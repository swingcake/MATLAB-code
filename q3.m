% Step 1: Define the 100 x 100 matrix A
n = 10;
A = diag(ones(n, 1))               % Set diagonal elements to 1
A = A + diag(2 * ones(n-1, 1), 1)  % Set superdiagonal elements to 2

% Step 2: Calculate the eigenvalues of the original matrix A
eigenvalues_A = eig(A);

% Step 3: Perturb the element A(100, 1) by 10^-10
A(10, 1) = A(10, 1) + 1e-10;

% Step 4: Calculate the eigenvalues of the perturbed matrix
eigenvalues_A_perturbed = eig(A);

% Step 5: Calculate the condition number of A in the 2-norm
cond_A = cond(A, 2);

% Display results
disp('Eigenvalues of the original matrix A:');
disp(eigenvalues_A);

disp('Eigenvalues of the perturbed matrix A:');
disp(eigenvalues_A_perturbed);

disp(['Condition number of the matrix A (Cond2(A)): ', num2str(cond_A)]);