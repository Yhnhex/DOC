%% DESCRIPCIÓN:
% Este programa te permite calcular automáticamente todos los tipos de
% ejercicios vistos en el Tema 8 de DOC. Tiene una estructura de flags que
% en el caso de que sean verdaderas te ejecuta los ejercicios vistos 
% (selecciónalas según el output que quieras tener, unos inputs que hay que
% meter a mano, pero sólo importan los que vayan a usar (si tienes un input
% adicional que no necesitas, no lo toques o coméntalo) y te permite 
% escribir después si el tipo de ejercicio es nuevo o si quieres meter 
% cálculos adicionales.

clc
clear

%% Estructura de flags. RECOMENDABLE una sóla flag activa
% Para obtener una matriz de rotación a partir de una matriz de inercia
flags.rotation_matrix_from_inertia_matrix = 1;

% Para obtener la matriz de inercia en ejes principales (diagonal)
flags.inertia_matrix_principal_axis_from_inertia_matrix = 0;


%% Inputs
% Para obtener una matriz de rotación a partir de una matriz de inercia
Input.inertia_matrix = [1500 , 0   , -1000;
                        0    , 2700, 0    ;
                        -1000, 0   , 3000];

% Para obtener la matriz de inercia en ejes principales (diagonal)
Input.inertia_matrix_non_principal = [];

%% Ejecución de ejercicios estándar
if flags.rotation_matrix_from_inertia_matrix == 1
    [eigenvectors,eigenvalues] = eig(Input.inertia_matrix);
    
    Output.inertia_matrix_principal = eigenvalues;
    Output.rotation_matrix          = eigenvectors;
end

if flags.inertia_matrix_principal_axis_from_inertia_matrix == 1
    [eigenvectors,eigenvalues] = eig(Input.inertia_matrix_non_principal);
    
    Output.inertia_matrix_principal = eigenvalues;
    Output.rotation_matrix          = eigenvectors;
end

%% Código adicional para ejercicios no estándar