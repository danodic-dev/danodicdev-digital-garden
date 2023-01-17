---
title: "#2: Férias"
tags:
  - devlog
  - vacations
  - gcp
  - gamedev
  - web
---

Comecemos com a _música do post_:
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/UGqmRXk2ztg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Enfim, férias

As últimas semanas foram cansativas. Eu estive estudando para a certificação de Google Cloud Professional Developer pelas últimas quatro semanas para tentar a sorte na certificação -- quatro semanas parece pouco tempo para uma prova que potencialmente pode tocar em cerca de _quarenta serviços_ do GCP.

Eu estava com férias marcadas para iniciar no dia após a prova, e meus planos eram de estudar mais durante as férias após falhar no teste. Realisticamente falando, as chances eram _bem baixas_. É muito mais _pé no chão_ já me planejar para estudar durante as férias do que criar uma falsa expectativa.

No final das contas, eu passei na prova. E pelo jeito vou tirar _férias de verdade_, sem me preocupar em estudar nada sobre plataformas de nuvem e seus 327 serviços diferentes. Ao menos por enquanto.

## Férias?

Fazia um tempo razoável que eu não tirava férias, quase um ano e meio. Desta vez prometi para mim que iria fazer um plano, pois nunca faço. Sempre que eu tiro férias é porque elas estão vencendo e eu _preciso_ sair de férias. Pois é, eu falhei novamente: estou saindo de férias em junhon porque as férias estão vencendo, _e_ meu plano não vai valer de nada. Hora de um plano novo.

## Planos

Essa deve ser a primeira vez que eu saio de férias e meu plano _não é programar_ como de costume. Vou arrumar algumas coias em casa, alugar um airbnb aleatório em algum lugar e fazer qualquer coisa que não seja estudar para certificações.

Porém, existe _uma coisa que eu **devo**_ fazer: colocar este site no ar.

## Isso é um devlog?

Eu venho desenvolvendo este site pelos últimos três meses, como sempre com restrições de tempo. Como mencionado no último post, eu não manjo de front-end. Este post que você está vendo agora está sendo postado direto na API, enquanto eu desenvolvo o front-end em paralelo. E nem vou fazer front-end para postar as coisas -- me viro bem com a página do
_Swagger_.

Estou na terceira iteração deste site: acho que agora vai.

Eu consegui estabilizar o desenvolvimento usando _Vue_ e _Bulma_, com HTML, CSS e Javascript mesmo. Já estou nos finalmentes, falta apenas terminar a parte visual e o carregamento assíncrono.

## _A parte visual_

Indecisão é algo complicado, e isso acabou afetando minha habilidade de definir o que fazer em termos visuais. Eu já tive algumas ideias diferentes:

- Desenvolver um site estilo um _menu de jogo_, utilizando three.js, canvas, etc. Cheguei a desenvolver uma parte disso, mas é pouco prático e eu estava levando mais tempo esmirilhando o comportamento e as animações do que de fato cuidando do conteúdo (que é o objetivo _real_ deste site).
- Fazer um front-end interativo, em formato de jogo -- afinal, esta página gira em torno disso. Eu quero fazer isso, mas não agora. A prioridade é mostrar o conteúdo.
- Fazer algo mais simples utilizando Bulma, parecendo um site comum. Fiz praticamente tudo neste approach, mas caí no erro do _abuso de css_: estava colocando tralha demais na UI, muita cor, background animado e outras coisas que estavam parecendo bagunçadas. Algumas coisas só estavam lá porque estava fácil de colocar.

No final das contas, estava voltando a ficar estranho: algumas coisas sendo feitas via API que poderiam ser providas de forma estática e o visual poderia ser simplificado.

## Menos é mais

No final das contas, eu cheguei a uma pergunta importante enquanto pensando a respeito do que eu estava fazendo: qual é o _real_ objetivo deste site? E no final das contas, eu não quero mostrar habilidades de desenvolvimento front-end nem de design visual -- nunca tive essa pretensão. Acima de tudo, o que realmente tem valor neste site é o _conteúdo_ dele,
sendo onde eu deveria estar gastando meu tempo.

Foi feita a decisão de reescrever o layout _uma última vez_, mas dessa vez de forma definitiva. Definitivo até eu mudar de idéia.

## Fechando o círculo

Uma das coisas que eu fiz para estudar para esta certificação de GCP foi _deployar_ o backend deste site no Kubernetes rodando no GKE. Enquanto eu ia lendo o livro para os estudos, eu fui aprendendo algumas coisas e uma delas foi muito importante: dá para _hostear_ páginas estáticas no GCS a um custo _muito baixo_. Mesmo que eu não venha a usar o GCS, eu posso usar _Cloud Run_ e economizar uma grana. Apenas o back-end estava custando quase 10 reais por dia no GKE.

Este front-end é basicamente estático: ele chama uma API que eu decidi mover para _Cloud Run_ e remover do GKE devido a questões de custo. Contanto que ele faça as chamadas para o back-end, está tudo certo.

Coisas como o conteúdo do site (detalhes de projetos e outras coisas) podem ficar no GCS direto, sem precisar de uma API para gerenciar elas. É simples de montar as URLs pelas strings direto no front-end, matando uma meia-dúzia de endpoints no backend. No final das contas, o backend vai ficar rodando apenas o _minumtium_. Isso ainda me dá flexibilidade de
não precisar ficar _buildando_ imagens do docker a cada vez que eu for fazer um update.

## E as férias?

Finalizando o deploy do front-end, eu _não vou mais mexer nisso durante as férias_. Talvez eu nem finalize antes das férias, já que eu preciso escrever uma parte do conteúdo do site e tem muita coisa para escrever. Mas eu tenho _muita_ coisa para resolver em casa, sendo a principal delas arrumar o meu escritório -- estou trabalhando de forma meio improvisada desde o início da pandemia, e como vou seguir de casa é melhor deixar as coisas mais ergonômicas. Por esse motivo, não devo mexer em nada até lá.

Depois das férias, vou fazer a primeira release _de verdade_ do Rushbeat e começar a trabalhar em uma nova versão dele. Além de alguns projetos à parte, que vou falar a respeito mais tarde.

## Concluindo

Nada a concluir. Apenas pensamentos aleatórios de final de madrugada. Minha cabeça está cansada demais para concluir, inclusive vou traduzir este post depois -- são 5:48 da manhã e eu só quero dormir.

Então é isso, até o próximo post -- e obrigado por ler mais este post inútil.