% exercise 1.4

x = [
  1
  2
  4
];

y = [
  2.5
  4.5
  9
];

% monomial basis functions

%% a
A = [
  1 x(1) x(1)^2
  1 x(2) x(2)^2
  1 x(3) x(3)^2
];

c = flip(A \ y);

polyval(c, 1)
polyval(c, 2)
polyval(c, 4)

x = -1:0.1:20;
plot(x, polyval(c, x))

%% b.

polyval(c, 100)

% no, the value is not realistic

%% c.

polyval(c, 0)




