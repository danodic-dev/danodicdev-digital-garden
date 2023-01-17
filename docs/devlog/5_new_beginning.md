---
title: "#5: Um novo começo"
tags:
  - devlog
  - gamedev
  - arquitetura
  - design patterns
  - java
---

_postado por **alguém que está fazendo um jogo** em 10 de agosto de 2022 23:24_

---

Comecemos pela nossa música para este post:
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/v8zEza6NQrw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Há alguns anos esta vertente de drum & bass vem se popularizando. Algumas pessoas chamam de _deep drum & bass_, eu conhecia isso como _minimal drum & bass_. Enfim, tanto faz -- o fato é que isso é uma volta às origens do gênero, o que é ótimo. Este disco inteiro é sensacional, esta é minha música favorita dele.

## Isto não é um blog sobre música

Talvez até seja, talvez devesse ser. Eu tenho a sessão de _aleatoriedades_ para isso.

## E aí, começamos?

Então, começamos.

Desde que _deployei_ este site que você está vendo, comecei logo em seguida a trabalhar no _jogo novo_. Jogo esse que ainda não tem nome, portanto será chamado de _jogo novo_ por enquanto. Estou aproveitando para refinar algumas áreas de conhecimento enquanto faço ele. Começando por duas:

- Arquitetura
- Debugging e instrumentação

## Arquitetura

A questão de arquitetura foi um dos pontos onde eu mais sofri durante o desenvolvimento do Rushbeat. O jogo já estava _quase pronto_ e jogável cerca de 2 anos antes de eu de fato terminar ele. O problema é que era um jogo com 50 classes _muito atulhadas de coisa_, grandes e com manutenção ruim.

