%% DESCRIPCIÓN:
% Esta función comprueba si un cuerpo es estable ante el gradiente
% gravitatorio a partir del valor de sus momentos de inercia. Básicamente,
% comprueba si se cumple la condición I2 >= I1 >= I3 (>= significa mayor o
% igual que), en cuyo caso el satélite es estable. Si no se cumple, será
% inestable.
%% INPUTS:
% I1 [1x1]: Momento de inercia respecto al eje X principal de inercia.
% I2 [1x1]: Momento de inercia respecto al eje Y principal de inercia.
% I3 [1x1]: Momento de inercia respecto al eje Z principal de inercia.
%% OUTPUTS:
% stable [string]: String que indica si el satélite es estable o no estable 

function stable = check_stability(I1, I2, I3)
if I1 > I2
    disp('No estable, I_2 < I_1')
    stable = 'No estable';
else
    if I3 > I1
        disp('No estable, I_1 < I_3')
        stable = 'No estable';
    else
        disp('Estable, I_2 >= I_1 >= I_3 ')
        stable = 'Estable';
    end
end
end