function [jacobiano, velocidadelinear, velocidadeangular ]= Kr3ij2(theta)
%essa função retorna jacobiano velocidade linear e angular do robô a partir
%da posição das juntas na matriz q
i= sym('i');
j= sym('j');
k= sym('k');



%transforma entrada em radianos
conv = pi/180;

t1 = theta(1)*conv;
t2 = theta(2)*conv;
t3 = theta(3)*conv;
t4 = theta(4)*conv;
t5 = theta(5)*conv;
t6 = theta(6)*conv;

q=[t1; 
t2;
t3;
t4;
t5;
t6];
%puxa os parametros do robo:
Kr3init;


%calculo da postura pelas matrizes de Denavit-Hartenberg

A0 = [ 1 0 0 0;
    0 1 0 0;
    0 0 1 0;
    0 0 0 1];


A1 = [cos(t1) 0 sin(t1) a1*cos(t1);
      sin(t1) 0 -cos(t1) a1*sin(t1);
      0 1 0 d1;
      0 0 0 1];
A2 = [cos(t2) -sin(t2) 0 a2*cos(t2);
      sin(t2) cos(t2) 0 a2*sin(t2);
      0 0 1 0;
      0 0 0 1];
A3 = [cos(t3-pi/2) 0 sin(t3-pi/2) a3*cos(t3-pi/2);
      sin(t3-pi/2) 0 -cos(t3-pi/2) a3*sin(t3-pi/2);
      0 1 0 0;
      0 0 0 1];
A4 = [cos(t4) 0 -sin(t4) 0;
      sin(t4) 0 cos(t4) 0;
      0 -1 0 d4;
      0 0 0 1];
A5 = [cos(t5) 0 sin(t5) 0;
      sin(t5) 0 -cos(t5) 0;
      0 1 0 0;
      0 0 0 1];
A6 = [cos(t6) -sin(t6) 0 0;
      sin(t6) cos(t6) 0 0;
      0 0 1 d6;
      0 0 0 1];


  
J1=[i j k; A0(9) A0(10) A0(11); A6(13)-A0(13) A6(14)-A0(14) A6(15)-A0(15)]; 
J2=[i j k; A1(9) A1(10) A1(11); A6(13)-A1(13) A6(14)-A1(14) A6(15)-A1(15)];
J3=[i j k; A2(9) A2(10) A2(11); A6(13)-A2(13) A6(14)-A2(14) A6(15)-A2(15)];
J4=[i j k; A3(9) A3(10) A3(11); A6(13)-A3(13) A6(14)-A3(14) A6(15)-A3(15)];
J5=[i j k; A4(9) A4(10) A4(11); A6(13)-A4(13) A6(14)-A4(14) A6(15)-A4(15)];
J6=[i j k; A5(9) A5(10) A5(11); A6(13)-A5(13) A6(14)-A5(14) A6(15)-A5(15)];

        
        Jv1= det(J1);
        Jv2= det(J2);
        Jv3= det(J3);
        Jv4= det(J4);
        Jv5= det(J5);
        Jv6= det(J6);
       




Jvv1= [0; 0 ;0];
Jvv2= [ - 150*cos(t1); - 150*sin(t1) ; (- 20*cos(t1)^2-20*sin(t1)^2)];
Jvv3= [ 260*sin(t2); - 260*cos(t2); 0 ];
Jvv4= [ 195*cos(t3 - pi/2) ; + 195*sin(t3 - pi/2) ;(-20*sin(t3 - pi/2)^2 - 20*cos(t3 - pi/2)^2) ];
Jvv5= [ 65*cos(t4) ;+ 65*sin(t4); 0];
Jvv6= [ 195*cos(t5) ;+ 195*sin(t5); 0];

Jv = [ Jvv1 Jvv2 Jvv3 Jvv4 Jvv5 Jvv6];

Jw = [A0(9) A1(9) A2(9) A3(9) A4(9) A5(9); A0(10) A1(10) A2(10) A3(10) A4(10) A5(10); A0(11) A1(11) A2(11) A3(11) A4(11) A5(11)];

jacobiano= [Jv; Jw];

velocidadeangular = Jw*q

velocidadelinear = Jv*q

