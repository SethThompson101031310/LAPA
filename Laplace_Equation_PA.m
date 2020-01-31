% Name: Seth Thompson
% Student Number: 101031310

close all
clear
clc

% January 31st, Laplace equation PA

% Setting creating a nx by ny matrix to hold the solution.

nx = 100;
ny = 100;
V = zeros(nx,ny);
Vnew = V;
% Setting a maximum number of iterations.
iterationMAX = 1000;

% Making a loop that will go through the system and solve it using an
% iterative method.

for n = 1:iterationMAX
    for i = 1 : nx
        for j = 1 : ny
            if j == 1
                Vnew(i,j) = 1;
            elseif j == 100
                Vnew(i,j) = 1;
            elseif i == 1 && (j ~= 1 && j ~= 100)
                Vnew(i,j) = 0;
            elseif i == 100 && (j ~= 100 && j ~= 1)
                Vnew(i,j) = 0;
            else
                Vnew(i,j) = (V(i+1,j) + V(i-1,j) + V(i,j-1) + V(i,j+1))/4;
            end
        end
    end
    V = Vnew;
    figure(1)
    surf(V)
    pause(0.0001)
end

% Calculating the E feild and plotting it using surf and quiver

[Ex, Ey] = gradient(V);
Ex = -Ex;
Ey = -Ey;

% Plotting the electric field and vecotrs using quiver and surf on the same
% plot.
figure(2)
surf(Ex,Ey)
hold on
quiver(Ex,Ey)