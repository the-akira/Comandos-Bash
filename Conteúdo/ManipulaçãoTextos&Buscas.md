# Manipulação de Textos e Buscas

Linux ou sistemas do tipo Unix têm o que é conhecido como “*standard streams of data*”. Qualquer processo executado em tais sistemas é inicializado com três fluxos de dados: *standard ouput*, *standard input* e *standard error*. 

![img](https://i.ibb.co/PCRTC9t/datastreams.png)

## Standard Out (stdout)

O **Standard output** ou “**stdout**” refere-se ao “local” para onde os programas ou processos enviam informações. Por padrão, a saída do shell será direcionada para a tela ou monitor (ou seja, impressa no terminal), mas também pode ser para um arquivo de texto ou uma impressora. Em outras palavras, o *standard output* é o local padrão onde as informações são enviadas após o processamento.

A maioria dos programas de linha de comando que exibem seus resultados o fazem enviando-os para um recurso chamado *standard output*. Por padrão, o *standard output* direciona seu conteúdo para o display. Para redirecionar o *standard output* para um arquivo, o caractere **">"** pode ser usado da seguinte forma:

```bash
echo "Hello World" > hello.txt
```

Neste exemplo o comando **echo** é executado e seu resultado é gravado em um arquivo nomeado `hello.txt`. Uma vez que o *output* do comando **echo** foi redirecionado para o arquivo, nenhum resultado irá aparecer na tela.

Podemos usar com diversos outros comandos também, neste exemplo usamos o **ls**:

```bash
ls > lista_arquivos.txt
```

O comando **ls** é executado e os resultados são gravados em um arquivo denominado `lista_arquivos.txt`. Como o *output* de **ls** foi redirecionado para o arquivo, nenhum resultado aparecerá na tela.

Cada vez que o comando acima é repetido, o arquivo `lista_arquivos.txt` será sobrescrito desde o início com o *output* do comando **ls**. Se quisermos que os novos resultados sejam anexados/*appended* ao arquivo, devemos usar **">>"** da seguinte maneira:

```bash
ls >> lista_arquivos.txt
```

Quando os resultados são anexados/*appended*, os novos resultados são adicionados ao final do arquivo, tornando o arquivo mais longo cada vez que o comando é repetido. Se o arquivo não existir quando você tentar anexar o *output* redirecionado, o arquivo será criado.

## Standard In (stdin)

**Standard input** ou “**stdin**” refere-se ao “local” de onde os programas ou processos obtêm informações. Por padrão, o shell “pega” a entrada do teclado. Em outras palavras, o *standard input* é o local padrão e a fonte de informações para programas Linux/Bash.

Assim como o *standard ouput*, o *standard input* também pode ser redirecionado. Para redirecionar o *standard input* de um arquivo em vez do teclado, o caractere **"<"** pode ser utilizado:

```bash
sort < cientistas.txt
```

No exemplo acima, usamos o comando **sort** para processar o conteúdo do arquivo `cientistas.txt`. Os resultados são exibidos no display, pois o *standard output* não foi redirecionado. Poderíamos redirecionar o *standard input* para outro arquivo da seguinte forma:

```bash
sort < cientistas.txt > cientistas_ordenados.txt
```

Podemos observar que um comando pode ter seu *Intput* e *Output* redirecionados. Estejamos cientes de que a ordem do redirecionamento não importa. O único requisito é que os operadores de redirecionamento (o **"<"** e **">"**) devem aparecer após as outras opções e argumentos no comando.

## Standard Error (stderr)

**Standard Error** ou “**stderr**”, refere-se ao “local” onde os programas ou processos enviam erros. Por padrão, o *output* do shell será direcionada para a tela ou monitor (ou seja, impressa no terminal). Em outras palavras, o *standard error* é o local padrão onde o shell envia mensagens sobre processos que deram errado.

Para compreendermos melhor este conceito, vamos tentar imprimir o conteúdo de um arquivo que está protegido contra leitura em seu sistema (`/etc/shadow`) e redirecionar o *output* para o arquivo `shadow.txt`:

```bash
cat /etc/shadow > shadow.txt
```

Imediatamente veremos o seguinte erro:

```bash
cat: /etc/shadow: Permissão negada
```

A questão essencial é: Essa mensagem não deveria ter sido enviada para o arquivo? Na verdade, há outro fluxo de *Input*/*Output* em jogo aqui chamado de *standard error* (**stderr**). Por padrão, o *stderr* envia seu *output* para a tela também, é um fluxo completamente diferente do *stdout*. Portanto, precisaremos redirecionar seu *output* de uma maneira diferente.

Teremos que usar descritores de arquivo. Um descritor de arquivo é um número não negativo usado para acessar um arquivo ou fluxo. O descritor de arquivo para **stdin**, **stdout** e **stderr** é **0**, **1** e **2**, respectivamente.

Então se quisermos redirecionar nosso stderr para o arquivo, podemos fazer o seguinte:

```bash
cat /etc/shadow 2> shadow.txt
```

Agora veremos a mensagem de erro no arquivo `shadow.txt`.

Caso queíramos ver o *stderr* e *stdout* no arquivo `shadow.txt` podemos usar os seguintes descritores de arquivo:

```bash
cat /etc/shadow 2>&1 shadow.txt
```

Esse comando envia o resultado de `cat /etc/shadow` para o arquivo `shadow.txt` e então redireciona o stderr* para o *stdout* através de `2>&1`. Lembrando que nesse caso a ordem das operações importa, `2>&1` envia o *stderr* para onde o *stdout* estiver apontando. Neste caso, o *stdout* está apontando para um arquivo, então `2>&1` também envia o *stderr* para um arquivo.

Existe ainda uma maneira mais rápida de redirecionar *stdout* e *stderr* para um arquivo:

```bash
cat /etc/shadow &> shadow.txt
```

E caso tenhamos o desejo de nos livrarmos das mensagens *stderr* por completo? Podemos redirecionar o *output* para um arquivo especial `/dev/null` e ela descartará qualquer *input*.

```bash
cat /etc/shadow 2> /dev/null
```

## Pipeline

Até então estavamos lidando com o envio de dados vindo de e para arquivos. As **Pipelines** são um mecanismo que permitem enviarmos dados de um programa para outro. O operador que usamos para definer uma **Pipeline** é o "**|**", esse operador alimenta o *output* do programa à esquerda para o programa à direita como *input*. 

No exemplo abaixo, listaremos apenas os 4 primeiros arquivos do diretório [Arquivos](https://github.com/the-akira/Comandos-Bash/tree/master/Arquivos).

```bash
ls | head -n 4
```

O *output* do programa **ls** será redirecionado para o *input* do programa **head** que por sua vez irá imprimir em nosso terminal apenas os 4 primeiros arquivos desse diretório.

Podemos também por exemplo usá-lo para filtrar apenas os arquivos com a extensão `.txt` de um determinado diretório:

```bash
ls -l | grep ".txt"
```

Podemos utilizar **pipelines** em quantos programas quisermos. No exemplo abaixo, canalizamos o *output* de `ls -l | grep ".txt"` para o programa **tail**, utilizando o argumento **-2** indicamos que queremos exibir apenas os dois últimos arquivos do diretório.

```bash
ls | grep ".txt" | tail -2
```

**Lists** são uma sequência de um ou mais pipelines separados por um dos operadores ‘`;`’, ‘`&`’, ‘`&&`’, '`||`':

```bash
ls | grep ".txt" && ls | grep ".csv"
```

O **pipeline** do lado esquerdo de **&&** imprimirá os arquivos correspondentes ao “.txt”, e o pipeline do lado direito imprimirá os arquivos correspondentes à extensão “.csv”, apenas se o lado esquerdo foi executado com sucesso.

## Manipulando & Processando Textos

Aprenderemos alguns comandos úteis que podemos usar para processar texto, para auxiliar em nossos exemplos, vamos usar os arquivos presentes no diretório [Arquivos](https://github.com/the-akira/Comandos-Bash/tree/master/Arquivos).

### head

O comando **head** imprime um número **N** de **dados de input** fornecido. Por padrão, ele imprime as primeiras 10 linhas dos arquivos especificados. Se mais de um nome de arquivo for fornecido, os dados de cada arquivo serão precedidos por seu nome de arquivo.

Para experimentarmos o comando **head** vamos utilizar como exemplo os arquivos [cientistas.txt](https://github.com/the-akira/Comandos-Bash/blob/master/Arquivos/cientistas.txt) e [linguagens.txt](https://github.com/the-akira/Comandos-Bash/blob/master/Arquivos/linguagens.txt)

Se usarmos o comando **head** sem nenhuma opção será apresentado na tela apenas as 10 primeiras linhas do arquivo especificado, por exemplo:

```bash
head linguagens.txt
```

A opção **-n num** imprime as primeiras linhas "**num**" em vez das primeiras 10 linhas, num é obrigatório ser especificado no comando, caso contrário, ele exibe um erro.

```bash
head -n 3 cientistas.txt
```

A opção **-c num** imprime os primeiros "**num**" bytes do arquivo especificado. A nova linha conta como um único caractere, portanto, se o cabeçalho imprimir uma nova linha, ele a contará como um byte, num é obrigatório ser especificado no comando, caso contrário exibe um erro.

```bash
head -c 13 cientistas.txt
```

A opção **-q** é usada se mais de 1 arquivo for fornecido. Por causa desse comando, os dados de cada arquivo não são precedidos por seu nome de arquivo.

```bash
head -q cientistas.txt linguagens.txt
```

Ao usarmos a opção **-v**, os dados do arquivo especificado são sempre precedidos por seu nome de arquivo.

```bash
head -v cientistas.txt linguagens.txt
```

O comando **head** pode ser conectado/*piped* com outros comandos. No exemplo a seguir, o *output* do comando head é direcionada para mostrar apenas as entradas que começam com a letra **C** através do comando **grep**:

```bash
head cientistas.txt linguagens.txt | grep "C"
```

### tail

Semelhante ao comando head, o comando **tail** permite que você veja as últimas 10 linhas de um arquivo por padrão.

```bash
tail linguagens.txt
```

Assim como o head, podemos utilizar a opção **-n** para alterar o número de linhas que desejamos ver.

```bash
tail -n 12 linguagens.txt
```

Outra ótima opção que podemos usar é a **-f** (*follow*), que acompanhará o arquivo à medida que ele crescer, podemos utilizar ele por exemplo com o arquivo `/var/log/syslog`:

```bash
tail -f /var/log/syslog
```

O arquivo `syslog` mudará continuamente enquanto interagimos com o sistema e, usando `tail -f`, podemos ver tudo o que está sendo adicionado a esse arquivo.

### cut

O comando **cut** extrai partes do texto de um arquivo.

Ele pode ser usado para cortar partes de uma linha por posição de **byte**, **caractere** e **campo**. Basicamente, o comando cut corta uma linha e extrai o texto. Se mais de um nome de arquivo for fornecido, os dados de cada arquivo não serão precedidos por seu nome de arquivo.

É muito interessante para removermos colunas.

Podemos por exemplo usar com o arquivo `cientistas.txt` para selecionar apenas os sobrenomes:

```bash
cut -f 2 -d " " cientistas.txt
```

A opção **-f** indica *field*, ou seja, estamos selecionando apenas o segundo campo do texto, e a opção **-d** indica *delimiter*, que em nosso caso é o espaço entre os nomes, mas poderia ser por exemplo `,` como é comum em arquivos **csv**.

Caso queíramos selecionar apenas os nomes, alteramos a opção **-f**:

```bash
cut -f 1 -d " " cientistas.txt
```

Para cortar por caractere, usamos a opção **-c**. Dessa maneira selecionamos os caracteres atribuídos à opção -c. Pode ser uma lista de números separados por vírgulas ou um intervalo de números separados por hífen (-). `Tabs` e `backspaces` são tratados como um caractere. É necessário especificar uma lista de números de caracteres, caso contrário, haverá um erro com esta opção.

Podemos por exemplo selecionar apenas o primeiro caracter de cada cientista do arquivo `cientistas.txt`:

```bash
cut -c 1 cientistas.txt
```

Ou até mesmo selecionar os 6 primeiros caracteres:

```bash
cut -c 1-6 cientistas.txt
```

Ou diversos caracteres separados por `,`:

```bash
cut -c 1,3,4,6 cientistas.txt
```

Caso queíramos selecionar todos os caracteres a partir do 3º:

```bash
cut -c 3- cientistas.txt
```

Podemos selecionar todos os caracteres até o 8º da seguinte forma:

```bash
cut -c -8 cientistas.txt
```

A opção **-b** (byte) é usada para extrair os bytes específicos, é necessário seguir a opção -b com a lista de números de bytes separados por vírgula. O intervalo de bytes também pode ser especificado usando o hífen (-). É necessário especificar a lista de números de bytes, caso contrário, ocorrerá erro. `Tabs` e `backspaces` são tratados como caracteres de 1 byte.

```bash
cut -b 1-3 cientistas.txt
cut -b 1,2,3 cientistas.txt
```

A opção **–output-delimiter** por padrão, o delimitador de *output* é o mesmo que o delimitador de *input* que especificamos no **cut** com a opção **-d**. Para alterar o delimitador de *output*, usamos a opção `–output-delimiter = ”delimitador”`.

Para alterarmos o delimitador de `backspaces` para `-` podemo executar:

```bash
cut -d " " -f 1,2 cientistas.txt --output-delimiter='-'
```

O comando **cut** pode ser conectado/*piped* a muitos outros comandos do Unix. No exemplo a seguir estamos usando o comando **cat** para imprimir o conteúdo do arquivo e enviamos seu *output* para o **cut** onde estamos selecionando apenas o primeiro *field*, que representa o nome do cientista, em seguida enviamos este *output* para o comando **sort** que está ordenando os nomes em ordem reversa devido a opção **-r**:

```bash
cat cientistas.txt | cut -d" " -f 1 | sort -r
```

O comando **cut** também pode ser muito útil para trabalharmos com arquivos `.csv`, neste exemplo veremos o arquivo [livros.csv](https://github.com/the-akira/Comandos-Bash/blob/master/Arquivos/livros.csv).

Para selecionarmos apenas a primeira coluna de `livros.csv`:

```bash
cut -d, -f 1 livros.csv
```

Para selecionarmos todas as colunas, exceto a primeira:

```bash
cut -d, -f 2- livros.csv
```

Em combinação com outros comandos, o **cut** serve como um filtro, se quisermos por exemplo buscar por palavras-chave em uma determinada coluna:

```bash
cat livros.csv | grep "computer" | cut -d, -f 4
```

Nesse caso estamos apenas buscando os gêneros de livro que contenham algo relacionado com **computer**.