Arquitetura é algo que a gente só pensa a respeito quando tudo já está errado, e esse foi o caso no Rushbeat. Foi quando eu vi o caos que estavam aquelas 50 classes que eu decidi estudar a respeito e cheguei [neste livro](https://gameprogrammingpatterns.com/). Eu já conhecia uma coisa ou outra sobre _design patterns_, mas só o básico: este livro pra mim mudou tudo.

> ![Livro: Game Programming Design Patterns](https://storage.googleapis.com/danodicdev-public/public/posts/7/20220810_225810.png)
>
> _O livro é tão bom que eu comprei ele em papel, mas você pode ler tudo no site._

Neste livro eu aprendi _pra valer_ sobre algumas coisas:

- Observers
- Comandos e Eventos
- Componentes
- Estado

Além disso, venho utilizando arquitetura hexagonal no trabalho e lendo o tal do _Clean Architeture_.

> ![Livro: Clean Architecture](https://storage.googleapis.com/danodicdev-public/public/posts/7/20220810_230000.png)
>
> _Isso me parece mais aplicável a software corporativo, mas algumas coisas parecem se encaixar com jogos também._

Tendo tudo isso em mente, defini algumas coisas como base para o novo jogo:

### Arquitetura Hexagonal

Eu estou usando Libgdx que é um framework cheio de adapters por padrão, mas ainda assim quero fazer o exercício de desacoplar a lógica do jogo das bibliotecas. O importante é ter a flexibilidade de trocar bibliotecas com facilidade e simplificar o port do jogo para outras linguagens (para o caso de eu querer _trocar de linguagem três vezes durante o desenvolvimento do jogo_).

### Eventos e Observers

A ideia de arquitetura hexagonal já implica no uso de eventos, mas os eventos brilham _de verdade_ quando usados junto de observers. O uso dos eventos com observers permite trafegar dados entre componentes do código de forma muito mais limpa. É o que eu deveria ter feito no Jao ao invés de usar aquele hashmap _nojento_ para guardar os dados dos eventos.

Os observers permitem deixar o código mais _reativo_. Não necessariamente reativo como em _sistemas reativos_, mas faz com que os componentes _reajam_ às mudanças de dados de forma transparente. Isso elimina o problema de _loops com ifs_, que acaba sendo um _anti-pattern_.

O uso excessivo de observers pode trazer problemas, principalmente dificuldades em entender o que acontece quando os observadores são notificados. Acima de tudo, gera uma dificuldade bem grande em relação à ordem que as coisas devem acontecer: às vezes o observer dificulta de entender qual a ordem que as coisas devem acontecer, então deve ser usado com parcimônia.

### Máquinas de estado

Uma das coisas que fez a quantidade de classes do Rushbeat crescer foi o uso de máquinas de estado. Isso deveria ser algo meio básico, mas o código inicial do Rushbeat tinha muito _enum_, _booleans_ e _if_ para controlar estado. Isso era parte do porque o código estava um caos.

Quebrar o jogo em máquinas de estado para cada módulo fez com que tudo ficasse _muito_ mais fácil.

Atualmente eu entendo _muito melhor_ como funciona a parte _funcional_ do Java, e pretendo expandir o uso de máquinas de estado com interfaces funcionais e funções anônimas. Dá para fazer estados razoavelmente limpos usando funções anônimas.

### Injeção de dependência

Outra coisa que ficou meio ruim no Rushbeat foi a injeção de dependências: eu acabei criando algumas classes que guardavam as instâncias de todos os objetos de determinado módulo e o código buscava os objetos de lá quando inicializava. Isso é a receita perfeita para _acoplamento temporal_ e `NullPointerException` a rodo.

Essa solução funcionou melhor do que um monte de `new` espalhado no meio da lógica do jogo, mas por outro lado não é o ideal. Eu cheguei a dar uma brincada com o [guice](https://github.com/google/guice) para fazer a injeção de dependências, mas não gostei do resultado -- funciona mas é muito trabalho. Ainda vou definir o _approach_, mas provavelmente vai ficar melhor que antes.

## Debugging

Outra coisa que foi _tenso_ no Rushbeat foi debugar as coisas. Muito do debug era feito por código temporário, que eu colocava e removia do jogo. Acima de tudo, o jogo não tinha um sistema de log integrado e tudo era debugado _na unha_.

Eu pretendo abordar esses problemas de duas formas:

### Código de debug é permanente

A interface de componentes _renderizáveis_ `IRenderable` define um `render()` e `renderDebug()`. A renderização do debug só vai ser chamada quando o jogo estiver em _modo de debug_, mas o código de debug vai ser parte dos componentes. Dessa forma, eu consigo ligar/desligar o debug a qualquer momento e resolver problemas de forma mais fácil. E com isso, eu não preciso misturar o código de renderização com o debug.

### Módulo de Teste

É meio ruim escrever testes para _o jogo em si_, isso é algo que eu quero fazer mas ainda não sei como vou abordar. Porém, já existe um módulo separado para testar os componentes manualmente fora do jogo. Este código também é _ permanente_, só não vai ser compilado na build final do jogo.

A intenção é que cada adaptador diferente tenha seus programas de teste e formas rápidas de serem testados de forma independente da lógica do jogo.

## Progresso

Com isso em mente, podemos entender qual o progresso que temos:

> <iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/Ek7K4T7EuJY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
>
> _Este é o programa de teste do adaptador de input. O adaptador é capaz não apenas de capturar o input do joystick
> como também ja lista os joysticks disponíveis e permite ouvir eventos deles. Já está amarrado no sistema de logging._
>
> _As interfaces se parecem com isso:_
>
> ![Interfaces de Input](https://storage.googleapis.com/danodicdev-public/public/posts/7/input.png)

> <iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/fHC2aTY2BoQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
>
> _Aqui temos a primeira versão do painel de debug, onde vou poder ver os logs durante a execução do jogo. É estilo o
> log do quake. A parte visual ainda vai ser concluída, mas isso já remove a necessidade de imprimir no console._

Decidi começar justamente pelas ferramentas de debug. Já sei uma boa parte do que eu preciso, então vou fazer isso agora para sofrer menos durante o desenvolvimento.

Por enquanto foram cerca de 14 horas de trabalho, umas 4 horas no primeiro video e cerca de 10 no segundo. Eu passei um tempo pensando em _como_ fazer alguns aspectos relacionados à renderização, principalmente qual o nível de abstração que eu queria.

## Concluindo

São 7:56 da manhã e minha cabeça está derretendo. Apesar do cansaço, é bom voltar a programar outro jogo -- bem mais divertido que desenvolvimento web. Se você ficou até aqui, obrigado pela atenção.

E até a próxima.
