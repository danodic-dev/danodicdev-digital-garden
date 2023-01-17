---
title: mkdocs
tags:
  - python
  - mkdocs
  - digital garden
---

# *mkdocs*

Minha configuração atual do mkdocs:

```yaml
site_name: ""
site_url: https://danodic.dev

plugins:
  - search
  - tags:
      tags_file: tags.md

theme:
  name: material
  features:
    - navigation.indexes
    - navigation.footer
  palette:
    scheme: slate
    primary: teal
    accent: teal
  font:
    text: Ubuntu Condensed
    code: Ubuntu Mono
  logo: assets/danodicdev-logo-light.svg

extra:
  alternate:
    - name: Português
      link: /portugues/
      lang: pt-BR
    - name: English
      link: /english/
      lang: en
  social:
    - icon: fontawesome/brands/youtube
      link: https://youtube.com/@danodicdev
    - icon: fontawesome/brands/github
      link: https://github.com/danodic-dev

repo_url: https://github.com/danodic-dev
repo_name: danodic.dev

site_description: Danilo Guimarães' digital garden.
site_author: Danilo Guimarães
copyright: Copyright &copy; 2022 - 2023 Danilo Guimarães

markdown_extensions:
  - attr_list
  - admonition
  - footnotes
  - toc:
      permalink: true
  - tables
```

O uso do tema [Material](https://squidfunk.github.io/mkdocs-material/) adiciona várias coisas legais que tornam o mkdocs mais adequado o uso para digital gardens.

Todo o conteúdo sai do meu vault do Obsidian.