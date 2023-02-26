---
title: GCR + Load Balancer + IAP
tags:
  - gcr
  - gcp
  - iap
  - web
---

Eu precisei configurar um ambiente de teste no trabalho, para o desenvolvimento de um sistema interno. A ideia era de hospedar os sistemas no GCR e utilizar a VPN corporativa para liberar acesso aos usuários internos.

O que eu acabei aprendendo é que este não é um processo muito simples principalmente quando precisamos limitar o acesso aos containeres. O GCR por padrão não utiliza uma VPC para rotear o tráfego, e o roteamento precisa ser feito uma um network load balancer.

Eu fiz um protótipo no meu GCP pessoal durante um final de semana e então implementei isso no trabalho. Essas são as notas de antes de eu apagar todo o setup do meu GCP pessoal.

## Construindo os Containeres

Os containeres são construídos utilizando GitHub Actions. Uma coisa importante do Cloud Run é que ele só vai rodar imagens de containeres hospedadas no Artifact Registry ou Container Registry. Isso significa que ele não consegue buscar as imagens dos registros de Docker utilizados no GitHub.

A solução para esse problema é adicionar alguns steps no pipeline para mandar a imagem para o GCR antes de fazer o deploy. Então utiliza-se terraform para aplicar a nova imagem e então deletar a antiga.

Pessoalmente, eu não gosto deste approach principalmente pelo risco de não se conseguir fazer um rollback apropriado via revisões do Cloud Run.

Na minha implementão atual, não cheguei a colocar isso para funcionar -- precisava montar o ambiente logo, então só fiz um push das imagens para o GCR manualmente.

Ao final da configuração, temos dois serviços rodando no Cloud Runm o backend e o frontend:

![](../../../assets/Pasted%20image%2020230225222523.png)

## Controle de acesso no Google Cloud Run

Uma vez que os containeres estão rodando no Cloud Run, precisamos nos preocupar com a forma com que eles serão acessados. Temos algumas opções:

- Deixar o acesso aberto para a internet, sem autenticação.
- Deixar o acesso aberto pra a internet, com autenticação via _Cloud Proxy_.
- Rotear o acesso via uma VPC utilizando o  HTTPS Load Balancer.

> ![](../../../assets/Pasted%20image%2020230225222925.png)
> ![](../../../assets/Pasted%20image%2020230225222950.png)
> 
> _Opções de segurança do GCP._


### Opção 1 - Deixar a porta aberta
Ambientes de teste nunca devem estar abertos à internet. Existem riscos inerentes ao processo de desenvolvimento que podem representar riscos a integridade de dados dos ambientes, mesmo de desenvolvimento. Por mais que você sempre diga para ninguém utilizar dados reais em um ambiente de testes, sempre vai ter o desenvolvedor que vai usar seus próprios dados pessoais lá dentro.

Enfim, sabendo disso, deixar aberto para a internet não é uma opção. Ainda assim, esta solução não incorre em custos adicionais.

### Opção 2 - Utilizar o Cloud Proxy

O Cloud Proxy é uma opção bem legal quando queremos testar apenas uma coisa de cada vez. Ele permite subir um proxy local que vai conectar na aplicação e expor ela via uma porta local na sua máquina. Dessa forma, o serviço hospedado no Cloud Run fica disponível via http://localhost:9000 ou algo assim.

O problema surge quando precisamos acessar o backend _e_ o frontend ao mesmo tempo. Até podemos subir dois proxies ao mesmo tempo, mas o proxy não roteia os requests HTTP feitos pelo navegador para a URL local do backend.

Se estivermos utilizando um DNS, ainda podemos configurar o DNS local da nossa máquina para resolver o DNS roteando para o serviço local. Ainda assim, é um setup complexo. Enquanto eu não veria problemas de direcionar um desenvolvedor ou testador para essa solução, eu não ia querer pedir para um PO ou outro papel não tecnico fazer isso.

