%% DESCRIPCIÓN:
% Este programa te permite calcular automáticamente todos los tipos de
% ejercicios vistos en el Tema 10 de DOC. Tiene una estructura de flags que
% en el caso de que sean verdaderas te ejecuta los ejercicios vistos 
% (selecciónalas según el output que quieras tener, unos inputs que hay que
% meter a mano, pero sólo importan los que vayan a usar (si tienes un input
% adicional que no necesitas, no lo toques o coméntalo) y te permite 
% escribir después si el tipo de ejercicio es nuevo o si quieres meter 
% cálculos adicionales.

clc
clear

%% Estructura de flags. RECOMENDABLE una sóla flag activa
% Para obtener los parámetros de la ley de control proporcional derivativa
% a partir del coeficiente de overshoot y el tiempo de establecimiento
flags.Kp_Kd_from_Mp_ts = 0;

% Para obtener los parámetros de sistemas subamortiguados a partir de los
% coeficientes de la ley de control proporcional derivativa
flags.Mp_ts_from_Kp_Kd = 1;


%% Inputs
% Para obtener los parámetros de la ley de control proporcional derivativa
% a partir del coeficiente de overshoot y el tiempo de establecimiento
Input.Mp = 0.2; % OJO: En tanto por uno
Input.ts = 60;
Input.I = 1;

% Para obtener los parámetros de sistemas subamortiguados a partir de los
% coeficientes de la ley de control proporcional derivativa
Input.Kp = 0.1;
Input.Kd = 0.5;
Input.I = 10;

%% Ejecución de ejercicios estándar
% Para obtener los parámetros de la ley de control proporcional derivativa
% a partir del coeficiente de overshoot y el tiempo de establecimiento
if flags.Kp_Kd_from_Mp_ts == 1
    phi = phi_from_Mp(Input.Mp);
    wn = wn_from_ts_phi(Input.ts, phi);
    [Output.Kp, Output.Kd] = Kp_Kd_from_wn_phi(wn,phi,Input.I);
end

% Para obtener los parámetros de sistemas subamortiguados a partir de los
% coeficientes de la ley de control proporcional derivativa
if flags.Mp_ts_from_Kp_Kd == 1
   [wn,phi] = wn_phi_from_Kp_Kd(Input.Kp, Input.Kd, Input.I);
   Output.ts = ts_from_wn_phi(wn,phi);
   Output.Mp = Mp_from_phi(phi); %OJO: En tanto por uno 
   [Output.tr,wd,beta] = tr_from_wn_phi(wn,phi);
   Output.tp = pi/wd;
end

%% Código adicional para ejercicios no estándar