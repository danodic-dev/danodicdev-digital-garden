---
title: Digital Gardens
tags:
  - digital garden
  - web
  - ideias
---

# Digital Gardens

Digital garden é uma forma de expor na internet assuntos que sejam do seu interesse de uma forma um pouco diferente do que se costuma fazer com uma _home page_ tracional. 

## Porque é diferente?

Normalmente é simplesmente a publicação de um conjunto de notas interligadas por assuntos, formando um mapa mental. Existem alguns _approachs_ diferentes para isso, mas o mais conhecido é o uso de um software chamado [Obsidian](https://obsidian.md).

Pelo que vejo duas coisas são proeminentes:
- Conhecimento em rede / mapas mentais.
- _Backlinks_.

Estes dois elementos incentivam o principal objetivo de um digital garden: exploração. A ideia é não estar tudo jogado na sua cara, mas sim incentivar a exploração de assuntos e tópicos relacionados através da ligação entre eles. Eu vejo como um passo adiante em relação a uma wiki pessoal.

## Convenções

Muito disso parece ter vindo de pessoas envolvidas em áreas técnicas de tecnologia, então o uso de ferramentas como Jekyll, Eleventy, Markdown, etc. são comuns.

A principal forma de escrever é utilizando markdown, o que faz com que o Obsidian se torne tao proeminente. Ferramentas como o Visual Studio Code ou Pycharm / IntelliJ também são boas ferramentas para editar markdown, mas aí é coisa pra desenvolvedor mesmo.

Outra coisa comum é sincronizar esse vault utilizando uma solução de versionamento como Git.

## Ferramentas

O pessoal do Obsidian vende um serviço chamado _[Obsidian Vault](https://obsidian.md/publish)_ que simplesmente publica o seu vault do obsidian tal qual ele está no editor. A idéia é muito boa, mas é muito caro: $20.00 por mês dá mais de 100 reais por aqui... Hoje em dia eu gasto 50 com o GCP e acho muito.

Eu achei algumas coisas:
- [Quartz]() - Foi de longe o mais próximo do que eu queria, mas não suporta documentos organizados em hierarquias. Depois da segunda pasta ele já não pega mais nada. Talvez no futuro venha a ser a solução que eu vá adotar.
- [Flowershow](https://flowershow.app/) - Foi o segundo mais próximo, também é feito para funcionar com Obsidian. Não funcionou muito bem, mas é promissor.
- [Jekyll](https://jekyllrb.com/) e [Eleventy](https://www.11ty.dev/) - são geradores de sites estáticos com templates para digital gardens, que adicionam os backlinks e mind maps.
- [Sphinx](https://www.sphinx-doc.org/en/master/), [Mkdocs](https://www.mkdocs.org/), etc. - geradores de documentação que lêem markdown são bem adequados para a tarefa também. Apesar disso, eles normalmente não têm suporte a backlinks nem mindmaps.

Tudo parte de conseguir publicar os arquivos markdown direto da estrutura utilizada pelo seu editor. Depois disso, coisas como os backlinks são legais mas não essenciais.

A ideia de gerar um site estático me agrada pois não é necessário manter infraestrutura como banco de dados ou escrever altos códigos para fazer as coisas funcionar. Vai direto do markdown para o html.

## Mkdocs

Mkdocs é uma solução escrita em Python e nativa para markdown, então decidi usar ele. Tentei os outros mas ou foram muito chatos de configurar ou ainda estão muito crus. Estava escrevendo o meu, mas _eu não quero esse problema na minha cabeça_.

Tem suporte a plugins, muitos temas e é fácil de usar. Quero fuçar nele e adicionar os backlinks via plugins caso seja possível.