Enquanto esta solução também não incorre em custos adicionais, a solução ideal é passar uma URL e tudo funcionar.

### Opção 3 - Utilizar um Load Balancer

O load balancer é uma boa solução, pois cria um ponto de entrada único para tanto o backend quanto o frontend, e o roteamendo para os serviços é feito internamente.

O GCP permite a criação de um Load Balancer HTTPs que já está preparado para fazer o roteamento para o GCR. O setup é meio convolucionado, porém. Ainda assim, funciona.

Os passos abaixo são necessários para o setup do Load Balancer.

## Criando o IP Público

Vamos precisar de um IP Público para configurar o DNS e provisionar os certificados. Isso é feito em **VPC -> IP Addresses**:

> ![](../../../assets/Pasted%20image%2020230225230447.png)

Você vai precisar reservar um endereço estático externo, clicando no botão no topo da tela.

> ![](../../../assets/Pasted%20image%2020230225230600.png)

Ele precisa ser _**premium**_ e _**global**_.

Uma vez que o IP público foi provisionado, você pode configurar o DNS. É importante notar que o preço por hora do IP muda de acordo como uso dele. **Um IP alocado a um serviço é mais barato que um IP sem uso**. E vale dizer que um IP público desalocado é _bem caro_.

## Configurando o DNS

O próximo passo deve acontecer no seu provedor de DNS. No meu caso, uso o _GoDaddy_, então precisei adicionar essas entradas lá:

> ![](../../../assets/Pasted%20image%2020230225230928.png)

O nome do domínio é _redcua.com_, então essa configuração faz com que:
- `redcua.com` seja acessível pela configuração de `@`
- `www.redcua.com` seja acessível pela configuração de `www`
- `api.redcua.com` seja acessível pela configuração de `api`

A configuração de DNS usando Load Balancer é muito mais simples do que via GCR, não precisando provar o _ownership_ do domínio.

A propagação do DNS leva um tempo, algumas vezes mais de um dia. Então você pode testar com `ping` no terminal cada um dos endereços confogurados no DNS até todos funcionarem. Você verifica isso vendo qual endereço de IP o comando ping resolve.

## Provisionando Certificados

Uma vez que temos um DNS configurado, podemos partir para o provisionamento dos certificados. Isso é feito em **Security -> Certificate Manager -> Classic Certificates**:

> ![](../../../assets/Pasted%20image%2020230225231321.png)

O provisionamento o certificado é simples caso você deixe o Google gerenciar ele. Tudo que você precisa é adicionar todos os domínios para os quais este certificado é válido. O Google não suporta provisionar certificados _wildcard_ (*), então é necessário colocar cada um dos domínios.

O provisionamento dos certificados depende do DNS para funcionar. Após o DNS estar funcionando, pode levar até um dia inteiro para o provisionamento ser concluído. Você pode ver o status do provisionamento ao clicar no nome do certificado na tela do Certificate Manager:

> ![](../../../assets/Pasted%20image%2020230225231725.png)

Além de olhar os _status_ para cada domínio, é necessário também ver o _status_ lá em cima. Muitas vezes todos os domínios estarão _active_, mas o certificado ainda vai estar em status _provisioning_ por um tempo.

## Provisionando uma VPC para o GCR

O próximo passo é configurar uma VPC para o GCR. Isso é feito em **VPC Network -> VCP Networks**:

> ![](../../../assets/Pasted%20image%2020230225231953.png)

O GCP já cria uma VPC padrão, mas você provavelmente vai querer segregar todo o tráfego externo em uma VPC específica. Por isso, é recomendado criar outra.

É uma VCP simples sem nada de especial. Apenas tenha certeza de deixar ranges de IP privado disponíveis pois o Serverless VPC Connector vai precisar de um range específico para criar uma proxy subnet. Além disso, crie a VPC na mesma região dos serviços do GCR.

## Habilitando o Serverless VPC Access

O próximo passo é configurar um Serverless VCP Connector, isso é feito em **VPC Network -> Serverless VPC Access**:

