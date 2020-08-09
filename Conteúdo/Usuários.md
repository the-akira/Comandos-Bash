# Gerenciamento de Usuários

Em qualquer sistema operacional tradicional, existem usuários e grupos. Eles existem apenas para acesso e permissões. Ao executar um processo, ele será executado como o proprietário desse processo, seja **Gabriel** ou **Rafael**. O acesso e a propriedade do arquivo também dependem da permissão. Não seria seguro que **Gabriel** visse os documentos de **Rafael** e vice-versa.

Um usuário é uma entidade, em um sistema operacional Linux, que pode manipular arquivos e realizar várias outras operações. Cada usuário recebe um ID exclusivo para cada usuário no sistema operacional. Após a instalação do sistema operacional, o ID 0 é atribuído ao usuário root e os IDs 1 a 999 (ambos inclusivos) são atribuídos aos usuários do sistema e, portanto, os IDs para o usuário local começam a partir de 1000.

Cada usuário tem seu próprio diretório inicial, onde seus arquivos específicos são armazenados, geralmente localizado em `/home/usuario` , mas pode variar em distribuições diferentes.

O sistema usa IDs de usuário (UID) para gerenciar usuários, nomes de usuário são a forma amigável de associar usuários à identificação, mas o sistema os identifica por seu UID. O sistema também usa grupos para gerenciar permissões, grupos são apenas conjuntos de usuários com permissão definida por aquele grupo, eles são identificados pelo sistema com seu ID de grupo (GID).

No Linux, você terá usuários além dos humanos normais que usam o sistema. Às vezes, esses usuários são daemons do sistema que executam processos continuamente para manter o funcionamento do sistema. Um dos usuários mais importantes é o **root** ou **superusuário**, o root é o usuário mais poderoso do sistema, o root pode acessar qualquer arquivo e iniciar e encerrar qualquer processo. Por esse motivo, pode ser perigoso operar como root o tempo todo, você pode remover arquivos essenciais do sistema. Felizmente, se o acesso root for necessário e um usuário tiver acesso root, ele poderá executar um comando como root em vez do comando sudo. O comando sudo (superuser do) é usado para executar um comando com acesso root.

Podemos por exemplo tentar visualizar um arquivo protegido como `/etc/shadow`:

```bash
cat /etc/shadow
```

Observe como obtemos um erro de **permissão negada**, podemos consultar as permissões com o comando:

```bash
ls -la /etc/shadow
```

**root** é o proprietário deste arquivo e precisaremos de acesso root ou fazer parte do grupo shadow para ler o conteúdo. Podemos então ler ele prefixando nosso comando com **sudo**:

```bash
sudo cat /etc/shadow
```

## Root

o comando **sudo** nos permite obter acesso de superusuário. Também podemos executar comandos como superusuário com o comando **su**. Este comando irá "substituir usuários" e abrir um shell root se nenhum nome de usuário for especificado. Podemos usar este comando para substituir qualquer usuário, desde que saibamos a senha.

```bash
su
```

Existem algumas desvantagens em usar este método: é muito mais fácil cometer um erro crítico executando tudo no root, você não terá registros dos comandos que usa para alterar as configurações do sistema, etc. Basicamente, se você precisar executar comandos como o superusuário, **sudo** é uma excelente opção.

Como saber quem tem acesso para fazer isso? O sistema não permite que cada pessoa execute comandos como superusuário, então, como ele sabe? Existe um arquivo chamado `/ etc/sudoers`, esse arquivo lista os usuários que podem executar o **sudo**. Você pode editar este arquivo com o comando **visudo**.

## /etc/passwd

É importante lembrarmos de que nomes de usuário não são identificações de usuários. O sistema usa um ID de usuário (UID) para identificar um usuário. Para descobrir quais usuários estão mapeados para qual ID, podemos consultar o arquivo `/etc/passwd`.

```bash
cat /etc/passwd
```

Este arquivo mostra uma lista de usuários e informações detalhadas sobre eles. Por exemplo, a primeira linha neste arquivo é semelhante a:

```
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
```

Cada linha exibe informações de usuário para um usuário, comumente veremos o usuário root como a primeira linha. 

