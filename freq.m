function freq

d=load('mf0225091.dat');
fc=14;
R=8.314 % gas constant
figure(1)

h=subplot(2,2,1);
set(h,'fontsize',fc,'FontName','Arial');
%p=polyfit(data(,f,2);
%fit=polyval(p,T);
g=plot(d(:,1),d(:,2),'-ok','markerfacecolor','k','Linewidth',2);
xlabel('\itT \rm(K)','FontName','Arial');
ylabel('\it<i> \rm(mA)','FontName','Arial');
%title('Frequency vs Temperature');
xlim([280 305]);ylim([0.2 1.2]);

h=subplot(2,2,2);
set(h,'fontsize',fc,'FontName','Arial');
p=polyfit(1./d(:,1),log(d(:,2)),1);
fit=polyval(p,1./d(:,1));

g=plot(1000*1./d(:,1),log(d(:,2)),'ok',1000*1./d(:,1),fit,'-r');
set(g(1),'markerfacecolor','k');
set(g(2),'lineWidth',2);
xlabel('1/\itT \rm\times1000 (K^-^1)','FontName','Arial');
ylabel('ln( \it<i> \rm)','FontName','Arial');
title(['ln(i) vs 1/T','     ', 'E_a','= ', num2str(-p(1)*R)]);
xlim([3.27 3.55]);ylim([-1.6 0.5]);


h=subplot(2,2,3);
set(h,'fontsize',fc,'FontName','Arial');
plot (d(:,1),d(:,3),'o-k','markerfacecolor','k','linewidth',2);
%title('Current vs Temperature');
xlabel('\itT \rm(K)','FontName','Arial');
ylabel('\omega (Hz)','FontName','Arial');
xlim([280 305]);ylim([0 7]);


h=subplot(2,2,4);
set(h,'fontsize',fc,'FontName','Arial');
s=polyfit(1./d(:,1),log(d(:,3)),1);
fit=polyval(s,1./d(:,1));
 
g=plot(1000*1./d(:,1),log(d(:,3)),'ok',1000*1./d(:,1),fit,'-r');
set(g(1),'markerfacecolor','k');
set(g(2),'lineWidth',2);
xlabel('1/\itT \rm\times1000 (K^-^1)','FontName','Arial');
ylabel('ln(\omega)','FontName','Arial');
t=title(['ln(\omega) vs 1/T','      ','E_a','=',num2str(-s(1)*R)]);
xlim([3.27 3.55]);ylim([0 2]);