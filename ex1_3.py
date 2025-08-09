import numpy as np
import numpy.typing as npt

def ex1_3():
    q3_a()
    q3_b()
    q3_c()

A = np.array([
    [ 210.5665, 215.9568, 375.3999 ],
    [ 309.2944, 317.1409, 550.7982 ],
    [ 227.6848, 232.4327, 403.2554 ],
])

b = np.array([-0.4816, -0.7068, -0.5182])

def q3_a():
    print('[3.a]\n')

    x = np.linalg.solve(A, b)

    print(x)

def q3_b():
    print('\n[3.b]\n')

    x = np.linalg.solve(A, b)

    ks = []

    for i in range(0, 1000):
        db = np.random.rand(3) * 0.02 - 0.01
        dx = x - np.linalg.solve(A, b + db)
        error_output = np.linalg.norm(dx) / np.linalg.norm(x)
        error_input = np.linalg.norm(db) / np.linalg.norm(b)
        k = error_output / error_input
        ks.append(k)

    print(f'k_max: {max(ks)}')

def q3_c():
    print('\n[3.c]\n')

    print(f'cond(A): {np.linalg.cond(A)}')

ex1_3()
