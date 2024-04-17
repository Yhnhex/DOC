%% DESCRIPTION:
% Esta función permite calcular la energía de un fotón a partir de su
% longitud de onda.
%% INPUTS:
% lambda [1x1]: Longitud de onda en m
%% OUTPUTS:
% E [1x1]: Energía de un fotón en J

function E = Energy_from_wave_longitude(lambda)
    h = 6.625e-34;
    c = 3e8;
    E = h*c/lambda;
end
