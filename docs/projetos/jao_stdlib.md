---
title: "Jao Standard Library"
tags:
  - java
  - libgdx
  - windows
  - linux
  - gamedev
  - jao
---

# Jao Standard Library ([GitHub](https://github.com/danodic-dev/jao-standard-library))  

![Jao Logo](../assets/jao-logo-light.svg)
{: style="height:200px;width:200px"} 

---
  
Enquanto a [Biblioteca Jao](jao-java.md) define como gerenciar e controlar os objetos Jao criados, a _Jao Standard Library_ implementa as _ações_ e _inicializadores_ para definir o comportamento das ações definidas no arquivo `jao.json`.  
  
Estas ações manipulam valores utilizados pelo _renderizador_ quando mostrando as coisas na tela. Estes valores normalmente são valores _float_, mas eles podem ser _booleans_, _strings_, qualquer coisa que você quiser. Estes valores são utilizados pelo renderizados para controlar coisas como opacidade, posição, rotação e outros atributos de um sprite.  
  
A biblioteca provê a habilidade de disparar e gerenciar diferentes tipos de eventos no seu jogo:  
  
- Fade In  
- Fade Out  
- Rotação  
- Escala  
- Translação  
- Pulsar / Piscar  
- Tocar/Parar sons  
- Tocar/Parar vídeos  
  
É importante mencionar que o que estas ações fazem na maior parte do tempo é gerenciar números. Elas tomam conta de interpolar valores, acumular valores, etc. A implementação do _Renderizador_ precisa pegar estes valores e fazer alguma coisa om eles -- este renderer é implementado na lógica do jogo/aplicação.  
  
  
## Tecnlogia  
Foi utilizado Java 8 e as interfaces providas pela biblioteca [jao-java](jao-java.md).  
  
## Timeline  
  
- **Novembro de 2019** - Ações iniciais implementadas.  
- **Maio de 2021** - Ações para controlar vídeos.