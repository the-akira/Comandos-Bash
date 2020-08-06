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

Um [kernel](https://en.wikipedia.org/wiki/Kernel_(computing)) do sistema operacional que permite que a **multitarefa** necessita que os processos tenham [determinados estados](https://en.wikipedia.org/wiki/Process_states). Os nomes desses estados não são padronizados, mas eles têm uma funcionalidade semelhante.

- Primeiro, o processo é "criado" ao ser carregado de um dispositivo de armazenamento secundário (unidade de disco rígido, CD-ROM, etc.) na memória principal. Depois disso, o [agendador de processos](https://en.wikipedia.org/wiki/Scheduling_(computing)) atribui o estado "em espera".
- Enquanto o processo está "em espera", ele aguarda o agendador fazer a chamada [troca de contexto](https://en.wikipedia.org/wiki/Context_switch). A opção de contexto carrega o processo no processador e altera o estado para "em execução" enquanto o processo "em execução" anterior é armazenado no estado "em espera".
- Se um processo no estado "em execução" precisar aguardar um recurso(esperar pelo input de um usuário ou abrir um arquivo), será atribuído o estado "bloqueado". O estado do processo é alterado novamente para "aguardando" quando o processo não precisa mais esperar(em um estado bloqueado).
- Depois que o processo termina a execução ou é finalizado pelo sistema operacional, ele não é mais necessário. O processo é removido instantaneamente ou é movido para o estado "finalizado". Quando removido, ele apenas esperar ser removido da memória principal.

A imagem a seguir representa os vários estados do processo, exibidos em um diagrama de estados, com setas indicando possíveis transições entre estados.

![img](https://i.ibb.co/ZLzLZT4/Process-states.png)

## Rastreando Processos com top

[top](https://linux.die.net/man/1/top) é a ferramenta que usamos para obter uma visualização em tempo real da utilização do sistema por nossos processos:

![img](https://i.ibb.co/m4KLnQ3/top.png)

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