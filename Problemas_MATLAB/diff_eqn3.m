%% DESCRIPCIÓN:
% Esta función resuelve e integra la ecuación de movimiento sin torque
% aplicado durante un tiempo para unas condiciones iniciales que se deben 
% dar previamente. 

function dot_x = diff_eqn3(time,x)
%% IMPORTANTE: Parámetros a cambiar
I1 = 210;
I2 = 200;
I3 = 118;

% Asignación de condiciones iniciales
theta1 = x(1);
theta2 = x(2);
theta3 = x(3);
w1 = x(4);
w2 = x(5);
w3 = x(6);

dot_w1 = -inv(I1)*(I3-I2)*w2*w3;
dot_w2 = -inv(I2)*(I1-I3)*w1*w3;
dot_w3 = -inv(I3)*(I2-I1)*w1*w2;

rotation_type = 'ZYX';

switch rotation_type
    case 'ZYX'
        dot_angles = 1/cos(theta2)*[cos(theta2), sin(theta1)*sin(theta2), cos(theta1)*sin(theta2) ;
                                    0          , cos(theta1)*cos(theta2), -sin(theta1)*cos(theta2);
                                    0          , sin(theta1)            , cos(theta1)              ]*[w1;w2;w3];
    case 'ZXZ' % theta3 = mu en las diapos
        dot_angles = 1/cos(theta2)*[sin(theta3)             , cos(theta3),              0         ;
                                    cos(theta3)*sin(theta2) , -sin(theta3)*sin(theta2), 0         ;
                                    -cos(theta2)*sin(theta3), -cos(theta3)*sin(theta2), sin(theta2)]*[w1;w2;w3];
end

dot_x = [dot_angles;dot_w1;dot_w2;dot_w3];

end