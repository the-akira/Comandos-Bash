# GNU, Unix & Linux

![img](https://i.ibb.co/KXGYgBs/Gn-Unix-Linux.png)

Para compreendermos como o **[Linux](https://en.wikipedia.org/wiki/Linux)** surgiu, devemos retornar ao início de 1969, quando [Ken Thompson](https://en.wikipedia.org/wiki/Ken_Thompson) e [Dennis Ritchie](https://en.wikipedia.org/wiki/Dennis_Ritchie), do [Bell Laboratories](https://en.wikipedia.org/wiki/Bell_Labs), desenvolveram o sistema operacional [Unix](https://en.wikipedia.org/wiki/Unix). Posteriormente, foi reescrito em [C](https://en.wikipedia.org/wiki/C_(programming_language)) para torná-lo mais portátil e, eventualmente, se tornou um sistema operacional amplamente utilizado.

## Unix

Unix é uma família de sistemas operacionais de computador [multitarefa](https://en.wikipedia.org/wiki/Computer_multitasking) e [multiusuário](https://en.wikipedia.org/wiki/Multiuser) que derivam do AT&T Unix original.

Inicialmente planejado para uso dentro do [Sistema Bell](https://en.wikipedia.org/wiki/Bell_System), a AT&T licenciou o Unix para terceiros no final dos anos 1970, levando a uma diversidade de variantes Unix acadêmicas e comerciais de fornecedores, incluindo Universidade da Califórnia, Berkeley (BSD), Microsoft (Xenix), Sun Microsystems (SunOS / Solaris), HP / HPE (HP-UX) e IBM (AIX). No início dos anos 1990, a AT&T vendeu seus direitos no Unix para a Novell, que então vendeu seu negócio Unix para a Santa Cruz Operation (SCO) em 1995. A marca Unix passou para o The Open Group, um consórcio neutro da indústria fundado em 1996, que permite o uso da marca para sistemas operacionais certificados que estejam em conformidade com a [Single Unix Specification](https://en.wikipedia.org/wiki/Single_UNIX_Specification) (SUS). No entanto, a Novell continua detendo os direitos autorais do Unix.

Os sistemas Unix são caracterizados por um design modular que às vezes é chamado de "filosofia Unix". De acordo com essa filosofia, o sistema operacional deve fornecer um conjunto de ferramentas simples, cada uma das quais desempenhando uma função limitada e bem definida. Um sistema de arquivos unificado (o sistema de arquivos Unix) e um mecanismo de comunicação entre processos conhecido como "**pipes**" servem como os principais meios de comunicação, e um shell scripting e linguagem de comando (o shell Unix) é usado para combinar as ferramentas para executar fluxos de trabalho complexos.

O Unix se diferencia de seus predecessores como o primeiro sistema operacional **portátil**: quase todo o sistema operacional é escrito na linguagem de programação C, o que permite que o Unix opere em várias plataformas.

No início, o Unix não foi projetado para ser portátil ou para multitarefa. Mais tarde, o Unix gradualmente ganhou portabilidade, capacidades multitarefa e multiusuário em uma configuração *time-sharing*. Os sistemas Unix são caracterizados por vários conceitos: o uso de texto simples para armazenamento de dados; um sistema de arquivos hierárquico; tratar dispositivos e certos tipos de [inter-process communication](https://en.wikipedia.org/wiki/Inter-process_communication) (IPC) como arquivos; e o uso de um grande número de ferramentas de software, pequenos programas que podem ser agrupados por meio de um [interpretador de linha de comando](https://en.wikipedia.org/wiki/Command-line_interpreter) usando **pipes**, em vez de usar um único programa monolítico que inclui todas as mesmas funcionalidades. Esses conceitos são conhecidos coletivamente como "[filosofia Unix](https://en.wikipedia.org/wiki/Unix_philosophy)". Brian Kernighan e Rob Pike resumem isso em [The Unix Programming Environment](https://en.wikipedia.org/wiki/The_Unix_Programming_Environment) como "a ideia de que o poder de um sistema vem mais das relações entre os programas do que dos próprios programas".

No início dos anos 1980, os usuários começaram a ver o Unix como um sistema operacional universal em potencial, adequado para computadores de todos os tamanhos. O ambiente Unix e o modelo de programa [cliente-servidor](https://en.wikipedia.org/wiki/Client%E2%80%93server) foram elementos essenciais no desenvolvimento da Internet e na reformulação da computação centrada em redes, em vez de em computadores individuais.

Tanto o Unix quanto a linguagem de programação C foram desenvolvidos pela AT&T e distribuídos para instituições governamentais e acadêmicas, o que levou ambos a serem portados para uma variedade maior de famílias de máquinas do que qualquer outro sistema operacional.

O sistema operacional Unix consiste em muitas bibliotecas e utilitários junto com o programa de controle mestre, o **[kernel](https://en.wikipedia.org/wiki/Kernel_(operating_system))**. O kernel fornece serviços para iniciar e parar programas, lida com o sistema de arquivos e outras tarefas comuns de "baixo nível" que a maioria dos programas compartilha, ele também agenda o acesso para evitar conflitos quando os programas tentam acessar o mesmo recurso ou dispositivo simultaneamente. Para mediar esse acesso, o kernel tem direitos especiais, refletidos na distinção entre o **espaço do kernel** e o **espaço do usuário**, sendo o último um domínio prioritário onde a maioria dos programas de aplicativos opera.

Em 1983, **[Richard Stallman](https://en.wikipedia.org/wiki/Richard_Stallman)** anunciou o projeto GNU (abreviação de "*GNU's Not Unix*"), um esforço ambicioso para criar um sistema de software livre semelhante ao Unix; "livre" no sentido de que todos que receberem uma cópia serão livres para usá-la, estudar, modificar e redistribuí-la. O próprio projeto de desenvolvimento de kernel do projeto GNU chamado de [GNU Hurd](https://en.wikipedia.org/wiki/GNU_Hurd), ainda não havia produzido um kernel funcional, mas em 1991 **[Linus Torvalds](https://en.wikipedia.org/wiki/Linus_Torvalds)** lançou o [kernel Linux](https://en.wikipedia.org/wiki/Linux_kernel) como software livre sob a [GNU General Public License](https://en.wikipedia.org/wiki/GNU_General_Public_License). Além de seu uso no sistema operacional GNU, muitos pacotes GNU - como o [GNU Compiler Collection](https://en.wikipedia.org/wiki/GNU_Compiler_Collection) (e o resto da [GNU toolchain](https://en.wikipedia.org/wiki/GNU_toolchain)), a [biblioteca GNU C](https://en.wikipedia.org/wiki/Glibc) e os [GNU core utilities](https://en.wikipedia.org/wiki/Coreutils) - passaram a desempenhar papéis centrais em outros sistemas Unix gratuitos também.

As [distribuições Linux](https://en.wikipedia.org/wiki/Linux_distribution), que consistem do kernel Linux e grandes coleções de software compatível, tornaram-se populares tanto para usuários individuais quanto para empresas. Distribuições populares incluem Red Hat Enterprise Linux, Fedora, SUSE Linux Enterprise, openSUSE, Debian GNU/Linux, Ubuntu, Linux Mint, Mandriva Linux, Slackware Linux, Arch Linux e Gentoo.

## Linux

Linux é uma família de sistemas operacionais de código aberto do tipo Unix baseados no [kernel Linux](https://en.wikipedia.org/wiki/Linux_kernel), um kernel de sistema operacional lançado pela primeira vez em 17 de setembro de 1991, por Linus Torvalds. O Linux é normalmente empacotado em uma distribuição Linux.

As distribuições incluem o kernel Linux, softwares e bibliotecas de suporte de sistema, muitos dos quais são fornecidos pelo Projeto GNU. Muitas distribuições Linux usam a palavra "Linux" em seus nomes, mas a Free Software Foundation usa o nome GNU/Linux para enfatizar a importância do software GNU.

### Linux Design

Muitos desenvolvedores *open-source* concordam que o kernel do Linux não foi projetado, ao invés disso, ele evoluiu por meio da Seleção Natural. Torvalds considera que embora o design do Unix tenha servido como um andaime, "o Linux cresceu com muitas mutações - e como as mutações eram menos do que aleatórias, elas eram mais rápidas e mais direcionadas do que as partículas alfa no DNA". 

Raymond considera os aspectos revolucionários do Linux como sociais, não técnicos, antes que o software complexo do Linux fosse projetado cuidadosamente por pequenos grupos, mas o Linux evoluiu de uma maneira completamente diferente. Desde quase o início, foi casualmente hackeado por um grande número de voluntários coordenando apenas através da Internet. A qualidade era mantida não por padrões rígidos ou autocracia, mas pela estratégia ingenuamente simples de lançar todas as semanas e obter feedback de centenas de usuários em poucos dias, criando uma espécie de seleção darwiniana rápida nas mutações introduzidas pelos desenvolvedores. 

Um sistema baseado em Linux é um sistema operacional modular semelhante ao Unix, derivando muito de seu design básico de princípios estabelecidos no Unix durante os anos 1970 e 1980. Tal sistema usa um kernel monolítico, o kernel Linux, que lida com controle de processos, rede, acesso a periféricos e sistemas de arquivos. Os drivers de dispositivo são integrados diretamente ao kernel ou adicionados como módulos que são carregados enquanto o sistema está em execução.

O GNU [userland](https://en.wikipedia.org/wiki/Userland_(computing)) é uma parte fundamental da maioria dos sistemas baseados no kernel Linux, com o Android sendo a exceção notável. A implementação do projeto da biblioteca C funciona como um wrapper para as chamadas do sistema do kernel Linux necessárias para a interface kernel-userspace, a [toolchain](https://en.wikipedia.org/wiki/GNU_toolchain) é uma ampla coleção de ferramentas de programação vitais para o desenvolvimento do Linux (incluindo os compiladores usados para construir o kernel do Linux em si), e os [coreutils](https://en.wikipedia.org/wiki/GNU_Core_Utilities) implementam muitas ferramentas básicas do Unix. O projeto também desenvolve o [Bash](https://en.wikipedia.org/wiki/Bash_(shell)), um shell [CLI](https://en.wikipedia.org/wiki/Command-line_interface) popular. A interface gráfica do usuário (ou GUI) usada pela maioria dos sistemas Linux é construída em cima de uma implementação do Sistema X Window. Mais recentemente, a comunidade Linux busca avançar para o Wayland como o novo protocolo de servidor de exibição no lugar do X11. Muitos outros projetos de software *open-source* contribuem para os sistemas Linux.

A figura a seguir apresenta várias camadas dentro do Linux, também mostrando separação entre o [userland](https://en.wikipedia.org/wiki/User_space) e o [kernel space](https://en.wikipedia.org/wiki/Kernel_space):

![img](https://i.ibb.co/v1PRNwj/linux-layers.png)

Os componentes instalados de um sistema Linux incluem o seguinte:

- Um [bootloader](https://en.wikipedia.org/wiki/Bootloader), por exemplo GNU GRUB, LILO, SYSLINUX ou Gummiboot é um programa que carrega o kernel do Linux na [memória principal](https://en.wikipedia.org/wiki/Main_memory) do computador, sendo executado pelo computador ao ser ligado e após a inicialização do firmware ser feita.
- Um programa init, como o [sysvinit](https://en.wikipedia.org/wiki/Sysvinit) tradicional e o mais recente [systemd](https://en.wikipedia.org/wiki/Systemd), [OpenRC](https://en.wikipedia.org/wiki/OpenRC) e [Upstart](https://en.wikipedia.org/wiki/Upstart_(software)). Este é o primeiro processo lançado pelo kernel Linux e está na raiz da árvore de processos: em outros termos, todos os processos são iniciados por meio do init. Ele inicia processos como serviços de sistema e prompts de login (seja gráfico ou em modo de terminal).
- Bibliotecas de software, que contêm código que pode ser usado por processos em execução. Em sistemas Linux que usam arquivos executáveis no formato ELF, o [dynamic linker](https://en.wikipedia.org/wiki/Dynamic_linker) que gerencia o uso de bibliotecas dinâmicas é conhecido como [ld-linux.so](https://linux.die.net/man/8/ld-linux.so). Se o sistema estiver configurado para o próprio usuário compilar o software, os [arquivos header](https://en.wikipedia.org/wiki/Header_file) também serão incluídos para descrever a interface das bibliotecas instaladas. Além da biblioteca de software mais comumente usada em sistemas Linux, a [GNU C Library](https://en.wikipedia.org/wiki/GNU_C_Library) (glibc), existem inúmeras outras bibliotecas, como [SDL](https://en.wikipedia.org/wiki/Simple_DirectMedia_Layer) e [Mesa](https://en.wikipedia.org/wiki/Mesa_(computer_graphics)).
- Comandos Unix básicos, com GNU coreutils sendo a implementação padrão. Existem alternativas para sistemas embarcados, como o copyleft BusyBox e o Toybox licenciado por BSD.
- Os kits de ferramentas de widget são as bibliotecas usadas para construir interfaces gráficas com o usuário (GUIs) para aplicativos de software. Numerosos kits de ferramentas de widget estão disponíveis, incluindo GTK e Clutter desenvolvidos pelo projeto GNOME, Qt desenvolvido pelo Projeto Qt.
- Um [sistema de gerenciamento de pacotes](https://en.wikipedia.org/wiki/Package_manager), como dpkg e RPM. Alternativamente, os pacotes podem ser compilados a partir de *source tarballs* ou binários.
- Programas de interface do usuário, como shells de comando ou *windowing environments*.

### Interface de Usuário

A interface do usuário, também conhecida como shell, é uma [interface de linha de comando](https://en.wikipedia.org/wiki/Command-line_interface) (CLI), uma [interface gráfica do usuário](https://en.wikipedia.org/wiki/Graphical_user_interface) (GUI) ou controles anexados ao hardware associado, o que é comum para [sistemas embarcados](https://en.wikipedia.org/wiki/Embedded_systems). Para sistemas de desktop, a interface de usuário padrão geralmente é gráfica, embora a CLI esteja comumente disponível por meio de janelas do emulador de terminal ou em um console virtual separado.

Os shells CLI são interfaces de usuário baseadas em texto, que usam texto para *input* e *output*. O shell dominante usado no Linux é o [Bourne-Again Shell](https://en.wikipedia.org/wiki/Bourne-Again_Shell) (bash), originalmente desenvolvido para o projeto GNU. A maioria dos componentes Linux de baixo nível, incluindo várias partes do [userland](https://en.wikipedia.org/wiki/Userland_(computing)), usam a CLI exclusivamente. O CLI é particularmente adequado para automação de tarefas repetitivas ou atrasadas e fornece [inter-process communication](https://en.wikipedia.org/wiki/Inter-process_communication) muito simples.

### Programação no Linux

A maioria das linguagens de programação suportam Linux diretamente, as ferramentas de desenvolvimento originais usadas para construir aplicativos Linux e programas de sistema operacional são encontradas na [GNU toolchain](https://en.wikipedia.org/wiki/GNU_toolchain), que inclui a GNU Compiler Collection (GCC) e o GNU Build System. Entre outros, o GCC fornece compiladores para Ada, C, C ++, Go e Fortran. Muitas linguagens de programação têm uma implementação de referência *cross-platform* que suporta Linux, por exemplo PHP, Perl, Ruby, Python, Java, Go, Rust e Haskell. Lançado pela primeira vez em 2003, o projeto LLVM fornece um compilador de código aberto *cross-platform* alternativo para muitas linguagens.

O Linux também inclui linguagens de programação tradicionais de propósito específico voltadas para [scripting](https://en.wikipedia.org/wiki/Script_(computing)), processamento de texto e configuração e gerenciamento de sistema em geral. As distribuições Linux suportam [scripts de shell](https://en.wikipedia.org/wiki/Shell_scripts), [awk](https://en.wikipedia.org/wiki/Awk), [sed](https://en.wikipedia.org/wiki/Sed) e [make](https://en.wikipedia.org/wiki/Make_(software)). Muitos programas também possuem uma linguagem de programação incorporada para suportar a configuração ou a programação deles próprios. Por exemplo, [expressões regulares](https://en.wikipedia.org/wiki/Regular_expressions) são suportadas em programas como [grep](https://en.wikipedia.org/wiki/Grep) e [locate](https://en.wikipedia.org/wiki/Locate_(Unix)), e também o editor de texto avançado [GNU Emacs](https://en.wikipedia.org/wiki/GNU_Emacs) é construído em torno de um interpretador [Lisp](https://en.wikipedia.org/wiki/Emacs_Lisp) de propósito geral.

GNOME e KDE são ambientes de desktop populares e fornecem uma estrutura para o desenvolvimento de aplicativos. Esses projetos são baseados nos kits de ferramentas de widget [GTK](https://en.wikipedia.org/wiki/GTK) e [Qt](https://en.wikipedia.org/wiki/Qt_(toolkit)), respectivamente. Ambos suportam uma ampla variedade de idiomas. Existem vários [ambientes de desenvolvimento integrados](https://en.wikipedia.org/wiki/Integrated_development_environment) disponíveis, incluindo **Anjuta**, **Code::Blocks**, **CodeLite**, **Eclipse**, **Geany**, **ActiveState Komodo**, **KDevelop**, **Lazarus**, **MonoDevelop**, **NetBeans** e **Qt Creator**, enquanto os editores **Vim**, **nano** e **Emacs** de longa data também permanecem popular.

### Suporte de Hardware

O **kernel Linux** é um kernel de sistema operacional amplamente portado, disponível para dispositivos que variam de telefones móveis a supercomputadores; ele roda em uma ampla variedade de arquiteturas de computador, incluindo o iPAQ portátil baseado em ARM e os mainframes IBM System z9 ou System z10. Distribuições especializadas e *kernel forks* existem para arquiteturas menos convencionais, por exemplo, o fork do kernel ELKS pode ser executado em microprocessadores Intel 8086 ou Intel 80286 de 16 bits, enquanto o fork do kernel µClinux pode ser executado em sistemas sem uma unidade de gerenciamento de memória. O kernel também roda em arquiteturas que pretendiam usar apenas um sistema operacional criado pelo fabricante, como computadores Macintosh (com processadores PowerPC e Intel), PDAs, consoles de videogame, reprodutores de música portáteis e telefones celulares.

### Linux Kernel

O sistema operacional Linux pode ser organizado em três níveis diferentes de abstração:

- O nível mais básico é o hardware, que inclui a CPU, memória, discos rígidos, portas de rede, etc. A camada física que realmente calcula o que nossa máquina está fazendo.

- O próximo nível é o kernel, que lida com gerenciamento de processos e memória, comunicação de dispositivos, chamadas de sistema, configura nosso sistema de arquivos, etc. O trabalho do kernel é conversar com o hardware para ter certeza de que ele faz o que queremos que nossos processos façam.

- E o nível com o qual estamos familiarizados é o **user space**, que inclui o shell, os programas que executamos, os gráficos, etc.

#### Níveis de Privilégio

Por que temos diferentes camadas de abstração para o **user space** e o kernel?

Há um importante motivo pelo qual essas duas camadas existem separadamente. Ambos operam em modos diferentes, o kernel opera no **modo kernel** e o user space opera no **modo usuário**.

No modo kernel, o kernel tem acesso completo ao hardware, ele controla tudo. No modo usuário, há uma quantidade muito pequena de memória segura e CPU que você tem permissão para acessar. Basicamente, quando queremos fazer algo que envolva hardware, ler dados de nossos discos, gravar dados em nossos discos, controlar nossa rede, tudo é feito em modo kernel.

Esses diferentes modos são chamados de níveis de privilégio (apropriadamente nomeados de acordo com os níveis de privilégio que você obtém).

Existem dois níveis ou modos principais em uma arquitetura de computador x86. O ring #3 é o privilégio no qual os aplicativos do modo de usuário são executados, o ring #0 é o privilégio no qual o kernel é executado. O ring #0 pode executar qualquer instrução do sistema e recebe total confiança. 

Como então podemos gravar qualquer coisa em nosso hardware? Não estaremos sempre em um modo diferente do kernel?

A resposta é com **system calls**, essas chamadas de sistema nos permitem executar uma instrução privilegiada no modo kernel e, em seguida, voltar ao modo de usuário.

#### System Calls

System calls (syscall) fornecem aos processos de espaço do usuário uma maneira de solicitar que o kernel faça algo por nós. O kernel disponibiliza certos serviços por meio da *system call API*. Esses serviços nos permitem ler ou gravar em um arquivo, modificar o uso de memória, modificar nossa rede, etc. A quantidade de serviços é fixa, então não podemos adicionar system calls, nosso sistema já tem uma tabela de qual system calls existem e cada system call possui um ID exclusivo.

Podemos ver as system calls que um processo faz com o comando **strace**. Ele é útil para depurar como um programa é executado.

```bash
strace cat
```

#### Instalação do Kernel

Podemos instalar vários kernels em nosso sistema, no menu GRUB podemos escolher em qual kernel inicializar.

Para ver qual versão do kernel temos em nosso sistema podemos usar o comando:

```bash
uname -r
```

É possível instalar o kernel do Linux de diferentes maneiras, podemos por exemplo baixar o *source package* e compilar ele ou podemos instalá-lo usando ferramentas de gerenciamento de pacote.

```bash
sudo apt install linux-generic-lts-vivid
```

E então reiniciamos no kernel que instalamos. Também será necessário instalar outros pacotes do linux, como linux-headers, linux-image-generic, etc). É possível também especificar o número da versão, nesse caso comando acima seria semelhante a: 

```bash
sudo apt install 3.19.0-43-generic
```

Alternativamente, se desejarmos apenas a versão atualizada do kernel, podemos usar dist-upgrade, ele executa atualizações para todos os pacotes em nosso sistema:

```bash
sudo apt dist-upgrade
```

#### Localização do Kernel

O que acontece quando instalamos um novo kernel? 

Ocorre que são adicionados alguns arquivos ao nosso sistema, esses arquivos geralmente são adicionados ao diretório `/boot`.

Existem vários arquivos para diferentes versões do kernel, por exemplo:

- **vmlinuz** - este é o kernel Linux real
- **initrd** - é usado como um sistema de arquivos temporário, usado antes de carregar o kernel
- **System.map** - tabela de pesquisa simbólica
- **config** - definições de configuração do kernel, se você está compilando seu próprio kernel, você pode definir quais módulos podem ser carregados

#### Módulos do Kernel

O kernel é um pedaço de software monolítico, quando desejamos adicionar suporte para um novo tipo de teclado, não escrevemos este código diretamente no código do kernel.

Módulos de kernel são pedaços de código que podem ser carregados e descarregados no kernel sob demanda. Eles nos permitem estender a funcionalidade do kernel sem realmente adicionar ao código do núcleo do kernel. Também podemos adicionar módulos e não ter que reiniciar o sistema (na maioria dos casos).

Para vermos uma lista dos módulos carregados atualmente podemos executar o comando:

```bash
lsmod
```

Para carregarmos um módulo:

```bash
sudo modprobe bluetooth
```

O Modprobe tentar carregar o módulo de `/lib/modules/(versão do kernel)/kernel/drivers`. Módulos de kernel também podem ter dependências, modprobe carrega nossas dependências de módulo se eles ainda não estiverem carregados.

Para remover um módulo:

```bash
sudo modprobe -r bluetooth
```

Também podemos carregar módulos durante a inicialização do sistema, em vez de carregá-los temporariamente com o modprobe (que será descarregado quando você reiniciar). Basta modificar o diretório `/etc/modprobe.d` e adicionar um arquivo de configuração como:

**configuracao.conf**:

```
options nome_modulo type=almond
```

Também podemos garantir que um módulo não carregue na inicialização adicionando um arquivo de configuração como:

**configuracao.conf**:

```
blacklist nome_modulo
```

### Processo de Boot do Linux

O processo de inicialização (*boot process*) do Linux pode ser dividido em 4 etapas simples:

1. **BIOS**: O BIOS (significa "*Basic Input/Output System*") inicializa o hardware e garante com um autoteste de inicialização (POST) que todo o hardware está pronto para funcionar. A principal tarefa do BIOS é carregar o bootloader.

Existe outra maneira de inicializar seu sistema em vez de usar BIOS, que é com UEFI (significa "*Unified extensible firmware interface*"). O UEFI foi projetado para ser o sucessor do BIOS, a maioria do hardware que existe hoje vem com firmware UEFI integrado. As máquinas Macintosh têm usado a inicialização UEFI há anos.

UEFI armazena todas as informações sobre a inicialização em um arquivo `.efi`. Este arquivo é armazenado em uma partição especial chamada partição do sistema EFI no hardware. Dentro desta partição ele conterá o bootloader. UEFI vem com muitas melhorias do firmware BIOS tradicional.

2. **Bootloader**: O bootloader carrega o kernel na memória e então inicia o kernel com um conjunto de parâmetros do kernel. Um dos bootloaders mais comuns é o GRUB, que é um padrão Linux universal.

As principais responsabilidades do bootloader são:

- Inicializar um sistema operacional, ele também pode ser usado para inicializar em sistemas operacionais não Linux
- Selecione um kernel para usar
- Especifique os parâmetros do kernel

Para encontrar o kernel o bootloader conta com os *kernel parameters*:

- initrd - especifica a localização do disco RAM inicial
- BOOT_IMAGE - onde a imagem do kernel está localizada
- root - A localização do sistema de arquivos raiz, o kernel procura dentro desta localização para encontrar o init. Geralmente é representado por seu UUID ou pelo nome do dispositivo, como `/dev/sda1`
ro - monta o sistema de arquivos como modo somente leitura.
quiet - adicionado para que você não veja mensagens de exibição que estão acontecendo em segundo plano durante a inicialização.

3. **Kernel**: Quando o kernel é carregado, ele inicializa imediatamente os dispositivos e a memória. A principal tarefa do kernel é carregar o processo init.

4. **Init**: O processo init é o primeiro processo iniciado, init inicia e interrompe o processo de serviço essencial no sistema. Existem três implementações principais do init nas distribuições Linux. 

- **System V init (sysv)**: Este é o sistema init tradicional. Ele inicia e processa sequencialmente, com base em scripts de inicialização. O estado da máquina é denotado por níveis de execução, cada nível de execução inicia ou interrompe uma máquina de uma maneira diferente.

- **Upstart**: Este é o init que você encontrará em instalações antigas do Ubuntu. O Upstart usa a ideia de jobs e eventos e funciona iniciando jobs que realizam determinadas ações em resposta a eventos.

- **Systemd**: Este é o novo padrão para init, ele é orientado a objetivos. Basicamente, você tem uma meta que deseja atingir e o systemd tenta satisfazer as dependências da meta para concluí-la.

### Arquitetura Linux

Linux é um [kernel monolítico](https://en.wikipedia.org/wiki/Monolithic_kernel) com um design modular (por exemplo, pode inserir e remover [LKMs](https://en.wikipedia.org/wiki/Loadable_kernel_module) em tempo de execução), suportando a maioria dos recursos antes disponíveis apenas em kernels de sistemas operacionais não livres e de código fechado:

- [Concurrent computing](https://en.wikipedia.org/wiki/Concurrent_computing) e (com a disponibilidade de núcleos de CPU suficientes para tarefas que estão prontas para serem executadas) até mesmo [execução paralela verdadeira](https://en.wikipedia.org/wiki/Parallel_computing) de muitos processos ao mesmo tempo (cada um deles tendo um ou mais [threads de execução](https://en.wikipedia.org/wiki/Thread_(computing)).
- Recursos configuráveis e políticas controláveis ​​em tempo de execução. O [Completely Fair Scheduler](https://en.wikipedia.org/wiki/Completely_Fair_Scheduler) (CFS) é o agendador padrão do Linux desde 2007 e usa uma [red-black tree](https://en.wikipedia.org/wiki/Red%E2%80%93black_tree) que pode pesquisar, inserir e excluir informações do processo ([task_struct](https://en.wikipedia.org/wiki/Task_struct)) com complexidade de tempo `O(log n)`, onde n é o número de tarefas executáveis.
- gerenciamento avançado de memória com memória virtual paginada.
- *inter-process communications* e mecanismo de sincronização.
- um sistema de arquivos virtual em cima de vários sistemas de arquivos concretos (ext4, Btrfs, XFS, JFS, FAT32 e muitos mais).
- Virtualização no nível do sistema operacional (com Linux-VServer), paravirtualização e virtualização assistida por hardware (com KVM ou Xen).
- mecanismos de segurança para controle de acesso discricionário e obrigatório (SELinux, AppArmor, POSIX ACLs e outros).
- vários tipos de protocolos de comunicação em camadas (incluindo o [conjunto de protocolos da Internet](https://en.wikipedia.org/wiki/Internet_protocol_suite)).

Drivers de dispositivo e extensões de kernel são executados no espaço do kernel (ring 0 em muitas arquiteturas de CPU), com acesso total ao hardware, embora algumas exceções sejam executadas no espaço do usuário, por exemplo, sistemas de arquivos baseados em FUSE CUSE. O sistema gráfico que a maioria das pessoas usa com o Linux não funciona dentro do kernel. Ao contrário dos kernels monolíticos padrão, os drivers de dispositivo são facilmente configurados como módulos e carregados ou descarregados enquanto o sistema está em execução e também podem ser antecipados sob certas condições para lidar com interrupções de hardware corretamente e para melhor suportar [multiprocessamento simétrico](https://en.wikipedia.org/wiki/Symmetric_multiprocessing).

### Material Anexo

- [Unix vs Linux](https://www.youtube.com/watch?v=jowCUo_UGts)
- [Mapa Interativo do Kernel Linux](https://makelinux.github.io/kernel/map/)
- [Mainframes and the Unix Revolution](https://www.youtube.com/watch?v=-rPPqm44xLs)
- [AT&T Archives: The UNIX Operating System](https://www.youtube.com/watch?v=tc4ROCJYbm0&t)