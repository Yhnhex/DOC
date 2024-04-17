%% DESCRIPCIÓN: 
% Esta función calcula el semieje mayor de una órbita a partir de los 
% radios de apogeo y perigeo de la órbita.
%% INPUTS: 
% rp [1x1]: Radio del perigeo
% ra [1x1]: Radio del afelio
%% OUPTUS:
% a_r [1x1]: Semieje mayor de la órbita

function a_r = SMA_r(rp, ra)
    a_r = (ra + rp) / 2;
end