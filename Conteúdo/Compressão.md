# Compressão e Arquivamento de Arquivos

Às vezes é útil armazenar um grupo de arquivos em um arquivo para que eles possam ser copiados, facilmente transferidos para outro diretório ou mesmo transferidos para outro computador. Às vezes, também é útil compactar arquivos em um arquivo para que eles usem menos espaço em disco e baixem mais rapidamente.

É importante entender a diferença e o relacionamento entre um **arquivo arquivado** e um **arquivo compactado**. 

Um arquivo arquivado é uma coleção de arquivos e diretórios armazenados em um arquivo. O arquivo arquivado não está compactado - ele usa a mesma quantidade de espaço em disco que todos os arquivos e diretórios individuais combinados. 

Um arquivo compactado é uma coleção de arquivos e diretórios armazenados em um arquivo e armazenados de uma maneira que utiliza menos espaço em disco do que todos os arquivos e diretórios individuais combinados. Se você não tiver espaço em disco suficiente no computador, poderá compactar os arquivos que não utiliza com muita frequência ou os arquivos que deseja salvar, mas não usa mais. Você pode até criar um arquivo e compactá-lo para economizar espaço em disco.

**Importante**: Um arquivo arquivado não é compactado, mas um arquivo compactado pode ser um arquivo arquivado.

## Compactando Arquivos

Os arquivos compactados usam menos espaço em disco e baixam mais rápido que os arquivos grandes e não compactados. No Linux podemos compactar arquivos com as ferramentas de compactação **gzip**, **bzip2** ou **zip**.

A ferramenta de compactação **bzip2** é muito recomendada porque fornece a maior compactação e é encontrada na maioria dos sistemas operacionais do tipo Unix. A ferramenta de compactação **gzip** também pode ser encontrada na maioria dos sistemas operacionais semelhantes ao Unix. Se você precisar transferir arquivos entre o Linux e outro sistema operacional, como o Microsoft Windows, use o **zip**, pois é mais comum nesses outros sistemas operacionais.

A tabela a seguir apresenta informações sobre as ferramentas de compactação/compressão

| Ferramenta para Compactar  | Extensão do Arquivo  | Ferramenta para Descompactar  |
|---|---|---|
| gzip  | .gz  | gunzip  |
| bzip2  | .bz2  | bunzip2  |
| zip  | .zip  | unzip |

Por convenção, os arquivos compactados com **gzip** recebem a extensão `.gz`, os arquivos compactados com **bzip2** recebem a extensão `.bz2` e os arquivos compactados com **zip** recebem a extensão `.zip`.

Arquivos compactados com **gzip** são descompactados com **gunzip**, arquivos compactados com **bzip2** são descompactados com **bunzip2** e arquivos compactados com **zip** são descompactados com **unzip**.

## Comandos

### Bzip2 & Bunzip2

Para utilizar o **bzip2** para compactar um arquivo, digite o seguinte comando em um prompt de shell:

```bash
bzip2 arquivo
```

O arquivo será compactado e salvo como `arquivo.bz2`.

Para expandir o arquivo compactado, digite o seguinte comando:

```bash
bunzip2 arquivo.bz2
```

Observe que o `arquivo.bz2` é deletado e substituído por `arquivo`.

Você pode usar o **bzip2** em vários arquivos ao mesmo tempo, listando-os com um espaço entre cada um:

```bash
bzip2 texto.txt script.py index.php
```

O comando acima irá comprimir os arquivos: `texto.txt`, `script.py` e `index.php`.

Para mais informações você pode utilizar o comando `man bzip2` ou a opção de ajuda `bunzip2 --help`

### Gzip & Gunzip

Para usar o **gzip** para compactar um arquivo, digite o seguinte comando no prompt do shell:

```bash
gzip arquivo
```

O arquivo será compactado e salvo como `arquivo.gz`.

Para expandir o arquivo compactado, digite o seguinte comando:

```bash
gunzip arquivo.gz
```

`arquivo.gz` é então deletado e substituído por `arquivo`.

Você pode usar o **gzip** em vários arquivos ao mesmo tempo, listando-os com um espaço entre cada um:

```bash
gzip texto.txt script.py index.php
```

O comando acima irá comprimir os arquivos: `texto.txt`, `script.py` e `index.php`.

### Zip & Unzip

