%% DESCRIPCIÓN:
% Esta función permite calcular los momentos de inercia principales de una
% varilla delgada a partir de su longitud y su masa (debe ser distribuida
% uniformemente). Se asume r~0, si no lo fuera, usar la fórmula del
% cilindro
%% INPUTS:
% r [1x1]: Radio de la base del cilindro, en m
% h [1x1]: Altura del cilindro, en m
% m [1x1]: Masa del cilindro, en kg
%% OUTPUTS:
% I_x [1x1]: Momento de inercia en el eje principal x del cilindro
% (dirección axial, paralela a la varilla)
% I_y [1x1]: Momento de inercia en el eje principal y del cilindro
% (cualquier dirección perpendicular a la varilla)
% I_z [1x1]: Momento de inercia en el eje principal z del cilindro
% (cualquier dirección perpendicular a la varilla)

function [I_x, I_y,I_z] = Inertia_moment_bar(l, m)
    I_x = 0;
    I_y = 1/12 * m * l^2;
    I_z = I_y;
end