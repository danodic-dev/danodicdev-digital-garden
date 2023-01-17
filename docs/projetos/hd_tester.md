---
title: "Hd Tester"
tags:
  - python
  - linux
---
# Hd Tester ([GitHub](https://github.com/danodic/hdtester))  
  
Meu irmão tinha um disco rígido que estava apresentando falhas, mas era intermitente. O disco era novo, e ele queria  fazer o RMA mas não tinha certeza (nós teríamos que pagar pelo envio caso não estivesse quebrado). Então, ele me pediu  para testar o disco para ele. Eu dei uma olhada em ferramentas para fazer isso, mas eu percebi que é algo azoavelmente  
simples de ser feito: apenas tentar copiar arquivos repetidamente esperando chegar a erros de escrita/leitura. Deve ser  fácil.  
  
E de fato foi bem simples. Eu usei uma iso do [Xubuntu](https://xubuntu.org) e criei um script que iria ficar copiando  esta iso em uma pasta até lotar o disco. O script também faz uma validação de checksum para cada arquivo salvo, de forma  a garantir que o arquivo foi escrito da forma correta. Ele gera um arquivo de texto com um relatório mostrando quantos  erros de I/O aconteceram e quando:  
  
```  
THE AWESOME HD TESTER OUTPUT REPORT  
Did it finish? No, it has aborted.Amount of file created: 1000  
Amount of hashes failed: 10 / 0.01  
IO/Disk Errors: 0 / 0.0  
Other errors: 0 / 0.0  
Breakdown of IO/Disk Errors:  
...  
Detailed log:  
Tue Sep 15 12:30:54 2020-HASH ERROR-Hash check for file dummy_file_1.tst has failed. Will (probably) delete the file and try again.  
...  
```  
  
Depois de todo o teste eu tinha evidência o suficiente de que o disco estrava estragando e mandei para o RMA. Ele estava inclusive batendo a cabeça de leitura, então provavelmente era um problema mecânico. Porém, isso acontecia apenas quando o disco estava próximo da capacidade máxima. Isto era exatamente o que eu queria validar: sendo um disco grande, esta falha iria aparecer apenas mais tarde do ciclo de vida do disco, talvez alguns anos depois quando ele deveria começar a ficar mais cheio. E a essas alturas a garantia teria vencido.  
  
Nós recebemos um disco novo e eu testei novamente com o script -- tudo funcionou bem e eu nunca mais usei o script novamente.

## Tecnologia
- Python  
- Algumas coisas sobre código de I/O do sistema operacional, para identificar quando havia falhas de escrita, quando o disco estava cheio e coisas do tipo.