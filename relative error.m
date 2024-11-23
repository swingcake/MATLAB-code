% Define matrix A and vectors b and b'
A = [1, 2; 3, 4]
b = [3; 7]
b_prime = [3.0001; 7.0001]

% Solve for x and x'
x = A \ b
x_prime = A \ b_prime

% Calculate delta x and delta b
delta_x = x_prime - x
delta_b = b_prime - b

% Calculate the relative error ||delta_x||2 / ||x||2
relative_error = norm(delta_x, 2) / norm(x, 2)

% Calculate the condition number Cond2(A)
cond_A = cond(A, 2)

