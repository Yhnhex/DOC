%% DESCRIPCIÓN:
% Esta función obtiene las dos condiciones de las cuales el valor del hs
% proporcionado por la rueda debe cumplir una para que el satélite sea
% pasivamente estable en el caso de que se esté girando alrededor de uno de
% los ejes principales de inercia con una perturbación pequeña alrededor de
% los tres ejes.
%% INPUTS:
% I1 [1x1]: Momento de inercia respecto del eje principal de inercia X
% I2 [1x1]: Momento de inercia respecto del eje principal de inercia Y
% I3 [1x1]: Momento de inercia respecto del eje principal de inercia Z
% axis_gyro [string]: String que indica sobre qué eje gira el satélite
% w_axis_gyro [1x1]: Valor nominal de la velocidad angular del satélite
%% OUTPUTS:
% first_condition [string]: String que indica la primera condición que debe
% cumplir el momento angular hs para ser estable. Indica respecto de qué
% valor debe ser mayor el momento angular para ser estable.
% second_condition [string]: String que indica la segunda condición que debe
% cumplir el momento angular hs para ser estable. Indica respecto de qué
% valor debe ser menor el momento angular para ser estable.
% hs_limits [2x1]: Expresa numéricamente los límites indicados en las
% condiciones anteriores.

function [first_condition, second_condition, hs_limits] = ...
    hs_limits(I1, I2, I3, axis_gyro, w_axis_gyro)
    switch axis_gyro
        case 'X'
            hs_limits(1) = w_axis_gyro*(I3 - I2);
            hs_limits(2) = w_axis_gyro*(I3 - I1);
            mayor = max(hs_limits(1),hs_limits(2));
            menor = min(hs_limits(1),hs_limits(2));
            first_condition = strcat('hs debe ser mayor que ',num2str(mayor), 'Nms');
            second_condition = strcat('hs debe ser menor que ',num2str(menor), 'Nms');
        case 'Y'
            hs_limits(1) = w_axis_gyro*(I3 - I2);
            hs_limits(2) = w_axis_gyro*(I3 - I1);
            mayor = max(hs_limits(1),hs_limits(2));
            menor = min(hs_limits(1),hs_limits(2));
            first_condition = strcat('hs debe ser mayor que ',num2str(mayor), 'Nms');
            second_condition = strcat('hs debe ser menor que ',num2str(menor), 'Nms');
        case 'Z'
            hs_limits(1) = w_axis_gyro*(I2 - I3);
            hs_limits(2) = w_axis_gyro*(I1 - I3);
            mayor = max(hs_limits(1),hs_limits(2));
            menor = min(hs_limits(1),hs_limits(2));
            first_condition = strcat('hs debe ser mayor que ',mayor, 'Nms');
            second_condition = strcat('hs debe ser menor que ',menor, 'Nms');
        otherwise
            disp('Input.axis wheel incorrecto')
    end
end