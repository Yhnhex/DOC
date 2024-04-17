%% DESCRIPCIÓN:
% Esta función obtiene y plotea los resultados para la evolución de la
% ecuación del movimiento sin torque aplicado para unas condiciones
% iniciales de ángulo y velocidad angular y un tiempo determinado.
% IMPORTANTE: Las inercias principales se deben dar dentro de la función
% diff_eqn3.
%% INPUTS:
% theta [3x1]: Vector con los ángulos iniciales, en radianes
% w [3x1]: Vector con las componentes de la velocidad angular inicial en rad/s
% tf [1x1]: Tiempo final, en s
%% OUTPUTS:
% time [nx1]: Vector de tiempos
% dot_x [nx6]: Matriz con la evolución temporal de los ángulos y la
% velocidad angular por filas

function [time, dot_x] = torque_free_motion_equation(theta, w, tf)
theta1 = theta(1);
theta2 = theta(2);
theta3 = theta(3);
w1 = w(1);
w2 = w(2);
w3 = w(3);

[time, dot_x] = ode45(@diff_eqn3, [0,tf], [theta1,theta2,theta3,w1,w2,w3],odeset('RelTol',1e-6));

subplot(231);plot(time,rad2deg(dot_x(:,1)));grid;title('Angles \theta1 [deg] vs time')
subplot(232);plot(time,rad2deg(dot_x(:,2)));grid;title('Angles \theta2 [deg] vs time')
subplot(233);plot(time,rad2deg(dot_x(:,3)));grid;title('Angles \theta3 [deg] vs time')
subplot(234);plot(time,dot_x(:,4));grid;title('w1 [rad/s] vs time')
subplot(235);plot(time,dot_x(:,5));grid;title('w2 [rad/s] vs time')
subplot(236);plot(time,dot_x(:,6));grid;title('w3 [rad/s] vs time')

end