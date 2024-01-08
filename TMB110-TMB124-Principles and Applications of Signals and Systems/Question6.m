%ERWTHMA 2
%Orizoume to tE[-10,10] ki to Dt=0.001 opote tha grapsoume
t=(0:.001:1);
%grafouem thn sunarthsh tou shmatos mas
x=cos(100*pi*t)+cos(200*pi*t)+sin(500*pi*t);
%ki kanoume to diagrama
%ERWTHMA 3
T=.01; %time_window=0.01
l=0:T:1; %time index
Fs=1/T; %sample rate to opoio isoutai me 1/T
N=length(l); %plithos twn sample "dots"
h=cos(100*pi*l)+cos(200*pi*l)+sin(500*pi*l);% our signal
ta=0:.001:1; %xronos anakataskevhs
y=zeros(N,length(ta)); %reconstruction vector
for i=1:N
 y(i,:)=h(i)*rectpuls(Fs*ta-i+1);
end

%ERWTHMA4
T=.1; %time_window=0.1
k=0:T:1; %time index
Fs=1/T; %sample rate to opoio isoutai me 1/T
N=length(k); %plithos twn sample "dots"
p=cos(100*pi*k)+cos(200*pi*k)+sin(500*pi*k);% our signal
taa=0:.001:1; %xronos anakataskevhs
m=zeros(N,length(taa)); %reconstruction vector
for i=1:N
 m(i,:)=p(i)*rectpuls(Fs*taa-i+1);
end
plot(taa,sum(m),ta,sum(y),t,x); %parousiash tou arxikouk ito uanakataskevasmenou shmmatos

