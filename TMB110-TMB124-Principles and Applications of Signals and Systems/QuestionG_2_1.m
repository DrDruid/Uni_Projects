%estw h sunarthsh tou G.1 xrisimopoieitai edw tote
fs=1000;
t=0:1/fs:1;
x=cos(100*pi*t)+cos(200*pi*t)+sin(500*pi*t);
plot(t,x);
X=fft(x);
X_mag=abs(X);
plot(X_mag);
