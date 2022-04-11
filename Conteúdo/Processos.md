# Gerenciamento de Processos

## Breve Histórico

Com o passar do tempo os computadores ficaram mais rápidos enquanto que o [tempo computacional](https://en.wikipedia.org/wiki/Time-sharing) ainda não era barato nem totalmente utilizado, esse ambiente tornou *[multiprogramming](https://en.wikipedia.org/wiki/Computer_multitasking#Multiprogramming)* possível e necessário. Multiprogramação significa que vários programas são executados [simultaneamente](https://en.wikipedia.org/wiki/Concurrency_(computer_science)).

No início, mais de um programa era executado em um único processador, como resultado da arquitetura subjacente do computador [uniprocessador](https://en.wikipedia.org/wiki/Uniprocessor_system), e eles compartilhavam recursos de hardware escassos e limitados, consequentemente, a simultaneidade era de natureza serial. Em sistemas posteriores com [múltiplos processadores](https://en.wikipedia.org/wiki/Multiprocessing), vários programas podem ser executados simultaneamente em [paralelo](https://en.wikipedia.org/wiki/Parallel_computing).

Os programas consistem em sequências de instruções para processadores. Um único processador pode executar apenas uma instrução de cada vez: é impossível executar mais programas ao mesmo tempo. Um programa pode precisar de algum [recurso](https://en.wikipedia.org/wiki/System_resource), como um dispositivo de *input*, com um possível grande *delay*, ou um programa pode iniciar uma operação lenta, como o envio de *output* para uma impressora. Isso levaria o processador a ficar "inativo" (não utilizado). Para manter o processador sempre ocupado, a execução de um programa desse tipo é interrompida e o sistema operacional alterna o processador para executar outro programa. Para o usuário, parece que os programas são executados ao mesmo tempo (surge então o termo "paralelo").

Pouco tempo depois, a noção de "programa" foi expandida para a noção de "programa em execução e seu contexto". Nasceu o conceito de processo, que também se tornou necessário com a invenção do *[re-entrant code](https://en.wikipedia.org/wiki/Reentrancy_(computing))*.

*Threads* vieram um pouco mais tarde. No entanto, com o advento de conceitos como *[time-sharing](https://en.wikipedia.org/wiki/Time-sharing)*, [redes de computadores](https://en.wikipedia.org/wiki/Computer_network) e computadores com [memória compartilhada](https://en.wikipedia.org/wiki/Shared_memory) com várias CPUs, a antiga "multiprogramação" deu lugar à verdadeira [multitarefa](https://en.wikipedia.org/wiki/Computer_multitasking), multiprocessamento e, posteriormente, [multithreading](https://en.wikipedia.org/wiki/Thread_(computing)#Multithreading).

## Processo

Na computação, um processo é a [instância](https://en.wikipedia.org/wiki/Instance_(computer_science)) de um [programa de computador](https://en.wikipedia.org/wiki/Computer_program) que está sendo executado por um ou vários *threads*. 

Ele contém o código do programa e sua atividade. Dependendo do [sistema operacional(SO)](https://en.wikipedia.org/wiki/Operating_system), um processo pode ser composto de vários threads de execução que executam instruções [simultaneamente](https://en.wikipedia.org/wiki/Concurrency_(computer_science)).

Um programa de computador é uma coleção passiva de instruções, já um processo é a execução real dessas instruções. Vários processos podem estar associados ao mesmo programa; por exemplo, abrir várias instâncias do mesmo programa geralmente resulta em mais de um processo sendo executado.

A [multitarefa](https://en.wikipedia.org/wiki/Computer_multitasking) é um método para permitir que vários processos compartilhem [processadores](https://en.wikipedia.org/wiki/Central_processing_unit)(CPU's) e outros recursos do sistema. Cada CPU(núcleo) executa uma única tarefa de cada vez. No entanto, a multitarefa permite que cada processador alterne entre as tarefas que estão sendo executadas sem ter que esperar a conclusão de cada tarefa(*[preemption](https://en.wikipedia.org/wiki/Preemption_(computing))*).

## Representação

Em geral, um processo de sistema de computador consiste dos seguintes recursos:

- Uma imagem do código de máquina executável associado a um programa.
- Memória (normalmente alguma região da [memória virtual](https://en.wikipedia.org/wiki/Virtual_memory)), que inclui o código executável, dados específicos do processo (*input* e *output*), uma [callstack](https://en.wikipedia.org/wiki/Call_stack)(para rastrear sub-rotinas ativas e/ou outros eventos) e uma [heap](https://en.wikipedia.org/wiki/Memory_management#Dynamic_memory_allocation) para armazenar dados de computação intermediários gerados durante o tempo de execução.
- Descritores de recursos do sistema operacional que são alocados ao processo, como [file descriptors](https://en.wikipedia.org/wiki/File_descriptor)(terminologia Unix) ou [handles](https://en.wikipedia.org/wiki/Handle_(computing))(Windows) e fontes de dados.
- Atributos de segurança, como o proprietário do processo e o conjunto de permissões do processo (operações permitidas).
- Estado do processador([contexto](https://en.wikipedia.org/wiki/Context_(computing))), como o conteúdo dos registradores e o endereçamento da memória física. O estado normalmente é armazenado nos registros do computador quando o processo está em execução e na memória.

O sistema operacional mantém a maioria dessas informações sobre processos ativos em estruturas de dados chamadas [blocos de controle de processo](https://en.wikipedia.org/wiki/Process_control_block). Qualquer subconjunto de recursos, geralmente ao menos o estado do processador, pode ser associado a cada um dos [threads](https://en.wikipedia.org/wiki/Thread_(computer_science)) do processo nos sistemas operacionais que suportam *threads* ou processos filhos(*child processes*).

O sistema operacional mantém seus processos separados e aloca os recursos de que precisam, para que tenham menos probabilidade de interferir um com o outro e causar falhas no sistema(exemplo: [deadlock](https://en.wikipedia.org/wiki/Deadlock) ou [thrashing](https://en.wikipedia.org/wiki/Thrashing_(computer_science))).

O sistema operacional também pode fornecer mecanismos de [comunicação entre processos](https://en.wikipedia.org/wiki/Inter-process_communication) para permitir que os processos interajam de maneiras seguras e previsíveis.

## Estados do Processo

Um [kernel](https://en.wikipedia.org/wiki/Kernel_(computing)) do sistema operacional que permite a **multitarefa** necessita que os processos tenham [determinados estados](https://en.wikipedia.org/wiki/Process_states). Os nomes desses estados não são padronizados, mas eles têm uma funcionalidade semelhante.

- Primeiro, o processo é "criado" ao ser carregado de um dispositivo de armazenamento secundário (unidade de disco rígido, CD-ROM, etc.) na memória principal. Depois disso, o [agendador de processos](https://en.wikipedia.org/wiki/Scheduling_(computing)) atribui o estado "em espera".
- Enquanto o processo está "em espera", ele aguarda o agendador fazer a chamada [troca de contexto](https://en.wikipedia.org/wiki/Context_switch). A opção de contexto carrega o processo no processador e altera o estado para "em execução" enquanto o processo "em execução" anterior é armazenado no estado "em espera".
- Se um processo no estado "em execução" precisar aguardar um recurso(esperar pelo input de um usuário ou abrir um arquivo), será atribuído o estado "bloqueado". O estado do processo é alterado novamente para "aguardando" quando o processo não precisa mais esperar(em um estado bloqueado).
- Depois que o processo termina a execução ou é finalizado pelo sistema operacional, ele não é mais necessário. O processo é removido instantaneamente ou é movido para o estado "finalizado". Quando removido, ele apenas esperar ser removido da memória principal.

A imagem a seguir representa os vários estados do processo, exibidos em um diagrama de estados, com setas indicando possíveis transições entre estados.

![img](https://raw.githubusercontent.com/the-akira/Comandos-Bash/master/Imagens/Process_states.png)

## Rastreando Processos com top

[top](https://linux.die.net/man/1/top) é a ferramenta que usamos para obter uma visualização em tempo real da utilização do sistema por nossos processos:

Pressione **H** para acessar uma página que explica brevemente as opções principais para personalizar o programa.

![img](https://raw.githubusercontent.com/the-akira/Comandos-Bash/master/Imagens/top.png)

Vamos então interpretar o significado do *output* do top

### Linha 1

É a mesma informação que veríamos se executássemos o comando **uptime**

Os campos são respectivamente, da esquerda para a direita:

1. Horário atual
2. Há quanto tempo o sistema está em execução
3. Quantos usuários estão conectados no momento
4. Média de carga do sistema

### Linha 2

Tarefas em execução, em suspensão, interrompidas e *zombied*.

### Linha 3

Informação do CPU:

1. us: user CPU time - Porcentagem do tempo de CPU gasto na execução de processos de usuários que não são *[niced](https://en.wikipedia.org/wiki/Nice_(Unix))*.
2. sy: system CPU time - Porcentagem do tempo de CPU gasto executando os processos do kernel e o próprio kernel.
3. ni: nice CPU time - Porcentagem de tempo de CPU gasto executando processos *[niced](https://en.wikipedia.org/wiki/Nice_(Unix))*
4. id: tempo ocioso da CPU - porcentagem do tempo da CPU gasto ocioso.
5. wa: I/O wait - Porcentagem do tempo de CPU gasto aguardando Input/Output. Se esse valor for baixo, o problema provavelmente não é a I/O de disco ou de rede.
6. hi: interrupções de hardware - Porcentagem de tempo de CPU gasto servindo interrupções de hardware.
7. si: interrupções de software - porcentagem de tempo de CPU gasto atendendo interrupções de software.
8. st: steal time - Se você estiver executando máquinas virtuais, esta é a porcentagem de tempo de CPU que foi extraída de você para outras tarefas.

### Linhas 4 e 5

Representam o uso de memória e uso de swap.

### Lista de Processos Atualmente em Uso

Significado de cada coluna:

1. **PID**: ID do processo
2. **USER**: Usuário que é o proprietário do processo
3. **PR**: Prioridade do processo
4. **NI**: O valor *nice*
5. **VIRT**: Memória virtual usada pelo processo
6. **RES**: Memória física usada no processo
7. **SHR**: Memória compartilhada do processo
8. **S**: Indica o status do processo: `S = sleep`, `R = running`, `Z = zombie`, `D = uninterruptible`, `T = stopped`
9. **%CPU**: O percentual de CPU usado por esse processo
10. **%MEM**: Porcentagem de RAM usada por esse processo
11. **TIME+**: Tempo total de atividade deste processo
12. **COMMAND**: Nome do processo

Também podemos especificar um **ID do processo** se desejarmos apenas controlar certos processos específicos:

```bash
top -p 1
```

## Tipos de Processos

Existem fundamentalmente dois tipos de processos no Linux:

- **Foreground processes**: Também chamados de processos interativos, são inicializados e controlados por meio de uma sessão do terminal. Em outras palavras, deve haver um usuário conectado ao sistema para iniciar esses processos; eles não foram iniciados automaticamente como parte das funções/serviços do sistema.
- **Background processes**: Também chamados de processos não-interativos/automáticos, são processos não conectados a um terminal; eles não esperam nenhum *input* do usuário.

### Daemons

[Daemons](https://en.wikipedia.org/wiki/Daemon_(computing)) são tipos especiais de processos em segundo plano que iniciam na inicialização do sistema e continuam funcionando para sempre como um serviço, eles não morrem. Eles são iniciados como tarefas do sistema (executadas como serviços), espontaneamente. No entanto, eles podem ser controlados por um usuário através do [processo init](https://en.wikipedia.org/wiki/Init).

### Criação de Processos no Linux

Normalmente, um novo processo é criado quando um processo existente faz uma cópia exata de si mesmo na memória. O processo filho terá o mesmo ambiente que seu pai, mas apenas o número de identificação(ID) do processo é diferente.

Existem duas maneiras convencionais usadas para criar um novo processo no Linux:

- Usando a função **system()** - esse método é relativamente simples, no entanto, é ineficiente e possui riscos de segurança significativos.
- Usando as funções **fork()** e **exec()** - técnica um pouco avançada, mas que oferece maior flexibilidade, velocidade e segurança.

### Identificando Processos no Linux

Como o Linux é um sistema multiusuário, o que significa que diferentes usuários podem executar vários programas no sistema, cada instância em execução de um programa deve ser identificada exclusivamente pelo kernel.

Um programa é identificado pelo seu ID do processo(**PID**) e pelo ID do processo pai(**PPID**). Sendo assim, os processos podem ser categorizados em:

- **Parent processes**: esses são processos que criam outros processos durante o tempo de execução.
- **Child processes**: esses processos são criados por outros processos durante o tempo de execução.

### O Processo Init

O processo **init** é a mãe (ou pai) de todos os processos no sistema; é o primeiro programa executado quando o sistema Linux é inicializado; ele gerencia todos os outros processos no sistema. Ele é iniciado pelo próprio kernel, portanto, em princípio, ele não possui um processo pai.

O processo **init** sempre tem o **ID** do processo **1**. Ele funciona como um pai adotivo para todos os processos órfãos.

Podemos usar o comando **pidof** para encontrar o ID de um processo, por exemplo:

```bash
pidof top
pidof chrome
pidof bash
pidof apache2
```

Para localizarmos o ID do processo e o ID do processo pai da **shell atual**, podemos executar:

```bash
echo $$
echo $PPID
```

### Controlando Processos

Existem diversos comandos que podem ser usados para controlar processos. São eles, por exemplo:

- **ps**: lista os processos em execução no sistema
- **kill**: envia um sinal para um ou mais processos (geralmente para "matar" um processo)
- **jobs**: uma maneira alternativa de listar seus próprios processos
- **bg**: coloca um processo em *background*/segundo plano
- **fg**: colocar um processo em *foreground*/primeiro plano

A maioria (se não todos) dos programas gráficos pode ser iniciada na linha de comando, podemos por exemplo iniciliazar o programa **GIMP** através do seguindo comando:

```bash
gimp
```

Observe que seu prompt não reapareceu após o lançamento do programa **GIMP**. O shell está aguardando a conclusão do programa antes que o controle retorne a você. Se você fechar a janela do GIMP, o programa GIMP será encerrado e o prompt retornará.

#### Colocando um Programa em Background

Agora lançaremos o programa **GIMP** novamente, mas desta vez o colocaremos em segundo plano/*background* para que o prompt retorne. Para fazer isso, executamos o **GIMP** assim:

```bash
gimp &
```

Nesse caso, o prompt retornou porque o processo foi colocado em segundo plano.

Imagine então que você esqueceu de usar o símbolo "**&**" para colocar o programa em segundo plano. Você pode digitar `Ctrl + Z` e o processo será suspenso. O processo ainda existe, mas está ocioso. Para retomar o processo em segundo plano, digite o comando **bg**(abreviação de background).

```bash
gimp 
CTRL + Z 
bg # [2]+ gimp &
```

#### Listando Processos

Agora que temos um processo em segundo plano, seria útil exibir uma lista dos processos que lançamos. Para fazer isso, podemos usar o comando **jobs** ou o comando **ps** que é mais poderoso.

```bash
jobs 
ps
```

#### Assassinando Processos

Uma maneira fundamental de controlar processos no Linux é enviando sinais para eles. Existem vários sinais que você pode enviar para um processo, para visualizar todos os sinais possíveis que podemos utilizar, digite o seguinte comando:

```bash
kill -L
```

A maioria dos sinais é para uso interno do sistema ou para programadores quando eles escrevem código. A seguir, apresentamos sinais úteis para um usuário do sistema:

- **SIGHUP 1**: enviado para um processo quando seu terminal de controle está fechado.
- **SIGINT 2**: enviado a um processo pelo seu terminal de controle quando um usuário interrompe o processo pressionando `Ctrl + C`.
- **SIGQUIT 3**: enviado para um processo se o usuário enviar um sinal de saída/quit `Ctrl + D`.
- **SIGKILL 9**: este sinal finaliza imediatamente (mata) um processo e o processo não realiza nenhuma operação de limpeza.
- **SIGTERM 15**: este é um sinal de encerramento do programa (o comando **kill** enviará ele por padrão).
- **SIGTSTP 20**: enviado a um processo pelo seu terminal de controle para solicitar que ele pare (parada do terminal); iniciado pelo usuário pressionando `Ctrl + Z`.

Imagine agora que temos um programa que não responde; Como podemos resolver este problema? O comando **kill** pode nos ajudar.

Faremos um experimento com o programa **GIMP**. Primeiro, precisamos identificar o processo que desejamos matar. Podemos usar **jobs** ou **ps** para esta tarefa. Caso utilizemos **jobs**, receberemos como retorno um número de trabalho. Já no **ps**, recebemos um ID do processo(PID).

**jobs**:

```bash
gimp & # [2] 2495
jobs
# [1]+  Parado                  top
# [2]-  Executando              gimp &
kill %2
```

**ps**:

```bash
gimp & # [2] 2585
ps 
#  PID TTY          TIME CMD
# 2585 pts/0    00:00:01 gimp
# 2593 pts/0    00:00:00 script-fu
# 2598 pts/0    00:00:00 ps
# 4006 pts/0    00:00:00 bash
# 29881 pts/0    00:00:12 top
kill 2585
```

#### Checando Principais Processos

Para verificarmos os principais processos ordenados por uso de RAM ou CPU no Linux podemos usar novamente o comando **ps**, que mostrará a lista dos principais processos ordenados pelo uso da RAM e da CPU na forma descendente (remova o [pipeline](https://en.wikipedia.org/wiki/Pipeline_(Unix)) e **head** se quiser ver a lista completa).

**Ordenando por Memória**:

```bash
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head
```

**Ordenando por CPU**:

```bash
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head
```

## Introdução ao SystemD

O **systemd** é um pacote de software que fornece uma variedade de componentes de sistema para sistemas operacionais Linux.

Seu principal objetivo é unificar a configuração e o comportamento do serviço nas distribuições Linux. O principal componente do systemd é um "gerenciador de sistemas e serviços" - um sistema init usado para inicializar o [espaço do usuário](https://en.wikipedia.org/wiki/User_space) e gerenciar [processos do usuário](https://en.wikipedia.org/wiki/Process_(computing)). Ele também fornece substituições para vários [daemons](https://en.wikipedia.org/wiki/Daemon_(computing)) e utilitários, incluindo gerenciamento de dispositivos, gerenciamento de login, gerenciamento de conexões de rede e log de eventos.

Systemd é controlado pelo utilitário **systemctl**, a tabela a seguir apresenta os comandos que podemos utilizar com ele:

| Comando systemctl  | Descrição  |
|---|---|
| systemctl start name  | Inicia name (onde name é um serviço)  |
| systemctl stop name  | Pára name  |
| systemctl try-restart name  | Reinicia name (se já estiver executando)  |
| systemctl restart name  | Reinicia name  |
| systemctl reload name  | Recarrega a configuração para name  |
| systemctl status name  | Apresenta o status atual de name  |
| systemctl  | Exibe o status de todos os serviços atuais  |
| systemctl enable name  | Ativa name para executar na inicialização, conforme especificado no arquivo da unidade (o arquivo para o qual o link simbólico aponta). O processo de ativar ou desativar um serviço para iniciar automaticamente na inicialização consiste em adicionar ou remover links simbólicos dentro do diretório `/etc/systemd/system` |
| systemctl disable name  | Desativa name para execução na inicialização, conforme especificado no arquivo da unidade (o arquivo para o qual o link simbólico aponta)  |
| systemctl is-enabled name  | Verifique se name (um serviço específico) está ativado no momento  |
| systemctl –type=service  | Exibe todos os serviços e informa se eles estão ativados ou desativados |
| systemctl poweroff  | Desliga a máquina (halt)  |
| systemctl reboot  | Reinicia o sistema  |

Por exemplo:

```bash
systemctl status apache2
systemctl restart mysql
```

## Rastreando Processos com htop

O [htop](https://hisham.hm/htop/) é um *[system-monitor](https://en.wikipedia.org/wiki/System_monitor)*, visualizador de processos e gerenciador de processos. 

![img](https://raw.githubusercontent.com/the-akira/Comandos-Bash/master/Imagens/htop.png)

Ele foi desenvolvido como uma alternativa ao programa **top** do Unix. Ele mostra uma lista atualizada com frequência dos processos em execução no computador, normalmente ordenadas pela quantidade de uso da CPU. Ao contrário do top, o [htop](https://github.com/hishamhm/htop) fornece uma lista completa dos processos em execução, em vez dos principais processos que consomem recursos. O htop usa cores e fornece informações visuais sobre o status do processador, da troca e da memória. O htop também pode exibir os processos como uma árvore.

## Sumário

- Qualquer programa em execução ou um comando fornecido a um sistema Linux é chamado de processo
- Um processo pode ser executado em primeiro plano/*foreground* ou em segundo plano/*background*
- O índice de prioridade de um processo é chamado de **Nice** no Linux. Seu valor padrão é 0 e pode variar entre 20 e -19
- Quanto menor o índice Nice, maior seria a prioridade dada a essa tarefa

### Comandos Importantes

| Comando  | Descrição |
|---|---|
| bg  | Para enviar um processo para o segundo plano |
| fg  | Para executar um processo parado em primeiro plano  |
| top  | Detalhes sobre todos os processos ativos |
| ps  | Fornece o status dos processos em execução para um usuário |
| ps PID  | Fornece o status de um processo específico  |
| pidof  | Fornece o ID do processo(PID) |
| kill PID  | Mata um processo de ID especificado |
| nice  | Inicia um processo com uma determinada prioridade |
| renice  | Altera a prioridade de um processo já em execução |