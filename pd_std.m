function v=pd_std(p,ntau)
l=length(p); 
nl=mod(l,ntau); 
n=(l-nl)/ntau; 
for k=1:n
nstart=(k-1)*ntau+1;
nend=k*ntau;
dp(k)=p(nend)-p(nstart);
end
v=var(dp);

