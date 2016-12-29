function lyap

k=2; l=2; m=1;
% Experimental data
d=load('mf0225091.dat');
fc=14;
R=8.314;
figure(1)

d(:,4)=d(:,4)./2 ;% Diffusion coeffiennt should be divided by 2 

h=subplot(k,l,m);
set(h,'fontsize',fc,'FontName','Arial');
rpd=d(:,4)./d(:,3);
plot(d(:,1),rpd,'-ok','markerfacecolor','k','Linewidth',2);
xlabel('\itT \rm(K)','FontName','Arial');
ylabel('\itD\rm_r (rad^2)','FontName','Arial');%,'FontAngle','italic','Hz');
xlim([280 305]);ylim([0 0.1]);

h=subplot(k,l,m+1);
set(h,'fontsize',fc,'FontName','Arial');

p=polyfit(1./d(:,1),log(rpd),1);
fit=polyval(p,1./d(:,1));
g=plot(1000*1./d(:,1),log(rpd),'ok',1000*1./d(:,1),fit,'-r');
set(g(1),'markerfacecolor','k','Linewidth',2)
set(g(2),'markerfacecolor','k','Linewidth',2)
xlabel('1/\itT \rm\times1000 (K^-^1)','FontName','Arial');
ylabel('ln(\itD\rm_r)','FontName','Arial');
title(['E_a','= ',num2str(-p(1)*R)]);
xlim([3.27 3.55]);ylim([-5.5 -2]);

h=subplot(k,l,m+2);
set(h,'fontsize',fc,'FontName','Arial');
rlambda=d(:,5)./d(:,3);

g=plot (d(:,1),d(:,5),'o--k',d(:,1),rlambda,'-^b');
set(g(1),'markerfacecolor','k','Linewidth',2)
set(g(2),'markerfacecolor','b','Linewidth',2)
xlabel('\itT \rm(K)','FontName','Arial');
ylabel('\lambda (s^-^1), \lambda_r','FontName','Arial');
xlim([280 305]);ylim([0 9]);

h=subplot(k,l,m+3);
set(h,'fontsize',fc,'FontName','Arial');
%s=polyfit(1./data(:,1),log(rphase),1);
%fit=polyval(s,1./data(:,1));
 
plot(d(:,1),d(:,6),'-ok','markerfacecolor','k','Linewidth',2);
xlabel('\itT \rm(K)','FontName','Arial');
ylabel('\itd\rm_i','FontName','Arial');
xlim([280 305]);ylim([2.3 2.8]);