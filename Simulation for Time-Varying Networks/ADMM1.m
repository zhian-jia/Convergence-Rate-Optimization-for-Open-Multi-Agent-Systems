neighbor=0;Zz= zeros(nN,nN);
     if W(i,i,k)==0 || flag(i)==0
         Mo(i,tt)=Mo(i,tt-1);
         return;
     end
cvx_begin quiet 
    variables C(nN,nN)
    expressions cost
    cost = norm(C-(1/(nNn))*oones(:,1)*oones(:,1)',2)+trace(Mm(:,:,i)'*(C-Z(:,:,i))) +E1(:,i)'*(C*ones(nN,1)-oones(:,1)) +...
        E2(:,i)'*(C'*ones(nN,1)-oones(:,1))+(rho/2)*norm(C*ones(nN,1)-oones(:,1),2)+...
        (rho/2)*norm(C'*ones(nN,1)-oones(:,1),2)+(rho/2)*norm(C-Z(:,:,i),'fro');%this paper
%     cost = norm(C-(1/(nNn))*oones(:,1)*oones(:,1)',2)+E1(:,i)'*(C*ones(nN,1)-oones(:,1)) +...
%         E2(:,i)'*(C'*ones(nN,1)-oones(:,1))+(rho/2)*norm(C*ones(nN,1)-oones(:,1),2)+...
%         (rho/2)*norm(C'*ones(nN,1)-oones(:,1),2);%◊Ó”≈÷µ
minimize cost
    subject to 
     for q=1:1:nN
     for g=1:1:nN
            if W(g,g,k)==0
                C(g,:)==0;C(:,g)==0;
            end
             if W(q,g,k)==0 && q~=g
                 C(q,g)==0;
                 C(g,q)==0;
             end
     end
     end
cvx_end
    Wa(:,:,i) =  C;

E1(:,i)=E1(:,i)+rho*(Wa(:,:,i)*ones(nN,1)-oones(:,1));
E2(:,i)=E2(:,i)+rho*(Wa(:,:,i)'*ones(nN,1)-oones(:,1));

for m=1:1:nN %
    if W(i,m,k) ~= 0 %
          Zz(:,:)=Zz(:,:)+ Mm(:,:,m)*2/rho +Wa(:,:,m);%Mm(:,:,m)*2/rho
          neighbor=neighbor+1;          
    end          
end
Z(:,:,i)=(1/(neighbor))*Zz(:,:);%

Mm(:,:,i) = Mm(:,:,i) + rho/2*(Wa(:,:,i)-Z(:,:,i));

Mo(i,tt)=norm(Wa(:,:,i)-(1/(nNn))*oones(:,1)*oones(:,1)',2);
