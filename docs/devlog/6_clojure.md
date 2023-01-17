---
title: "#6: Clojure"
tags:
  - devlog
  - danodicdev
  - clojure
  - clojurescript
  - ranço
---

#  #6 - Notas para o Futuro: Clojure

_postado por **alguém cansado de Clojure** em 23 de outubro de 2022 22:46_

---


> _**Dica: Se você gosta de Clojure, talvez não queira ler este texto.**_

Comecemos com a _musga do post_:
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/eIeq6DveX6c" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Não é o estilo que eu venho consumindo nos últimos anos, mas estava aleatoriamente ouvindo isso esses dias, e ficou na
minha cabeça. Tinha ouvido essa pela primeira vez em um set, _e também tinha ficado na minha cabeça_.

## Isso não é um blog sobre música

Pois é, sempre me perco nisso. São 5:20 da manhã no momento em que estou começando a escrever isso e minha cabeça já
foi para a casa do chapéu, mas existe um motivo para eu estar fazendo isso agora.

Eu tenho o péssimo costume ruim de abrir a IDE depois da meia-noite, o que me faz iniciar sessões de programação que vão
até duas, três da manhã. Se eu estiver empolgado, vai até às _cinco_ (e eu tenho que dar meu jeito de acordar no outro
dia). Porém, hoje é sábado para domingo, e esses são os dias que _vai até cansar_. Eu acordei às _quatro da tarde_
ontem, então não vou dormir antes das oito de qualquer forma.

O fato de eu ficar pensando em programação durante a noite -- muitas vezes com a cabeça cansada -- me faz tomar decisões
_esdruxulas_. E isso aconteceu em uma madrugada qualquer lá por março ou maio de 2020: eu decidi aprender Clojure.

## Porque Clojure?

Eu poderia dizer que estava atrás de uma linguagem funcional, um dialeto de lisp ou apenas uma alternativa ao Java. Mas
a realidade é que eu só queria uma linguagem estranha mesmo. Afinal, pessoas estranhas buscam coisas estranhas.

Eu não fazia a mínima ideia no que eu estava me metendo:

- Eu não sabia que Clojure era um _dialeto de Lisp_.
- Eu não sabia que Clojure era uma _linguagem funcional_.
- Eu não sabia o que diabos era _programação funcional_ direito.
- Eu não sabia que o Nubank usava isso.

Então eu comecei a aprender Clojure, e foi... interessante.

## Programação Funcional

Eu não tinha noção nenhuma de programação funcional quando comecei no Clojure. Eu sabia que era algo além de _usar
funções_, mas não sabia exatamente o que era. Comecei a pesquisar e aprendi os conceitos principais (imutabilidade,
funções puras/impuras, funções de alta ordem, etc.), enquanto tentava reescrever um pedaço do _Rushbeat_ em Clojure.

Ah sim, esqueci desse detalhe: eu queria reescrever o Rushbeat, _mais uma vez_.

Comecei pelo parser de BMS, que me parecia ser algo simples. Hoje eu consigo ver como eu não entendia nada de
programação funcional: um parser (principalmente de BMS) naturalmente é algo que depende muito de estado, então não é
lá um inicio muito bom para alguém que nunca programou com estruturas imutáveis.

Eu passei uns dois ou três meses em cima disso, até que com muito esforço consegui chegar a uma implementação do parser
de BMS, em que todos os testes unitários passavam. Quando fui passar o primeiro BMS _de verdade_ no parser, ele deu um
erro tão grande que eu quase chorei de frustração. Quem já viu stack traces em Clojure vai entender essa ultima frase.

Nesse ponto eu decidi deixar para lá e fazer outra coisa com Clojure no futuro. Acabei reescrevendo o jogo em Java
mesmo, e foi uma boa decisão.

## Conhecimentos Aleatórios

Apesar dos pesares, minha experiência com Clojure me deu um bom conhecimento de programação funcional, mesmo que tenha
sido curta. Enquanto no trabalho eu não precisava desse conhecimento, eu já tinha um entendimento de programação
funcional muito maior que muita gente -- nesse aspecto Clojure é excelente, você aprende o paradigma funcional _pra
valer_.

