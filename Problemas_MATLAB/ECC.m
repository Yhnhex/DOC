%% DESCRIPCIÓN:
% Esta función permite obtener la excentricidad a partir del radio del
% perigeo y del radio del apogeo de la órbita. Rp y Ra deben ir en las
% mismas unidades
%% INPUTS:
% Rp [1x1]: Radio del apogeo
% Ra [1x1]: Radio del afelio.
%% OUTPUTS:
% e [1x1]: Excentricidad de la órbita.

function e = ECC(Rp, Ra) % OJO, llama a SMA_r
syms e
    f1 = Rp == (SMA_r(Rp,Ra)*(1- e^2) / (1 + e));
    e = double(solve(f1,e));
end