> ![](../../../assets/Pasted%20image%2020230225232235.png)

Ao clicar em **Create Connector** no topo, você vai ver a seguinte tela:

> ![](../../../assets/Pasted%20image%2020230225232341.png)

Aqui é preciso pretar **muita** atenção em algumas coisas:
- A região selecionada precisa ser a mesma da VPC.
- Selecione a VPC que você criou no passo anterior.

Após preencher os campos, expanda o menu **Show Scaling Settings** na parte debaixo da tela. Aqui, você tem controle sobre três coisas:
- Mínimo de instâncias para o Serverless VPC Connector.
- Máximo de instâncias para o Serverless VPC Connector.
- Tamanho de cada instância.

Você pode ver a estimativa de custo à direita da sua tela, e estes valores mudam isso completamente. A *configuração padrão não é a mais barata*, e pode ser bem cara dependendo do seu caso de uso. É recomendado ver isso com atenção. Ambientes com pouca carga podem ficar com tudo no mínimo.

Com isso feito, podemos começar a configurar o Load Balancer.

## Configurando o Load Balancer

Começamos criando um HTTPS Load Balancer:

> ![](../../../assets/Pasted%20image%2020230225223821.png)
> *Aqui é onde criamos o Load Balancer*

O tipo de load balancer que precisa ser criado é um _HTTP(s) Load Balancing_, que pode ser visto na tela acima.

> ![](../../../assets/Pasted%20image%2020230225223914.png)

O Load Balancer precisa ser gloal e estar no tier _premium_ de rede (que não é o _classic_ nem o _standard_). Isso precisa acontecer porque ele precisa de acesso a porta 443, suporte a certificados e IP Público.

#### Como o Load Balancer Funciona no GCP

O Load Balancer é dividido em três partes:
- Backend
- Frontend
- Rotas

É importante entender que esses são componentes do _Load Balancer_. Quando falamos de backend e frontend, não é o backend e frontend da sua aplicação, porém do load balancer em si.

#### Frontend
O **frontend** é a configuração do ingress para dentro do load balancer. Ou seja, certificados, IP público, porta, etc.

> ![](../../../assets/Pasted%20image%2020230225224107.png)

Algumas coisas importantes sobre a configuração do frontend:
- Ele _vai_ precisar de um IP público. Este é o IP que posteriormente iremos utilizar para configurar o DNS.
- A segunda coisa é que você vai precisar criar certificados, ou seja, vai precisar configurar um DNS e IP público _antes_ de chegar nessa etapa. Até tem como fazer nesse ponto, mas vai ser mais simples se fizer isso antes.
- O Frontend possui uma opção de habilitar o redirecionamento automático de HTTP para HTTPS, o que é uma boa ideia sempre. Porém, isso adiciona custo pois provisiona mais um load balancer em background.

##### Backend

O **backend** é a configuração dos serviços e recursos do GCP que serão acessados através do Load Balancer. Em outros lugares (como no AWS), isso é chamado de _Load Balancing Groups_.

Os backend no nosso caso são os serviços que estão rodando no GCR, tando o backend quanto o frontend.

> ![](../../../assets/Pasted%20image%2020230225225048.png)

Existe algo importante sobre essa configuração: 

> ![](../../../assets/Pasted%20image%2020230225225148.png)

- Você vai precisar provisionar os _Network Endpoint Groups_, ou `neg` como pode ver na imagem acima. Enquanto existe uma tela em que se provisionam esses NEGs na sessão de networking do GCP, não podemos provisionar NEGs de _serverless_ lá. O único lugar em que podemos provisionar um *Serverless NEG* é durante esta configuração.
- Você pode habilitar ou desabilitar o Cloud CDN aqui. Se este serviço for ter pouco tráfego, vale mais a pena desabilitar pois o Cloud CDN provisiona infraestutura que incorre em custo. Porém, se o serviço tiver muita demanda, provavelmente esse custo e absorvido pelo fato de existirem menos invocações no seu serviço.

