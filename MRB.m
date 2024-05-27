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
%hello does it work?


% motion plannning for theta angle from 0 to 360 degrees in 10 seconds
% Jerome Jouffroy, January 2024


%------------------
% motion planning.
%------------------
T = 5; % horizon time
% intial conditions
theta0 = 0;
theta_dot0 = 0;
theta_ddot0 = 0;

% final conditions
thetaT = 45;
theta_dotT = 0;
theta_ddotT = 0;

% calculations polynomial coefficients
alpha_vect = poly5traj([theta0;theta_dot0;theta_ddot0],[thetaT;theta_dotT;theta_ddotT],T);
%alpha_vect = poly3traj([theta0; theta_dot0], [thetaT; theta_dotT], T);

