# Instalando Softwares

## Distribuição de Software

Um sistema é composto de muitos pacotes, como navegadores de internet, editores de texto, reprodutores de mídia, etc. Esses pacotes são gerenciados por gerenciadores de pacotes, que instalam e mantêm o software em seu sistema. No entanto, nem todos os pacotes são instalados através de gerenciadores de pacotes, é possível normalmente instalar pacotes diretamente de seu código-fonte. No entanto, na maioria das vezes usaremos um gerenciador de pacotes para instalar software, a variedade mais comum de pacotes são **Debian** (.deb) e **Red Hat** (.rpm). Os pacotes de estilo Debian são usados em distribuições como Debian, Ubuntu, Linux Mint, etc. Os pacotes de estilo Red Hat são vistos no Red Hat Enterprise Linux, como Fedora, CentOS, etc.

O que são pacotes? Conhecemos normalmente eles como Chrome, Photoshop, etc, mas o que eles realmente são é apenas muitos e muitos arquivos que foram compilados em um.

## Repositórios de Pacotes

Como os pacotes que são enviados para a Internet de alguma forma acabam em nossos computadores? Você vai para a página de download de cada pacote que deseja e clica em baixar e instalar? Na verdade é possível fazer isso, mas existe algo melhor chamado de repositórios de pacotes. Repositórios são apenas um local de armazenamento central para pacotes. Existem diversos repositórios que contêm muitos pacotes e o melhor de tudo eles são encontrados na Internet, sem necessidade de discos de instalação.

Nossa distribuição já vem com fontes pré-aprovadas para obter pacotes e é assim que ela instala todos os pacotes básicos que você vê em seu sistema. Em um sistema Debian, este arquivo de fontes é o arquivo `/etc/apt/sources.list`. Sua máquina saberá olhar lá e verificar se há repositórios de origem que você adicionou.

## Dependências de Pacote

Os pacotes raramente funcionam sozinhos; na maioria das vezes, são acompanhados por dependências para ajudá-los a funcionar.

No Linux, essas dependências geralmente são outros pacotes ou bibliotecas compartilhadas. Bibliotecas compartilhadas são bibliotecas de código que outros programas desejam usar e não precisam reescrever por conta própria.

## rpm & dpkg 

Assim como `.exe` é um único arquivo executável, `.deb` e `.rpm` também são. Normalmente não os veremos se usarmos repositórios de pacotes, mas se baixarmos pacotes diretamente, provavelmente os obteremos neste formato popular. Obviamente, eles são exclusivos de suas distribuições, `.deb` para baseadas em Debian e `.rpm` para baseadas em Red Hat.

Para instalar esses pacotes diretos, podemos usar os comandos de gerenciamento de pacotes: **rpm** e **dpkg**. Essas ferramentas são usadas para instalar arquivos de pacote, no entanto, não irão instalar as dependências do pacote, então se o pacote tivesse 10 dependências, teríamos que instalar esses pacotes separadamente e então as dependências e assim por diante. 

### Instalando um Pacote

#### Debian

```bash
dpkg -i pacote.deb
```

#### RPM

```bash
rpm -i pacote.rpm
```

O opção **-i** significa instalar. É possível também pode usar o formato mais longo **--install**.

### Removendo um Pacote

#### Debian

```bash
dpkg -r pacote.deb
```

A opção **-r** significa *remove*

#### RPM

```bash
rpm -e pacote.rpm
```

A opção **-e** significa *erase*

### Listando os Pacotes Instalados

#### Debian

```bash
dpkg -l
```

A opção **-l** significa *list*

#### RPM 

```bash
rpm -qa
```

A opção **-q** significa *query e **a** quer dizer *all*

## yum & apt

Os sistemas possuem consigo todas as correções para facilitar a instalação, remoção e mudanças de pacotes, incluindo a instalação de dependências de pacotes. Dois dos sistemas de gerenciamento mais populares são o **yum** e o **apt**. Yum é exclusivo da família Red Hat e apt é exclusivo da família Debian.

### Instalando um Pacote de um Repositório

#### Debian

```bash
apt install pacote 
```