Existem muitos campos separados por dois pontos que fornecem informações adicionais sobre o usuário:

1. Nome do usuário
2. Senha do usuário: a senha não é realmente armazenada neste arquivo, geralmente é armazenada no arquivo `/etc/shadow`. É possível vermos muitos símbolos diferentes neste campo, se você ver um "x" significa que a senha está armazenada no arquivo `/etc/shadow`, um "\*" significa que o usuário não tem acesso de login e se houver um campo em branco significa que o usuário não tem uma senha.
3. O ID do usuário: o usuário root tem o UID de 0
4. O ID do grupo
5. Campo GECOS - geralmente é usado para deixar comentários sobre o usuário ou conta, como seu nome real ou número de telefone, delimitado por vírgulas.
6. Diretório inicial do usuário
7. Shell do usuário: muitos usuários usam o bash para seu shell

O arquivo `/etc/passwd` também contém outros usuários. É importante lembrarmos que os usuários estão realmente apenas no sistema para executar processos com permissões diferentes. Às vezes, queremos executar processos com permissões pré-determinadas. Por exemplo, o usuário daemon é usado para processos daemon.

Podemos editar o arquivo `/etc/passwd` manualmente se quisermos adicionar usuários e modificar informações com a ferramenta **vipw**.

## /etc/shadow

O arquivo `/etc/shadow` é usado para armazenar informações sobre a autenticação do usuário. Requer permissões de leitura de superusuário.

```bash
sudo cat /etc/shadow
```

É possível percebermos que seu conteúdo é muito semelhante ao conteúdo de `/etc/passwd`, entretanto, no campo de senha, você verá uma senha criptografada. Os campos são separados por dois pontos da seguinte forma:

1. Nome do usuário
2. Senha criptografada
3. Data da última alteração da senha: expressa como o número de dias desde 1º de janeiro de 1970. Se houver um 0, isso significa que o usuário deve alterar sua senha na próxima vez que fizer login
4. Duração mínima da senha: Dias que um usuário terá que esperar antes de poder alterar sua senha novamente
5. Duração máxima da senha: Número máximo de dias antes que um usuário tenha que alterar sua senha
6. Período de aviso de senha: Número de dias antes que uma senha expire
7. Período de inatividade da senha: Número de dias após a expiração de uma senha para permitir o login com sua senha
8. Data de expiração da conta: data em que o usuário não poderá fazer o login
9. Campo reservado para uso futuro

Em muitas das distribuições de hoje, a autenticação do usuário não depende apenas do arquivo `/etc/shadow`, existem outros mecanismos em funcionamento, como PAM(Pluggable Authentication Modules) que substituem a autenticação.

## /etc/group

Outro arquivo usado no gerenciamento de usuários é o arquivo `/etc/group`. Este arquivo permite diferentes grupos com diferentes permissões.

```bash
cat /etc/group
```

Semelhante aos campos de `/etc/password`, os campos `/etc/group` são os seguintes:

1. Nome do grupo
2. Senha de grupo: Não há necessidade de definir uma senha de grupo, usando um privilégio elevado, como sudo é padrão. Um "\*" será colocado como o valor padrão.
3. ID do grupo (GID)
4. Lista de usuários: Podemos especificar manualmente os usuários que desejarmos em um grupo específico

## Ferramentas de Gerenciamento de Usuários

A maioria dos ambientes corporativos usam sistemas de gerenciamento para gerenciar usuários, contas e senhas. No entanto, em um único computador, existem comandos úteis que podemos executar para gerenciar usuários.

### Adicionando Usuários

Podemos usar o comando **adduser** ou o comando **useradd**. O comando adduser contém recursos úteis, como criar um diretório inicial. Existem arquivos de configuração para adicionar novos usuários que podem ser personalizados, dependendo do que você deseja alocar para um usuário padrão.

```bash
sudo useradd gabriel 
```

O comando acima cria uma entrada em `/etc/passwd` para **gabriel**, configura grupos padrão e adiciona uma entrada ao arquivo `/etc/shadow`.

### Removendo Usuários

Para remover um usuário, podemos usar o comando **userdel**:

```bash
sudo userdel gabriel
```

