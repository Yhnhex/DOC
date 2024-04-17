%% DESCRIPCIÓN:
% Este programa te permite calcular automáticamente todos los tipos de
% ejercicios vistos en el Tema 2 de DOC. Tiene una estructura de flags que
% en el caso de que sean verdaderas te ejecuta los ejercicios vistos 
% (selecciónalas según el output que quieras tener, unos inputs que hay que
% meter a mano, pero sólo importan los que vayan a usar (si tienes un input
% adicional que no necesitas, no lo toques o coméntalo) y te permite 
% escribir después si el tipo de ejercicio es nuevo o si quieres meter 
% cálculos adicionales.
clc
clear

%% Estructura de flags. RECOMENDABLE una sóla flag activa
% Para obtener los parámetros de una órbita a partir de su radio de apoaxis
% y su radio de periaxis 
flags.parameters_from_ra_rp = 0;

% Para obtener los parámetros de una órbita a partir de su radio y su
% velocidad en un punto
flags.a_from_r_v = 1;

% Para obtener los parámetros de una órbita SSO y Frozen
flags.SSO_Frozen = 0;

%% Inputs
% Para obtener los parámetros de una órbita a partir de su radio de apoaxis
% y su radio de periaxis
Input.ra = [];
Input.rp = [];
Input.mu = []; % Si es distinta a alguna de las de abajo, comentar esas

% Para obtener los parámetros de una órbita a partir de su radio y su
% velocidad en un punto
Input.r = [];
Input.v = [];
Input.mu = []; % Si es distinta a la de abajo, comentar esa

% Para obtener los parámetros de una órbita SSO y Frozen
Input.sgn = []; % 1 para inclinación Frozen positiva, 0 para negativa 
% (en SSO, 0)
Input.a = [];
Input.mu = [];

%% Ejecución de ejercicios estándar
% Para obtener los parámetros de una órbita a partir de su radio de apoaxis
% y su radio de periaxis
if flags.parameters_from_ra_rp == 1
    Output.a = SMA_r(Input.rp, Input.ra);
    Output.e = ECC(Input.rp,Input.ra);
    Output.vp = V(Input.rp,Output.a,Input.mu);
    Output.va = V(Input.ra,Output.a,Input.mu);
    Output.T = Periodo(Output.a,Input.mu);
end

% Para obtener los parámetros de una órbita a partir de su radio y su
% velocidad en un punto
if flags.a_from_r_v == 1
   Output.a = SMA_from_r_v(Input.r, Input.v, Input.mu);  
end

% Para obtener los parámetros de una órbita SSO y Frozen
if flags.SSO_Frozen == 1
    Output.i = INC_Frozen_Orbit(Input.sgn);
    Output.e = ECC_Frozen_SSO_Orbit(Input.a,Input.mu);
    Output.rp = Input.a*(1-Output.e);
    Output.ra = Input.a*(1+Output.e);
end

%% Código adicional para ejercicios no estándar