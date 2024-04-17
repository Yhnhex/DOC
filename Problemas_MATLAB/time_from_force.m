%% DESCRIPCIÓN
% Esta función permite obtener la aceleración de un cuerpo a partir de la
% fuerza que sufre y su masa, además de calcular el tiempo que, sometido a
% esa aceleración, es capaz de recorrer una distancia concreta.
%% INPUTS:
% F [1x1]: Fuerza, en N, que sufre el objeto
% m [1x1]: Masa del objeto en kg
% s [1x1]: Distancia que debe recorrer el objeto, en km
% v0 [1x1]: Velocidad inicial del objeto, en km
%% OUTPUTS:
% t [1x1]: Tiempo que tarda en recorrer la distancia, en s

function [a,t] = time_from_force(F,m,s,v0)
    a = F/m;
    s = s/1000; % Pasar de km a m
    if v0 == 0
        t = sqrt(2*s/a);
    else
        v0 = v0/1000; % Pasar de km/s a m/s
        syms time
        f = s == 0.5*a*time^2 + v0*time;
        times = double(solve(f,time));
        % Eliminar la solución negativa:
        for i = 1: length(times)
            if times(i) > 0 
                t = times(i);
            end
        end
         
    end
end