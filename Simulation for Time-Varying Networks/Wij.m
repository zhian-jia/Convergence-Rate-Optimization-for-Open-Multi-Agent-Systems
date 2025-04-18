W = (1/nN)*ones(nN,nN,kmax);s=(1/nN);Wa =zeros(nN,nN,nN);
if(open == 1)
 t=unique(randi([4, kmax-1], 1, min(kmax/5,nN/2)));
%  t=unique(randi([3, kmax-1], 1, kmax-4));
 T=numel(t);   
    for i=2:2:T
        W(2*i,2*i,[1:t(1,i)-1])=0;
    end
    for i=1:2:T
        W(2*i,2*i,[t(1,i) : kmax])=0;
    end
else
t=1*ones(1,nN);T=numel(t);  
end
Lx=unique(randi([1, nN], 1, nN/2));
K=numel(Lx);
for i=1:1:K
    for j=i+1:1:K
         W(Lx(i),Lx(j),1:kmax)=0;
         W(Lx(j),Lx(i),1:kmax)=0;
    end
end
for i=3:6:nN
W(i,i,1:kmax) = 0;
end
for k=1:1:kmax    
    for i=1:1:nN
        if W(i,i,k) == 0
            W(i,:,k)=0;
            W(:,i,k)=0;
        end
    end
end
%%
k=1;
mo;

