%% DESCRIPCIÓN:
% Esta función devuelve la velocidad de rotación total y la velocidad de
% precesión (velocidad a la que el eje de simetría gira alrededor de la
% dirección fija de inercia) de un cuerpo girando con simetría axial.
%% INPUTS:
% I_T [1x1]: Momento de inercia en el plano de simetría axial
% I_z [1x1]: Momento de inercia en el eje de simetría axial
% omega [1x1]: Velocidad angular en la dirección del eje de simetría
% gamma [1x1]: Ángulo de nutación, en grados
%% OUTPUTS:
% Omega_T [1x1]: Velocidad de rotación total, en rad/s
% Omega_prec [1x1]: Velocidad de precesión, en rad/s

function [Omega_T, Omega_prec] = precession_rate_from_inertia_omega_ax_sym...
        (I_T, I_z, omega, gamma)
    gamma = deg2rad(gamma);
    Omega_T = (I_T - I_z)/I_T * omega;
    Omega_prec = I_z/((I_T - I_z)*cos(gamma))*Omega_T;
end