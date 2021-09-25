clc
clear
close all

%% desired 2d function
x = 0:0.04:1;
y = zeros(size(x));
z = sin(pi*x) + x.*sin(3*pi*x);
X = [x; y; z];

%% make 3d function using 3d rotation
REF_point = [0; 0; 0];
Rz = 0:10:360;
Rotated_X = [];
for k = 1:length(Rz)
    Rotation_degree = [0 0 Rz(k)];
    Rotated_X = [Rotated_X rot3d(X, REF_point, Rotation_degree)];
end

Rx = Rotated_X(1,:);
Ry = Rotated_X(2,:);
Rz = Rotated_X(3,:);

[XX, YY] = meshgrid(-1:0.01:1, -1:0.01:1);
ZZ = griddata(Rx, Ry, Rz, XX, YY);

%% display results
figure(1); subplot(1, 3, 1);
plot(x, z);
grid minor; axis square; xlabel('x'); ylabel('z');
title('2d function');

subplot(1, 3, 2);
plot3(Rx, Ry, Rz,'.b'); hold on;
plot3(X(1,:), X(2,:), X(3,:), 'r', 'linewidth', 10);
grid minor; axis square; xlabel('x'); ylabel('y'); zlabel('z');
title('3d points');
view([15, 15, 30]);

subplot(1, 3, 3);
mesh(XX, YY, ZZ);
grid minor; axis square; xlabel('x'); ylabel('y'); zlabel('z');
title('3d function');
view([15, 15, 30]);
