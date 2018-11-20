close all
clear
clc

%parâmetros do robô;
Kr3init;

%exemplos de posicionamentos
%pose = [-40 -30 50 -45 10 0];
pose = [90 45 20 -50 30 10];


%obtenção da matriz de posição pela cinematica direta
Cinematica_Direta = Kr3fk(pose)


%calculo das juntas do motor pela cinematica inversa
Cinematica_Inversa = Kr3ik(Cinematica_Direta)

%Calcula a velocidade das juntas.
Velocidade_Juntas = Kr3ij(pose) 

%Calcula a velocidade no efetuador
Velocidade_Efetuador = Kr3fj(Velocidade_Juntas)

