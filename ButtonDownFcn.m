function [x,y]=ButtonDownFcn(src,event)  
                pt = get(gca,'CurrentPoint');    %获取当前点坐标  
                x = pt(1,1);  
                y = pt(1,2);  
                %set(gcf,'WindowButtonMotionFcn',@ButtonMotionFcn); %设置鼠标移动响应  
                fprintf('x1=%f,y1=%f\n',x,y); 
                %set(gcf, 'WindowButtonDownFcn', '');
                set(gcf,'WindowButtonUpFcn',@ButtonUpFcn);
                %plot(x,y,'*');
       