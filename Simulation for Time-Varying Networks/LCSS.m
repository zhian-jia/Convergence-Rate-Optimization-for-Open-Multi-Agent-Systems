clear all;close all;clc;
open=1;%
nN=30;kmax=80;tmax=15;tt=2;
flag=ones(nN,1); flag1=sum(flag(:,1));
I=zeros(nN);
Zm = zeros(nN,nN,kmax);
Zad = zeros(nN,nN,kmax);
X = zeros(nN,kmax);
Xad = zeros(nN,kmax);
X(:,1)=[-10+round(60*rand(1,nN))]';
Xad(:,1)=X(:,1);
rho=2;
Mo = zeros(nN,kmax);
Wij;
E1=zeros(nN,nN);E2=zeros(nN,nN); Z = zeros(nN,nN,nN);Mm = zeros(nN,nN,nN);
%%
for k=2:1:kmax    
    M = zeros(1,nN); Mz = zeros(1,nN); %Mad = ones(nN,nN);
    for i=1:1:T
        if k-1==t(i)
            flag=ones(nN,1); flag1=sum(flag(:,1));E1=zeros(nN,nN);E2=zeros(nN,nN); Z = zeros(nN,nN,nN);Mm = zeros(nN,nN,nN);
            oones=ones(nN,1);nNn=nN;Mo = zeros(nN,kmax);tt=2;
            mo;
            break;
        end
    end
    while (flag1>0 && tt<=tmax)   
        for i=1:1:nN
           ADMM1;%W(k) update
        end
        for i=1:1:nN
            if abs(Mo(i,tt)-Mo(i,tt-1))+5/nNn*abs(L(i,:)*Mo(:,tt))<=0.01 %Stopping Criterion
               flag(i)=0;
            end
        end
        tt=tt+1
        flag1=sum(flag(:,1));
    end
    for i=1:1:nN    
        %
        for j=1:1:nN
            if W(i,j,k) ~= 0  %
                if W(i,j,k-1) ~= 0 %                   
                    M(1,i)= M(1,i) + W(i,j,k-1)*(X(j,k-1)-X(i,k-1));
                    Zm(i,j,k)=Zm(i,j,k-1)-W(i,j,k-1)*(X(j,k-1)-X(i,k-1));                 
                end
            else
                if W(i,j,k-1) ~= 0 %表示消失的节点
                     Mz(1,i)= Mz(1,i) + Zm(i,j,k-1);  
                end
            end
        end 
        if W(i,i,k) ~= 0
            if W(i,i,k-1) ~= 0
                X(i,k)= X(i,k-1)+M(1,i)+Mz(1,i);
                Xad(i,k)=Wa(i,:,i)*Xad(:,k-1);%
            end
            if W(i,i,k-1) == 0
                xx=rand;
                X(i,k)= X(i,1)+xx;%
                Xad(i,k)= Xad(i,1)+xx;%
            end
        end
    end  
end
%% plot
plotOMAS;