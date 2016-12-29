    function get_phase2(dat,dar)

dn=('C:\Documents and Settings\mwickram\My Documents\LabVIEW Data\');

sdir=dat(1:7);
Data=strcat(dn,sdir,'\',dat);
data1=load(Data);
row=100;
if dat(1)=='h'
    data1=data1(30000:end,2);
    row=1000;
end


data=data1(1:end,1);
d=sgolayfilt(data,2 ,21);
d=d-mean(d);

h = hilbert(d); % for phase coherent chaos
%used for experimental data
h =dar*diff(h);
%h=h + re + im*(i);%used for rossler model and haim model
%h=h-3e-3-1e-3*i;% mainly used for non-phase coherent data
h=sgolayfilt(h,2,21);



p(:,1)=unwrap(angle(h(row:end-row)));
t=[1:length(p(:,1))]/dar;

p=detrend(p);
np=length(p);
ml=floor(np/20);
NTAU=[200:10:ml];
l=length(NTAU);
for k=1:l
D(k)=pd_std(p,NTAU(k));
end


polf=polyfit(NTAU/dar,D,1);
disp(['Phase Diffusion Coefficient',' ',num2str(polf(1)/2)])
fitpd=polyval(polf,NTAU/dar);






