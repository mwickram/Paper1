function p=get_phasep(dat,dar,enum,row,erow,re,im)

dn=('C:\Documents and Settings\mwickram\My Documents\LabVIEW Data\');

sdir=dat(1:7);
Data=strcat(dn,sdir,'\',dat);
data1=load(Data);
data1=data1(30001:end,:);

switch dar
    case 200
        n=[-1.3 2.7 0 1500 0 1500 0 76];
        m=[-1.3 2.7 -5000 15000 -10 5 0 3.5];
    case 1000
        n=[-20 40 0 300 0 300 0 15];
        m=[-20 40 -5000 15000 -20 20 0 25];
end

for k=2:enum
    
data=data1(1:end,k);
d=sgolayfilt(data,2 ,21);
d=d-mean(d);

h = hilbert(d); % for phase coherent chaos
h=h + re + im*(i);%used for rossler model and haim model
%used for experimental data
h =dar*diff(h);% derivative hilbert transformation
h=h + re + im*(i);%used for rossler model and haim model
%h=h-3e-3-1e-3*i;% mainly used for non-phase coherent data
h=sgolayfilt(h,2,21);

fc=14;
figure(k)

g=subplot(2,2,1); 
set(g,'fontsize',fc,'FontName','Arial');
plot(h(30000:45000),'-k','linewidth',0.00001);
dat(8)='-';
%title([dat ' ' 'Electrode' num2str(k)])
%grid
ylabel('d\itH \rm/d\itt \rm(mA/s)','FontName','Arial')
xlabel('d\iti \rm/d\itt \rm(mA/s)','FontName','Arial')
xlim([n(1) n(2)]);ylim([m(1) m(2)])


p(:,1)=unwrap(angle(h(row:end-erow)));
t=(1:length(p(:,1)))/dar;
disp(dat)

g=subplot(2,2,2);
set(g,'fontsize',fc,'FontName','Arial');
plot(t,p,'k','linewidth',2);
ylabel('\phi (rad)','FontName','Arial');
xlabel('\itt \rm(s)','FontName','Arial');
%title('Phase Vs Time');
xlim([n(3) n(4)]); ylim([m(3) m(4)]);

g=subplot(2,2,3);
set(g,'fontsize',fc,'FontName','Arial');
plot(t(1:400:end),detrend(p(1:400:end)),'k','linewidth',0.3);
ylabel('\phi - 2\pi\omega\itt \rm(rad)','FontName','Arial')
xlabel('\itt \rm(s)','FontName','Arial')
%title('Detrended Phase')
xlim([n(5) n(6)]);ylim([m(5) m(6)])

g=subplot(2,2,4);
set(g,'fontsize',fc,'FontName','Arial');
pd(p,dar);
xlim([n(7) n(8)]);ylim([m(7) m(8)])

fout=strcat('slide',num2str(k),'.tiff');
print('-dtiff','-r300', fout)
end




