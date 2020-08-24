# Função para rolar um dado simulado
# n -> número de lados
function dado(n) { return 1 + int(rand() * n) }

# Rolamos 2 vezes um dado de 6 lados
# Imprimos a soma de pontos
BEGIN { print dado(6) + dado(6) } 
