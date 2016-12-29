%% get the time series of the laser dynamics

clear;clc;

x = rand(1, 3);

%x(1)=5;
%x(2)=0.5;
%x(3)=0.1;
%options=odeset('reltol',1e-6);

[t, y] = ode45(@NiODE, [0:0.1:8000], x);

length(y)
%y=y(30001:end,:);

%t=t(30001:end,1);

figure(2)
subplot(2,1,1);
y1=y(:,1)-mean(y(:,1));
y1=hilbert(y1);
plot(y1);


figure(1);
subplot(2,1,1);
plot(t,y(:,1));

subplot(2,1,2);
plot(y(1000:end,1), y(1000:end,2),'k-');




% yy = y(length(y)-101:end, :);
% save('betaFlow.dat', 'yy', '-ascii');
