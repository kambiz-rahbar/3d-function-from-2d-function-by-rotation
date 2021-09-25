function [Rotated_X] = rot3d(X, REF_point, Rotation_degree)
%Rotation_degree = [0 0 90];

Rotation_degree = (Rotation_degree*pi)./180;

%Direction Cosines (rotation matrix) construction
Rx = [1 0                       0
      0 cos(Rotation_degree(1)) -sin(Rotation_degree(1))
      0 sin(Rotation_degree(1)) cos(Rotation_degree(1))];
  
Ry = [cos(Rotation_degree(2))  0 sin(Rotation_degree(2))
      0                        1 0
      -sin(Rotation_degree(2)) 0 cos(Rotation_degree(2))];
  
Rz = [cos(Rotation_degree(3)) -sin(Rotation_degree(3)) 0
      sin(Rotation_degree(3)) cos(Rotation_degree(3))  0
      0                       0                        1];
  
R = Rx * Ry * Rz;
T = REF_point;

Rotated_X = R * (X - REF_point) + T;
