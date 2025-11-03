# PA-5

For the first problem, we are tasked to find the difference between the three operators, transpose(), ', and .'

For real numbers, they have no difference at all. They share the same function of interchanging a matrix's columns and rows. For example, given the matrix:

 $$
    A = \begin{bmatrix}
    2 & 0 & 1 & 8 & 0 & -2 \\
    3 & 4 & 7 & 3 & 7 & 6 \\
    -6 & 4 & -1 & 2 & 5 & 9
    \end{bmatrix}
$$

  Performing any single one of the operations will give us:

  Using transpose(A), A', or A.'
  
 $$
    A' = \begin{bmatrix}
    2 & 3 & -6 \\
    0 & 4 & 4 \\
    1 & 7 & -1 \\
    8 & 3 & 2 \\
    0 & 7 & 5 \\
    -2 & 6 & 9
    \end{bmatrix}
$$

  Note: The "'" notation is used to indicate that matrix A has been transposed, using any of the three operators and not necessarily using the ' operator in MATLAB.

For complex numbers, the operators transpose(), and .' does the same thing as before, only interchanging a matrix's rows and columns. However, the ' operator does another step on top of interchanging a matrix's rows and columns. It also inverts the sign of the imaginary part of the complex number.

For example, 

$$
    B = \begin{bmatrix}
    3+2j & -6-7j & 1-j \\
    -5+2j & 3+j & 1+7j \\
    4-3j & 7+8j & 3j
    \end{bmatrix}
$$ 

Using B'

$$
    B' = \begin{bmatrix} 
    3-2j & -5-2j & 4+3j \\
    -6+7j & 3-j & 7-8j \\
    1+j & 1-7j & -3j
    \end{bmatrix}
$$

If we use the other two operations, we simply get its transpose as with the real numbers, with the signs being untouched: 

Using transpose(B) or B.'

$$
    B' = \begin{bmatrix} 
    3+2j & -5+2j & 4-3j \\
    -6-7j & 3+j & 7+8j \\
    1-j & 1+7j & 3j
    \end{bmatrix}
$$


For problem two, we're tasked to solve the system of linear equations below, simultaneously using the inverse method and Cramer's Rule.

System of linear equations:

$$
\begin{cases}
3x_1 + 4x_2 - 3x_3 + \pi x_4 + x_5 = 1 \\
x_1 - x_2 + 5x_3 - 4x_4 + 6x_5 = 12 \\
3x_1 - \sqrt{5}x_2 - x_3 + 7x_4 - 9x_5 = -7 \\
7x_1 + 4x_2 - 7x_3 + 8x_4 + 2x_5 = 2 \\
9x_1 + \csc(3)x_2 - 11x_3 - \frac{6}{5}x_4 + 2x_5 = 0
\end{cases}
$$

In both methods, we first need to get the coefficient matrix. This matrix contains all the coefficients of all the equations within the system. In this case, our coefficient matrix is as follows:

$$
A = \begin{bmatrix}
3 & 4 & -3 & \pi & 1 \\
1 & -1 & 5 & -4 & 6 \\
3 & -\sqrt{5} & -1 & 7 & -9 \\
7 & 4 & -7 & 8 & 2 \\
9 & \csc(3) & -11 & \frac{6}{5} & 2
\end{bmatrix}
$$

Next, we need to get the solution matrix, a column vector, which contains the values in the right-hand side of the system.

$$
B = \begin{bmatrix}
 1 \\
 12 \\
 -7 \\
 2 \\
 0
\end{bmatrix}
$$

For the inverse method, the equation that we're gonna base on is AX = B. Performing some algebraic manipulation, we are able to solve for X, which is the matrix that will contain all the unknown values of our system. The expected type of matrix X will be is a column matrix, with every row corresponding to one unknown. 

Since matrix division is not possible, instead of dividing both sides of the equation by A, we will multiply both sides of the equation by the inverse of A. This is due to the fact that if you multiply a matrix by its inverse, it will always yield an identity matrix, which is the equivalent of dividing a scalar quantity by itself and getting a 1. Therefore, X will be equal to $A^{-1}(B)$

Using the function inv(A), and storing it into the matrix Ainv, 

