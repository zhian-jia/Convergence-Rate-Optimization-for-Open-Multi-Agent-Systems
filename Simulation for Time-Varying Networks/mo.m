%Calculate matrix Mo
oones=ones(nN,1);nNn=nN;
     for g=1:1:nN
            if W(g,g,k)==0
                oones(g,1)=0;
                nNn=nNn-1;
            end
     end
L = zeros(nN,nN);ML=zeros(1,nN);eyek=zeros(nN,nN);L1 = zeros(nN,nN);ML1=zeros(1,nN);
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
      Mo(i,1)=norm(Waa(:,:,i)-(1/(nNn))*oones(:,1)*oones(:,1)',2);
    end
end