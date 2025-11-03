%Problem 1 

%To be used for ' operator
X = [2 0 1 8 0 -2; 
    3 4 7 3 7 6; 
    -6 4 -1 2 5 9];

%To be used for .' operator
Y = [3+j*2 -6-j*7 1-j; 
    -5+j*2 3+j 1+j*7; 
    4-j*3 7+j*8 j*3];

X
Xtrans = X' 
Xetrans = X.'
Xtransfunc = transpose(X)

Y
Ytrans = Y'
Yetrans = Y.'
Ytransfunc = transpose(Y)

%For Real numbers, meaning numbers with no imaginary component, the
%Transpose function, ' operator and .' does the exact same thing. Making
%the rows into columns or vice versa.

%For complex numbers, meaning numbers with an imaginary component,
%Transpose and the .' operation has the same function as with the earlier
%operations with real numbers. However, for ', it has an added function.
%Not only does it turn the rows into columns and columns into rows, it also
%flips the sign of the imaginary components of the entries.









