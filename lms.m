function [h,y]=lms(x,d,delta,N,h0)
M=length(x);
y=zeros(M,1);
h=h0;
for n=N:M
    x1=x(n:-1:n-N+1);
    y(n)=h'*x1;
    e=d(n)-y(n);
    h=h+delta*e*x1;
end 
end 