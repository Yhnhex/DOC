%% DESCRIPCIÓN:
% Este programa te permite calcular automáticamente todos los tipos de
% ejercicios vistos en el Tema 6 de DOC. Tiene una estructura de flags que
% en el caso de que sean verdaderas te ejecuta los ejercicios vistos 
% (selecciónalas según el output que quieras tener, unos inputs que hay que
% meter a mano, pero sólo importan los que vayan a usar (si tienes un input
% adicional que no necesitas, no lo toques o coméntalo) y te permite 
% escribir después si el tipo de ejercicio es nuevo o si quieres meter 
% cálculos adicionales.

clc
clear

%% Estructura de flags. RECOMENDABLE una sóla flag activa
% Para sacar la matriz de cosenos directores a partir de dos orientaciones
% (de a --> b)
flags.cosine_matrix_from_base_vectors                   = 0;

% Para obtener la matriz skew-simétrica de un vector
flags.skewsymetric_from_vector                          = 0;

% Para sacar la matriz de rotación y/o todos los parámetros de Euler (eje,
% quaternion, ángulo de Euler) a partir de los ángulos de giro 
flags.Euler_parameters_from_angles                      = 0;

% Para obtener la orientación relativa entre dos naves a partir de la
% secuencia de ángulos de giro.
flags.relative_orientation_from_angles                  = 0;

% Para obtener la matriz de rotación y los ángulos de giro a partir del
% ángulo de Euler y el eje principal de giro de Euler.
flags.rotation_matrix_and_angles_from_Euler_parameters  = 1;

%% Inputs
% Para sacar la matriz de cosenos directores a partir de dos orientaciones
% (de a --> b).
Input.a1 = [];
Input.a2 = [];
Input.a3 = [];
Input.b1 = [];
Input.b2 = [];
Input.b3 = [];

% Para obtener la matriz skew-simétrica de un vector.
Input.a = []; 

% Para sacar la matriz de rotación y/o todos los parámetros de Euler (eje,
% quaternion, ángulo de Euler) a partir de los ángulos de giro.
Input.theta1 = [10];
Input.theta2 = [25];
Input.theta3 = [-15];
Input.orden  = ['ZYX'];

% Para obtener la orientación relativa entre dos naves a partir de la
% secuencia de ángulos de giro.
Input.thetaA1 = [30];
Input.thetaA2 = [-45];
Input.thetaA3 = [60];
Input.ordenA  = ['ZYX'];
Input.thetaB1 = [10];
Input.thetaB2 = [25];
Input.thetaB3 = [-15];
Input.ordenB  = ['ZYX'];

% Para obtener la matriz de rotación y los ángulos de giro a partir del
% ángulo de Euler y el eje principal de giro de Euler.
Input.phi = [45];
Input.e = [1/sqrt(3), 1/sqrt(3), 1/sqrt(3)]';

%% Ejecución de ejercicios estándar
% Para sacar la matriz de cosenos directores a partir de dos orientaciones
% (de a --> b).
if flags.cosine_matrix_from_base_vectors == 1
    Output.C = matrix_cos_direct([Input.a1, Input.a2, Input.a3],...
        [Input.b1, Input.b2, Input.b3]);
end

% Para obtener la matriz skew-simétrica de un vector.
if flags.skewsymetric_from_vector == 1
    Output.skew = skew_matrix(Input.a);
end

% Para sacar la matriz de rotación y/o todos los parámetros de Euler (eje,
% quaternion, ángulo de Euler) a partir de los ángulos de giro.
if flags.Euler_parameters_from_angles == 1
    [C, q_vect, q4, phi, e] = Euler_rot(Input.theta1, Input.theta2, Input.theta3, Input.orden);
    Output.rotation_matrix = C;
    Output.quaternion = [q_vect';q4];
    Output.Euler_angle = phi;
    Output.Euler_axis = e;
end

% Para obtener la orientación relativa entre dos naves a partir de la
% secuencia de ángulos de giro.
if flags.relative_orientation_from_angles == 1
    [C_AI, ] = Euler_rot(Input.thetaA1, Input.thetaA2, Input.thetaA3, Input.orden);
    [C_BI, ] = Euler_rot(Input.thetaB1, Input.thetaB2, Input.thetaB3, Input.orden);
    C_AB     = C_AI*C_BI';

    switch Input.orden
        case 'ZYX'
            Output.theta1_rad = atan2(C_AB(2,3),C_AB(3,3));
            Output.theta2_rad = - asin(C_AB(1,3));
            Output.theta3_rad = atan2(C_AB(1,2),C_AB(1,1));
            Output.theta1_deg = rad2deg(Output.theta1_rad);
            Output.theta2_deg = rad2deg(Output.theta2_rad);
            Output.theta3_deg = rad2deg(Output.theta3_rad);
        case 'ZYZ'
            Output.theta1_rad = atan2(C_AB(2,3),C_AB(1,3));
            Output.theta2_rad = - asin(C(3,3));
            Output.theta3_rad = atan2(C_AB(3,2),C_AB(3,1));
            Output.theta1_deg = rad2deg(Output.theta1_rad);
            Output.theta2_deg = rad2deg(Output.theta2_rad);
            Output.theta3_deg = rad2deg(Output.theta3_rad);
        case 'ZXZ'
            Output.theta1_rad = atan2(C_AB(1,3),C_AB(2,3));
            Output.theta2_rad = acos(C(3,3));
            Output.theta3_rad = - atan2(C_AB(3,1),C_AB(3,2));
            Output.theta1_deg = rad2deg(Output.theta1_rad);
            Output.theta2_deg = rad2deg(Output.theta2_rad);
            Output.theta3_deg = rad2deg(Output.theta3_rad);
        otherwise
            disp('Secuencia de ángulos no registrada')
    end
end
    
% Para obtener la matriz de rotación y los ángulos de giro a partir del
% ángulo de Euler y el eje principal de giro de Euler.
if flags.rotation_matrix_and_angles_from_Euler_parameters == 1
    [Output.C, Output.theta1, Output.theta2, Output.theta3]...
        = phi_e_to_C(Input.phi, Input.e);
end

%% Código adicional para ejercicios no estándar
