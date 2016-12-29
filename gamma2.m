function gamma2

%load this file mf0225092.dat

k=2;l=2;m=1; 
d=load('mf0225092.dat');
fc=14;

d=[d(:,1)/0.8 d(:,2:end)] %alpha=Gamma_2/0.8 where Gamma_2=d(:,1)

figure(1)

h=subplot(k,l,m);
set(h,'fontsize',fc,'FontName','Arial');
p=polyfit(d(:,1),d(:,2),1);
fit=polyval(p,d(:,1));
g=plot(d(:,1),d(:,2),'ok',d(:,1) ,fit,'--r');
set(g(1),'markerfacecolor','k')
set(g(2),'lineWidth',2);
xlabel('\alpha','FontName','Arial');
ylabel('\omega','FontName','Arial');%,'FontAngle','italic','Hz');

ylim([0.065 0.08]);
xlim([0.95 1.4]);


h=subplot(k,l,m+1);
set(h,'fontsize',fc,'FontName','Arial');
rphase=d(:,3)./(2*d(:,2));%dividing d(:,3)/2 gives phase diffusion.

s=polyfit(d(:,1),rphase,1);
fit=polyval(s,d(:,1));
g=plot (d(:,1),rphase,'ok',d(:,1),fit,'--r');
set(g(1),'markerfacecolor','k');
set(g(2),'lineWidth',2);
xlabel('\alpha','FontName','Arial');
ylabel('\itD\rm_r','FontName','Arial');
%title(['E_a','=',num2str(-s(1))]);

ylim([0 0.07]);
xlim([0.95 1.4]);


h=subplot(k,l,m+2);
set(h,'fontsize',fc,'FontName','Arial');
rlambda=d(:,4)./d(:,2)

g=plot (d(:,1),rlambda,'o--k');
set(g(1),'markerfacecolor','k','lineWidth',2);
xlabel('\alpha','FontName','Arial');
ylabel('\lambda_r');
ylim([0.25 0.55]);
xlim([0.95 1.4]);


h=subplot(k,l,m+3);
set(h,'fontsize',fc,'FontName','Arial'); 
g=plot(d(:,1),d(:,5),'--ok','markerfacecolor','k','lineWidth',2);
xlabel('\alpha','FontName','Arial');
ylabel('\itd\rm_i');
xlim([0.95 1.4]);
ylim([1.65 1.85]);


distribution=100*(max(d(:,2))-min(d(:,2)))/(2*mean(d(:,2)))
