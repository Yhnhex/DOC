%% DESCRIPCIÓN:
% Esta función permite calcular los momentos de inercia principales de un
% cilindro a partir de su radio, su altura y su masa (debe ser distribuida
% uniformemente).
%% INPUTS:
% r [1x1]: Radio de la base del cilindro, en m
% h [1x1]: Altura del cilindro, en m
% m [1x1]: Masa del cilindro, en kg
%% OUTPUTS:
% I_x [1x1]: Momento de inercia en el eje principal x del cilindro
% (cualquier dirección en el plano de la base desde su centro de masas)
% I_y [1x1]: Momento de inercia en el eje principal y del cilindro
% (cualquier dirección en el plano de la base desde su centro de masas)
% I_z [1x1]: Momento de inercia en el eje principal z del cilindro
% (perpendicular a la base desde el centro de masas)

function [I_x, I_y,I_z] = Inertia_moment_cylindre(r, h, m)
    I_x = 1/12 * m * (3*r^2 + h^2);
    I_y = I_x;
    I_z = 1/2 * m * r^2;
end