%% The data used in the paper
M30=load("30-Mo.mat");M3=M30.Mo;
M50=load("50-Mo.mat");M5=M50.Mo;
M100=load("100-Mo1.mat");M10=M100.Mo;
% M100=load("open-Xad.mat");Xad=Xady.Xad;
%% fig 4
figure(3)
CList=slanCL(11,1:nN);
plot(M3(10,1:9),'-','LineWidth', 1.5,'color',CList(1,:));hold on;
plot(M5(10,1:11),'-','LineWidth', 1.5,'color',CList(2,:));hold on;
plot(M10(10,1:15),'-','LineWidth', 1.5,'color',CList(4,:));hold on;
grid on;
legend('N=30','N=50','N=100','FontSize',14);
xlim([1 15]);
set(gca,'FontSize',14);
ylabel('State value of $M_{eig}$','FontSize',16,'FontWeight','normal','Color','black','Interpreter','latex')

