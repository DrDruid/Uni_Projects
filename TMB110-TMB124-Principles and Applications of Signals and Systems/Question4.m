clc,clear,close all
T=.1; %time_window=0.1
t=0:T:1; %time index
Fs=1/T; %sample rate to opoio isoutai me 1/T
N=length(t); %plithos twn sample "dots"
x=cos(100*pi*t)+cos(200*pi*t)+sin(500*pi*t);% our signal
ta=0:.001:1; %xronos anakataskevhs
y=zeros(N,length(ta)); %reconstruction vector
for i=1:N
 y(i,:)=x(i)*rectpuls(Fs*ta-i+1);
end
plot(ta,sum(y),t,x); %parousiash tou arxikouk ito uanakataskevasmenou shmmatos