Para compactar um arquivo com **zip**, usamos o seguinte comando:

```bash
zip -r arquivo.zip diretorio
```

Neste exemplo, `arquivo.zip` representa o arquivo que você está criando e `diretorio` representa o diretório que você deseja colocar no novo arquivo zip. A opção -r especifica que você deseja incluir todos os arquivos contidos no diretório `diretorio` recursivamente.

Para extrair o conteúdo de um arquivo **zip**, digite o seguinte comando:

```bash
unzip arquivo.zip
```

É possível compactar vários arquivos e diretórios ao mesmo tempo, listando-os com um espaço entre cada um:

```bash
zip -r arquivo.zip readme.md texto.txt script.py /usr/documentos/scripts
```

O comando acima irá comprimir os arquivos `readme.md`, `texto.txt` e `script.py` e os conteúdos do diretório `/usr/documentos/scripts` e os colocará em `arquivo.zip`.

### Arquivamento de Arquivos
 
Um arquivo **tar** é uma coleção de vários arquivos e/ou diretórios em um arquivo. Essa é uma boa maneira de criar backups e arquivamentos.

Algumas das opções disponíveis para usarmos com **tar** são:

- `-c`: cria um novo arquivamento
- `-f`: quando utilizado com a opção **-c** utiliza o nome de arquivo especificado para a criação do arquivo tar. quando usado com a opção **-x** desarquiva o arquivo especificado.
- `-t`: mostra a lista de arquivos no arquivo **tar**
- `-v`: mostra o progresso dos arquivos sendo arquivados
- `-x`: faz a extração dos arquivos de um arquivamento
- `-z`: faz a compressão do arquivo **tar** com **gzip**
- `-j`: faz a compressão do arquivo **tar** com **bzip2**

Vejamos então alguns exemplos, para criar um arquivo **tar**:

```bash
tar -cvf arquivos.tar Diretorio
```

Neste exemplo, `arquivos.tar` representa o arquivo que você está criando e `Diretorio` representa os arquivos ou diretórios que você deseja colocar no arquivo arquivado.

Podemos utilizar **tar** em vários arquivos e diretórios ao mesmo tempo, listando-os com um espaço entre cada um:

```bash
tar -cvf arquivos.tar Arquivos readme.md texto.txt
```

O comando acima irá colocar todos os arquivos do diretório `Arquivos` e os arquivos `readme.md` e `texto.txt` em um novo arquivo chamado de `arquivos.tar` no diretório atual.

Para listar o conteúdo de um arquivo tar, digite o comando:

```bash
tar -tvf arquivos.tar
```

Para extrair o conteúdo de um arquivo **tar**, digite:

```bash
tar -xvf arquivos.tar
```

Este comando não remove o arquivo **tar**, mas coloca cópias de seu conteúdo no *diretório de trabalho atual*.

É importante lembrarmos que o comando tar não compacta os arquivos por padrão. Para criar um arquivo compactado com tar e bzip, use a opção **-j**:

```bash
tar -cjvf arquivo.tbz readme.md texto.txt Arquivos
```

Os arquivos **tar** compactados com o **bzip2** recebem convencionalmente a extensão `.tbz`.

Este último comando irá criar um arquivo arquivado e então irá comprimí-lo como `arquivo.tbz`. Se você descompactar o arquivo `arquivo.tbz` com o comando **bunzip2**, o arquivo `arquivo.tbz` será removido e substituído por `arquivo.tar`.

Você também pode expandir e desarquivar um arquivo tar **bzip** em um único comando:

```bash
tar -xjvf arquivo.tbz
```

Para criar um arquivo compactado com **tar** e **gunzip**, utilizamos a opção **-z**:

```bash
tar -czvf arquivos.tgz readme.md Arquivos/
```

Os arquivos **tar** compactados com o **gzip** recebem convencionalmente a extensão `.tgz`.

Este comando cria o arquivo `arquivos.tar` e, em seguida, o compacta como o arquivo `arquivos.tgz`. (O arquivo filename.tar não será salvo) Se você descompactar o arquivo `arquivo.tgz` com o comando gunzip, o arquivo `arquivo.tgz` será removido e substituído por `arquivo.tar`.

Também podemos expandir um arquivo tar/gzip em apenas um comando:

```bash
tar -xzvf arquivos.tgz
```