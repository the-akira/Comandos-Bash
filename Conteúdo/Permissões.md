# Permissões

Os sistemas operacionais do tipo Unix, como o Linux, diferem de outros sistemas de computação, pois além de serem multitarefas, são também multiusuários.

Isso significa que mais de um usuário pode estar operando o computador ao mesmo tempo. Embora seu computador tenha apenas um teclado e monitor, ele ainda pode ser usado por mais de um usuário. Por exemplo, se o seu computador estiver conectado a uma rede ou à Internet, os usuários remotos poderão efetuar login via **ssh**(shell seguro) e operar o computador. De fato, os usuários remotos podem executar aplicativos gráficos e exibir o *output* em um computador remoto.

A capacidade multiusuário de sistemas do tipo Unix é um recurso profundamente arraigado no design do sistema operacional. Anos atrás, antes dos computadores serem "pessoais", eles eram grandes, caros e centralizados. Um sistema de computador universitário tradicional consistia em um grande computador mainframe localizado em algum prédio do campus e os terminais estavam localizados em todo o campus, cada um conectado ao grande computador central. O computador suportava muitos usuários ao mesmo tempo.

Para tornar o sistema prático, um método teve que ser desenvolvido para proteger os usuários uns dos outros. Afinal, você não podia permitir que as ações de um usuário travassem o computador, nem que um usuário interferisse nos arquivos pertencentes a outro usuário.

## Permissões de Arquivos

Em um sistema Linux, cada arquivo e diretório recebe direitos de acesso para o **proprietário do arquivo**, **os membros de um grupo de usuários relacionados** e **todos os outros**. Direitos podem ser atribuídos para **ler um arquivo**, **escrever em um arquivo** e **executar um arquivo**(rodá-lo como se fosse um programa).

Para visualizarmos as configurações de permissões para um arquivo podemos utilizar o comando **ls**. Utilizaremos como exemplo o programa **bash** que está localizado no diretório `/bin`:

```bash
ls -l /bin/bash

# Output:
# -rwxr-xr-x 1 root root 1113504 jun  6  2019 /bin/bash
```

Podemos observar que:

- O arquivo `/bin/bash` pertence ao usuário **root**
- O superusuário tem o direito de ler, escrever e executar este arquivo
- O arquivo pertence ao grupo **root**
- Membros do grupo **root** também podem ler e executar esse arquivo
- Todos os demais podem ler e executar este arquivo.

Na imagem abaixo, nós podemos ver como as permissões são interpretadas. Basicamente ela consiste de um caracter indicando o tipo do arquivo (**d** para diretório, **-** para outros arquivos), seguido por **três conjuntos** de **três caracteres** que consistem das permissões de **ler**, **escrever** e **executar** um arquivo para o **owner**, **grupo** e **todos os demais**.

