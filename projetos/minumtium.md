---
title: "Minumtium"
tags:
  - python
  - pydantic
  - fastapi
  - sqlalchemy
  - pyjwt
  - sqlite
  - postgres
  - pytest
---

# Minumtium ([Github](https://github.com/danodic-dev/minumtium))
---

![Minumtium Logo](../assets/minumtium-logo-light.svg)
  
Minumtium é uma micro biblioteca de blogging (mas não uma biblioteca de _microblogging_) que foi criada para ser simples, porém extensível. O núcleo tem menos de 300 linhas de código, e tem uma arquitetura feita de forma que você possa estendê-lo usando _adaptadores_ que podem ser fornecidos como bibliotecas python externas.  
  
O Minumtium não foi feito com usuários finais em mente - não é algo que você vai baixar e _deployar_ como um WordPress. Ele foi feito para que seja fácil para um desenvolvedor incorporá-lo em um projeto maior, como esta página de portefólio.  
  
Não foi feito para fazer muita coisa, a ponto de nem ter gerenciamento de perfil de usuário: você pode assinar o post com qualquer nome a qualquer momento. Provavelmente não é a melhor escolha para um sistema de gerenciamento de conteúdo multiusuário, mas funciona muito bem para páginas pessoais de qualquer tipo.  
  
## Tecnologia  
Este projeto foi iniciado em Clojure, mas foi finalizado em Python. Ele usa _um monte_ de coisas:  
  
- Pydantic  
- FastAPI  
- SQL Alchemy  
- SQLite  
- Postgres  
- Setuptools  
- Pipenv  
- Pyjwt  
- bcrypt  
- Pytest  
- GitHub Actions  
- Keep a Changelog  
  
## Timeline  
  
- **janeiro ~ maio de 2022** - desenvolvimento inicial e integração ao site _danodic.dev_.