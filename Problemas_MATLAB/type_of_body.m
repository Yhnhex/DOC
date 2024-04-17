%% DESCRIPCIÓN:
% Esta función utiliza las inercias de un cuerpo girando con simetría axial
% para determinar si el tipo de cuerpo es Oblate o Prolate y comprobar que
% la velocidad de precesión obtenida es coherente con las inercias. La
% precesión prógrada implica que la velocidad de precesión es mayor que 0 y
% la retrógrada que es menor que 0.
%% INPUTS: 
% I_xy [1x1]: Inercia en el plano de simetría
% I_z [1x1]: Inercia en el eje de simetría
% Omega_prec [1x1]: Velocidad de precesión
%% OUTPUTS:
% body_type [string]: String con el tipo de cuerpo que es, Oblate o Prolate

function body_type = type_of_body(I_xy, I_z, Omega_prec)
    if I_z < I_xy
        body_type = 'Prolate';
        disp('El cuerpo es un Prolate spinner')
        if Omega_prec > 0
            disp ('La precesión es prógrada, como debería ser en un Prolate')
        else
            disp ('La precesión es retrógrada, hay una incongruencia')
        end
    elseif I_z > I_xy
        body_type = 'Oblate';
        disp('El cuerpo es un Oblate spinner')
        if Omega_prec > 0
            disp ('La precesión es prógrada, hay una incongruencia')
        else
            disp ('La precesión es retrógrada, como debería ser en un Oblate')
        end
    else
        disp('Las inercias son iguales')
    end
end