# Compactação e Arquivamento de Arquivos

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