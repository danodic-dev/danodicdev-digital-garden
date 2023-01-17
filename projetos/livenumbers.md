---
title: "Livenumbers"
tags:
  - java
  - testng
  - gamedev
---

# Livenumbers ([Github](https://github.com/danodic-dev/live-numbers))  

![Livenumbers Logo](../assets/livenumbers-logo-light.svg)

---

Livenumbers é uma biblioteca que provê classes que encapsulam números e aplicam comportamento a eles, como _Adders_ (acumuladores), _Interpolators_ (interpoladores) e outros.  
  
Ela se parece com isso:  
  
```Java  
// Cria um novo sistema de livenumbers  
LiveNumbersSystem system = new LiveNumbersSystem();  
  
// Pede um novo increaser para o sistema  
Increaser increaser = system.getIncreaser();  
  
// Cria um novo adder usando o Builder, adicionando um Increaser como observer  
Adder adder = Adder.builder()
                   .withSystem(system)
                   .withValue(10d)
                   .withStep(0.1d)
                   .allowNegative(false)
                   .withStepObserver(increaser::setStep)
                   .build();  

while (true) {  
    // Podemos chamar update() em um loop para atualizar os números   
    system.update();  
    // Podemos imprimir as variáveis no console para inspecionar seus valores    
    System.out.println(adder);
    System.out.println(increaser);
}  
```  
  
## Tecnologia  
  
A biblioteca foi desenvolvida em _Java_, já que é a linguagem utilizada no [Rushbeat](rushbeat.md). É uma biblioteca muito simples, então a única biblioteca utilizada é o _TestNG_ para alguns testes.  
  
## Timeline  
  
- **Fevereiro de 2021** - Versão inicial integrada no Rushbeat. [Video](https://open.lbry.com/@danodic.dev:5/integrated_live_numbers_post_processing_pipeline_and_gameplay:e)  
- **Maio de 2022** - Melhorias com builders e observers.