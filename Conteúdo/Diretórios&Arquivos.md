# Diretórios e Arquivos

Tudo no Linux é um arquivo. Cada arquivo é organizado em uma árvore de diretórios hierárquica. O primeiro diretório no sistema de arquivos é apropriadamente chamado de diretório **root**. O diretório **root** tem muitas pastas e arquivos e você pode armazenar mais pastas e arquivos, etc. 

A imagem a seguir apresenta um exemplo de como é a árvore de diretórios:

![img](https://i.ibb.co/1fwpyBC/linux-filesystem-2.png)

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

**Auto-complete**: Quando estamos utilizando comandos no Bash, podemos contar com uma característica chamada *auto-complete*, que trata de auto-completar um comando para nós de forma a aumentar nossa eficiência. Por exemplo, se digitarmos o comando `cd Git` e apertarmos a tecla `[tab]` uma vez, ele irá preencher o comando com o diretório correspondente, que nesse exemplo é `GitHub`, se houver mais opções similares ele nos tratá todas elas. Se usarmos somente um comando como `ls` e teclarmos `[tab]` duas vezes, ele tratá todas as opções possíveis de auto-complete existentes.

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

**Output:**

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

**Output:**

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

**tree** é um pequeno programa de linha de comando, cross-platform, usado para listar ou exibir recursivamente o conteúdo de um diretório em um formato semelhante a uma árvore. Ele produz os caminhos de diretório e arquivos em cada subdiretório e um resumo de um número total de subdiretórios e arquivos.

O programa tree está disponível em Unix e sistemas semelhantes ao Unix, como Linux, bem como DOS, Windows e muitos outros sistemas operacionais. Ele apresenta várias opções para manipulação de *output*, desde opções de arquivo, opções de classificação, até opções de gráficos e suporte para *output* em formatos XML, JSON e HTML.

Para listar o conteúdo do diretório em um formato semelhante a uma árvore, navegamos até o diretório desejado e executamos o comando tree sem quaisquer opções ou argumentos, Devemos lembrar de invocar sudo para executar a árvore em um diretório que requer permissões de acesso do usuário root.

```bash
tree  
sudo tree
```

Ele exibirá o conteúdo do *working directory* recursivamente, mostrando subdiretórios e arquivos, e um resumo do número total de subdiretórios e arquivos. Podemos ativar a impressão de arquivos ocultos usando a opção **-a**.

```bash 
sudo tree -a 
```

Para listar o conteúdo do diretório com o prefixo do caminho completo para cada subdiretório e arquivo, usamos a opção **-f**.

```bash
sudo tree -f
```

Podemos também instruir o tree a imprimir apenas os subdiretórios, sem os arquivos neles, usando a opção **-d**. Se usado junto com a opção **-f**, a árvore imprimirá o caminho completo do diretório.

```bash 
sudo tree -df
```

É possível especificar a profundidade máxima de exibição da árvore de diretórios usando a opção **-L**. Por exemplo, se quisermos uma profundidade de 2:

```bash
sudo tree -f -L 2
```

Para exibirmos apenas os arquivos que correspondem ao padrão *wildcard*, usamos a opção **-P** e especificamos o padrão. Neste exemplo, o comando listará apenas os arquivos que correspondem a `linux*`, arquivos como: `linux-filesystem 2.png`, `linux-filesystem.png`, `linux_layers.png`, serão listados.

```bash
tree -f -P linux*
```

Podemos exibir todos os arquivos Python que terminam com a extensão `.py`:

```bash
tree -f -P *.py
```

É possível dizer ao **tree** para remover diretórios vazios do *output* adicionando a opção **--prune**:

```bash
sudo tree -f --prune
```

A opção **-p** é capaz de imprimir o tipo de arquivo e as permissões para cada arquivo de maneira semelhante ao comando `ls -l`.

```bash
sudo tree -f -p 
```

Podemos ainda usar a opção **-u** para imprimir o nome de usuário (ou UID se nenhum nome de usuário estiver disponível) e a opção **-g** que imprime o nome do grupo (ou GID se nenhum nome de grupo estiver disponível). Podemos combinar as opções **-p**, **-u** e **-g**:

```bash
tree -f -pug
```

É possível imprimir o tamanho de cada arquivo em bytes junto com o nome usando a opção **-s**. Para imprimir o tamanho de cada arquivo, mas em um formato mais legível, usamos a opção **-h**.

```bash
sudo tree -s -h
```

Para exibir a data da hora da última modificação para cada subdiretório ou arquivo podemos usar a opção **-D**:

```bash
tree -f -pug -h -D
```

Finalmente podemos enviar ou redirecionar o *output* do programa **tree** para um arquivo para análise posterior usando a opção **-o**.

```bash
sudo tree -o arvore_diretorios.txt
```

o comando **du** (*Disk Usage*) é um comando padrão Unix/Linux usado para verificar as informações de uso do disco de arquivos e diretórios em uma máquina. O comando du tem muitas opções de parâmetro que podem ser usadas para obter os resultados em muitos formatos. Ele também é capaz de exibir os arquivos e tamanhos de diretório de maneira recursiva.

Podemos usar ele em um arquivo, juntamente com a opção **-h** que indica *human readable*, em outras palavras, legível para humanos.

```bash
du -h arrays.sh
```

Podemos também user ele em um diretório:

```bash
du -h arquivos/
```

Se usarmos a opção **-a** ele listará todos os arquivos dentro do diretório:

```bash
du -ha files/
```

Para exibirmos o uso do disco com base na modificação do tempo, usamos a opção **--time**:

```bash
du -ha --time files/
```

### Criando Arquivos

Vamos aprender a criar arquivos. Uma maneira muito simples é usar o comando **touch**. O touch permite criarmos novos arquivos vazios.

Criando apenas um arquivo

```bash
touch arquivo.txt
```

Criando múltiplos arquivos

```bash
touch script.py readme.md
```

Existem também muitas outras maneiras de criar arquivos, como redirecionamento e editores de texto que veremos em breve.

### Criando Diretórios

O comando **mkdir** nos permite criar diretórios, ele criará um diretório se ele ainda não existir. É possível também criar vários diretórios ao mesmo tempo.

Criando apenas um diretório

```bash
mkdir projeto
```

Criando múltiplos diretórios

```bash
mkdir imagens videos
```

Criando subdiretórios com a opção **"-p"**

```bash
mkdir -p scripts/python
```

### Removendo Arquivos e Diretórios

Para remover arquivos, podemos utilizar o comando **rm**. O comando **rm** é usado para excluir arquivos e diretórios.

Tenha cuidado ao usar **rm**, pois não há como recuperar os arquivos removidos por este comando. Depois que eles se foram, eles se foram para sempre.

Para remover especificamente diretórios, podemos utilizar o comando **rmdir**.

Vejamos alguns exemplos

Adicionando a opção **"-i"** nos fornecerá um prompt para confirmarmos se realmente desejamos remover o arquivo, adicionando assim mais segurança ao processo de remoção.

```bash
rm -i readme.md
```

Já a opção **"-f"** ou **force** diz ao comando **rm** para remover todos os arquivos, estejam eles protegidos contra gravação ou não.

```bash
rm -f script.py
```

Por padrão **rm** não é capaz de remover diretórios, para obtermos essa funcionalidade temos de adicionar a flag **"-r"** de **recursive** para remover todos os arquivos e quaisquer subdiretórios que possam ter.

```bash
rm -r scripts
```

Também podemos simplesmente remover um diretório com o comando **rmdir**

```bash
rmdir imagens
```

### Movendo e Renomeando Arquivos e Diretórios

O comando **mv** é utilizado para mover arquivos e diretórios

Para renomear um arquivo é muito simples

```bash
mv arquivo.txt texto.txt
```

O arquivo de nome `arquivo.txt` agora irá se chamar `texto.txt`

Podemos também mover um arquivo para um diretório diferente

```bash
mv texto.txt Arquivos/
```

Ou até mesmo mover mais de um arquivo:

```bash
mv readme.md script.py Arquivos/
```

A opção **"-i"** nos oferece um prompt que nos avisa se desejamos sobrescrever arquivos que possuem o mesmo nome.

```bash
mv -i script.py Arquivos/
```

Digamos que você queira mover um arquivo para substituir o anterior. Você também pode fazer um backup desse arquivo e ele renomeará a versão antiga com um **~**

```bash
mv -b script.py Arquivos/
```

Movendo diretórios para um diretório. Imagine que temos o diretório **imagens** e **vídeos** e desejamos movê-los para o diretório **Arquivos**.

```bash
mv imagens/ videos/ Arquivos/
```

### Copiando Arquivos e Diretórios

O comando **cp** nos permite copiar arquivos e diretórios.

Podemos por exemplo copiar um arquivo para um diretório específico

```bash
cp readme.md Arquivos/
```

**readme.md** é o arquivo que estamos copiando e **Arquivos** é o diretório de destino da cópia.

Podemos também copiar vários arquivos e diretórios e usar *wildcards*. Um *wildcard* é um caracter que pode ser substituído por uma seleção baseada em padrão, oferecendo mais flexibilidade nas pesquisas. Você pode usar *wildcards* em todos os comandos para obter mais flexibilidade:

- `*`: É usado para representar todos os caracteres únicos ou qualquer *string*.
- `?`: Usado para representar um caracter
- `[]`: Usado para representar qualquer caracter entre colchetes

Por exemplo, podemos copiar todos os arquivos com a extensão **.txt** para o diretório **Arquivos**

```bash
cp *.txt Arquivos
``` 

Uma opção muito útil é **"-r"**, ele copiará recursivamente os arquivos e diretórios dentro de um diretório.

```bash
cp -r Arquivos/ ArquivosCopia
```

Neste exemplo somos capazes de copiar por complete o diretório Arquivos, incluindo subdiretórios e arquivos.

Se copiarmos um arquivo para um diretório com o mesmo nome de arquivo, o arquivo será substituído pelo que você estiver copiando. Se tivermos um arquivo que não desejamos substituir acidentalmente. Podemos usar a opção **"-i"** (de interativo) para avisar antes de substituir um arquivo.

```bash
cp -i texto.txt Arquivos
```

Nesse caso nos será perguntado se desejamos sobrescrever o arquivo **texto.txt**, uma vez que já existe um arquivo com o mesmo nome dentro do diretório **Arquivos**.

Para copiar um arquivo com um determinado caminho para o nosso diretório atual, podemos usar o comando:

```bash
cp /home/akira/Documents/domains.csv .
```

O `.` indica nosso diretório atual.

### Examinando Arquivos

O comando **file** examinará um arquivo e informará que tipo de arquivo ele é. Ele mostrará uma descrição do conteúdo do arquivo.

Por exemplo

```bash
file Arquivos # Arquivos: directory
file readme.md # readme.md: ASCII text
file imagem.png # imagem.png: PNG image data, 1400 x 1400, 8-bit/color RGB, non-interlaced
```

### Lendo Arquivos

Para lermos o conteúdo de um arquivo podemos utilizar o comando **cat**, abreviação de *concatenate*, ele não apenas exibe o conteúdo do arquivo, mas pode combinar vários arquivos e mostrar o *output* deles.

```bash
cat script.py readme.md
# print('Hello World')
# Arquivo Leia-me
```

Podemos também copiar um arquivo com o comando **cat**:

```bash
cat script.py > copia_script.py
```

O `>` é um operador de redirecionamento que nos permite mudar onde o *standard output* irá. Nos possibilita enviar o output de um comando como o **cat** ou **echo** para um arquivo, ao invés da tela.

**Less** é um utilitário de linha de comando que exibe o conteúdo de um arquivo ou *output* de um comando, uma página de cada vez. É semelhante ao **more**, mas possui recursos mais avançados e permite navegar para frente e para trás no arquivo.

Ao iniciar **less**, ele não lê o arquivo inteiro, o que resulta em tempos de carregamento muito mais rápidos.

```bash
less /usr/share/common-licenses/GPL-3
```

Se você quiser mostrar os números de linha, inicie o programa com a opção **"-N"**:

```bash
less -N /usr/share/common-licenses/GPL-3
```

Para navegar com o **less** podemos utilizar os seguintes comandos:

- `q`: Utilizado para sair do **less** e retornar para a shell
- `Page Up`, `Page Down`, `Up`, `Down`: Navegação através das teclas setas ou das teclas Page
- `g`: Move para o início do arquivo
- `G`: Move para o final do arquivo
- `/search`: Podemos buscar por um texto específico dentro de um documento de texto por exemplo. Para início temos que colocar na frente da palavra que desejamos buscar um `/`, por exemplo `/developer`
- `h`: Help/Ajuda dentro do programa **less**, traz um sumário de informações e comandos.

O comando **more** é um comando para visualizar (mas não modificar) o conteúdo de um arquivo de texto, uma tela por vez.

Por exemplo

```bash
more /proc/cpuinfo
```

Para navegarmos no arquivo com **more** podemos usar as seguintes teclas: `[enter]` para irmos para a próxima linha, `[barra de espaço]` para a próxima página, `b` para retornarmos uma página, `q` para sairmos do arquivo, `h` para apresentar o texto de ajuda.

### Obtendo Informação

Aprendemos um pouco sobre diversos comandos até então, se estivermos em dúvida sobre o que um comando faz, podemos usar o comando **whatis**. O comando whatis fornece uma breve descrição dos programas de linha de comando.

```bash
whatis ls
whatis cat
whatis python
```

A descrição, como podemos observar, é obtida da página de manual de cada comando.