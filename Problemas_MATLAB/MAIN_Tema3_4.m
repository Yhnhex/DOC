%% DESCRIPCIÓN:
% Este programa te permite calcular automáticamente todos los tipos de
% ejercicios vistos en los Temas 3 y 4 de DOC. Tiene una estructura de 
% flags que en el caso de que sean verdaderas te ejecuta los ejercicios 
% vistos (selecciónalas según el output que quieras tener, unos inputs que 
% hay que meter a mano, pero sólo importan los que vayan a usar (si tienes 
% un input adicional que no necesitas, no lo toques o coméntalo) y te 
% permite escribir después si el tipo de ejercicio es nuevo o si quieres 
% meter cálculos adicionales.
clc
clear

%% Estructura de flags. RECOMENDABLE una sóla flag activa
% Para obtener la fuerza de radiación solar a partir del flujo solar, el
% área y la reflectividad
flags.Frad_from_Solar_flux_A_q = 1;

% Para obtener el semieje mayor de una órbita a partir de su período
flags.a_from_T = 0;

% Para obtener el tiempo de viaje a partir de las distancias al Sol inicial
% y final, la masa y el área de una vela solar
flags.t_Solar_sail = 0;

%% Inputs
% Para obtener los parámetros de una órbita a partir de su radio de apoaxis
% y su radio de periaxis
Input.Solar_flux = [];
Input.A = [];
Input.q = []; 

% Para obtener el semieje mayor de una órbita a partir de su período
Input.T = [];
Input.mu = [];

% Para obtener el tiempo de viaje a partir de las distancias al Sol inicial
% y final, la masa y el área de una vela solar
Input.ri = [];
Input.rf = [];
Input.mu = [];
Input.q2 = [];
Input.A2 = [];
Input.v0 = [];

%% Ejecución de ejercicios estándar
% Para obtener la fuerza de radiación solar a partir del flujo solar, el
% área y la reflectividad
if flags.Frad_from_Solar_flux_A_q == 1
    Output.Frad = Frad_from_Flux_q_A(Input.Solar_flux, Input.q, Input.A);
    Output.distance_Sun = distance_Sun_fron_Flux(Input.Flux);
end

if flags.a_from_T == 1
    a = SMA_from_T(Input.T, Input.mu);
end

if flags.t_Solar_sail == 1
    Flux_i = Solar_Flux_fron_distance_Sun(Input.ri);
    Frad_i = Frad_from_Flux_q_A(Flux_i, Input.q2, Input.A);
    [a_i,Output.t_i] = time_from_force(Frad_i, Input.m, Input.rf - Input.ri, 0);
    % NOTA: En el problema de clase, coge únicamente los valores iniciales.
    % Incluyo también el resultado de hacerlo con una media entre los
    % valores de fuerza inicial y final
    Flux_f = Solar_Flux_fron_distance_Sun(Input.rf);
    Frad_f = Frad_from_Flux_q_A(Flux_f, Input.q2, Input.A);
    Frad_med = (Frad_i + Frad_f)/2;
    [a_med,Output.t_med] = time_from_force(Frad_med, Input.m, Input.rf - Input.ri, 0);
end
%% Código adicional para ejercicios no estándar