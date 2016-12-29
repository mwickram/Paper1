function timeser


%file m102408_1.dat rate=200;ntau=29; FOR 10 oC
%file m102008_13.dat rate=1000;ntau=33; FOR 30 oC

ntau=33;
rate=1000;

data=load('m102008_13.dat');
data=sgolayfilt(data,2,11); % filter
[nr,nc]=size(data);  %  #rows , # columns
t=[0:nr-1]./rate; 
t=t';

figure(1)

h=subplot(2,2,1);

set(h,'fontsize',14,'FontName', 'Arial');

plot(t, data(:,1),'k','linewidth',2);
xa=input('xa =');
xb=input('xb =');
xlim([xa, xb]);
%title (num2str(d))
xlabel('\itt \rm(s)','FontName','Arial');
ylabel('\iti \rm(mA)','FontName','Arial');

data=data(30000:37000,1);
set(h,'fontsize',14);

h=subplot(2,2,2);
set(h,'fontsize',14,'FontName', 'Arial');

x=data(1:end-ntau*2);
x2=data(ntau+1:end-ntau);
x3=data(ntau*2+1:end);

h=plot3(x,x2,x3,'k','linewidth',0.00001);

xlabel('\iti \rm(mA)','FontName','Arial');
ylabel(['\iti \rm(\itt \rm+',' ',num2str(ntau/rate),'s) (mA)'],'FontName','Arial');
zlabel(['\iti \rm(\itt \rm+',' ',num2str(2*ntau/rate),'s) (mA)'],'FontName','Arial');


switch rate
    
case 200
n=[0.05 0.17 0.05 0.3 0.17 0.4 -70 16];

case 1000
        
n=[0.4 1 0.5 1.25 0.65 1.5 -58 14];
        
end

xlim([n(1) n(2)]);
ylim([n(3) n(4)]);
zlim([n(5) n(6)]);
view([n(7) n(8)]);

end