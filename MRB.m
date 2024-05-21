m =4;
l =1;

%If the motors are 1m distance from the center we have:
%x_i=y_i=l, z_i=0 
%sum[4__i=1] = 0^2+l^2+0^2+(-l)^2
Ixx = l^2 + (-l)^2;
Iyy = Ixx;
Izz = l^2 + (-l)^2 + l^2 + (-l)^2;

Ic = [Ixx,0,0;0,Iyy,0;0,0,Izz];

Mrb =[m*eye(3),zeros(3);zeros(3),Ic];
test =0; 
g = 9.81;