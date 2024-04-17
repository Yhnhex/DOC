%% DESCRIPCIÓN:
% Esta función integra y obtiene la evolución de los 3 ángulos de Euler con
% una cierta velocidad angular a lo largo del tiempo con unas condiciones
% iniciales determinadas que se deben dar previamente.

function dot_angles = diff_eqn(time, angles)
theta1 = angles(1);
theta2 = angles(2);
theta3 = angles(3);

%% IMPORTANTE: Parámetros a cambiar
w = [sin(0.1*time); 0.01; cos(0.1*time)]*deg2rad(5);
rotation_type = 'ZYX';

switch rotation_type
    case 'ZYX'
        dot_angles = 1/cos(theta2)*[cos(theta2), sin(theta1)*sin(theta2), cos(theta1)*sin(theta2) ;
                                    0          , cos(theta1)*cos(theta2), -sin(theta1)*cos(theta2);
                                    0          , sin(theta1)            , cos(theta1)              ]*w;
    case 'ZXZ' % theta3 = mu en las diapos
        dot_angles = 1/cos(theta2)*[sin(theta3)             , cos(theta3),              0         ;
                                    cos(theta3)*sin(theta2) , -sin(theta3)*sin(theta2), 0         ;
                                    -cos(theta2)*sin(theta3), -cos(theta3)*sin(theta2), sin(theta2)]*w;
end

end