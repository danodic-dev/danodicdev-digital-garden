---
title: Projetos
tags:
  - portugues
---

# Projetos

Estes são os projetos pessoais nos quais eu trabalhei no passado ou venho trabalhando atualmente.

## [Rushbeat](rushbeat.md)

O Rushbeat é um jogo de rítmo onde você toca notas no tempo correto, de forma a tocar uma  música. Ele é similar a jogos como _Beatmania_ e _DJ Max_, porém utiliza o formato de arquivo `bms`, permitindo jogar músicas feitas pela comunidade.  
  
É o principal (e o único, até agora) caso de uso da biblioteca Jao e sua especificação.

## Jao

Jão é um conjunto de projetos menores em que eu trabalhei ao longo do desenvolvimento do [Rushbeat](rushbeat.md).

### [Jao Specification](jao_specification.md)

A especificação Jao define um padrão (e possivelmente um JSON schema, no futuro) para a criação de componentes de UI animados e controlados por eventos, utilizando arquivos JSON.  
  
Ela é utilizada como a base paara implementar este sistema de animação em diferentes linguagens, e permite inter-compatibilidade entre implementações para diferentes linguagens, desde que você tenha uma implementação de biblioteca compatível para esta linguagem.

### [Jao Java](jao_java.md)

A implementação do Jao para Java é utilizado em todos os desenhos de tela do Rushbeat, e permite a criação de elementos de UI animados reutilizáveis com muito menos esforço do que uma abordagem utilizando somente o código.  
  
No Rushbeat, quase todos os componentes de UI utilizam Jao, incluindo elementos específicos de gameplay. A implementação em Java permite extensibilidade utilizando bibliotecas de Ações customizadas e um renderizador customizado.

### [Jao Standard Library](jao_stdlib.md)

A blbioteca padrão para o Jao provê uma implementação de refrência para ações Jao utilizando Java. Seu desenvolvimento foi feito para implementar as ações padrão utilizadas na interface do Rushbeat, e provê a maior parte das ações básicas e inicializadores para a criação de arquivos Jao.

### [Jao Editor](jao_editor.md)

O Jao Edtior é uma ferramenta criada para construir cenas/telas baseadas em Jao. Ele economiza muito tempo enquanto desenhando as telas (ou qualquer outro tipo de UI), permitindo um ciclo de design iterativo.  
  
O Jao Editor foi muito utilizado durante o desenvolvimento do Rushbeat, e permitiu desenhar telas complexas com muito menos esforço do que seria necessário testando as animações diretamente no jogo.

## [Livenumbers](livenumbers.md)

A biblioteca Live Numbers provê números que são encapsulados com comportamentos como interpolação, limitação e outros. Ela também provê uma _factory_ e um _sistema_ que pode ser utilizado para atualizar estes números de uma maneira simples.  
  
Ela é utilizada no Rushbeat de forma a simplificar tarefas como _scrolling_ de notas, movimento de elementos de UI e outras tarefas _repetitivas porém chatas_ relacionadas à números.

## [Minumtium](minumtium.md)

Uma biblioteca de _blogging_ mínima, para necessidades de _blogging_ mínimas.  
  
A biblioteca Minumtium é utilizada como a biblioteca de blogging para o _danodic.dev_e é muito simples, ao ponto que tem menos de 300 linhas de código. Ela foi feita de forma que _adapters_ customizados podem ser plugados nela para extender sua funcionalidade.

## [Le Memaker](lememaker.md)

Uma ferramenta que permite a criação simples e rápida de _memes de citação_, seguindo um padrão  restrito de controle de qualidade -- permitindo gerar memes que têm as mesmas fontes, layouts e tamanhos.

## [Pianopad](pianopad.md)

Pianopad é uma solução para permitir o uso de controladores Novation Launchpad como teclados. Teclado como em música, não como em digitação. Bem, _teclados como em digitação também_, mas principalmente como em música.

## [danodic.dev](danodicdev.md)

_danodic.dev_ é esta página que você está vendo agora. Não há nada de especial nela, apenas um monte de projetos aleatórios de uma pessoa aleatória.

## Outros

Esta página tem projetos antigos ou pequenos que eu fiz de uma vez só. Esta são coisas que em sua maioria foram criadas para resolver um problema específico e não foram mais tocadas depois do desenvolvimento inicial.

- [Argibi](argibi.md)
- [Hd Tester](hd_tester.md)
- [ricardinho.py](ricardinho.py.md)