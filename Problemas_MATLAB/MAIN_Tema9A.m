%% DESCRIPCIÓN:
% Este programa te permite calcular automáticamente todos los tipos de
% ejercicios vistos en el Tema 9-A de DOC. Tiene una estructura de 
% flags que en el caso de que sean verdaderas te ejecuta los ejercicios 
% vistos (selecciónalas según el output que quieras tener, unos inputs que 
% hay que meter a mano, pero sólo importan los que vayan a usar (si tienes 
% un input adicional que no necesitas, no lo toques o coméntalo) y te 
% permite escribir después si el tipo de ejercicio es nuevo o si quieres 
% meter cálculos adicionales.
clc
clear

%% Estructura de flags. RECOMENDABLE una sóla flag activa
% Para obtener un momento de inercia (si quieres las fórmulas, están en el
% interior de las funciones)
flags.Inertia_moment = 0; 

% Para obtener un momento de inercia a través de un eje paralelo a uno
% conocido (teorema de Steiner)
flags.Steiner = 0; 

% Para obtener el ángulo de nutación y la velocidad de precesión de un giro
% con simetría axial a partir de sus momentos de inercia
flags.nutation_angle_precesion_rate_from_inertias_omega_axial_sym = 1;

% Para obtener la evolución temporal de los ángulos y velocidades angulares
% del satélite durante un tiempo en términos de los ángulos de Euler para
% unas condicinoes iniciales
flags.torque_free_motion_equation = 0;

%% Inputs
% Para obtener un momento de inercia (si quieres las fórmulas, están en el
% interior de las funciones). Sólo marcar los que necesites para tu cuerpo
Input.type = []; % Están incluidos: esfera, cilindro, varilla, disco, hexaedro
Input.m = [];
Input.r = [];
Input.h = [];
Input.l = [];
Input.a = [];
Input.b = [];
Input.c = [];

% Para obtener un momento de inercia a través de un eje paralelo a uno
% conocido (teorema de Steiner). Solo poner el valor en UNO de los dos I
% que vienen a continuación y poner 0 en el otro. I_cg es si conoces el
% principal (pasa por el centro de masas) y quieres calcular uno paralelo e
% I_paral es si conoces un momento respecto a un eje paralelo a otro que
% pasa por el centro de masas y quieres conocer el del eje que pasa por el
% centro de masas
Input.I_cg = [];
Input.I_paral = [];
Input.d = [];
Input.m2 = [];

% Para obtener el ángulo de nutación y la velocidad de precesión de un giro
% con simetría axial a partir de sus momentos de inercia. Se supone giro
% sobre el eje Z, si es sobre otro eje se hace igual
Input.I_xy = [100];
Input.I_z = [150];
Input.omega = [0.1, 0.02, 0.5]'; % OJO: Las dos primeras componentes son las velocidades  
% angulares en el plano de simetría y la tercera la del eje de simetría, si
% el eje de simetría no es el Z, cambiar el orden de omega

% Para obtener la evolución temporal de los ángulos y velocidades angulares
% del satélite durante un tiempo en términos de los ángulos de Euler para
% unas condicinoes iniciales
Input.theta = [];
Input.w = [];
Input.tf = [];
% IMPORTANTE: Los momentos de inercia principales y el tipo de rotación de
% los ángulos de Euler se deben modificar dentro de la función diff_eqn3

%% Ejecución de ejercicios estándar
% Para obtener la fuerza de radiación solar a partir del flujo solar, el
% área y la reflectividad
if flags.Inertia_moment == 1
    switch Input.type
        case 'Cilindro'
            [Output.I_x,  Output.I_y, Output.I_z]...
                = Inertia_moment_cylindre(Input.r, Input.h, Input.m);
        case 'Esfera'
            [Output.I_x,  Output.I_y, Output.I_z]...
                = Inertia_moment_sphere(Input.r, Input.m);
        case 'Varilla'
            [Output.I_x,  Output.I_y, Output.I_z]...
                = Inertia_moment_bar(Input.l, Input.m);
        case 'Disco'
            [Output.I_x,  Output.I_y, Output.I_z]...
                = Inertia_moment_cylindre(Input.r, 0, Input.m);
        case 'Hexaedro'
            [Output.I_x,  Output.I_y, Output.I_z]...
                = Inertia_moment_hexahedron(Input.a, Input.b, Input.c,Input.m);
    end
end

if flags.Steiner == 1
    if Input.I_cg == 0
        Output.I_cg = Steiner_inv(Input.I_paral, Input.d, Input.m2);
    else
        if Input.I_paral == 0
            Output.I_paral = Steiner(Input.I_cg, Input.d, Input.m2);
        else
            disp('Poner 0 en el momento de inercia que se quiere calcular')
        end
    end
end


if flags.nutation_angle_precesion_rate_from_inertias_omega_axial_sym == 1
    [h_T, h, Output.gamma] = nutation_angle_from_inertia_omega_ax_sym...
        (Input.I_xy, Input.I_z, Input.omega);
    [Omega_T, Output.Omega_prec] = precession_rate_from_inertia_omega_ax_sym...
        (Input.I_xy, Input.I_z, Input.omega(3),Output.gamma);
    Output.body_type = type_of_body(Input.I_xy, Input.I_z, Output.Omega_prec);
end

if flags.torque_free_motion_equation == 1
    [Output.times, Output.dot_x] = torque_free_motion_equation...
        (Input.theta,Input.w,Input.tf);
end
%% Código adicional para ejercicios no estándar
