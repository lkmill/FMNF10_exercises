% Exercise 1.3

A = [
    210.5665 215.9568 375.3999
    309.2944 317.1409 550.7982
    227.6848 232.4327 403.2554
];

b = [
    -0.4816
    -0.7068
    -0.5182
];

%% a

x_ref = A \ b;

%% b

k_max = 0;

for i = 1:1000
    d_b = 0.01 - 2 * 0.01 * rand(3, 1);
    x = A \ (b + d_b);

    k = (norm(x - x_ref) / norm(x_ref)) / (norm(d_b) / norm(b));

    if k > k_max
        k_max = k;
    end
end

k_max

%% c

cond(A)