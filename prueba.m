M=5000;N=15;
D=10;

x=randn(M,1);
d=[zeros(D,1);x(1:M-D)];

delta=1/3*(1/(10*N*sum(x.^2)/M));
h0=zeros(N,1);

[h,y] = lms(x, d, delta, N, h0);

plot(d-y),title('Señal de error'), pause
stem(0:N-1,h), title('Respuesta impulsiva final del filtro transversal')