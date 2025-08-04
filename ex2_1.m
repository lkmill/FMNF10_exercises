% Exercise 2.1

close all;
format compact;
format long;

%% 1.

% x = linspace(0, 1);
% 
% plot(x, cos(x));
% hold on;
% plot(x, x);


x_0 = 0.74;
fn = @(x) cos(x);
x_ref = fn(x_0)
x_app = iterate(fn, x_0, 50);

x_app(size(x_app))
% k = abs(x_ref - x_app) / x_ref


plot(1:N, x_app)


%% 2.
close all;
fn = @(x) sqrt(3 + x);
N = 50;
x_0 = 2;

x_ref = fn(x_0)
x_app = iterate(fn, x_0, N);
x_app(N)
plot(1:N, x_app);

% yes it converges

%% 3

% syms a
% 
% eqn = a^2 + 2*a + 1 == 0;
% solx = solve(eqn, a)
vpasolve(1)

%% 4

x(1) = 1 ;
N = 50 ;
for n = 1:N
f_x(n) = exp(-x(n)) - x(n) ;
fprim_x(n) = -exp(-x(n)) - 1;
x(n+1) = x(n) - f_x(n) / fprim_x(n);
end
x(N + 1)    % 0.567143290409784

%% 5
newtons_method(@(x) x^3 + x - 1, @(x) 3*x^2 + 1, -0.7, 10)

% x(1) = 1 ;
% N = 50 ;
% for n = 1:N
%   f_x(n) = exp(-x(n)) - x(n);
%   fprim_x(n) =
%   x(n+1) =
% end

function x = newtons_method(f, f_prim, x0, N)
x = double.empty(N, 0);
x(1) = x0;

for n = 1:N
  x(n+1) = x(n) - f(x(n)) / f_prim(x(n));
end
end

function x = iterate(fn, x_0, N)
x = double.empty(0, N);

x(1) = fn(x_0);

for n = 1:N-1
    x(n + 1) = fn(x(n));
end

end