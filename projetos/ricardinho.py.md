---
title: "ricardinho.py"
tags:
  - python
  - chatbot
  - discord
---

# Ricardinho.py  
  
Quando a pandemia começou eu percebi que iria ficar doente da cabeça caso não encontrasse uma forma de conversar com outras pessoas como eu fazia no escritório -- eu moro sozinho e iria passar algumas semanas distante da minha família. Com isso em mente, eu criei um canal do _Discord_ e convidei meus amigos para lá.  
  
O canal cresceu muito mais do que eu esperava, e eu passava o dia conversando com o pessoal lá. Um dia uma das coisas que nós fizemos foi adicionar o bot _Groovy_, para que nós pudessemos ouvir música enquanto conversando. Eu não estava habituado ao conceito de bots, e isso pareceu interessante.  
  
Eu comecei a dar uma olhada em como isso funciona, e então o _Ricardinho.py_ nasceu. Este é um bot de discord que foi baseado no meme do _Ricardo Milos_, que era basicamente um dos nossos memes favoritos naquele momento. Era um bot com muita funcionalidade útil:  
  
- Enviava mensagens aleatórias no chat, incomodando os usuários que estavam tentando conversar. Alguns usuários tinham mensagens _customizadas_ direcionadas a eles.  
- Enviar DMs aleatórias para os usuários do canal com gifs aleatórios do Ricardo Milos dançando. Alguns usuários também tinham DMs customizadas.  
- Existinham alguns comandos para pedir gifs, como `!ricardinho`.  
  
![Ricardinho Screenshots](https://storage.googleapis.com/danodicdev-public/public/other/images/ricardinho.png)  
  
Algumas pessoas ficaram _realmente_ incomodadas com o bot e bloquearam ele. Algumas pessoas saíram do canal.  
  
Mais tarde eu criei uma extensão deste script chamada _Andrézinho_ (outro meme, _deixa os garoto brincar_) para tocar música para nós:  
  
- Ele tocava áudio de vídeos usando uma URL do youtube.  
- Dava para montar playlists, e outros usuários poderiam montar estas playlists de forma colaborativa.  
- Ele conseguia entrar em mais de uma sala, o que era uma limitação do _Groovy_.  
  
O problema é que a minha conexão de internet era tão ruim que eu não consegui mais rodar o bot, e eu tive que desligar ele.  
  
## Tecnologia  
  
- Python  
- Discord Client Library para Python  
- Asyncio  
- Requests  
- Youtube-dl  
- FFMpeg