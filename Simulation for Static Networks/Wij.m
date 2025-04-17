W = (1/nN)*ones(nN,nN,kmax);s=(1/nN);Wa =zeros(nN,nN,nN);
if(open == 1)
 t=unique(randi([3, kmax-1], 1, nN/2));
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
for i=2:5:nN
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
%% 1_k update
oones=ones(nN,1);nNn=nN;
     for g=1:1:nN
            if W(g,g,2)==0
                oones(g,1)=0;
                nNn=nNn-1;
            end
     end
%% 
L = zeros(nN,nN);ML=zeros(1,nN);k=1;eyek=zeros(nN,nN);L1 = zeros(nN,nN);ML1=zeros(1,nN);
for i=1:1:nN
    for j=1:1:nN
        if W(i,j,k)~=0 & i~=j
             L(i,j)=-1;%
             L1(i,j)=-W(i,j,k);%
             ML(1,i)=ML(1,i)-L(i,j);%
             ML1(1,i)=ML1(1,i)+W(i,j,k);%
        end
    end
    if W(i,i,k)~=0
        L(i,i)= ML(1,i);L1(i,i)= ML1(1,i);
        eyek(i,i)= 1;
    end
end

for i=1:1:nN
    Waa(:,:,i)=eyek-L1;
    if W(i,i,k)==0 
      Mo(i,1)=0;
    else
      Mo(i,1)=norm(Waa(:,:,i)-(1/(nNn))*oones(g,1)*oones(g,1)',2);
    end
end