---
title: "#4: danodic.dev está pronto"
tags:
  - devlog
  - web
  - gcp
  - danodicdev
---
_postado por **alguém que deployou alguma coisa** em 2 de agosto de 2022 03:11_

---

Fazia muito tempo que eu não ouvia a música de hoje, mas este final de semana dei uma revirada no deezer e lembrei dessa:

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/yOuiMLdCRC4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Não sei como fiquei tanto tempo sem ouvir esta.

## Está Pronto

O que eu imaginava ser trabalho para 3 meses acabou se tornando trabalho para _seis meses_. Estou concluindo a versão inicial do _danodic.dev_, e estou contente com o resultado. Não está perfeito e ainda vai ser muito primorado, porém esta funcionando.

Todo projeto que eu termino é sinônimo de _xp e level up_, e neste não foi diferente: aprendi muito mais coisa do que eu esperava, e no final das contas este projeto agregou mais do que simplesmente _aquela página pra eu colocar os meus negócios lá_.

## Terminando coisas

Fazer protótipos é algo muito simples, muito mais do que parece. Apesar de que muitas vezes o protótipo por si só pode trazer algumas das partes mais desafiadoras _tecnicamente_, isso é 20% do trabalho. Além disso, o protótipo é
normalmente uma das partes mais divertidas do processo: nós estamos descobrindo coisas novas e a sensação de progresso é muito boa.

O bicho pega na hora que nós atacamos o que eu acredito ser 80% do trabalho: acabemento, teste e entrega.

## A parte chata

Teste é algo muito importante, e é a parte onde começamos a encontrar bugs chatos de resolver. Acima de tudo, é quando começamos a perceber as _bobagens_ que fizemos e começamos a ter que refatorar pedaços do código. A parte mais frustrante é quando começamos a achar uma quantidade muito maior de problemas do que esperamos. E nós sempre esperamos _menos_ problemas do que realmente vamos ter.

Neste momento começamos a perceber que além de bugs, temos problemas de _acabamento_. E acabamento é um troço _chato_.

Ajustes muito finos muitas vezes são difíceis de implementar, e muitas vezes são difíceis de implementar de forma limpa. Isso acontece porque muitas vezes esses problemas de acabamento ocorrem em muitas situações únicas: um _fix_ não se aplica à maior parte dos outros problemas. E ainda tem aqueles casos em que você não consegue uma boa solução _genérica_ e tem que implementar comportamentos semelhantes, porém levemente diferentes um do outro.

Esse tipo de problema tende a ocorrer principalmente na interface: coisas como espaçamento, animações e outras coisas de acabamento de UI são meio chatinhas de resolver. Isso começa a gerar muito código _específico demais_, e muitas vezes é melhor deixar assim mesmo, caso contrário você precisa atulhar os componentes de lógica e parâmetros para cobrir situações únicas.

E ainda por cima, eu sei programar interfaces para _jogos_, não gosto muito de html e css. Ainda menos de
javascript, e eu nunca vou perder a oportunidade de falar isso.

