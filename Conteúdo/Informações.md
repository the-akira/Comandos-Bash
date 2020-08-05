# Informações do Sistema

Existem diversos comandos que podem nos trazer informações úteis sobre o sistema que estamos operando.

Para saber apenas o **nome do sistema**, você pode usar o comando **uname** sem nenhuma opção:

```bash
uname 
# Linux
```

Para visualizar o nome do host da sua rede, use a opção **'-n'** com o comando **uname**:

```bash
uname -n 
# akira
```

Para obter informações sobre o kernel, usamos a opção **'-v'**:

```bash
uname -v 
# #46~18.04.1-Ubuntu SMP Fri Jul 10 07:21:24 UTC 2020
```

Para obter as informações sobre a versão do seu kernel, use a opção **'-r'**:

```bash
uname -r
# 5.4.0-42-generic
```

Para imprimir o nome do hardware da sua máquina, use a opção **'-m'**:

```bash
uname -m
# x86_64
```

Todas essas informações podem ser impressas de uma só vez utilizando a opção **'-a'**:

```bash
uname -a 
# Linux akira 5.4.0-42-generic #46~18.04.1-Ubuntu SMP Fri Jul 10 07:21:24 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
```

Informações sobre a distribuição Linux podem ser encontradas nos arquivos *release*:

```bash
cat /etc/*-release
```

Podemos também usar o arquivo **version**, localizado em `/proc/`:

```bash
cat /proc/version
```

## Informações de Hardware

A ferramenta **lshw** pode ser usada para coletar informações abrangentes sobre os componentes de hardware, como CPU, discos, memória, controladores USB, etc.

**Importante**: Lembre-se de que o comando **lshw** é executado pelo superusuário(root) ou pelo usuário sudo.

Para imprimir informações sobre o hardware do sistema Linux, podemos executar o comando.

```bash
sudo lshw
```

É possível imprimir um resumo das informações do seu hardware usando a opção **-short**.

```bash
sudo lshw -short
```

Se você deseja gerar uma saída como um arquivo html, pode usar a opção **-html**.

```bash
sudo lshw -html > lshw.html
```

## Informações de CPU

Para visualizarmos informações sobre a CPU, usamos o comando lscpu, pois mostra informações sobre a arquitetura da CPU, como número de CPUs, núcleos, modelo de família de CPUs, caches de CPU, threads, etc.

```bash
lscpu
```

Também podemos recorrer ao arquivo **cpuinfo**

```bash
cat /proc/cpuinfo 
```

## Informações sobre Block Devices

*Block Devices* são dispositivos de armazenamento, como discos rígidos, unidades flash etc. O comando **lsblk** é usado para relatar informações sobre os *block devices* da seguinte maneira.

```bash
lsblk
```

Para obtermos informações específicas sobre a memória, podemos utilizar o comando

```bash
cat /proc/meminfo
```

Para sabermos quanto há de memória em uso e disponível e *swap*, o comando **free** pode nos ajudar, com a opção **-m** podemos ver em *MB*.

```bash
free -m
```

- `-b`: Saída em bytes

- `-k`: Saída em kilobytes

- `-m`: Saída em megabytes

Se você deseja visualizar todos os *block devices* no seu sistema, inclua a opção **-a**.

```bash
lsblk -a
```

## Informações sobre os Controladores USB

O comando **lsusb** é usado para relatar informações sobre controladores USB e todos os dispositivos conectados a eles.

```bash
lsusb
```

Você pode usar a opção **-v** para gerar informações detalhadas sobre cada dispositivo USB.

```bash
lsusb -v
```

## Informações sobre Dispositivos PCI

Os dispositivos PCI podem incluir portas USB, placas gráficas, adaptadores de rede etc. A ferramenta **lspci** é usada para gerar informações sobre todos os controladores PCI do seu sistema, além dos dispositivos conectados a eles.

Para imprimir informações sobre dispositivos PCI, executamos o seguinte comando.

```bash
lspci
```

A opção **-t** pode ser usada para produzir saída em um formato de árvore.

```bash
lspci -t
```

A opção **-v** produz informações detalhadas sobre cada dispositivo conectado.

```bash
lspci -v
```

## Informações do Sistema de Arquivos Linux

Para coletarmos informações sobre partições do sistema de arquivos, podemos usar o comando **fdisk**. Embora a principal funcionalidade do comando fdisk seja modificar partições do sistema de arquivos, ele também pode ser usado para visualizar informações sobre as diferentes partições no seu sistema de arquivos.

Podemos imprimir as informações da partição da seguinte maneira. Lembre-se de executar o comando como superusuário.

```bash
sudo fdisk -l
```

O comando **df**(disk free), quando usado sem nenhuma opção, exibe informações sobre o espaço total em disco, o espaço em disco atualmente em uso e o espaço livre em todas as unidades montadas. Se um diretório for especificado, as informações serão limitadas à unidade em que esse diretório está localizado.

- `-H`: mostra o número de blocos ocupados em gigabytes, megabytes ou kilobytes - em formato legível por humanos

- `-t`: Tipo de sistema de arquivos (ext2, nfs, etc.)

O comando **du** quando executado sem nenhum parâmetro, mostra o espaço total em disco ocupado por arquivos e subdiretórios no diretório atual.

- `-a`: Exibe o tamanho de cada arquivo individual

- `-h`: Saída em formato legível por humanos

- `-s`: Exibe apenas o tamanho total calculado

## Extrair Informações sobre Componentes de Hardware

Podemos também usar o utilitário **dmidecode** para extrair informações de hardware lendo dados das [tabelas DMI](https://en.wikipedia.org/wiki/Desktop_Management_Interface).

Para imprimir informações sobre memória, executamos este comando como um superusuário.

```bash
sudo dmidecode -t memory
```

Para imprimir informações sobre o sistema, executamos este comando.

```bash
sudo dmidecode -t system
```

Para imprimir informações sobre o BIOS, executamos este comando.

```bash
sudo dmidecode -t bios
```

Para imprimir informações sobre o processador, executamos este comando.

```bash
sudo dmidecode -t processor
```

Para sabermos o fabricante podemos usar o comando.

```bash
sudo dmidecode -s system-manufacturer
```

Para sabermos o modelo podemos usar o comando.

```bash
sudo dmidecode -s system-product-name
```

## Data e Calendário

O comando **date** nos traz informação sobre o dia e horário e o comando **cal** nos traz um calendário, ambos contam com diversas opções.