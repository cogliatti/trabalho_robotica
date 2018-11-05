function theta = Kr3ik(postura)

%puxa os parametros do robo:
Kr3init;


ot = postura;

%calcula posição do punho

ow = ot(1:3,4)-ot(1:3,1:3)*[0 0 d6]';

%encontra theta 1

t(1,1)=atan2(ow(2,1),ow(1,1));

%distancia entre a junta 2 e o punho em z
rz = -ow(3,1)-(-d1);

%modulo da distancia no plano xy da junta 2 ate o punho
rx = sqrt(ow(2,1)^2+ow(1,1)^2)-a1;

%moduo da distancia rz-rx
R = sqrt(rz^2+rx^2);

%modulo da distancia formada pelo ofset na junta 3
a = sqrt(a2^2+a3^2);

%por geometria theta 2
t(2,1) = -(atan2(rz,rx)+acos((a2^2+R^2-a^2)/(2*a2*R)));

%por geometria theta 3
t(3,1) = pi-acos((a2^2+a^2-R^2)/(a2*a*2))+tan(a3/a2);

%calculo da postura de 0 a 3
A1 = [cos(t(1,1)) 0 sin(t(1,1)) a1*cos(t(1,1));
      sin(t(1,1)) 0 -cos(t(1,1)) a1*sin(t(1,1));
      0 1 0 d1;
      0 0 0 1];
A2 = [cos(t(2,1)) -sin(t(2,1)) 0 a2*cos(t(2,1));
      sin(t(2,1)) cos(t(2,1)) 0 a2*sin(t(2,1));
      0 0 1 0;
      0 0 0 1];
A3 = [cos(t(3,1)-pi/2) 0 sin(t(3,1)-pi/2) a3*cos(t(3,1)-pi/2);
      sin(t(3,1)-pi/2) 0 -cos(t(3,1)-pi/2) a3*sin(t(3,1)-pi/2);
      0 1 0 0;
      0 0 0 1];

r03=A1*A2*A3;

%matriz de rotação do punho para ferramenta
r36 = r03(1:3,1:3)'*(ot(1:3,1:3));

%obtenção de theta 4, 5 e 6 consecutivamente
t(4,1) = atan2(r36(2,3),r36(1,3));
t(5,1) = atan2(sqrt(r36(1,3)^2+r36(2,3)^2),r36(3,3));
t(6,1) = atan2(r36(3,2),-r36(3,1));

%retorna thea em graus
theta = (180/pi.*t)';