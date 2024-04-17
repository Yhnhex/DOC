%% DESCRIPCIÓN:
% Este programa te permite calcular automáticamente todos los tipos de
% ejercicios vistos en el Tema 9-B de DOC. Tiene una estructura de 
% flags que en el caso de que sean verdaderas te ejecuta los ejercicios 
% vistos (selecciónalas según el output que quieras tener, unos inputs que 
% hay que meter a mano, pero sólo importan los que vayan a usar (si tienes 
% un input adicional que no necesitas, no lo toques o coméntalo) y te 
% permite escribir después si el tipo de ejercicio es nuevo o si quieres 
% meter cálculos adicionales.
clc
clear

%% Estructura de flags. RECOMENDABLE una sóla flag activa
% Para comprobar si un satélite es estable para el torque gravitatorio en
% actitud a partir de sus momentos de inercia (en el programa está la
% condición de estabilidad).
flags.check_stability_gravity_gradient = 1;

% Para calcular el torque por gradiente gravitatorio en ejes satélite
flags.gravitational_torque = 0;

% Para calcular el momento angular relativo de una rueda necesario para que
% un satélite sea pasivamente estable sin torques externos aplicados
flags.hs_pasively_stable_torque_free = 0;

%% Inputs
% Para comprobar si un satélite es estable para el torque gravitatorio en
% actitud a partir de sus momentos de inercia
Input.I1 = [];
Input.I2 = [];
Input.I3 = [];

% Para calcular el torque por gradiente gravitatorio en ejes satélite
Input.Ix = [];
Input.Iy = [];
Input.Iz = [];
Input.rotation_type = [];
Input.spacecraft_position = [];
Input.axis_spacecraft_position = []; % Inertial or Body
% Sólo para el caso Inertial
Input.theta1 = [];
Input.theta2 = [];
Input.theta3 = [];
Input.orden = [];

% Para calcular el momento angular relativo de una rueda necesario para que
% un satélite sea pasivamente estable sin torques externos aplicados
Input.I_X = [];
Input.I_Y = [];
Input.I_Z = [];
Input.axis_wheel = []; % X, Y, Z
Input.w_axis_wheel = [];

%% Ejecución de ejercicios estándar
% Para comprobar si un satélite es estable para el torque gravitatorio en
% actitud a partir de sus momentos de inercia (en el programa está la
% condición de estabilidad).
if flags.check_stability_gravity_gradient == 1
    Output.stable = check_stability(Input.I1, Input.I2, Input.I3);
end

if flags.hs_pasively_stable_torque_free == 1
    [Output.first_condition, Output.second_condition, hs_limits] = ...
        hs_limits(Input.I_X, Input.I_Y, Input.I_Z, Input.axis_wheel, Input.w_axis_wheel);
    % NOTA: Se debe cumplir una de las dos condiciones para que el satélite
    % sea estable
end

if flags.gravitational_torque == 1
    switch Input.axis_spacecraft_position
        case 'Inertial'
            [C_IB, q_vect, q4, phi, e] = Euler_rot(Input.theta1,...
                Input.theta2, Input.theta3, Input.orden);
            spacecraft_position_B = C_IB * Input.spacecraft_position;
            Output.grav_torque = gravitatory_torque_from_position_inertia...
                (Input.Ix, Input.Iy, Input.Iz, spacecraft_position_B);
        case 'Body'
            Output.grav_torque = gravitatory_torque_from_position_inertia...
                (Input.Ix, Input.Iy, Input.Iz, Input.spacecraft_position);
        otherwise
            disp('Input axis spacecraft position incorrecto')
    end
end


%% Código adicional para ejercicios no estándar