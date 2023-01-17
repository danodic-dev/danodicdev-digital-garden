---
title: "Jao Java"
tags:
  - java
  - libgdx
  - windows
  - linux
  - gamedev
  - testng
  - jao
---

# Jao Java ([GitHub](https://github.com/danodic-dev/jao-java)) 

![Jao Logo](../assets/jao-logo-light.svg)
{: style="height:200px;width:200px"} 

---
  
`jao-java` é uma implementação da [Especificação Jao](/en/projects/jao_specification) em java. É usado para criar Elementos de UI animados e orientados a eventos usando arquivos `.json`. Seu principal caso de uso foi criar praticamente todos os elementos de interface do usuário no [Rushbeat](rushbeat.md).  
  
Você pode escrever um arquivo `.json` e adicionar instruções como _"fade in por 3 segundos em 0,5 segundos"_ ou _" deslize da sua posição para x,y ao longo de um intervalo de tempo de 3 segundos"_. Aqui está um exemplo de como uma animação se parece:  
  
![Rushbeat Jao Example](https://user-images.githubusercontent.com/6846892/152474666-3dfc1d63-b468-4002-9bc6-ac81e5b4b951.gif)  
  
Aqui está uma lista de recursos que ele fornece:  
  
- Suporte para várias camadas no mesmo arquivo `.json`, cada camada com vários eventos.  
- Várias ações no mesmo evento;  
- Deslocamentos de Posição;  
- Renderizadores personalizados;  
- Bibliotecas de ações personalizadas;  
- Análise de pastas e arquivos `.jao`;  
- Relógios personalizados / gerenciamento de tempo;  
- Uso de expressões de tempo.  
  
Esta é a implementação de referência para a [Especificação Jao](/en/projects/jao_specification), e é de onde a especificação surgiu.  
  
## Tecnologia  
Eu usei Java 8 com Gson para o _core_ da biblioteca. Eu também usei [reflections](https://github.com/ronmamo/reflections) para descobrir as ações disponíveis no caminho de classe. Eu usei o TestNg para os testes, e todo o processo de teste e lançamento foi automatizado usando o GitHub Actions.  
  
## Timeline  
  
- **Outubro de 2019** - Desenvolvimento inicial e primeiras provas de conceito. [[Video1](https://odysee.com/@danodic.dev:5/json_animation_objects_jao_1st_demo_libgdx_jao_gdx_edit:6)] [[Video2](https://odysee.com/@danodic.dev:5/rushbeat_devlog_jao_file_inexis_logo_final_so_far:0)]  
- **Novembro de 2019** - Integração inicial no jogo. [[Video1](https://odysee.com/@danodic.dev:5/rushbeat_devlog_initial_integration_of_skin_system_and_conversion_to_4k_skin.:0)] [[Video2](https://odysee.com/@danodic.dev:5/rushbeat_devlog_new_logo_screen_done_using_jao:7)]  
- **Dezembro de 2019 ~ Janeiro de 2020** - Refatoração.  
- **Algum momento em 2021** - Melhorias de performance e bug fixes.
