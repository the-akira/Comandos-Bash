# Diretórios e Arquivos

Tudo no Linux é um arquivo. Cada arquivo é organizado em uma árvore de diretórios hierárquica. O primeiro diretório no sistema de arquivos é apropriadamente chamado de diretório **root**. O diretório **root** tem muitas pastas e arquivos e você pode armazenar mais pastas e arquivos, etc. 

A imagem a seguir apresenta um exemplo de como é a árvore de diretórios:

![img](https://raw.githubusercontent.com/the-akira/Comandos-Bash/master/Imagens/linux-filesystem.png)

## Estrutura de Diretórios

No [FHS](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard), todos os arquivos e diretórios aparecem no diretório **root** `/`, mesmo se estiverem armazenados em diferentes dispositivos físicos ou virtuais.

- `/`: **Root** de hierarquia primária e diretório **root** de toda a hierarquia do sistema de arquivos.
- `/bin`: Binários de comando essenciais que precisam estar disponíveis no modo de usuário único. Exemplo: [cat](https://en.wikipedia.org/wiki/Cat_(Unix)), [ls](https://en.wikipedia.org/wiki/Ls), [cp](https://en.wikipedia.org/wiki/Cp_(Unix))
- `/boot`: Arquivos do [carregador de inicialização](https://en.wikipedia.org/wiki/Boot_loader), por exemplo, [kernels](https://en.wikipedia.org/wiki/Kernel_(computer_science)), [initrd](https://en.wikipedia.org/wiki/Initrd).
- `/dev`: Arquivos de dispositivo, por exemplo, `/dev/null`, `/dev/sda1`
- `/etc`: Contém arquivos de configuração do sistema
- `/home`: Diretórios pessoais dos usuários, contendo arquivos salvos, configurações pessoais, etc
- `/lib`: Bibliotecas essenciais para os binários em `/bin` e `/sbin`
- `/media`: Pontos de montagem para mídia removível, como CD-ROMs
- `/mnt`: Sistemas de arquivos montados temporariamente
- `/opt`: Pacotes opcionais de software de aplicativo
- `/proc`: Sistema de arquivos virtual que fornece informações de processo e kernel como arquivos. No Linux, corresponde a uma montagem [procfs](https://en.wikipedia.org/wiki/Procfs). Geralmente gerado automaticamente e preenchido pelo sistema, em tempo real.
- `/root`: Diretório inicial para o usuário **root**.
- `/run`: Dados variáveis em tempo de execução: informações sobre o sistema em execução desde a última inicialização, por exemplo, usuários conectados no momento e [daemons](https://en.wikipedia.org/wiki/Daemon_(computer_software)) em execução.
- `/sbin`: Binários essenciais do sistema, por exemplo, fsck, init, route.
- `/srv`: Dados específicos do site atendidos por esse sistema, como dados e scripts para servidores Web, dados oferecidos por servidores FTP e repositórios para sistemas de controle de versão.
- `/sys`: Contém informações sobre dispositivos, drivers e alguns recursos do kernel.
- `/tmp`: Arquivos temporários
- `/usr`: Hierarquia secundária para dados do usuário, somente leitura; contém a maioria dos utilitários e aplicativos para (multi)usuários.
- `/var`: Arquivos variáveis - arquivos cujo conteúdo deverá mudar continuamente durante a operação normal do sistema - como logs, e arquivos de email temporários.

A localização desses arquivos e diretórios é conhecida como caminhos. Se você tivesse uma pasta chamada **home** com uma pasta dentro dela chamada **Documentos** e outra pasta nessa pasta chamada **Livros**, esse caminho seria assim: `/home/Documentos/Livros`

## Comandos

### Imprimir Diretório de Trabalho

A navegação no sistema de arquivos, bem como a vida real, é útil se você souber onde está e para onde está indo. Para ver onde você está, você pode usar o comando [pwd](https://en.wikipedia.org/wiki/Pwd), este comando significa "imprimir diretório de trabalho" e mostra apenas em qual diretório você está, observe o caminho decorrente do diretório raiz.

```bash
pwd 
```

### Mudar de Diretório

Agora que sabemos onde estamos, vamos então nos mover pelo sistema de arquivos. Lembre-se de que precisamos navegar usando caminhos. 

Existem duas maneiras diferentes de especificar um caminho, com **caminhos absolutos** e **relativos**.

- **Caminho absoluto**: Este é o caminho do diretório **root**. O diretório **root** geralmente é mostrado como uma barra. Toda vez que seu caminho começa com / significa que você está iniciando no diretório **root**. Por exemplo, `/home/gabriel/Desktop`.
- **Caminho relativo**: Este é o caminho de onde você está atualmente no sistema de arquivos. Se estivéssemos na localização `/home/gabriel/Documentos` e quiséssemos acessar um diretório dentro de **Documentos** chamado **site**, não é necessário especificarmos o caminho inteiro a partir do **root**, como `/home/gabriel/Documentos/site`, basta irmos para `site/` em vez disso.

Para que possámos mudar o nosso Diretório de Trabalho, podemos utilizar o comando `cd`, que significa *“change directory”*, ou seja, mudar diretório.

Navegando até o diretório `Documentos`

```bash
cd /home/gabriel/Documentos
```

Agora estamos trabalhando dentro do diretório `Documentos`, em que dentro dele eu tenho um diretório chamado `GitHub`, vou então navegar até esse diretório com o comando

```bash
cd GitHub
```

Observe que utilizamos apenas o nome do diretório `GitHub`, isso porque já estávamos em `home/gabriel/Documentos`.

Pode ser bastante cansativo navegar com caminhos absolutos e relativos o tempo todo, felizmente existem alguns atalhos para nos ajudar.

- `.` (diretório atual). Este é o diretório em que você está atualmente.
- `..` (diretório pai). Leva você ao diretório acima do seu atual.
- `~` (diretório home). O diretório padrão é o seu "diretório inicial". Como `/home/gabriel`.
- `-` (diretório anterior). Isso o levará ao diretório anterior em que você estava.

```bash
cd . 
cd ..
cd ~ 
cd - 
```

### Listando Arquivos e Diretórios

[ls](https://www.rapidtables.com/code/linux/ls.html) é um comando shell que lista o conteúdo do **diretório de trabalho atual**.

O comando ls listará os diretórios e arquivos no diretório atual por padrão, no entanto, podemos especificar em qual caminho desejamos listar os diretórios.

```bash
ls 
ls /home/gabriel/Documentos
```

Para que podermos listar arquivos escondidos que começam com `.` podemos utilizar a opção/flag **"-a"** que significa *all*, ou seja, todos os arquivos e diretórios, sem exceção.

```bash
ls -a
```

Uma outra opção muito importante é o **"-l"**, de *long*, que é capaz de mostrar a lista de arquivos e diretórios em um formato longo e detalhado.

A partir da esquerda: permissões de arquivo, número de links, nome do proprietário, grupo de proprietários, tamanho do arquivo, *timestamp* da última modificação e nome do arquivo/diretório.

```bash
ls -l
```

O meu resultado seria

```
total 12
drwxrwxr-x 2 akira akira 4096 jul 30 23:57 Conteúdo
drwxrwxr-x 2 akira akira 4096 jul 30 05:04 Imagens
-rw-rw-r-- 1 akira akira  591 jul 30 01:14 README.md
```

Os comandos possuem uma característica chamada de *flags*, também conhecido como argumentos ou opções para adicionar mais funcionalidades a eles. Veja como nos exemplos anteriores adicionamos `-l` e `-a` para modificar o *output* do comando **ls**, podemos além disso, combinar as opções e utilizá-las em conjunto.

```bash
ls -la
```

O meu resultado seria

```
total 24
drwxrwxr-x  5 akira akira 4096 jul 30 00:40 .
drwxrwxr-x 11 akira akira 4096 jul 30 00:04 ..
drwxrwxr-x  2 akira akira 4096 jul 30 23:57 Conteúdo
drwxr-xr-x  8 akira akira 4096 jul 30 16:01 .git
drwxrwxr-x  2 akira akira 4096 jul 30 05:04 Imagens
-rw-rw-r--  1 akira akira  591 jul 30 01:14 README.md
```

Em breve veremos mais detalhes sobre usuários e permissões.