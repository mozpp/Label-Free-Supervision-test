clear all; close all;
data=importdata('data.txt');
fid=fopen('data_inter.txt','w+');

% i=1
% while i<4
% 
%     t=data(i:(i+1),1)
% x1=data(i:(i+1),2);
% a=[t,ones(2,1)];
% X1abc=a\x1;
% y1=data(i:(i+1),3);
% Y1abc=a\y1
% x2=x1+data(i:(i+1),4);
% X2abc=a\x2;
% y2=y1+data(i:(i+1),5);
% Y2abc=a\y2;
% 
% for j=t(1):t(2)-1
%     x1j=[j,1]*X1abc;
%     y1j=[j,1]*Y1abc;
%     offset_x=[j,1]*X2abc-x1j;
%     offset_y=[j,1]*Y2abc-y1j;
% fprintf(fid,'%d,%.0f,%.0f,%.0f,%.0f\n',j,x1j,y1j,offset_x,offset_y); 
% end
% i=i+1
% end

% t=data(:,1);
% x1=data(:,2);
% t_1=t(1);t_2=t(2);t_3=t(3);t_4=t(4);
% x1_1=x1(1);
% % syms a b s v;
% % f1='a*b/(s-v*t(1))-a=x1(1)';
% % f2='a*b/(s-v*t(2))-a=x1(2)';
% % f3='a*b/(s-v*t(3))-a=x1(3)';
% % f4='a*b/(s-v*t(4))-a=x1(4)';
% %M=answer([a,b,s,v])
% x0=[1;1;10;0];
% options=optimset('Display','iter');
% [Xabc,fval] = fsolve(@answer,x0,options);
% Xabc
% % Xabsv(1)*Xabsv(2)/(Xabsv(3)-Xabsv(4)*1)-Xabsv(1)
% % Xabsv(1)*Xabsv(2)/(Xabsv(3)-Xabsv(4)*40)-Xabsv(1)
% % Xabsv(1)*Xabsv(2)/(Xabsv(3)-Xabsv(4)*80)-Xabsv(1)
% % Xabsv(1)*Xabsv(2)/(Xabsv(3)-Xabsv(4)*96)-Xabsv(1)
% for j=1:4
% %sin(Xabc(1))*(Xabc(2)*cot(Xabc(1))-(Xabc(4)-Xabc(5)*t(j)))*Xabc(3)/(csc(Xabc(1))*(Xabc(4)-Xabc(5)*t(j)))
% Xabc(1)*(t(1)+Xabc(4))^2+Xabc(2)*(t(1)+Xabc(4))+Xabc(3)
% end

for i=1:3
    
    if i==2
        t=data(i-1:i+1,1);
        x1=data(i-1:i+1,2)
        a=[t.^2,t,ones(3,1)]
        X1abc=a\x1;
        y1=data(i-1:i+1,3);
        Y1abc=a\y1;
        x2=x1+data(i-1:i+1,4);
        X2abc=a\x2;
        y2=y1+data(i-1:i+1,5);
        Y2abc=a\y2;
        
        for j=t(2):t(3)-1
            x1j=[j^2,j,1]*X1abc;
            y1j=[j^2,j,1]*Y1abc;
            offset_x=[j^2,j,1]*X2abc-x1j;
            offset_y=[j^2,j,1]*Y2abc-y1j;
            fprintf(fid,'%d,%.0f,%.0f,%.0f,%.0f\n',j,x1j,y1j,offset_x,offset_y);
        end
        
    else
        
        t=data(i:i+1,1);
        x1=data(i:i+1,2)
        a=[t,ones(2,1)]
        X1abc=a\x1;
        y1=data(i:i+1,3);
        Y1abc=a\y1;
        x2=x1+data(i:i+1,4);
        X2abc=a\x2;
        y2=y1+data(i:i+1,5);
        Y2abc=a\y2;
        
        for j=t(1):t(2)-1
            x1j=[j,1]*X1abc;
            y1j=[j,1]*Y1abc;
            offset_x=[j,1]*X2abc-x1j;
            offset_y=[j,1]*Y2abc-y1j;
            fprintf(fid,'%d,%.0f,%.0f,%.0f,%.0f\n',j,x1j,y1j,offset_x,offset_y);
        end
    end
end
% t=data(1:2,1);
% x1=data(1:2,2);
% a=[t,ones(2,1)];
% X1abc=a\x1;
% y1=data(1:2,3);
% Y1abc=a\y1;
% x2=x1+data(1:2,4);
% X2abc=a\x2;
% y2=y1+data(1:2,5);
% Y2abc=a\y2;
% 
% t_=data(:,1);
% for j=t(1):t_(3)
%     x1j=[j,1]*X1abc;
%     y1j=[j,1]*Y1abc;
%     offset_x=[j,1]*X2abc-x1j;
%     offset_y=[j,1]*Y2abc-y1j;
% fprintf(fid,'%d,%.0f,%.0f,%.0f,%.0f\n',j,x1j,y1j,offset_x,offset_y); 
% end

% t=data(:,1);
% x1=data(:,2);
% a=[t.^3,t.^2,t,ones(4,1)];
% X1abc=a\x1;
% y1=data(:,3);
% Y1abc=a\y1;
% x2=x1+data(:,4);
% X2abc=a\x2;
% y2=y1+data(:,5);
% Y2abc=a\y2;
% 
% for j=t(1):t(4)+10
%     x1j=[j^3,j^2,j,1]*X1abc;
%     y1j=[j^3,j^2,j,1]*Y1abc;
%     offset_x=[j^3,j^2,j,1]*X2abc-x1j;
%     offset_y=[j^3,j^2,j,1]*Y2abc-y1j;
% fprintf(fid,'%d,%.0f,%.0f,%.0f,%.0f\n',j,x1j,y1j,offset_x,offset_y); 
% end
