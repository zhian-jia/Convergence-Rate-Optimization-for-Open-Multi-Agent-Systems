clear all;close all;clc;
open=0;%
nN=50;kmax=15;
flag=ones(nN,1); flag1=sum(flag(:,1));
I=zeros(nN);
Zm = zeros(nN,nN,kmax);
Zad = zeros(nN,nN,kmax);
X = zeros(nN,kmax);
Xad = zeros(nN,kmax);
X(:,1)=[-10+round(60*rand(1,nN))]';
Xad(:,1)=X(:,1);
rho=2;
Mo = zeros(nN,kmax);%M_eig
Mw = zeros(nN,nN,kmax);
Wij;
E1=zeros(nN,nN);E2=zeros(nN,nN); Z = zeros(nN,nN,nN);Mm = zeros(nN,nN,nN);
%%
for k=2:1:kmax    
    M = zeros(1,nN); Mz = zeros(1,nN); tt=2;%Mad = ones(nN,nN);
    while (flag1>0)   
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
                if W(i,j,k-1) ~= 0 %
                     Mz(1,i)= Mz(1,i) + Zm(i,j,k-1);  
                end
            end
        end 
        if W(i,i,k) ~= 0
            if W(i,i,k-1) ~= 0
                X(i,k)= X(i,k-1)+M(1,i)+Mz(1,i);
                Zad(i,:,k)=Zad(i,:,k-1)+(I(i,:)-Wa(i,:,i))*Xad(:,k-1);
                Xad(i,k)=Wa(i,:,i)*Xad(:,k-1);%
            end
            if W(i,i,k-1) == 0
                xx=rand;
                X(i,k)= X(i,1)+xx;%
                Xad(i,k)= Xad(i,1)+xx;%
            end
        end
        Mw(i,:,k)=Wa(i,:,i);
    end  
end
%% plot fig 3
figure(1)
CList=slanCL(11,1:nN);q=2;
subplot(1,2,1);
for i=1:1:nN
    if i~=q
         plot(X(i,:),'--','LineWidth', 1.5,'color',CList(i,:));hold on;
    else
        q=q+5;
    end
end
xlim([1 10]);
grid on;
legend('Agent state $x_i(k)$','FontSize',14,'FontWeight','normal','Interpreter','latex');
title(['Control strategy in [13]'],'FontSize',12);
% xlabel('Times k','FontName','Arial','FontSize',10);
set(gca,'FontSize',14);

subplot(1,2,2);q=2;
for i=1:1:nN
    if i~=q
         plot(Xad(i,:),'--','LineWidth', 1.5,'color',CList(i,:));hold on;
    else
        q=q+5;
    end
end
xlim([1 10]);
grid on;
legend('Agent state $x_i(k)$','FontSize',14,'FontWeight','normal','Interpreter','latex');
title(['Control strategy in this paper'],'FontSize',12);
% xlabel('Times k','FontName','Arial','FontSize',10);
set(gca,'FontSize',14);



figure(2)
plot(1:10,Mo(10,1:10),'--','LineWidth', 1.5,'color',CList(i,:));hold on;
