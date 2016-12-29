function pd (p,dar)
p=detrend(p);
np=length(p);
ml=floor(np/20);
NTAU=[200:10:ml];
l=length(NTAU);
for k=1:l
D(k)=pd_std(p,NTAU(k));
end


D=D(1:end);
NTAU= NTAU(1:end);

%tem=input('Temperature:');

polf=polyfit(NTAU/dar,D,1);
slope=polf(1);
phased=polf(1)/2;
disp(['Phase Diffusion Coefficient',' ',num2str(phased)])
fitpd=polyval(polf,NTAU/dar);

h=plot(NTAU/dar,D,'k',NTAU/dar,fitpd,'r');
set(h(2), 'linewidth',2)
title(['D=1/2\times d(\sigma^2)/dt','=',  num2str(phased)]);%, ' ','at',' ', num2str(tem),'^0C'])
xlabel('\tau \rm(s)','fontsize',14,'FontName','Arial')
ylabel('\sigma^2 (rad^2)','fontsize',14,'FontName','Arial')
end

% x1= NTAU/dar;
% x1=x1';
% length(x1)
% x2=ones(1,length(x1))';
% X=[x1 x2];
% D=D';
% 
% 
% [a b]= regress(D,X)

%upp1=upp(1,:)*[ones(1, length(fitpd))];
%upp2=upp(2,:)*[ones(1, length(fitpd))];


%plot(NTAU/dar,D,NTAU/dar,fitpd,'r');

% figure(2)
%errorbar(x1,fitpd,upp1, upp2)