
function histo(d,rate,ofs)

dn=('C:\Documents and Settings\mwickram\My Documents\LabVIEW Data\');
sdir=d(1:7);
D=strcat(dn,sdir,'\',d);
data=load(D);
data= data(1:end,1);

data=sgolayfilt(data,2,21); % filter
[nr,nc]=size(data);  %  #rows , # columns
t=[0:nr-1]./rate; 
t=t';

cd ('C:\Documents and Settings\mwickram\My Documents\MATLAB\mahesh')

[ind,amp]=p_findpeak(data,ofs);


T=diff(ind) ;%T=diff(ind)/rat
T=T./rate;
Tm=max(T)
Tmi=min(T)
vT=var(T);
mean_T=mean(T);


figure(1)

h=subplot(2,2,3);
set(h,'fontsize',14,'FontName','Arial');
g=plot(T, '-Ok');
set(g(1),'markeredgecolor','k','markerfacecolor','k','linewidth',2);
ylabel('\itT\rm_n (s)','FontName','Arial');
xlabel('\itn','FontName','Arial');


h=subplot(2,2,4);
set(h,'fontsize',14,'FontName','Arial');
T=T./mean(T);
vT1=var(T);
[n_y,n_x]=hist(T,0.6:0.045:1.45);
n_y=n_y/length(T);
%n_x=n_x;
g=bar(n_x,n_y,'Facecolor','k');
xlabel('\itT / <T>','FontName','Arial');
ylabel('\itp','FontName','Arial');

      
disp('mean   var(T) var(T/<T>) std  max(T/<T>) min(T/<T>)')
data=[mean_T vT vT1 std(T) max(T) min(T)]


cd ('C:\Documents and Settings\mwickram\My Documents\mahesh\LAB_work\Precisoin\final')




%plot(data(:,1),t,ind,amp)


