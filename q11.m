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

% Example usage:
A = [4, 3, 2; 2, 1, 4; 6, 7, 8]; % Example matrix
[L, U] = lu_decomposition(A);

% Display results
disp('Matrix L:');
disp(L);
disp('Matrix U:');
disp(U);
disp('Verification A = L * U:');
disp(L * U); % Should reconstruct the original matrix A