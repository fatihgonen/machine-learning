

img = double(imread('data.jpg'));
red_c = img(:,:,1); 
A=red_c;

A_t = transpose(A);
Z = A_t*A;
[ Z_v,Z_val] = eig(Z);
[k p] = size(A);
[m n] = size(Z_v);
o= m; p = n;

Sigma = sqrt(Z_val);
Sig= zeros(o,p);
for i=1:1:p  
    Sig(i,i) = Sigma(o-i+1,p-i+1); 
end
V = fliplr(Z_v); 
Si=inv(Sig);
U=A*V*Si;
d=50;

U2 = U(:,1:d);
S2 = Sig(1:d,1:d);
V2 = V(:,1:d);
red_channel=U2*S2*V2';

green_c = img(:,:,2);
A=green_c;
A_t = transpose(A);
Z = A_t*A;
[ Z_v,Z_val] = eig(Z);
[k p] = size(A);
[m n] = size(Z_v);
o= m; p = n;

Sigma = sqrt(Z_val);
Sig= zeros(o,p);
for i=1:1:p  
    Sig(i,i) = Sigma(o-i+1,p-i+1);  
end
V = fliplr(Z_v);
Si=inv(Sig);
U=A*V*Si;
d=50;

U2 = U(:,1:d);
S2 = Sig(1:d,1:d);
V2 = V(:,1:d);
green_channel=U2*S2*V2';

blue_c= img(:,:,3);
A=blue_c;

A_t = transpose(A);
Z = A_t*A;
[ Z_v,Z_val] = eig(Z); 
[k p] = size(A);
[m n] = size(Z_v);
o= m; p = n;

Sigma = sqrt(Z_val);
Sig= zeros(o,p);
for i=1:1:p  
    Sig(i,i) = Sigma(o-i+1,p-i+1); 
end
V = fliplr(Z_v); 
Si=inv(Sig);
U=A*V*Si;
d=50;

U2 = U(:,1:d);
S2 = Sig(1:d,1:d);
V2 = V(:,1:d);
blue_channel=U2*S2*V2';

rgbImage = cat(3, red_channel,green_channel,blue_channel);
figure(1) = imshow(mat2gray(rgbImage));