#### RPM

```bash
yum install pacote
```

### Removendo um Pacote 

#### Debian

```bash
apt remove pacote 
```

#### RPM

```bash
yum erase pacote
```

### Atualizando Pacotes de um Repositório

É sempre uma prática recomendada atualizar seus repositórios de pacotes para que eles estejam atualizados antes de instalar e atualizar um pacote.

#### Debian

```bash
apt update 
apt upgrade 
```

#### RPM

```bash
yum update
```

### Obtendo Informação sobre um Pacote Instalado

#### Debian

```bash
apt show pacote 
```

#### RPM

```bash
yum info pacote
```

## Compilando o Código-Fonte

Freqüentemente podemos encontrar um pacote que só vem na forma de código-fonte puro. Para ele precisaremos usar alguns comandos para obter o pacote de código-fonte compilado e instalado em nosso sistema.

O primeiro passo é instalar um software para instalar as ferramentas que permitirão compilar o código-fonte.

```bash
sudo apt install build-essential
```

Depois de fazer isso, extraímos o conteúdo do arquivo do pacote, possivelmente será um arquivo `.tar.gz`.

```bash
tar -xzvf package.tar.gz
```

Antes de fazer qualquer coisa, é importante sempre olharmos o arquivo **README** ou **INSTALL** dentro do pacote. Às vezes, haverá instruções de instalação específicas.

Dentro do conteúdo do pacote estará um script de configuração, este script verifica as dependências em seu sistema e se estiver faltando alguma coisa, você verá um erro e precisará consertar essas dependências.

```bash
./configure
```

O `./` permite executarmos um script no diretório atual.

Dentro do conteúdo do pacote, existe um arquivo chamado **Makefile** que contém regras para construir o software. Quando executamos o comando **make**, ele examina esse arquivo para construir o software.

```bash
make 
```

Este comando realmente instala o pacote, ele irá copiar os arquivos corretos para os locais corretos em seu computador:

```bash
sudo make install
```

Se desejarmos desinstalar o pacote, podemos usar:

```bash
sudo make uninstall
```

O comando **checkinstall** irá essencialmente fazer o "make install" e construir um pacote `.deb` e instalá-lo. Isso torna mais fácil remover o pacote posteriormente.

```bash
sudo checkinstall
```

## Instalando Aplicativos no Ubuntu usando PPA

PPA - Personal Package Archive é outra maneira fácil de instalar software no Ubuntu Linux. Muitos desenvolvedores desejam oferecer a versão mais recente de seu software diretamente aos usuários finais. Nesse caso, o PPA pode ser usado como repositório de software oficial do Ubuntu. Muitos usuários do Ubuntu podem não esperar por tanto tempo, mas podem usar o PPA para instalar a versão mais recente instantaneamente.

Exemplo da instalação do Cinnamon Desktop no Ubuntu Linux:

```bash
sudo add-apt-repository ppa:embrosyn/cinnamon
sudo apt update
sudo apt install cinnamon
```

O primeiro comando é para adicionar o repositório PPA à lista de fontes do sistema, o segundo é para atualizar o cache da lista de software e o último é para instalar o software específico usando o comando apt.

## Instalando Aplicações Python via Pip

Pip é outra maneira de instalar software, especialmente aplicativos baseados em Python, no Linux. Pip é na verdade um sistema de gerenciamento de software baseado em linha de comando para aplicativos que são escritos na linguagem de programação Python. É fácil de usar e, se você for um desenvolvedor de software, poderá usar o Pip para instalar e gerenciar vários pacotes e módulos Python para seus projetos Python.

Para instalar o Pip executamos o comando abaixo para Python 2 e Python 3 respectivamente:

```bash
sudo apt install python-pip
sudo apt install python3-pip
```

Para pesquisar os pacotes, executamos o seguinte comando:

```bash
pip search palavra 
```

Para instalarmos uma aplicação usando o **pip**:

```bash
pip install pacote 
```

Para removermos um pacote instalado com **pip**: 

```bash
pip uninstall pacote
```

Para mais informações e ajuda podemos contar com o comando `pip3 --h`.