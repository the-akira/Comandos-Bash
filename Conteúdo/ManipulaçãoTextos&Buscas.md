# Manipulação de Textos e Buscas

Linux ou sistemas do tipo Unix têm o que é conhecido como “*standard streams of data*”. Qualquer processo executado em tais sistemas é inicializado com três fluxos de dados: *standard input*, *standard ouput* e *standard error*. 

## Standard Out (stdout)

O **Standard output** ou “**stdout**” refere-se ao “local” para onde os programas ou processos enviam informações. Por padrão, a saída do shell será direcionada para a tela ou monitor (ou seja, impressa no terminal), mas também pode ser para um arquivo de texto ou uma impressora. Em outras palavras, a saída padrão é o local padrão onde as informações são enviadas após o processamento.

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