%Problem 2

%Inverse method


%Matrix containing the coefficients of the system of linear equations, the
%coefficient matrix
A = [3 4 -3 pi 1;
    1 -1 5 -4 6;
    3 -sqrt(5) -1 7 -9;
    7 4 -7 8 2;
    9 csc(3) -11 -6/5 2]

%The inverse of the coefficient matrix
Ainv = inv(A)

%The dimensions of the matrix
Awidth = width(A); %Number of columns
Alength = length(A); %Number of rows

B = [1; 12; -7; 2; 0]; %Row matrix containing the values on the right hand side of the equations

X = Ainv*B; %This is the inverse method. from Ax = B, x = A^-1*B

X

%Checking
C = [round(3*X(1)+4*X(2)-3*X(3)+pi*X(4)+1*X(5));
round(1*X(1)+-1*X(2)+5*X(3)-4*X(4)+6*X(5));
round(3*X(1)-sqrt(5)*X(2)-1*X(3)+7*X(4)-9*X(5));
round(7*X(1)+4*X(2)-7*X(3)+8*X(4)+2*X(5));
round(9*X(1)+csc(3)*X(2)-11*X(3)-(6/5)*X(4)+2*X(5));
]

B == C


%Cramer method


%Uses X = Dx/D

A = [3 4 -3 pi 1;
    1 -1 5 -4 6;
    3 -sqrt(5) -1 7 -9;
    7 4 -7 8 2;
    9 csc(3) -11 -6/5 2]

%Taking the determinant of the matrix A,
Adet = det(A);

B = [1; 12; -7; 2; 0];
X = zeros(Alength,1);


for i = 1:Awidth
    An = A;
    An(:, i) = B;

    Dn = det(An);

    X(i) = Dn/Adet;
end


X

C = [round(3*X(1)+4*X(2)-3*X(3)+pi*X(4)+1*X(5));
round(1*X(1)+-1*X(2)+5*X(3)-4*X(4)+6*X(5));
round(3*X(1)-sqrt(5)*X(2)-1*X(3)+7*X(4)-9*X(5));
round(7*X(1)+4*X(2)-7*X(3)+8*X(4)+2*X(5));
round(9*X(1)+csc(3)*X(2)-11*X(3)-6/5*X(4)+2*X(5));
]

B == C