$$
Ainv = \begin{bmatrix}
-0.0080 & 0.1514 & 0.1128 & -0.0098 & 0.0670 \\
0.4493 & -0.0042 & 0.0046 & -0.1837 & -0.0079 \\
0.2581 & 0.1272 & 0.0797 & -0.1133 & -0.0386 \\
0.0368 & -0.0238 & -0.0086 & 0.0942 & -0.0800 \\
-0.1144 & 0.0189 & -0.0902 & 0.1282 & -0.0336
\end{bmatrix}
$$

To get the value of X, we then multiply Ainv to the solution matrix B. 
Which yields:

$$
\begin{bmatrix}
1.0000 \\
0.0000 \\
1.0000 \\
-0.0000 \\
1.0000
\end{bmatrix}
$$

which falls well within our expectations of it being a column vector.

Now, to check if these are really the unknown values, we substitute these values into the system of linear equations. I've stored the results inside the matrix C, rounding everything to the nearest integer as the values on the right-hand side of the system are whole numbers. 

Using the code:
```matlab
C = [round(3*X(1)+4*X(2)-3*X(3)+pi*X(4)+1*X(5));
round(1*X(1)+-1*X(2)+5*X(3)-4*X(4)+6*X(5));
round(3*X(1)-sqrt(5)*X(2)-1*X(3)+7*X(4)-9*X(5));
round(7*X(1)+4*X(2)-7*X(3)+8*X(4)+2*X(5));
round(9*X(1)+csc(3)*X(2)-11*X(3)-(6/5)*X(4)+2*X(5));
]
```

Now, in MATLAB, we are able to perform elementwise comparisons. Meaning, we can check to see each element matches each other. Using the the operation B == C, with B being the solution matrix and C the computed values with the unknown values we solved earlier, we see that the matrix that this operation yields is:

$$
\begin{bmatrix}
1 \\
1 \\
1 \\
1 \\
1
\end{bmatrix}
$$

All of it is 1, meaning, when compared element by element, all the values in C (our computed solution matrix) matched the values in B (the right-hand side values of the system)

Moving on to Cramer's Rule, we will use a different formula: $X_n = \frac{D_n}{D}$

Where $X_n$ is the nth missing variable, $D_n$ is the determinant of the coefficient matrix where the nth column is replaced with the values in the right-hand side of the system, and D is the determinant of the coefficient matrix.

Given the repetitive nature of this method, having to replace every column with the right-hand side, we are going to use a for loop in order to make the code more flexible and easier to read. In MATLAB, for loops are written by providing a variable that contains a range that indicates how many iterations it will run.

```matlab
for i = 1:Awidth
    An = A;
    An(:, i) = B;

    Dn = det(An);

    X(i) = Dn/Adet;
end

```

In this code, the variable Awidth is defined as width(A), which returns the number of columns matrix A has. Hence, the loop will run for however many columns a matrix has, which in this case is 5. Moving on, I copy the matrix A into the variable An so that our coefficient matrix is preserved. Then, to perform the steps of replacing the nth column with the right-hand side, the following syntax is used: ``An(:, i) = B`` This means that it will select all the rows, and the ith column and replace it with the column vector B which again, is the right hand side of the system. We then take the determinant of that matrix and store it in the variable Dn. Finally, we divide Dn by the determinant of the coefficient matrix which is Adet. Which will yield the ith unknown variable. This process is repeated until the loop has iterated the same amount of times as the number of columns in A which in this case is 5.




Stored in X will then be all the unknowns in the system of linear of equations. Using the same checking method earlier, 

we substitute these values into the system of linear equations. I've stored the results inside the matrix C, rounding everything to the nearest integer as the values on the right-hand side of the system are whole numbers. 

Using the code:
```matlab
C = [round(3*X(1)+4*X(2)-3*X(3)+pi*X(4)+1*X(5));
round(1*X(1)+-1*X(2)+5*X(3)-4*X(4)+6*X(5));
round(3*X(1)-sqrt(5)*X(2)-1*X(3)+7*X(4)-9*X(5));
round(7*X(1)+4*X(2)-7*X(3)+8*X(4)+2*X(5));
round(9*X(1)+csc(3)*X(2)-11*X(3)-(6/5)*X(4)+2*X(5));
]
```

Using the the operation B == C, with B being the solution matrix and C the computed values with the unknown values we solved earlier, we see that the matrix that this operation yields is:

$$
\begin{bmatrix}
1 \\
1 \\
1 \\
1 \\
1
\end{bmatrix}
$$

All of it is 1, meaning, when compared element by element, all the values in C (our computed solution matrix) matched the values in B (the right-hand side values of the system)









  
