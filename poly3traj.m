function alpha_vect = poly3traj(IC, FC, T)

%POLY3TRAJ Computes coefficients of cubic polynomial for trajectory planning.
%   alpha_vect = POLY3TRAJ(IC, FC, T) finds the vector alpha_vect of the 
%   coefficients of a cubic polynomial h(t) of degree 3 (h(t) = a0 + a1*t + a2*t^2 + a3*t^3), 
%   with initial conditions specified in IC and final conditions at time t = T specified in FC.

alpha_vect = zeros(4,1);

% Initial conditions
alpha_vect(1) = IC(1); % a0
alpha_vect(2) = IC(2); % a1

% Solve for a2 and a3 using final conditions
A = [T^2, T^3; 
     2*T, 3*T^2];
B = [FC(1) - (alpha_vect(1) + alpha_vect(2)*T);
     FC(2) - alpha_vect(2)];

%alpha_vect(3:4) = A \ B;
 % Initial conditions
    h0 = IC(1);  % Initial position
    h_dot0 = IC(2);  % Initial velocity

    % Final conditions
    hT = FC(1);  % Final position
    h_dotT = FC(2);  % Final velocity

    % Solve for the coefficients
    A = [1, 0,    0,    0;  % h(0)
         0, 1,    0,    0;  % h'(0)
         1, T,  T^2,  T^3;  % h(T)
         0, 1, 2*T, 3*T^2]; % h'(T)
    B = [h0; h_dot0; hT; h_dotT];
    alpha_vect = A\B;
end
