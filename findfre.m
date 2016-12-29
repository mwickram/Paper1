  function findfre(d,rate,ntau,re,im,cal,select)

dn=('C:\Documents and Settings\mwickram\My Documents\LabVIEW Data\');
sdir=d(1:7);
D=strcat(dn,sdir,'\',d);
data1=load(D);



if select==0
    data1=data1(30000:end,2);
end
    

data = data1(1:end,1);
disp(['Delay', '   ',  num2str(ntau/rate),' ', 'seconds'])

data=sgolayfilt(data,2,21); % filter
[nr,nc]=size(data);  %  #rows , # columns
t=[0:nr-1]./rate; t=t';

meanos=mean(data(:,1)); %calculate mean current
disp(['Mean Current','  ', num2str(meanos),' ','mA'])

if cal==0
    
figure(1)

A=subplot(3,2,1);
get(A,'position');
set(A,'position',[0.07  0.7093   0.9  0.2157]);
plot(t, data(:,1))%,t,data(:,2));
xa=input('xa =');
xb=input('xb =');
xlim([xa, xb]);
potential=input('Potential=');tem=input('Temperature=');res=input('Resistant=');

title (['Potential', ' ', num2str(potential),' ', 'mV', ',', 'Temperature', ' ', num2str(tem),' ','^0','C',',', num2str(res),' ','\Omega','          ', num2str(d)]);
%get(H(5),'position')
xlabel('Time (s)')
ylabel('Current (mA)')

end



difos=data(:,1)-meanos;
Hdifos=hilbert(difos);
dHi=diff(Hdifos);

%select=input('Hilbert selection  1/0 =');


 if select==1
 dHi=dHi-3e-3-1e-3*i;%used this for exp
 dHi = dHi(1000:end-1000);
 %phs=angle([dHi - 0.0025])
 %dHi = dHi+ re + im*(i);
 %DHi= dHi + re + im*(i);
 
  if cal==0 %select 0 to dispaly figure
   
   subplot(3,2,3)  
   H=plot(dHi(1000:end-1000),imag(dHi(1000:end-1000)));
   title ('diff(Hilbert Transformation)')
   grid
   
   
  end

 else if select==0
          %dHi=dHi+ 0.0001-i*0.0005;
          %dHi=dHi(1000:end-1000);
          dHi = dHi+ re + im*(i);% Haim and Rossler model
          dHi=dHi(1000:end-1000);
         if cal==0
         subplot(3,2,3)  
         plot(dHi(1000:end-1000));
         grid
         end
         
     end
 end
   
    
phs=angle(dHi) ;   
%phs=angle([dHi - 0.0025]);
Uphs=unwrap(phs);
p= polyfit(t(1000:end-1001),Uphs,1) ;%p=ployfit(X,Y,N) --> P(1)*X^N + P(2)*X^(N-1) +...+ P(N)*X + P(N+1)
fit=polyval(p,t(1000:end-1001));  %Y = POLYVAL(P,X) returns the value of a polynomial P evaluated at X. 
                 %P is a vector of length N+1 whose elements are the
                 %coefficients of the
                 %polynomial in descending powers. --->
                 %Y = P(1)*X^N + P(2)*X^(N-1) + ... + P(N)*X + P(N+1)
if cal==0     
    
subplot(3,2,4)
%g=plot(t(1:end-1),Uphs,'d',t(1:end),fit,'r');% FOR diff(H)
g=plot(t(1:end),Uphs,'d',t(1:end),fit,'r');
grid 
legend('Real', 'polynomial','Location','Best')
set(g(1),'markersize',2,'markeredgecolor','g','markerfacecolor','g');
Frequency = p(1)/(2*pi)
disp (['Period=' num2str(1/Frequency)])
title(['Frequency' ' '   num2str(Frequency)])
ylabel('Phase (radian)')
xlabel('Time (s)')
end


Frequency = p(1)/(2*pi)
disp (['Period=' num2str(1/Frequency)])

end

 
 



