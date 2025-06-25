import numpy as np

A = np.array([[ 1.0, -1.0, -1.0 ], [ 3.0, 2.0, 0.0 ], [ 0.0, 2.0, -8.0 ]])
b = [ 0, 10.0, 0.6]

print(np.linalg.solve(A, b))

for i in range(0, A.shape[1]):
    for j in range(i + 1, A.shape[0]):
        r = A[j, i] / A[i, i]
        b[j] = b[j] - b[i] * r

        for k in range(i, A.shape[1]):
            A[j, k] = A[j, k] - A[i, k] * r

# back substition
x3 = b[2] / A[2, 2]
x2 = (b[1] - A[1, 2] * x3) / A[1, 1]
x1 = (b[0] - A[0, 1] * x2 - A[0, 2] * x3) / A[0, 0]

print(x1, x2, x3)

