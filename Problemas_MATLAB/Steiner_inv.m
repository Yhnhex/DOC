%% DESCRIPCIÓN:
% Esta función permite calcular el momento de inercia en un eje principal 
% del sólido conociendo el momento en un eje paralelo al principal del 
% sólido a través de la aplicación del teorema de Steiner.
%% INPUTS:
% I_paral [1x1]: Momento de inercia respecto a un eje paralelo a uno que 
% pasa por el centro de masas del cuerpo, en kg*m^2
% d [1x1]: Distancia entre los dos ejes paralelos, en m
% m [1x1]: Masa del cuerpo, en kg
%% OUTPUTS:
% I_cg [1x1]: Momento de inercia respecto a un eje que pasa por el centro 
% de masas y es paralelo al conocido 

function I_cg = Steiner_inv(I_paral, d, m)
    I_cg = I_paral - m*d^2;
end
