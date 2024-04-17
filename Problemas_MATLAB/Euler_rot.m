%% DESCRIPCIÓN:
% Esta función devuelve todos los parámetros asociados a los ángulos de
% Euler a partir de los propios ángulos de Euler y el orden de giro.
%% INPUTS:
% theta_1 [1x1]: Valor en grados del primer ángulo de giro.
% theta_2 [1x1]: Valor en grados del segundo ángulo de giro.
% theta_3 [1x1]: Valor en grados del tercer ángulo de giro.
% orden [string]: Orden de la rotación de los ángulos diciendo los ejes de 
% giro en su orden. Ej: Si la rotación es 3-2-1 --> orden = 'ZYX'.
%% OUTPUTS:
% C [3x3]: Matriz de rotación del giro completo.
% q_vect [3x1]: Parte vectorial del quaternion asociado: q1, q2, q3.
% q4 [1x1]: Parte escalar del quaternion asociado: q4.
% phi [1x1]: Ángulo de Euler de la rotación completa.
% e [3x1]: Eje principal de Euler de la rotación completa. 

function [C, q_vect, q4, phi, e] = Euler_rot(theta1, theta2, theta3, orden)
    % C matrix rotacion 3-2-1.
    
    C = angle2dcm(deg2rad(theta1), deg2rad(theta2), deg2rad(theta3),orden);
    
    q = dcm2quat(C);


    q4 = q(1);
    q_vect = q(2:4);

    phi = acosd( 1/2 * (trace(C)-1) );

    e = 1/(2*sind(phi))* [C(2,3) - C(3,2); C(3,1) - C(1,3); C(1,2) - C(2,1)];

end