# Informações do Sistema

Existem diversos comandos que podem nos trazer informações úteis sobre o sistema que estamos operando.

Para saber apenas o **nome do sistema**, você pode usar o comando **uname** sem nenhuma opção:

```bash
uname # Linux
```

Para visualizar o nome do host da sua rede, use a opção **'-n'** com o comando **uname**:

```bash
uname -n # akira
```

Para obter informações sobre o kernel, usamos a opção **'-v'**:

```bash
uname -v 
# #46~18.04.1-Ubuntu SMP Fri Jul 10 07:21:24 UTC 2020
```

Para obter as informações sobre a versão do seu kernel, use a opção **'-r'**:

```bash
uname -r
# 5.4.0-42-generic
```

Para imprimir o nome do hardware da sua máquina, use a opção **'-m'**:

```bash
uname -m
# x86_64
```

Todas essas informações podem ser impressas de uma só vez utilizando a opção **'-a'**:

```bash
uname -a 
# Linux akira 5.4.0-42-generic #46~18.04.1-Ubuntu SMP Fri Jul 10 07:21:24 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
```