A configuração de um _Serverless NEG_ se parece com isso:

> ![](../../../assets/Pasted%20image%2020230225225518.png)

É razoavelmente simples você apenas tem que garantir que a região dele é a mesma na qual os seus containeres estão rodando no GCR.

##### Rotas

As rotas amrram uma requisição que chega no frontend com algum destino definino no backend. É basicamente a configuração de proxy reverso:

> ![](../../../assets/Pasted%20image%2020230225225710.png)

### Configurando os Serviços no GCR

Após configurar o Load Balancer, 

Uma vez que estas coisas estão configuradas, você deve conseguir acessar seus serviços via DNS após o provisionamento dos certificados.

**Tenha em mente que**, como dito anteriormente, o provisionamento dos certificados depende da propagação do DNS, e ambos demoram um tempo. Na maior parte das vezes o DNS propaga em 1 ou 2 horas, mas os certificados podem levar _muito_ tempo. Eu normalmente deixo para testar no outro dia.

### Restringindo o Acesso com IAP

Finalmente, podemos configurar o controle de acesso ao nosso ambiente de testes. Isso é feito habilitando o Identity Aware Proxy (IAP). Isso é feito em **Security -> Identity-Aware-Proxy**.

Ao abrir esta tela, você vai ver os seus backends listados nela:

> ![](../../../assets/Pasted%20image%2020230225232938.png)

Você precisa marcar o check de IAP em cada um dos serviços para habiltar o IAP. Agora, quando você vai ver uma tela de login quando tentar acessar os seus serviços. Como o acesso nao vai estar configurado, você vai ver uma tela de erro:

> ![](../../../assets/Pasted%20image%2020230225233113.png)

Esta tela é um bom sinal, significa que agora seus serviços estão protegidos por autenticação.

Após isso, você precisa configurar o acesso a eles. Na tela do IAP, selecione os serviços e adicione as roles necessárias:

> ![](../../../assets/Pasted%20image%2020230225233231.png)
> _Clique em Add Principal..._
> 
> ![](../../../assets/Pasted%20image%2020230225233329.png)
> _E adicione a role de IAP-Secured Web App user_

Se quiser que qualquer usuario autenticado na sua organização possa acessar o ambiente, use a role `allAuthenticatedUsers`.

Isso conclui a configuração.

## Custo

O uso do Cloud Proxy não gera custos adicionais, sendo a minha recomendação caso você precise de acesso a apenas um serviço. Por outro lado, o acesso via Load Balancer tem um custo relativamente algo para algo pequeno. Este é o resumo do meu billing por alguna dias com o serviço parado:

> ![](../../../assets/Pasted%20image%2020230225234106.png)

Foram cerca de 25 reais em uma semana, cerca de 100 reais em um mês. Isso em acesso. Devemos levar em consideração que:
- Várias coisas estão dentro do _free tier_, como da para ver pelos valores negativos na coluna _Cost_.
- O Load Balancer e o Severless VPC conector provisionam recursos no Compute Engine, que é o principal custo por esse período de uso.

O aumento no uso desses recursos pode resultar em aumento gradual do custo, saindo dos free tiers e aumentando os valores mais do que linearmente.

## Conclusão

O setup não é simples, mas resolve um problema a nível corporativo. Essa nao é a solução para alguém que quer apenas subir um serviço no GCR mas sim para alguém que quer manter uma prática de desenvolvimento dentro de um time.

O custo para uma empresa (e acima de tudo, para um ambiente de testes) não é alto dado o benefício. Caso sua empresa use o Google Workplace, a autenticação dos usuários no IAP já fica amarrada à sua organização.

Pelo que li nos documentos, é possível fazer um setup desses a nível de _organização_ utilizando _Shared VPCs_, o que seria o ideal no meu caso. Dessa forma, não preciso reconfigurar isso para cada projeto/ambiente.