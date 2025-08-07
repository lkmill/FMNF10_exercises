% exercise 1.1

function ex1_1
  % a();
  b();
  % c();
end

function a ()
  disp("[1.a]\n");
  U1 = 10;
  U2 = 0.6;
  R1 = 3;
  R2 = 2;
  R3 = 8;
  i(3, 1) = (U2 - U1 * R2 / (R1 + R2)) / (-R1 * R2 / (R1 + R2) - R3);
  i(2, 1) = (U1 - R1 * i(3, 1)) / (R1 + R2);
  i(1, 1) = i(2, 1) + i(3, 1)
end

function b
  disp("\n[1.b]\n");
  A = [ 1 -1 -1; 3 2 0; 0 2 -8 ];
  b = [ 0; 10; 0.6 ];
  x = solve(A, b)
  x_matlab = A \ b
  norm(x - x_matlab)
end

function c
  disp("\n[1.c]\n");
  for i = 1:5
    A = rand(10);
    b = rand(10, 1);
    x = solve(A, b);
    x_matlab = A \ b;
    norm(x - x_matlab)
  end
end

function x = solve(A, b)
  n = length(b);

  LU = A;
  P = eye(n);

  for m = 1:n - 1
    [~, new_m] = max(abs(LU(m:end, m)));

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

  b

  % back substitution
  for m = n:-1:1
    b(m) = (b(m) - LU(m, m + 1:n) * b(m + 1:n)) / LU(m, m);
  end
  x = b;
end
