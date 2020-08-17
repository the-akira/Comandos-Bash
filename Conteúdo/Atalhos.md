# Atalhos

Na tabela a seguir temos os atalhos mais comuns do **Bash**

| Atalho  | Descrição  |
|---|---|
| CTRL + A  | move para o início da linha  |
| CTRL + B  | retrocede um caracter |
| CTRL + C  | interrompe o comando atual |
| CTRL + D  | exclui um caractere para trás ou sai da sessão atual, semelhante ao exit |
| CTRL + E  | move para o final da linha |
| CTRL + F  | avança um caractere |
| CTRL + G  | interrompe o comando de edição atual e toca a campainha do terminal |
| CTRL + J  | mesmo que RETURN |
| CTRL + K  | exclui(elimina) para a frente até o final da linha |
| CTRL + L  | limpa a tela e reexibe a linha |
| CTRL + M  | mesmo que RETURN |
| CTRL + N  | próxima linha no histórico de comandos |
| CTRL + O  | igual a RETURN, em seguida, exibe a próxima linha no arquivo de histórico |
| CTRL + P  | linha anterior no histórico de comandos |
| CTRL + R  | pesquisas para trás |
| CTRL + S  | pesquisas para a frente |
| CTRL + T  | transpõe dois caracteres |
| CTRL + U  | elimina para trás do ponto até o início da linha  |
| CTRL + V  | torna o próximo caractere digitado literalmente |
| CTRL + W  | elimina a palavra atrás do cursor  |
| CTRL + X  | lista a possível conclusão de nome de arquivo da palavra atual  |
| CTRL + Y  | recupera (cola) o último item eliminado  |
| CTRL + Z  | interrompe o comando atual, retoma com fg em primeiro plano ou bg em segundo plano |
| DELETE  | exclui um caracter para trás |
| !!  | repete o último comando |
| exit  | sai da sessão atual |

## alias

Os usuários do Linux geralmente precisam usar alguns comandos repetidamente.

Podemos economizar algum tempo criando **aliases** para os comandos mais usados. Aliases são como atalhos personalizados usados para representar um comando (ou conjunto de comandos) executado com ou sem opções personalizadas.

Para vermos uma lista de aliases definidos em nosso perfil simplesmente executamos o comando alias:

```bash
alias
```

Nos serão apresentados os aliases deste usuário definidos em nossos sistema.

```
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias ports='netstat -tulanp'
```

Podemos observar por exemplo que o alias `ll` é equivalente ao comando `ls -alF`.

### Criando Aliases

A criação de aliases é um processo relativamente fácil e rápido. Podemos criar dois tipos de aliases: **temporários** e **permanentes**.

#### Temporário

Para criarmos um **alias** temporário precisamos digitar a palavra **alias** e usar o nome que desejamos usar para executar um comando seguido do sinal `=` e citar o comando que queremos criar.

Devemos então usar a seguinte sintaxe para definir um alias:

```bash
alias atalho="comando customizado a ser executado"
```

Exemplo prático:

```bash
alias wr=”cd /var/www/html”
```

Agora podemos usar o atalho **wr** que definimos para ir para o diretório webroot. O problema com esse alias é que ele estará disponível apenas para sua sessão de terminal atual, ele é temporário.

Se abrirmos uma nova sessão de terminal, o alias não estará mais disponível. Se desejarmos salvar os aliases entre as sessões, precisaremos de um alias permanente.

#### Permanente

Para manter os aliases entre as sessões, podemos salvá-los no arquivo de perfil de configuração do shell do usuário, que pode ser:

- Bash: `~/.bashrc`
- ZSH: `~/.zshrc`
- Fish: `~/.config/fish/config.fish`

Existe também o arquivo `~/.bash_profile`, ele é carregado quando você faz o login. É lido apenas uma vez.

A sintaxe que usamos é praticamente a mesma que a de criar um alias temporário. A única diferença vem do fato que estaremos salvando em um arquivo desta vez. Por exemplo, no bash, podemos abrir o arquivo `.bashrc` desta forma:

```bash
# Com nano
nano ~/.bashrc
# Com vim
vim ~/.bashrc
```

o arquivo `~/.bashrc` é carregado toda vez que você inicia um shell (por exemplo, iniciando um terminal), mas não é carregado quando você faz o login pela primeira vez.

Encontramos um local no arquivo `~/.bashrc` onde queremos manter os aliases. Por exemplo, podemos adicioná-los no final do arquivo. Para fins de organização, podemos deixar um comentário antes dos aliases para identificá-los.

```bash
# Custom Aliases
alias rm="rm -vi"
alias ll="ls -alFh"
```

Salvamos o arquivo. O arquivo será carregado automaticamente em nossa próxima sessão. Se quisermos usar o alias recém-definido na sessão atual, usamos o seguinte comando:

```bash
source ~/.bashrc
```

Para remover um alias adicionado por meio da linha de comando podemos usar o comando **unalias**.

```bash
unalias ll
```