![img](https://i.ibb.co/ZWRWGNy/permissions.png)

Cada caracter representa então uma permissão diferente, por exemplo:

- **r** = readable (possível de ler)
- **w** = writable (possível de escrever)
- **x** = executable (executável)
- **-** = vazio

## Comandos

### chmod

O comando chmod é usado para alterar as permissões de um arquivo ou diretório. Para usá-lo, você especifica as configurações de permissão desejadas e o arquivo ou arquivos que deseja modificar. Existem duas maneiras de especificar as permissões.

Podemos imaginar as configurações de permissão como uma série de bits(que é exatamente como o computador os trata).

Funciona da seguinte forma:

```
rwx rwx rwx = 111 111 111
rw- rw- rw- = 110 110 110
rwx --- --- = 111 000 000

rwx = 111 = 7
rw- = 110 = 6
r-x = 101 = 5
r-- = 100 = 4
```

Podemos então representar cada um dos **três conjuntos**(owner, grupo, e todos os demais) como um único dígito.

Por exemplo, se quiséssemos definir *arquivo.txt* para ter permissão de leitura e gravação para o proprietário/owner, mas quiséssemos manter o arquivo privado de outros, poderíamos executar o seguinte comando:

```bash
chmod 600 arquivo.txt
```

A tabela a seguir apresentar algumas configurações comuns. Os que começam com o número **7** são usados para programas, uma vez que eles habilitam a execução, e os demais são para outros tipos de arquivos.

| Valor  | Significado  |
|---|---|
| 777  | (rwxrwxrwx) Não há restrições de permissões. Qualquer um pode fazer qualquer coisa.  |
| 755  | (rwxr-xr-x) O proprietário/owner do arquivo pode ler, escrever e executar o arquivo. Todos os outros podem ler e executar o arquivo.  |
| 700  | (rwx------) O proprietário do arquivo pode ler, escrever e executar o arquivo. Ninguém mais tem nenhum direito. |
| 666  | (rw-rw-rw-) Todos os usuários podem ler e escrever o arquivo.  |
| 644  | (rw-r--r--) O proprietário pode ler e escrever um arquivo, enquanto todos os outros podem apenas ler o arquivo. |
| 600  | (rw-------) O proprietário pode ler e escrever um arquivo. Todos os outros não têm direitos. |

O comando **chmod** também pode ser usado para controlar as permissões de acesso para diretórios. Novamente, podemos usar a notação octal para definir permissões, mas o significado dos atributos **r**, **w** e **x** é diferente:

- **r**: Permite que o conteúdo do diretório seja listado se o atributo **x** também estiver definido.
- **w**: Permite que arquivos dentro do diretório sejam criados, excluídos ou renomeados se o atributo **x** também estiver definido.
- **x**: Permite que um diretório seja acessado (por exemplo: `cd docs`)

Configurações interessantes para diretórios:

| Valor  | Significado  |
|---|---|
| 777  | (rwxrwxrwx) Não há restrições de permissões. Qualquer pessoa pode listar arquivos, criar novos arquivos no diretório e excluir arquivos no diretório. |
| 755  | (rwxr-xr-x) O proprietário do diretório tem acesso total. Todos os outros podem listar o diretório, mas não podem criar arquivos nem excluí-los. |
| 700  | (rwx------) O proprietário do diretório tem acesso total. Ninguém mais tem nenhum direito. |

Há também uma outra maneira de alterar as permissões: 

Primeiro, escolhemos qual conjunto de permissões você deseja alterar, **usuário**, **grupo** ou **outro**. Podemos adicionar ou remover permissões com um **+** ou **-**, vejamos alguns exemplo:

Alterando a permissão no `script.py` adicionando o bit de permissão executável ao conjunto de usuários. Então agora o usuário tem permissão de executar este arquivo:

```bash
chmod u+x script.py 
```

Caso queíramos remover a permissão:

```bash
chmod u-x script.py 
```

Também podemos adicionar múltiplas permissões em um arquivo:

```bash
chmod ug+w script.py
```

Neste exemplo, habilitamos os bits de permissão de escrita para o **usuário** e **grupo**.

Podemos também habilitar o bit de permissão de execução apenas para **os outros**:

```bash
chmod o+x script.py
```

### Permissões de Propriedade

#### chown

Além de modificar as permissões nos arquivos, podemos também modificar a propriedade do grupo e do usuário, ou seja, a quem pertence o arquivo.

##### Modificar a propriedade do usuário

```bash
sudo chown akira arquivo.txt
```

Este comando irá setar **akira** como proprietário de `arquivo.txt`

#### chgrp

##### Modificar propriedade do grupo

```bash
sudo chgrp programadores script.js
```

Este comando irá setar o grupo de `script.js` para **programadores**

##### Modificar a propriedade do usuário e do grupo ao mesmo tempo

Se adicionarmos dois pontos e nome de grupo após o usuário, podemos definir o usuário e o grupo ao mesmo tempo.

```bash
sudo chown akira:programadores script.js
```

### Tornando-se Superusuário

Geralmente, é necessário se tornar o superusuário para executar tarefas importantes de administração do sistema. Na maioria das distribuições, existe um programa que pode fornecer acesso temporário aos privilégios do superusuário. Este programa é chamado **su**(abreviação de usuário substituto) e pode ser usado nesses casos em que você precisa ser o superusuário. Para se tornar o superusuário, basta digitar o comando su. Você será solicitado a senha do superusuário:

```bash
su
``` 

Após executar o comando **su**, você terá uma nova sessão de shell como superusuário. Para sair da sessão de superusuário, digite `exit` ou `CTRL + D` e você retornará à sua sessão anterior.

Em algumas distribuições é usado um método alternativo. Em vez de usar **su**, esses sistemas empregam o comando **sudo**. Com o sudo, um ou mais usuários recebem privilégios de superusuário conforme a necessidade. Para executar um comando como superusuário, o comando desejado é simplesmente precedido pelo comando sudo. Depois que o comando é inserido, o usuário solicita a senha do usuário, em vez da senha do superusuário:

```bash
sudo script.py
```

### umask

Máscara de criação de arquivo do usuário. O comando **umask** define uma variável de ambiente que define automaticamente as permissões de arquivo nos arquivos recém-criados. ou seja, definirá a máscara de criação de arquivo.

Este comando aceita o conjunto de permissões de 3 bits que vemos nas permissões numéricas. Em vez de adicionar essas permissões, o umask tira essas permissões.

Por exemplo:

```bash
umask 021
```

No exemplo acima, estamos afirmando que queremos que as permissões padrão de novos arquivos permitam aos usuários acessar tudo, mas para grupos queremos retirar sua permissão de leitura e para outros queremos retirar sua permissão de executar. 

Para determinar o valor de **umask** que você deseja definir, subtraia o valor das permissões desejadas de 666(para um arquivo) ou 777(para um diretório), o restante é o valor a ser usado com o comando umask. 

Por exemplo, suponha que você queira alterar o modo padrão dos arquivos para 644(**rw-r--r--**). A diferença entre 666 e 644 é 022, que é o valor que você usaria como argumento para o comando **umask**.

Você também pode determinar o valor de umask que deseja definir usando a tabela a seguir, que mostra as permissões de arquivo e diretório criadas para cada um dos valores octais de umask.

| Valor Octal  | Permissões de Arquivos  | Permissões de Diretórios  |
|---|---|---|
| 0  | rw-  | rwx  |
| 1  | rw-  | rw-  |
| 2  | r--  | r-x  |
| 3  | r--  | r--  |
| 4  | -w-  | -wx  |
| 5  | -w-  | -w-  |
| 6  | --x  | --x  |
| 7  | ---  | ---  |

O comando a seguir define as permissões de arquivo padrão como (rw-rw-rw-).

```bash
umask 000
```