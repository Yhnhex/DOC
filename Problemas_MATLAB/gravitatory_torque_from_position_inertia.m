function grav_torque = gravitatory_torque_from_position_inertia...
    (Ix, Iy, Iz, spacecraft_position_B, mu)
    I = [Ix, 0, 0; 0, Iy, 0; 0, 0, Iz];
    skew_R = skew_matrix(spacecraft_position_B);
    R = sqrt(spacecraft_position_B(1)^2 + spacecraft_position_B(2)^2 ...
        + spacecraft_position_B(3)^2);
    grav_torque = 3*mu/R^5*skew_R*I*spacecraft_position_B;
end
