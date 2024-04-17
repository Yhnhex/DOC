%% DESCRIPCIÓN:
% Esta función permite calcular el ángulo de nutación a partir de los
% momentos de inercia y la velocidad angular de un cuerpo girando con 
% simetría axial. También devuelve los momentos angulares en el plano de
% simetría y total.
%% INPUTS:
% I_xy [1x1]: Momento de inercia en el plano de simetría axial
% I_z [1x1]: Momento de inercia en el eje de simetría axial
% omega [3x1]: Vector cuyas componentes son las componentes de la velocidad
% angular dada. OJO: Las dos primeras componentes son las velocidades  
% angulares en el plano de simetría y la tercera la del eje de simetría, si
% el eje de simetría no es el Z, cambiar el orden de omega
%% OUTPUTS:
% h_T [1x1]: Momento angular en el plano de simetría
% h [1x1]: Momento angular total
% gamma [1x1]: Ánuglo de precesión, en grados

function [h_T, h, gamma] = nutation_angle_from_inertia_omega_ax_sym(I_xy, I_z, omega)
    h_T = sqrt((I_xy*omega(1))^2 + (I_xy*omega(2))^2);
    h = sqrt((I_xy*omega(1))^2 + (I_xy*omega(2))^2 + (I_z*omega(3))^2);
    gamma = rad2deg(asin(h_T/h));
end