### Alterando Senhas

O comando **passwd** permitirá que você altere a sua senha ou de outro usuário (se você for root).

```bash
passwd gabriel 
```

### Listando Usuários

Para listar todos os usuários no Linux, podemos usar **awk** com a opção **-F**. Acessaremos um arquivo e imprimimos apenas a primeira coluna com a ajuda de `print $1` e awk.

```bash
awk -F':' '{ print $1}' /etc/passwd
```

### Obtendo o ID do Usuário

Usando o comando **id**, podemos obter o ID de qualquer nome de usuário. Cada usuário tem um id atribuído a ele e o usuário é identificado com a ajuda deste id. Por padrão, este id é também o id do grupo do usuário.

```bash
id usuario 
```

### Alterando o ID de um Usuário

o comando **usermod** pode alterar o ID de usuário de um usuário. O usuário com o nome de usuário fornecido será atribuído com o novo ID fornecido no comando e o ID antigo será removido.

```bash
usermod -u novoidusuario usuario
```

### Modificando o ID de Grupo de um Usuário

O comando **usermod** pode alterar o ID de grupo de um usuário e, portanto, pode até ser usado para mover um usuário para um grupo já existente. Isso mudará o ID do grupo do usuário cujo nome de usuário é fornecido e define o ID do grupo como o **novo_id_fornecido** fornecido.

```bash
usermod -g novoidgrupo usuario
```

### Adicionando Usuários aos Grupos de Usuários

É possível visualizar os grupos existentes em seu sistema operacional Linux digitando o seguinte comando:

```bash
# Digite o comando e aperte [tab] duas vezes
groupmod
```

Para adicionar um usuário a um grupo, use o seguinte comando:

```bash
sudo usermod -a -G grupo usuario
```

### Criando um Grupo de Usuários

Vamos entender como criar um grupo. Temos todos os grupos listados no arquivo `/etc/groups`.

Todos os grupos padrão são grupos específicos de contas do sistema e não é recomendado usá-los para contas comuns. A seguir temos sintaxe para criar uma nova conta de grupo

```bash
groupadd programadores
```

O exemplo em cima cria um grupo de programadores com valores padrão, o que é bastante aceitável para a maioria dos administradores de sistemas.

### Modificando um Grupo

Para modificar um grupo, usamos o comando **groupmod**

```bash
groupmod -n novo_grupo antigo_grupo
```

### Deletando um Grupo

Para excluir um grupo existente, tudo que precisamos é o comando **groupdel** e o **nome do grupo**.

```bash
groupdel programadores
```

### Mudando o Nome de Login do Usuário

É possível alterar o nome de login do usuário usando o comando **usermod**. O comando a seguir é usado para alterar o nome de login do usuário. O nome de login antigo do usuário é alterado para o novo nome de login fornecido.

```bash
sudo usermod -l novo_login antigo_login
```

### Alterando o Diretório Home

O comando **usermod** pode ser utilizado também para alterar o diretório inicial. O comando a seguir altera o diretório inicial do usuário cujo nome de usuário é fornecido e define o novo diretório inicial como o diretório cujo caminho é fornecido.

```bash
usermod -d novo_caminho_diretorio_home usuario
```

### Deletando um Usuário

É possível também excluir um nome de usuário. O comando a seguir exclui o usuário cujo nome de usuário é fornecido. Certifique-se de que o usuário não faça parte de um grupo. Se o usuário fizer parte de um grupo, ele não será excluído diretamente, portanto, primeiro teremos que removê-lo do grupo e depois podemos excluí-lo.

```bash
userdel -r gabriel 
```

### /etc/default/useradd

O arquivo `/etc/default/useradd` contém algumas opções padrão do usuário. O comando useradd -D pode ser usado para exibir este arquivo.

```bash
useradd -D 
```

### Finger

O comando **finger** é usado para obter informações dos usuários em uma máquina Linux. É possível usá-lo em máquinas locais e remotas.

A sintaxe `finger` fornece dados sobre todos os usuários logados na máquina remota e local:

```bash
finger 
```

A sintaxe `finger usuário` especifica as informações do usuário.

```bash
finger gabriel 
```