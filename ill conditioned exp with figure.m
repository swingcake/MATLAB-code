function A = pei(n, b)
    % Create an n x n matrix with all entries initialized to 1
    A = ones(n);
    
    % Set diagonal elements to b
    for i = 1:n
        A(i,i) = b;
    end
end

% Experiment to show that the Pei matrix becomes more ill-conditioned as b approaches 1
n = 20;                % Fixed matrix size
b_values = 0:0.1:1.5;  % Range of b values to test, from 0 to 1.5
cond_values = zeros(size(b_values)); % Initialize array for storing condition numbers

for k = 1:length(b_values)
    b = b_values(k);
    A = pei(n, b);               % Generate Pei matrix for each b
    cond_values(k) = cond(A, 2); % Compute 2-norm condition number
end

% Plot the condition number against b values
figure;
plot(b_values, cond_values, '-o');
xlabel('b');
ylabel('Condition Number (Cond2(A))');
title('Condition Number of Pei Matrix as b Approaches 1');
grid on;