function [L, U] = lu_decomposition(A)
    % Get the size of matrix A
    [n, m] = size(A);
    if n ~= m
        error('Matrix A must be square.');
    end
    
    % Initialize L as an identity matrix and U as a copy of A
    L = eye(n);
    U = A;
    
    % Perform LU decomposition
    for k = 1:n-1
        for i = k+1:n
            % Compute the multiplier
            L(i, k) = U(i, k) / U(k, k);
            
            % Update the rows of U
            U(i, k:n) = U(i, k:n) - L(i, k) * U(k, k:n);
        end
    end
end

function x = lu_solve(A, b)
    % Perform LU decomposition
    [L, U] = lu_decomposition(A);
    
    % Forward substitution to solve Ly = b
    n = length(b);
    y = zeros(n, 1);
    for i = 1:n
        y(i) = b(i) - L(i, 1:i-1) * y(1:i-1);
    end
    
    % Backward substitution to solve Ux = y
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = (y(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
    end
end

% Example usage:
A = [2, 2, 2; 4, 7, 7; 6, 18, 22] % Example matrix
b = [12; 24; 12] % Example right-hand side vector
x = lu_solve(A, b)


disp('Verification A * x = b:'); 
disp(A*x);