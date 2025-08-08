import numpy as np
import numpy.typing as npt

def ex1_1():
    a()
    b()
    c()

def a():
    print('[1.a]\n')
    A = np.array([[ 1.0, -1.0, -1.0 ], [ 3.0, 2.0, 0.0 ], [ 0.0, 2.0, -8.0 ]])
    b = [ 0, 10.0, 0.6]

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

    print(f'x: {[x1, x2, x3]}')
    print(f'norm: {np.linalg.norm(np.linalg.solve(A, b) - [ x1, x2, x3 ])}')

def b():
    print('\n[1.b]\n')

    A = np.array([[ 1.0, -1.0, -1.0 ], [ 3.0, 2.0, 0.0 ], [ 0.0, 2.0, -8.0 ]])
    b = [ 0, 10.0, 0.6]

    x = solve(A, b)

    print(f'x: {x}')
    print(f'norm: {np.linalg.norm(np.linalg.solve(A, b) - x)}')

def c():
    print('\n[1.c]\n')

    norms = []

    for i in range(0, 10):
        A = np.random.rand(10, 10)
        b = np.random.rand(10, 1)
        norm = np.linalg.norm(np.linalg.solve(A, b) - solve(A, b))
        norms.append(norm)
        print(f'norm: {np.linalg.norm(np.linalg.solve(A, b) - solve(A, b))}')

    print(f'norm of norms: ${np.linalg.norm(norms)}')


def solve(A: npt.NDArray, b):
    LU =  A.copy()
    m, n = A.shape
    P = np.identity(m)

    for k in range(0, m - 1):
        new_k = np.argmax(LU[range(k, m), k]) + k

        if (new_k != k):
            LU[[ k, new_k ]] = LU[[ new_k, k ]]
            P[[ k, new_k ]] = P[[ new_k, k ]]

            
        for i in range(k + 1, m):
            r = LU[i, k] / LU[k, k]
            LU[i, k] = r
            # b[i] = b[i] - b[k] * r

            for j in range(k + 1, n):
                LU[i, j] = LU[i, j] - LU[k, j] * r

    b = P.dot(b)

    # forward substition (Lc = Pb)
    c = []

    for i in range(0, m):
        c.append(b[i] - LU[i, 0:i].dot(c[0:i]))
        
    # back substition (Ux = c)
    x = [None] * n

    for i in range(n - 1, -1, -1):
        x[i] = (c[i] - LU[i, i + 1:n].dot(x[i + 1:m])) / LU[i, i]

    return x

    

ex1_1()
