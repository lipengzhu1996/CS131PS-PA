syms x;
syms sig;
syms k;

%1-D Gaussian and its 1st and 2nd derivative
g(x,sig)=1/(sqrt(2*pi)*sig)*exp(-x^2/(2*sig^2));
gg(x,sig)=diff(g,x);
ggg(x,sig)=diff(gg,x);

x1=-10:0.1:10;
y1=g(x1,1);
y2=gg(x1,1);
y3=ggg(x1,1);

% plot(x1,y1);
% figure
% plot(x1,y2);
% figure
plot(x1,y3);

D(x,sig,k)=(g(x,k*sig)-g(x,sig))/(k*sig-sig);
hold on
d1_2=D(x1,1,1.2);
plot(x1,d1_2);
d1_4=D(x1,1,1.4);
hold on
plot(x1,d1_4);
d1_6=D(x1,1,1.6);
hold on
plot(x1,d1_6);


