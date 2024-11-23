function L = cholesky_decomposition(A)
    % Check if A is square
    [n, m] = size(A);
    if n ~= m
        error('Matrix A must be square.');
    end

    % Initialize L as a zero matrix of the same size as A
    L = zeros(n);

    % Perform Cholesky decomposition
    for i = 1:n
        for j = 1:i
            if i == j
                % Diagonal elements
                L(i, j) = sqrt(A(i, i) - sum(L(i, 1:j-1).^2));
            else
                % Off-diagonal elements
                L(i, j) = (A(i, j) - sum(L(i, 1:j-1) .* L(j, 1:j-1))) / L(j, j);
            end
        end
    end
end

% Example usage
A = [4, 12, -16; 12, 37, -43; -16, -43, 98]; % Example positive definite matrix
L = cholesky_decomposition(A);

% Display the result
disp('Cholesky factor L:');
disp(L);

% Verify that A = L * L'
disp('Reconstructed A from L * L'':');
disp(L * L');