Eu sempre sou a favor de aprender coisas novas, por mais aleatórias que sejam. Esse conhecimento de programação
funcional foi extremamente importante para a minha migração para desenvolvimento há um ano atrás (preciso fazer um post
sobre isso), já que desde o meu primeiro projeto eu _precisei_ usar programação funcional no Java.

## A volta ao Clojure

Esse lance e Clojure ficou lá no fundo da minha cabeça, e de vez em quando eu dava uma lida a respeito ou tentava
começar algo novo que eu não terminava. Comprei o livro da [Casa do Código](https://www.casadocodigo.com.br/products/livro-programacao-funcional-clojure) sobre Clojure, aprendi mais sobre
programação funcional e me caíram muitas fichas na cabeça. A abordagem que eu segui para o parser de BMS não foi a
correta, então sentia que precisava tentar novamente.

Minha intenção era ter escrito o backend deste site em Clojure, mas eu queria terminar isso logo. Por esse motivo,
fiz em Python mesmo (de qualquer forma foi uma oportunidade de usar FastAPI). Ainda assim, cheguei a esboçar uma API
REST com ele e achei bem legal.

Com o site no ar, muita procrastinação com meu jogo e a cabeça um pouco bagunçada, eu tomei uma decisão...

## A decisão

Ah, as decisões que tomamos nessa vida. Uma dica importante é nunca decidir as coisas:

- Quando estamos com raiva.
- Quando estamos com fome.
- _Quando estamos entendiados a uma da manhã prestes a abrir o VS Code e criar a pasta `clojure/danodicdev-frontend`
  naquela pasta amaldiçoada de projetos que nunca são concluídos enquanto eu deveria estar programando meu jogo._

Pois é.

Eu decidi _reescrever_ este site em Clojure. Inteiro, backend e frontend.

## O real motivo deste post

Há 30 minutos atrás eu _desisti do Clojure_.

O real motivo deste post é voltar aqui e ler tudo isso da próxima vez que eu achar que devo voltar ao Clojure, para que
eu não lembre apenas das memórias boas sobre Clojure mas também lembre dos perrengues.

Fazem mais ou menos umas três semanas que comecei a usar _cljs_ para reescrever o frontend, e ontem eu comecei a
reescrever o backend. Tiveram altos e baixos -- coisas muito legais e coisas muito ruins. A realidade é que algumas
coisas me deixaram meio indignado e, da mesma forma que eu decido fazer algo às 2 da manhã, pelo jeito e decido desistir
lá pelas 5.

## A parte ruim

Vamos começar pela parte ruim, é o que está fresco na minha cabeça agora.

### Parece abandonado

Antes de decidir usar uma biblioteca ou tecnologia, eu sempre olho primeiro quando foi a última release ou os últimos
commits no repositório. A maior parte dos tutoriais e documentação que eu encontrei fazem referências a bibliotecas que
não foram atualizadas nos últimos dois ou três anos. Isso pode parecer um sinal de maturidade, mas muitos deles não
chegaram ao 1.0.

Quando vemos a frequência dos posts no [Clojure TV](https://www.youtube.com/user/ClojureTV/videos), podemos ver que
foram
alguns vídeos no último ano, comparado à muitos vídeos nos anos anteriores.

O fato de a Cognitect ter sido comprada pelo Nubank é apenas um sinal de que até eles devem estar com medo de que a
linguagem esteja sendo abandonada. Não que eu espere que a linguagem vá ter um ecossistema rico como Java ou Python,
pois ainda é algo de nicho, mas podemos pegar o exemplo do _Go_: é uma linguagem mais nova, também funcional, e muito
mais usada. Não vamos nem ao Go, já que é do Google. Vamos ao Elixir, que também é mais nova, funcional, _estranha_,
_brasileira_ e está ganhando mais aderência.

### Mesmos problemas, soluções diferentes

Muitos dos problemas que a galera do _Clojure_ diz resolver já são coisas solucionadas em outras linguagens, apenas
de formas diferentes. Um exemplo é o _spec_: é uma ótima ideia, e a parte de geração de testes é muito legal. Mas ainda
assim, é uma solução muito mais complexa para o problema básico que ela tenta resolver.

Por mais que ter tipagem estática e _bean validators_ não façam tudo que o _spec_ faz, ainda assim fazem o básico que
nós esperamos que seja feito. O resto é bônus. Parece que todo mundo que vai desenvolver Clojure _pra valer_ acaba
usando alguma lib de spec (seja o `clojure.spec` o `schema`) o que, honestamente, me parece bem mais complicado que
a abordagem padrão que a gente tem em outras linguagens.

Veja bem: eu entendo as vantagens que o spec traz (geração de testes, validação em runtime, especificação de funções,
etc.), mas a criação dos specs tira a simplicidade que todo mundo diz que o Clojure tem.

### Sintaxe

Enquanto a sintaxe do Lisp é simples, existe muito _sintax sugar_. Ler um código escrito por um programador experiente
em Clojure é _muito difícil_, mesmo que quem esteja lendo seja um programador muito experiente em outras linguagens
porém iniciante em Clojure. Devemos manter em mente que isso não é apenas um problema de Clojure: Scala tem o mesmo
problema, e Python parece estar indo pelo mesmo caminho com tralhas como o _walrus operator_.

O overhead cognitivo é muito alto, precisamos decorar coisas demais para a mesma coisa:

- `->` é o operador de _threading_, que passa o resultado da função chamada como primeiro argumento da proxima função a
  ser chamada.
- Mas se não for o primeiro, mas o último argumento? Ah! Temos o `->>`, que serve para isso.
- Mas se algumas funções precisarem do primeiro, e outras do último? Então usamos o `as->`.
- Mas aí tem o `cond->`.
- E o `cond->>`.
- E o `some->`.
- E o `some->>`.

Eu sei que ao menos três desses são resolvidos só com o `as->`.

### Gambiarras

A interoperabilidadade com a JVM ou com o motor de Javascript do navegador nos leva a ter que fazer coisas no código
que soam mais como gabiarra. Um exemplo que eu passei durante essa noite:

- Eu defini um protocolo em um namespace `business-logic.contracts.clj` e precisava importar dentro de outro namespace
  de teste.
- O teste definia um mock deste protocolo, que seria passado para as funções que usam o protocolo.
- O `require` do protocolo não funcionava de jeito nenhum.
- Depois de pesquisar, aprendi que _protocolos não usam `require`, eles usam `import` porque geram classes_.
- Ainda assim não funcionava.
- Em um blog aleatório, descobri que _apenas no import_, deveria substituir o `-` no namespace por `_`, pois o Java não
  aceita _traços no nome dos pacotes_.
- Ainda assim não funcionou.
- Fechei a IDE e vim escrever esse post.

A realidade é que eu não estou programando em Java e não estou tentando fazer _interop_ com Java. Porque preciso me
preocupar com problemas do Java? O fato de o Java não suportar _traços no nome do pacote_ não deveria ser problema meu.
Vou além: tudo deveria funcionar com `require`, e a linguagem deveria saber o que fazer com aquilo.

Essas gambiarrinhas estão espalhadas pela linguagem, e isso me incomoda muito.

### Poucos wrappers idiomáticos

Muitas vezes eu precisei simplesmente usar as classes do Java, e instanciar essas classes no meu código. Um exemplo é
o wrapper para lidar com datas: ele foi feito para Joda Time, e então foi abandonado quando saiu o Java 8, pois temos a
nova _Date and Time API_ do Java. E é isso, não temos mais wrapper, temos que usar a API diretamente -- o que é
parcialmente ok, já que eu conheço a API, mas fica feio pois não fica idiomático.

A API _Date and Time API_ veio no Java 8, _em 2014_.

### Não tem debugger

Common Lisp tem debugger e funciona muito bem. Não me diga para usar prints, não me diga para ficar rodando coisas no
REPL para resolver problemas. Em muitos casos, debugar o programa rodando é muito mais útil.

O Calva costumava ter um debugger integrado, que era mais uma gabiarra com macros no Clojure. Eu lembro que saiu um
update em 2020 que tirou o debugger enquanto eu estava escrevendo o parser de BMS.

### _Os stack traces_

Clojure é conhecido por ter stack traces enormes e difíceis de entender. Isso foi algo _extremamente frustrante_ na
primeira vez que tentei usar a linguagem. Eu preferi desistir de usar a linguagem em 2020 do que tentar entender o que
diabos estava acontecendo no meu código quando eu tentei parsear aquele BMS.

É muito difícil entender os problemas que estão acontecendo, principalmente depois de integrar as unidades de código --
não tem debugger e os call stacks são gigantescos.

Dois anos depois continua a mesma coisa. As mensagens são difíceis de entender e você precisa ficar caçando o seu código
no meio de um call stack gigantesco que mistura seu código, coisas do Clojure _e_ coisas do Java.

Aqui eu preciso levantar um ponto importante: call stacks longos é uma característica da programação funcional, e
isso também acontece no Java e no Scala -- a questão é como a linguagem comunica isso quando os erros acontecem. Eu não
sei se a abordagem do Scala é melhor, mas a do Java é (_quando usando streams e coisas do tipo_).

## Reclamou pra caramba, mas tem coisa boa?

Tem coisas boas sim, afinal...

### ...qualquer coisa é melhor que javascript

Eu tenho que admitir que _mesmo com todos os quirks_, clojurescript é muito melhor que javascript. Me convença do
contrário.

É bom ver que hoje em dia tem mais gente que acha que _o javascript tem que acabar_. E viva o WASM, em 2037 deslancha.

### Sintaxe

Apesar do excesso de _sintax sugar_, a sintaxe do lisp é sucinta e expressiva. Se faz muita coisa com pouco código, o
que vem mais a ser uma característica do paradigma funcional do que da linguagem em si. Ainda assim, é um mérito da
linguagem mas, de qualquer forma, eu abriria mão de um pouco de expressividade para remover de um tanto de atalhos
redundantes.

### É funcional _de verdade_

É uma experiência muito boa para quem quer aprender funcional _pra valer_, sem misturar com OOP.

### É muito bom para testes

É muito fácil escrever testes unitários em Clojure, principalmente praticar TDD.

Veja bem: _testes unitários_. Não tentei escrever testes de integração nem escrever testes funcionais automatizados.
Enquanto testes de integração devem ser simples, não vejo vantagens em escrever testes funcionais automatizados usando
Clojure, já que são muito sequenciais e estruturais por natureza.

### Quando funciona é legal

A experiência de usar _reagent_ no frontend foi muito boa. Melhor do que minhas tentativas de usar _React_ com
Javascript. E isso é uma característica do Clojure: quando a coisa está dentro dos parâmetros da linguagem, elas
funcionam muito bem. A forma com que a reatividade funciona no _reagent_ é muito legal.

## Concluindo

São 7:20 da manhã, eu estou há duas horas aqui reclamando do coitado do Clojure. Vendo a situação de semi-abandono da
linguagem eu até me sinto chutando cachorro morto.

Com este post, deixo uma nota mental na minha cabeça para voltar aqui e ler isso novamente quando eu resolver _voltar
para o Clojure_ pela terceira vez. Eu cheguei a fuçar com _Racket_ e _Common Lisp_ depois de brincar com Clojure em
2020, talvez dê mais uma olhada em Racket. Devo admitir que Common Lisp me surpreendeu, mas parecia que a stack web
estava meio abandonada (e o nome de algumas funções são _muito estranhas_).

Se você ficou até aqui, parabéns. Provavelmente você:

- Não gosta de Clojure, mas gostou muito de ler este texto.
- Gosta de Clojure, e ficou com tanta raiva que neste momento está invadindo a minha casa e
