%% DESCRIPCIÓN:
% Esta función integra y obtiene la evolución de los 4 parámetros del
% quaternion con una cierta velocidad angular a lo largo del tiempo con 
% unas condiciones iniciales determinadas que se deben dar previamente.

function dot_q = diff_eqn_2(time, q)

w = [sin(0.1*time); 0.01; cos(0.1*time); 0.0]*deg2rad(50);

w1 = w(1);
w2 = w(2);
w3 = w(3);
w4 = w(4);

dot_q = 0.5* [ 0  , w3 , -w2, w1;
               -w3, 0  , w1 , w2;
               w2 , -w1, 0  , w3;
               -w1, -w2, -w3, 0  ]*q;

end