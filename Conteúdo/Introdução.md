# Introdução

[Shell](https://en.wikipedia.org/wiki/Shell_(computing)) é um programa utilitário [Unix](https://en.wikipedia.org/wiki/Unix). Possui uma identidade dupla: como uma interface do usuário para os utilitários Unix e como uma linguagem de programação, facilitando o uso e a combinação dos utilitários Unix. 

Quando você abre o terminal, o programa shell é carregado na memória do computador. Quando você digita comandos no terminal, o shell lê os comandos e os converte em um formato legível pelo kernel a ser executado. Ele fornece uma instância interativa para iniciar programas, gerenciar arquivos e processos em execução no computador. 

Como o shell é apenas um programa, muitas variações foram criadas desde 1969, quando [Ken Thompson](https://en.wikipedia.org/wiki/Ken_Thompson) desenvolveu a primeira implementação do Unix no Bell Labs. O shell Unix original foi escrito por [Steve Bourne](https://en.wikipedia.org/wiki/Stephen_R._Bourne) em 1970 e é conhecido como Bourne shell ou sh. 

O Bourne shell não estava disponível gratuitamente na época, o que limitava seu uso por outros programadores. Para aliviar esse problema, em 1988, a Free Software Foundation encarregou [Brian Fox](https://en.wikipedia.org/wiki/Brian_Fox_(computer_programmer)) de desenvolver uma reimplementação de código aberto do Bourne shell, o chamado [Bourne again shell](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) ou **bash**. Hoje, o bash shell é provavelmente a implementação de uso mais amplo do shell Unix.

O Bash é um processador de comandos que normalmente é executado em uma janela de texto em que o usuário digita comandos que causam ações. O Bash também pode ler e executar comandos de um arquivo, chamado de shell script. Como todos os shells do Unix, ele suporta *filename [globbing](https://en.wikipedia.org/wiki/Glob_(programming))* (wildcard matching), *[piping](https://en.wikipedia.org/wiki/Pipeline_(Unix))*, *[here documents](https://en.wikipedia.org/wiki/Here_document)*, *[command substitution](https://en.wikipedia.org/wiki/Command_substitution)*, *[variáveis](https://en.wikipedia.org/wiki/Variable_(programming))*, e *[estruturas de controle](https://en.wikipedia.org/wiki/Control_flow)* para *[condition-testing](https://en.wikipedia.org/wiki/Conditional_(programming))* e *[iteration](https://en.wikipedia.org/wiki/Iteration)*.

![img](https://raw.githubusercontent.com/the-akira/Comandos-Bash/master/Imagens/shell.png)

## Comandos Básicos

Iniciaremos abrindo o terminal para assim podermos executar os nossos primeiros comandos, vamos utilizar o comando `CTRL + ALT + T` para inicializá-lo.

### Imprimindo Hello World

O comando **echo** no linux é usado para exibir o **texto**/**string** que é passada como argumento.

```bash
echo "Hello World"
```

### Imprimindo Variáveis de Ambiente

```bash
echo $HOME # Diretório Home do usuário atual

echo $PWD # Imprime o diretório de trabalho atual

echo $TERM # Terminal sendo utilizado

echo $USER # Usuário atual do sistema

echo $SHELL # Shell sendo utilizada

echo $HOSTNAME # O nome do host do computador no momento.

echo $LANG # Linguagem atual em uso

echo $COLUMNS # O número de colunas que estão sendo usadas para desenhar a saída na tela.

echo $BASH_VERSION # Versão do Bash

echo $BASHOPTS 
# A lista de opções usadas quando o bash foi executado. 
# Isso pode ser útil para descobrir se o ambiente do shell funcionará da maneira que você deseja.

echo $PATH 
# Uma lista de diretórios que o sistema verificará ao procurar comandos. 
# Quando um usuário digita um comando, o sistema verifica os diretórios nesta ordem quanto ao executável.
```

### Histórico de Comandos Digitados

O comando **history** exibe ou manipula a lista do histórico de comandos. 

```bash
history
```

### Limpando a Tela

O comando **clear** ou `CTRL + L` limpa a tela do terminal.

```bash
clear
CTRL + L
```

### Fechando a Shell

O comando **exit** ou `CTRL + D` nos permite fechar o terminal.

```bash
exit 
CTRL + D
```

### Utilizando o Manual

O comando **man** é uma interface para os manuais de referência online.

```bash
man python	
man libc
man cat
```

### Obtendo Ajuda

Muitos programas executáveis suportam uma opção **"--help"** que exibe uma descrição da sintaxe e das opções suportadas pelo comando.

```bash
php --help
chmod --help
ls --help
```

### Verificando Versões

Muitos programas suportam uma opção **"--version"** que exibe a versão atual do programa que estamos utilizando.

```bash
bash --version
python --version
```