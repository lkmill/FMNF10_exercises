% Exercise 1.2
format long

%% a.

A = [ 10.2 0 -1.1; 0.1 12.0 0; 0.1 0.2 -9.3 ];
b = [ 1; 2; 3 ];
iterations = 4;

% norm(A)
% norm(A)
% norm(A, 2)
% norm(A, 'inf')

% x_gauss_seidel = gauss_seidel(A, b, iterations)
% x_jacobi = jacobi(A, b, iterations)
% x_matlab = A \ b
x_jacobi = jacobi(A, b, 1)
x_jacobi = jacobi(A, b, 2)
x_jacobi = jacobi(A, b, 3)
x_gauss_seidel = gauss_seidel(A, b, 1)
x_gauss_seidel = gauss_seidel(A, b, 2)
x_gauss_seidel = gauss_seidel(A, b, 3)

function x = gauss_seidel(A, b, iterations)
x_ref = A \ b;
x = [ 1; 1; 1 ];

for k = 1:iterations
  for i = 1:3
    x(i) = (b(i) - A(i, [1:i - 1, i + 1:end]) * x([1:i - 1, i + 1:end])) / A(i, i);
  end
  % check = norm(x_ref-x) / norm(x_ref)
end
end

function x = jacobi(A, b, iterations)
x_ref = A \ b;
x = [ 1; 1; 1 ];
D_inv = inv(diag(diag(A)));
L_U = triu(A, 1) + tril(A, -1);

for k = 1:iterations
  x = D_inv * (-L_U * x + b);
end
end
