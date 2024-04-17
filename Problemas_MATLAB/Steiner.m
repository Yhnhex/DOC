%% DESCRIPCIÓN:
% Esta función permite calcular el momento de inercia en un eje paralelo al
% eje principal del sólido dado a través de la aplicación del teorema de
% Steiner.
%% INPUTS:
% I_cg [1x1]: Momento de inercia que pasa por el centro de masas del
% cuerpo, en kg*m^2
% d [1x1]: Distancia entre los dos ejes paralelos, en m
% m [1x1]: Masa del cuerpo, en kg
%% OUTPUTS:
% I_paral [1x1]: Momento de inercia que pasa por el eje paralelo

function I_paral = Steiner(I_cg, d, m)
    I_paral = I_cg + m*d^2;
end
