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

Para visualizarmos informações sobre a CPU, usamos o comando lscpu, pois ele mostra informações sobre a arquitetura da CPU, como número de CPUs, núcleos, modelo de família de CPUs, caches de CPU, threads, etc.

```bash
lscpu
```

Também podemos recorrer ao arquivo **cpuinfo** para obter informações

```bash
cat /proc/cpuinfo 
```

Para localizarmos se CPU é de 32 bits ou 64 bits podemos executar

```bash
getconf LONG_BIT
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

## Desligar e Reiniciar o Sistema

No Linux, como em todas as tarefas, as operações de desligamento e reinicialização também podem ser feitas na linha de comando. Os comandos normalmente utilizados são **shutdown**, **halt**, **poweroff**, **reboot**.

Os comandos são úteis especialmente quando precisamos reiniciar um servidor Linux remoto, onde apenas o acesso ao shell está disponível e não há interface de usuário. Os servidores geralmente precisam ser reiniciados quando as atualizações são instaladas ou precisam ser desligados para outras tarefas de manutenção.

### shutdown

O comando **shutdown** pode ser usado para desligar um sistema ou reiniciá-lo. É comumente usado para desligar ou reinicializar máquinas locais e remotas.

shutdown faz com que o sistema seja desativado de maneira segura. Todos os usuários logados são notificados de que o sistema está caindo e, nos últimos cinco minutos de **TEMPO**, novos logins são impedidos.

A síntaxe dele é:

```
shutdown [OPÇÃO] [TEMPO] [MENSAGEM]
```

Para desligar uma máquina podemos executar o shutdown da seguinte forma:

```bash
shutdown -h now
```

A opção **-h** é para *halt*, o que significa parar. O segundo parâmetro é o parâmetro de tempo. "**now**" significa desligar o sistema imediatamente.

O parâmetro de tempo também pode ser especificado em minutos ou horas. Por exemplo:

```bash
shutdown -h +5 "Server vai cair para atualização, por favor, salve seu trabalho."
```

O comando acima deve mostrar a mensagem para todos os outros usuários conectados e dar a eles 5 minutos antes que o sistema seja desligado.

O comando shutdown também pode ser usado para reiniciar um sistema com a opção **-r**:

```bash
shutdown -r +5 "Server vai cair para atualização, por favor, salve seu trabalho."
```

Todos os outros usuários conectados verão uma mensagem de transmissão em seus terminais, neste ponto, o shutdown pode ser cancelado chamando-o com a opção "**-c**".

```bash
shutdown -c
```

### reboot

O comando **reboot** pode ser utilizado para desligar ou reiniciar o sistema Linux.

O seguinte comando desligará o Linux:

```bash
reboot -p
```

A opçõe "**-p**" significa poweroff. Para reinicializar o Linux, basta chamarmos o comando reboot diretamente sem nenhuma opção.

```bash
reboot
```

Isso executará um desligamento normal e reinicialização da máquina. Isso é o que acontece quando você clica em reiniciar no menu gráfico.

Já o comando a seguir forçará a reinicialização da máquina. Isso é semelhante a pressionar o botão liga/desliga. Nenhum desligamento ocorre. O sistema será reiniciado instantaneamente.

```bash
reboot -f
```

### halt

O comando **halt** também pode desligar um sistema:

```bash
halt
```

Para mais detalhes e opções:

```bash
man halt 
```

### poweroff

**poweroff** é um comando muito semelhante ao comando halt. Ele faz as mesmas coisas e usa as mesmas opções.

```bash
poweroff
```

### REISUB - Pressionamento das teclas R E I S U B

Os comandos mostrados acima podem ser usados ​​quando você está no controle de seu sistema. E se o sistema travou e não está respondendo? E você não quer pressionar o botão liga/desliga da CPU, o que pode levar à corrupção de dados. Para salvar de tal situação, vêm as chaves mágicas sysRQ.

Uma combinação especial de pressionamentos de tecla que permitirá que você reinicie seu sistema Linux, não importa o quanto ele esteja travado.

"Um uso comum da chave mágica **SysRq** é realizar uma reinicialização segura de um computador Linux que, de outra forma, travou. Isso pode evitar que um fsck seja necessário na reinicialização e dá a alguns programas a chance de salvar backups de emergência de trabalhos não salvos."

**Atenção!**: Pressionar as seguintes teclas reinicializaria instantaneamente o seu sistema. É semelhante a pressionar o botão liga/desliga ou executar o comando `reboot -f`.

```
ALT + PrintScreen + B
```

Agora, no lugar da tecla **B**, temos que usar as letras **R** **E** **I** **S** **U** primeiro. Cada chave realiza uma tarefa conforme mencionado abaixo:

```
unRaw      (take control of keyboard back from X),
 tErminate (send SIGTERM to all processes, allowing them to terminate gracefully),
 kIll      (send SIGKILL to all processes, forcing them to terminate immediately),
  Sync     (flush data to disk),
  Unmount  (remount all filesystems read-only),
reBoot.
```

O procedimento então é:

1. Mantenha pressionadas as teclas Alt e SysRq (Print Screen).
2. Enquanto as mantém pressionadas, digite as seguintes teclas em ordem, com um intervalo: `R E I S U B`
3. O computador deve reiniciar.

Certifique-se de ter algum intervalo de tempo entre cada uma das teclas `R E I S U B`.

O recurso **sysrq** pode ser controlado alterando o valor de `/proc/sys/kernel/sysrq`.

## Data e Calendário

O comando **date** nos traz informação sobre o dia e horário e o comando **cal** nos traz um calendário, ambos contam com diversas opções.