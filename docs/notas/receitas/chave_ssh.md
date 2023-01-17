---
title: Chave SSH
tags:
  - linux
  - ssh
---

# Criando Chave SSH

Comandinho maroto:
```sh
ssh-keygen -t rsa -b 4096 -C "fulano@beutrano.com"
```

Arquivos vão para `~/.ssh/`.

## Notas:
- Sempre usar chaves de 4096 ou mais. Provavelmente mais se 2023 foi há muito tempo atrás.