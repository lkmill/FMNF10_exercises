import numpy as np
import numpy.typing as npt

def ex1_4():
    q4_a()

X = np.array([ 1, 2, 4 ])
f = np.array([ 2.5, 4.5, 9 ])

b = np.array([-0.4816, -0.7068, -0.5182])

def q4_a():
    print('[4.a]\n')

    L_1 = lambda x: (x - X[1]) * (x - X[2]) / ((X[0] - X[1]) * (X[0] - X[2]))
    L_2 = lambda x: (x - X[0]) * (x - X[2]) / ((X[1] - X[0]) * (X[1] - X[2]))
    L_3 = lambda x: (x - X[0]) * (x - X[1]) / ((X[2] - X[0]) * (X[2] - X[1]))
    P = lambda x: f[0] * L_1(x) + f[1] * L_2(x) + f[2] * L_3(x)

    print(P(X[0]) == f[0])
    print(P(X[1]) == f[1])
    print(P(X[2]) == f[2])

ex1_4()