> ![Screenshot](https://storage.googleapis.com/danodicdev-public/public/posts/6/screenshot1.png)
> 
> _Eu não tenho paciência para coisas assim..._

## A parte _mais_ chata

Seja você um desenvolvedor frontend ou backend, existe apenas _uma coisa_ mais frustrante que ficar fazendo ajustes finos na aplicação: _deployar ela_.

Containeres vieram com a missão de simplificar a nossa vida, e mesmo assim conseguem encontrar formas de fazer o container rodar _bugado_. No meu caso, o container do backend não rodava no Cloud Run. O mesmo container que rodou sem problemas no GKE. Esse tipo de coisa é o que acontece na hora da _entrega_.

Minha missão era simples: criar um container do backend e um container do frontend. Subir no Cloud Run -- o GKE é caro demais para bobagens como esse site -- e mapear o DNS para os serviços.

## Uma semana

Uma f*cking semana.

Esse foi o tempo que eu fiquei quebrando a cabeça para fazer o backend rodar no Cloud Run. Descobri algumas coisas:

- Existe um bug no Google Cloud Run que quebra ambientes virtuais criados com _Pipenv_. É um bug conhecido e não é novo, mas leva um tempo até você pesquisar _pipenv cloud run_ no google para descobrir isso. Neste processo eu fiquei buildando 97 imagens diferentes debugando pipeline, extraindo imagem e tudo mais.
- Depois disso a aplicação não subia: a variáveis de ambiente não eram injetadas no container. Depois de muita tentativa e erro, aprendi que não podemos usar pontos `.` nos nomes das variáveis de ambiente. A interface não reclama disso e a documentação não menciona isso _também_.
- Com a aplicação subindo e pegando as variáveis de ambiente, tive que fazer alguns deploys para o banco de dados funcionar: no cloud run ele não é disponibilizado via cloud sql proxy como no GKE, ao invés disso ele cria um _socket unix_ no container para conexão com o banco.

Tiveram alguns outros erros, mas foram da minha parte.

Eu já estava pronto para ir para o Heroku, mas algo aconteceu: eu não consegui logar no Heroku _de jeito nenhum_, e então foi quando eu resolvi insistir por mais uns dias no Cloud Run.

> ![Screenshot](https://storage.googleapis.com/danodicdev-public/public/posts/6/screenshot2.png)
> 
> _Foram muitas builds desse backend..._

Aprendi várias coisas, algumas específicas demais, mas ainda assim aprendi. E por incrível que pareça, o container do frontend foi _deployado_ e estava rodando em menos de duas horas.

## Usando essa certificação aí

No final das contas está tudo _deployado_ no GCP, e eu usei os seguintes serviços:

- Cloud Run para o backend e frontend.
- Cloud Storage para o conteúdo estático.
- Cloud build para deploy contínuo do backend, frontend e conteúdo estático.
- Source Repositories como repositório git.
- Postgres rodando em Cloud SQL para o banco de dados do [Minumtium](/projects/minumtium).
- Container Registry, porque _a própria ferramenta do google_ ainda não usa o Artifact Registry.
- Secret Manager para tratar credenciais.

Algumas coisas foram fáceis:

- O mapeamento de DNS no Cloud Run é _muito mais simples_ do que o setup necessário para o GKE.
- O pipeline de deploy do conteúdo estático usando `gsutil` funcionou _de primeira_.
- A configuração de CORS no GCS é bem fácil.

## A recompensa

Terminar o projeto por si só é um grande aprendizado, e com certeza melhora muito as minhas habilidades com GCP. Ver o site funcionando sem maiores problemas é muito bom. É como matar um chefe do Dark Souls, só que bugado. Esse backend foi difícil e frustrante, mas foi resolvido.

Acima de tudo, o principal aprendizado sempre vem ao _terminar_ o projeto. Muitas dessas coisas eu não teria aprendido se só tivesse subido um wordpress ou tivesse deixado as coisas pela metade. Finalmente usei Vue _pra valer_, e admito que sofri menos do que esperava.

Nem sempre terminar é _realmente terminar_, na maior parte das vezes é mais _abandonar_. A realidade é que se eu fosse terminar o site _do jeito que eu queria_, iria levar o ano inteiro aqui e provavelmente não iria terminar nada. Infelizmente excesso de perfeccionismo nos leva a ciclos interminaveis de coisas que nunca ficam prontas. Eu não me proponho a ser desenvolvedor frontend, então não me importo do site estar meio tosquinho de inicio. Com o tempo vou arrumando -- ao menos não estou na _v4_ mesmo antes de colocar a página no ar, como fazia quando tinha 12 anos de idade.

## O que vem por aí

O site não está finalizado, mas não sei se algum dia eu vou _finalizar_ ele. Tá na hora de começar o próximo projeto, e já sei por onde começar.

Ao longo do tempo vou colocar mais coisas aqui, as páginas vão ser abandonadas ao invés de terminadas.

## Estou cansado

Pra variar, são 2:30 da manhã e eu estou aqui. Enfim, este é um post importante e precisava ser feito, pois é o _primeiro post público_ do site. Espero que esteja tudo funcionando para você e que não esteja tendo erros de CORS -- que eu não sei se resolvi.

Todos os outros posts que você vai ver aqui foram criados _antes_ de estar tudo pronto, mas eu fui postando para testar o _minumtium_.

Se você chegou até aqui, agradeço a atenção -- até a próxima.
