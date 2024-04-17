%% DESCRIPCIÓN:
% Esta función permite calcular los momentos de inercia principales de un
% hexaedro a partir de la longitud de sus lados y su masa (debe ser 
% distribuida uniformemente).
%% INPUTS:
% a [1x1]: Lado x del hexaedro, en m
% b [1x1]: Lado y del hexaedro, en m
% c [1x1]: Lado z del hexaedro, en m
% m [1x1]: Masa del cilindro, en kg
%% OUTPUTS:
% I_x [1x1]: Momento de inercia en el eje principal x del hexaedro
% (dirección paralela al lado de longitud a desde su centro de masas)
% I_y [1x1]: Momento de inercia en el eje principal y del cilindro
% (dirección paralela al lado de longitud b desde su centro de masas)
% I_z [1x1]: Momento de inercia en el eje principal z del cilindro
% (dirección paralela al lado de longitud c desde su centro de masas)

function [I_x, I_y,I_z] = Inertia_moment_hexahedron(a, b, c, m)
    I_x = 1/12 * m * (b^2 + c^2);
    I_y = 1/12 * m * (a^2 + c^2);
    I_z = 1/12 * m * (b^2 + a^2);
end