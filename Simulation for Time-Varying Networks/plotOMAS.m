zero=zeros(1,kmax);
s=zeros(1,kmax);
for k=1:1:kmax
    for m=1:1:nN
        if X(m,k)~= 0
            s(1,k)=s(1,k)+1;
        end
    end
end
for k=1:1:kmax
Ybar(:,k)=[mean(X(:,k)')]*nN/s(1,k);%
yerr(:,k)=X(:,k)-kron(ones(nN,1),Ybar(:,k));%
Ybarad(:,k)=[mean(Xad(:,k)')]*nN/s(1,k);
yerrad(:,k)=Xad(:,k)-kron(ones(nN,1),Ybarad(:,k));
end

figure(3)
subplot(4,1,1);
CList=slanCL(11,1:nN);
for m=1:2:T
       plot(1:t(1,m)-1,X(2*m,1:t(1,m)-1),'-','LineWidth', 1.5,'color',CList(m,:));hold on;
       plot(t(1,m)-1,X(2*m,t(1,m)-1),'o','MarkerSize', 10,'LineWidth', 1.5,'color',CList(m,:));hold on;
end
for m=2:2:T
    plot(t(1,m),X(2*m,t(1,m)),'*','MarkerSize', 7,'color',CList(m,:));hold on;
    plot(t(1,m):kmax,X(2*m,t(1,m):kmax),'-','LineWidth', 1.5,'color',CList(m,:));hold on;
end
q=3;%Removal of the leaving agent
for m=1:2:nN
    if m~=q
         plot(1:kmax,X(m,1:kmax),'-','LineWidth', 1.5,'color',CList(m,:));hold on;
    else
        q=q+6;
    end
end
% ylim([-18 22]);
xlim([1 80]);
grid on;
legend('Agent state $x_i(k)$','FontSize',12,'FontWeight','normal','Interpreter','latex');
title(['Control strategy in [13]'],'FontSize',12);
% xlabel('Times k','FontName','Arial','FontSize',10);
set(gca,'FontSize',14);

subplot(4,1,2);
for m=1:2:T
       plot(1:t(1,m)-1,yerr(2*m,1:t(1,m)-1),'--','LineWidth', 1.5,'color',CList(m,:));hold on;
       plot(t(1,m)-1,yerr(2*m,t(1,m)-1),'o','MarkerSize', 10,'LineWidth', 1.5,'color',CList(m,:));hold on;
end
for m=2:2:T
       plot(t(1,m),yerr(2*m,t(1,m)),'*','MarkerSize', 7,'color',CList(m,:));hold on;
       plot(t(1,m):kmax,yerr(2*m,t(1,m):kmax),'--','LineWidth', 1.5,'color',CList(m,:));hold on; 
end
q=3;%Removal of the leaving agent
for m=1:2:nN
    if m~=q
        plot(1:kmax,yerr(m,1:kmax),'-','LineWidth', 1.5,'color',CList(m,:));hold on;
    else
        q=q+6;
    end 
end
plot(zero,'LineWidth',1,'color','r');hold on;
xlim([1 80]);
% ylim([-15 15]);
grid on;
legend('Consensus error $\theta_i(k)$','FontSize',12,'FontWeight','normal','Interpreter','latex');
xlabel('Time step k','FontName','Arial','FontSize',14);
set(gca,'FontSize',14);

subplot(4,1,3);
for m=1:2:T
      plot(1:t(1,m)-1,Xad(2*m,1:t(1,m)-1),'-','LineWidth', 1.5,'color',CList(m,:));hold on;
      plot(t(1,m)-1,Xad(2*m,t(1,m)-1),'o','MarkerSize', 10,'LineWidth', 1.5,'color',CList(m,:));hold on;
end
for m=2:2:T
       plot(t(1,m),Xad(2*m,t(1,m)),'*','MarkerSize', 7,'color',CList(m,:));hold on;
       plot(t(1,m):kmax,Xad(2*m,t(1,m):kmax),'-','LineWidth', 1.5,'color',CList(m,:));hold on;
end
q=3;%Removal of the leaving agent
for m=1:2:nN
    if m~=q
        plot(1:kmax,Xad(m,1:kmax),'-','LineWidth', 1.5,'color',CList(m,:));hold on;
    else
        q=q+6;
    end
end
xlim([1 80]);
% ylim([-18 22]);
grid on;
legend('Agent state $x_i(k)$','FontSize',12,'FontWeight','normal','Interpreter','latex');
title(['Control strategy in this paper'],'FontSize',12);
% xlabel('Times k','FontName','Arial','FontSize',10);
set(gca,'FontSize',14);

subplot(4,1,4);
for m=1:2:T
       plot(1:t(1,m)-1,yerrad(2*m,1:t(1,m)-1),'--','LineWidth', 1.5,'color',CList(m,:));hold on;
       plot(t(1,m)-1,yerrad(2*m,t(1,m)-1),'o','MarkerSize', 10,'LineWidth', 1.5,'color',CList(m,:));hold on; 
end
for m=2:2:T
       plot(t(1,m),yerrad(2*m,t(1,m)),'*','MarkerSize', 7,'color',CList(m,:));hold on;
       plot(t(1,m):kmax,yerrad(2*m,t(1,m):kmax),'--','LineWidth', 1.5,'color',CList(m,:));hold on;
end
q=3;%Removal of the leaving agent
for m=1:2:nN
    if m~=q
        plot(1:kmax,yerrad(m,1:kmax),'-','LineWidth', 1.5,'color',CList(m,:));hold on;
    else
        q=q+6;
    end
end
plot(zero,'LineWidth',1,'color','r');hold on;
xlim([1 80]);
% ylim([-15 15]);
grid on;
legend('Consensus error $\theta_i(k)$','FontSize',12,'FontWeight','normal','Interpreter','latex');
% title(['Control strategy in [5]'],'FontSize',12);
xlabel('Time step k','FontName','Arial','FontSize',10);
% ylabel('Consensus error \theta_i(k)','FontName','Arial','FontSize',10)
set(gca,'FontSize',14);

