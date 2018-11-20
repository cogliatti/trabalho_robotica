Pedro Arthur Cogliatti - 2018
Artur Henrique Lauth

UFSC - Blumenau
_________________________________________________________________________________________

Este é o algortimo feito em MATLAB do trabalho de introdução a 
robótica industrial.


Kr3init: inicializa os parâmetros do KUKA KR3 R540.

o Kr3fk: recebe como argumento os ângulos das juntas e calcula a cinemática
direta pelo método de D&H.

o Kr3ik: recebe como argumento a postura do efetuador e calcula a cinemática
inversa. As resposta da cinemática inversa foram escolhidos considerando a 
arquitetura do robô. Logo, as escolhas foram feitas para que seu posicionamento
fique o mais próximo da posição de repouso, assim evitando que ele se contocione
desnecessariamente.


o Kr3fj: recebe como argumento a posição e a velocidade das juntas, e calcula a
velocidade no efetuador.

o Kr3ij: recebe como argumento a posição das juntas e a velocidade do
efetuador, e calcula a velocidade das juntas.

o Example: demonstração de utilização das funções


Todos os arquivos devem estar abertos no MATLAB para funcionar.
 
