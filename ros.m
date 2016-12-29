function ros

k=2; l=2; m=1;
d=load('mf0226091.dat');
d=d(1:end-3,:);
figure(1)

h=subplot(k,l,m);
set(h,'fontsize',14,'FontName','Arial');
p=polyfit(d(:,1),d(:,2),1);
fit=polyval(p,d(:,1));
g=plot(d(:,1),d(:,2),'ok',d(:,1),fit,'--r');
set(g(1),'markerfacecolor','k')
set(g(2),'lineWidth',2);
xlabel('\alpha','FontName','Arial');
ylabel('\omega','FontName','Arial');%,'FontAngle','italic','Hz');
%title('Frequency vs Temperature');
ylim([0.17 0.2])
xlim([0.7 1.25])

h=subplot(k,l,m+1);
set(h,'fontsize',14,'FontName','Arial');
rphase=d(:,3)./d(:,2);
p=polyfit(d(:,1),rphase,1);
fit=polyval(p,d(:,1));
g=plot (d(:,1),rphase,'ok',d(:,1),fit,'--r');
set(g(1),'markerfacecolor','k')
set(g(2),'lineWidth',2);
xlabel('\alpha','FontName','Arial');
ylabel('\itD\rm_r','FontName','Arial');
ylim([0 1.25])
xlim([0.7 1.25])

