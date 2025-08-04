% exercise 1.1

format long;

%% a.)

x = ex1a(10, 0.6, 3, 2, 8)

%% b.)

A = [ 1 -1 -1; 3 2 0; 0 2 -8 ];
b = [ 0; 10; 0.6];
% A = [ 0 2 -8; 3 2 0; 1 -1 -1 ];
% b = [ 0.6; 10; 0 ];
% A = [ 2 -1 3; 4 2 1; 6 13 -5 ];
% b = [ 17; 10; -21];
x = solve(A, b)
x_matlab = A \ b

%% c.)

for i = 1:5
  A = rand(10);
  b = rand(10, 1);
  x = solve(A, b)
  x_matlab = A \ b
end

% exercise 2

function i = ex1a (U1, U2, R1, R2, R3)
i(3, 1) = (U2 - U1 * R2 / (R1 + R2)) / (-R1 * R2 / (R1 + R2) - R3);
i(2, 1) = (U1 - R1 * i(3, 1)) / (R1 + R2);
i(1, 1) = i(2, 1) + i(3, 1);
end

function x = solve(A, b)
n = length(b);

LU = A;
P = eye(n);

for m = 1:n - 1
  [~, new_m] = max(LU(m:end, m), [], "ComparisonMethod", "abs");

  new_m = new_m + m - 1;

  if (new_m ~= m)
    LU([m new_m], :) = LU([new_m m], :);
    P([m new_m], :) = P([new_m m], :);
  end

  LU(m + 1:n, m) = LU(m + 1:n, m) / LU(m, m);
  LU(m + 1:n, m + 1:n) = LU(m + 1:n, m + 1:n) - LU(m + 1:n, m) * LU(m, m + 1:n);
end

b = P * b;

% forward substitution
for m = 1:n
  b(m, 1) = b(m) - LU(m, 1:m - 1) * b(1:m - 1);
end

% back substitution
for m = n:-1:1
  b(m) = (b(m) - LU(m, m + 1:n) * b(m + 1:n)) / LU(m, m);
end
x = b;
end