%% DESCRIPCIÓN:
% Este programa te permite calcular automáticamente todos los tipos de
% ejercicios vistos en el Tema 7 de DOC. Tiene una estructura de flags que
% en el caso de que sean verdaderas te ejecuta los ejercicios vistos 
% (selecciónalas según el output que quieras tener, unos inputs que hay que
% meter a mano, pero sólo importan los que vayan a usar (si tienes un input
% adicional que no necesitas, no lo toques o coméntalo) y te permite 
% escribir después si el tipo de ejercicio es nuevo o si quieres meter 
% cálculos adicionales.

clc
clear

%% Estructura de flags. RECOMENDABLE una sóla flag activa
% Para obtener una matriz de rotación a partir del método TRIAD
flags.rotation_matrix_from_TRIAD_method = 1;

% Para obtener la evolución de los ángulos a lo largo del tiempo.
flags.angles_evolution = 0;

% Para obtener la evolución del quaternion asociado a lo largo del tiempo
flags.quaternion_evolution = 0;

%% Inputs
% Para obtener una matriz de rotación a partir del método TRIAD
Input.system_a_n_1 = 1/sqrt(2)*[0, -1, 1]';
Input.system_a_n_2 = 1/sqrt(2)*[0, 1, 1]';
Input.system_b_n_1 = [-1, 0, 0]';
Input.system_b_n_2 = [0, 1, 0]';




% Para obtener la evolución de los ángulos a lo largo del tiempo. También
% para obtener la evolución del quaternion asociado a lo largo del tiempo
% IMPORTANTE: Las expresiones de w y qué tipo de rotación es hay que
% meterlas dentro de la función diff_eqn. 
Input.theta0_1 = 40% deg2rad(80);
Input.theta0_2 = 30%deg2rad(30);
Input.theta0_3 = 80%deg2rad(40);
Input.tf = 60; 
Input.omega = 0; % Tienes que introducir la expresión en la función diff_eqn
Input.rotation_type = 'ZYX';


%% Ejecución de ejercicios estándar
% Para obtener una matriz de rotación a partir del método TRIAD
if flags.rotation_matrix_from_TRIAD_method == 1
    Triad_matrix_a = TRIAD(Input.system_a_n_1, Input.system_a_n_2);
    Triad_matrix_b = TRIAD(Input.system_b_n_1, Input.system_b_n_2);
    C_ab = Triad_matrix_a*Triad_matrix_b';  
end

% Para obtener la evolución de los ángulos a lo largo del tiempo
if flags.angles_evolution == 1
    [time,angles] = ode45(@diff_eqn, [0,Input.tf], [Input.theta0_1,Input.theta0_2,Input.theta0_3],...
    odeset('RelTol',1e-4));

    subplot(311);plot(time,rad2deg(angles(:,1)));grid;title('Yaw angle vs time')
    subplot(312);plot(time,rad2deg(angles(:,2)));grid;title('Pitch angle vs time')
    subplot(313);plot(time,rad2deg(angles(:,3)));grid;title('Roll angle vs time')
end

if flags.quaternion_evolution == 1

    [C, q_vec, q4, phi, e] = Euler_rot(Input.theta0_1, Input.theta0_2,...
        Input.theta0_3, Input.rotation_type);

    q_0 = [q_vec,q4];

    [time,q] = ode45(@diff_eqn_2, [0,Input.tf], q_0, odeset('RelTol',1e-4));

    subplot(221);plot(time,q(:,1));grid;title('q_1 vs time')
    subplot(222);plot(time,q(:,2));grid;title('q_2 vs time')
    subplot(223);plot(time,q(:,3));grid;title('q_3 vs time')
    subplot(224);plot(time,q(:,4));grid;title('q_4 vs time')

    figure(2); plot(time, sqrt(q(:,1).^2 + q(:,2).^2 + q(:,3).^2 + q(:,4).^2));...
        grid; title('q module')
end

%% Código adicional para ejercicios no estándar
