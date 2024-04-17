%% DESCRIPCIÓN:
% Esta función permite calcular los momentos de inercia principales de una
% esdera a partir de su radio y su masa (debe ser distribuida uniformemente).
%% INPUTS:
% r [1x1]: Radio de la esfera, en m
% m [1x1]: Masa de la esfera, en kg
%% OUTPUTS:
% I_x [1x1]: Momento de inercia en el eje principal x de la esfera
% (cualquier dirección desde su centro)
% I_y [1x1]: Momento de inercia en el eje principal y de la esfera
% (cualquier dirección desde su centro)
% I_z [1x1]: Momento de inercia en el eje principal z de la esfera
% (cualquier dirección desde su centro)

function [I_x, I_y,I_z] = Inertia_moment_sphere(r, m)
    I_x = 2/5 * m * r^2;
    I_y = I_x;
    I_z = I_x;
end