fs=1000;
t=0:1/fs:1;
x=cos(100*pi*t)+cos(200*pi*t)+sin(500*pi*t);
subplot(3,1,1);stem(x);
xk=ifft(x,t);
magxk=abs(xk);
anglexk=angle(xk);k=0:1:fs-1;
subplot(3,1,3);stem(k,magxk);
subplot(3,1,3);steam(k,anglexk);





