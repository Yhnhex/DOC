%% DESCRIPCIÓN:
% Esta función permite obtener la matriz de rotación y los ángulos de giro
% asociados a un ángulo de Euler y a un eje principal de rotación de Euler
% dados. 
%% INPUTS:
% phi [1x1]: Ángulo de Euler de la rotación.
% e [3x1]: Eje principal de Euler de la rotación.
%% OUTPUTS:
% C [3x3]: Matriz de rotación asociada.
% theta_1 [1x1]: Valor en grados del primer ángulo de giro.
% theta_2 [1x1]: Valor en grados del segundo ángulo de giro.
% theta_3 [1x1]: Valor en grados del tercer ángulo de giro.


function [C, theta1, theta2, theta3] = phi_e_to_C(phi, e)

    e_skew = skew_matrix(e);

    C = cosd(phi)*eye(3) + (1-cosd(phi))*e*e' - sind(phi)*e_skew;
    

    [theta1, theta2, theta3] = dcm2angle(C); % Se obtienen los angulos según 
                                               % el orden de rotacion
    
    theta1 = rad2deg(theta1);
    theta2 = rad2deg(theta2);
    theta3 = rad2deg(theta3);

end