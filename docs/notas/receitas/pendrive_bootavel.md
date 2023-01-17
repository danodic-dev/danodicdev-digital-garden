---
tags:
  - linux
  - windows
  - uefi
  - boot
---

# Criando pendrive bootável UEFI do Windows 10 no Linux  
  
## Requisitos
  
- Pendrive de 8gb ou mais  
- Estar a fim de usar um sistema operacional _ruim_.  
  
## Passos
  
- Preparar pendrive:  
	- Apagar todas as particões do pendrive.  
	- Criar uma partição FAT32 de 1gb no inicio do espaço vazio.  
	- Criar uma partição NTFS ocupando o resto do espaço.  
- Montar a ISO do Windows.  
- Copiar arquivos de boot de dentro da ISO:  
	- Copiar as pastas `boot`, `efi`, `support` para a partição FAT32 do pendrive.  
	- Copiar todos os arquivos na raiz da iso para a raiz da partição FAT32 do pendrive.  
	- Criar uma pasta com o nome `sources` na raiz da partição FAT32 do pendrive.  
	- Copiar o arquivo `sources/boot.wim` de dentro da ISO para a pasta `sources` do pendrive.  
- Copiar toda a pasta `sources` para a partição NTFS do pendrive.  
  
## Notas
  
- ISOs mais novas do Windows 10 têm um arquivo maior de 4gb que precisa ser copiado para o pendrive. Esse arquivo não pode ser copiado para uma partição FAT32. Por isso precisamos fazer essa gambiarra toda (senão deveriamos apenas copiar tudo de dentro da ISO para o pendrive).  
- Alguns sites mencionam que copiar tudo da ISO para o pendrive deveria funcionar, contanto que o pendrive estivesse formatado como exFat. Não funcionou para mim.  
- Eu não quero usar Windows, preciso arrumar o computador de outra pessoa.  
  
## Fontes
  
- https://techbit.ca/2019/02/creating-a-bootable-windows-10-uefi-usb-drive-using-linux/