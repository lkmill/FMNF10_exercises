import numpy as np
import numpy.typing as npt

def ex1_2():
    a()

def a():
    print('[2.a]\n')

    A = np.array([[10.2, 0, -1.1], [0.1, 12.0, 0], [0.1, 0.2, -9.3]])
    b = np.array([1.0, 2.0, 3.0])
    initial = np.array([1.0, 1.0, 1.0])
    x = gauss_seidel(A, b, initial, 10)
    print(f'x: {x}')
    x_np = np.linalg.solve(A, b)
    print(f'x_np: {x_np}')
    print(f'norm: {np.linalg.norm(x - x_np)}')




def gauss_seidel(A: npt.NDArray, b: npt.NDArray, initial: npt.NDArray, iterations):
    m, n = A.shape

    coefficients = []

    for i in range(0, m):
        before = A[i, 0:i]
        after = A[i, (i + 1):n]
        coefficients.append(np.concatenate((before, after)))

    x = initial.copy()

    for k in range(0, iterations):
        for i in range(0, m):
            x[i] = (b[i] - coefficients[i].dot(np.concatenate((x[:i], x[(i + 1):])))) / A[i, i]

        print(f'x_{k}: {x}')

    return x

ex1_2()
