function x = gauss_elimination(A, b)
    % Get the size of matrix A
    [n, m] = size(A);
    if n ~= m
        error('Matrix A must be square.');
    end
    
    % Augment matrix A with vector b
    Aug = [A, b];
    
    % Forward elimination process
    for k = 1:n-1
        % Partial pivoting
        [~, maxRow] = max(abs(Aug(k:n, k)));
        maxRow = maxRow + k - 1;
        if maxRow ~= k
            % Swap rows
            Aug([k, maxRow], :) = Aug([maxRow, k], :);
        end
        
        % Eliminate elements below the pivot
        for i = k+1:n
            factor = Aug(i, k) / Aug(k, k);
            Aug(i, k:n+1) = Aug(i, k:n+1) - factor * Aug(k, k:n+1);
        end
    end
    
    % Back substitution to solve for x
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = (Aug(i, end) - Aug(i, i+1:n) * x(i+1:n)) / Aug(i, i);
    end
end

% Example usage:
A = [6, 2, 2; 2, 2/3, 1/3; 1, 2, -1] % Example coefficient matrix
b = [-2; 1; 0] % Example right-hand side vector

% Solve the system
x = gauss_elimination(A, b)