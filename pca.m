
myfile='data.txt';

A= importdata(myfile);
disp(size(A));
X= A(:,1:64);
Y=A(:,65);
S=sum(X,1);

for i=1:64
S(i)=S(i)/3823;
end
  
for i=1:64
     for j=1:3823
          X(j,i)=X(j,i)-S(i);
     end
end
 
sta=std(X,1);
disp(sta);

Xt=transpose(X);
Z=Xt*X;
[V,D,P]=eig(Z);

V1= V(:,63:64);
T=X*V1;
disp(size(V1));
disp(V1);

for i=1:2
     for j=1:3823
        T(j,i)=-T(j,i);
     end
end
s=figure;
scatter(T(:,2),T(:,1),5);

x = T(1:200,2); y = T(1:200,1); 
z = Y(1:200,1);
a = [1:10]'; b = num2str(z); c = cellstr(b);
text(x,y,c,'right','FontSize',8);

  
  