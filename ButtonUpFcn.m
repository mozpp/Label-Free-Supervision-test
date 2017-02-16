function [x2,y2]=ButtonUpFcn(src,event)  
%[x1,y1]=ButtonDownFcn;
pt = get(gca,'CurrentPoint');  
x2 = pt(1,1);  
y2 = pt(1,2);  
fprintf('x2=%f,y2=%f\n',x2,y2);  
A=[x1,x2,x2,x1,x1;y1,y1,y2,y2,y1];
plot(A(1,:),A(2,:));
set(gcf, 'WindowButtonMotionFcn', '');    %取消鼠标移动响应  