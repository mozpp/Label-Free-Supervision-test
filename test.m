clear all; close all;
file_path =  '/media/b3-542/Library/dataset_fenghuo/image3/';% 图像文件夹路径
img_path_list = dir(strcat(file_path,'*.jpg'));%获取该文件夹中所有jpg格式的图像
img_num = length(img_path_list);%获取图像总数量
data=importdata('data_inter2.txt');
try
    t_data=data(:,1);
    x_data=data(:,2);
    y_data=data(:,3);
    offset_x_data=data(:,4);
    offset_y_data=data(:,5);
catch
end

if img_num > 0 %有满足条件的图像
    j=1;i=1;
    while j <img_num &j>0%逐一读取图像
        image_name = img_path_list(j).name;% 图像名
        image =  imread(strcat(file_path,image_name));
        fprintf('%d %d %s\n',i,j,strcat(file_path,image_name));% 显示正在处理的图像名
        imshow(image);hold on
        
        %             set(gcf,'WindowButtonDownFcn',@ButtonDownFcn);
        %             [x1,y1]=ButtonDownFcn;
        %             %fprintf('x1=%f,y1=%f\n',x1,y1);
        %             %set(gcf,'WindowButtonMotionFcn',@ButtonMotionFcn);
        %             set(gcf,'WindowButtonUpFcn',@ButtonUpFcn);
        %             [x2,y2]=ButtonUpFcn;
        %             %A=[x1,x2,x2,x1,x1;y1,y1,y2,y2,y1];
        %             %plot(A(1,:),A(2,:));
        try
            for i=1:length(t_data)
                if j==t_data(i)
                    plot(x_data(i),y_data(i),'*');
                    x = [x_data(i) x_data(i)+offset_x_data(i) x_data(i)+offset_x_data(i) x_data(i) x_data(i)];
                    y = [y_data(i) y_data(i) y_data(i)+offset_y_data(i) y_data(i)+offset_y_data(i) y_data(i)];
                    
                    plot(x,y)
                    
                end
            end
        catch
        end
        k = waitforbuttonpress;              % 等待鼠标按下
        point1 = get(gca,'CurrentPoint');    % 鼠标按下了
        finalRect = rbbox;                   %
        point2 = get(gca,'CurrentPoint');    % 鼠标松开了
        point1 = point1(1,1:2);              % 提取出两个点
        point2 = point2(1,1:2);
        p1 = min(point1,point2);           % calculate locations
        offset = abs(point1-point2);       % and dimensions
        x = [p1(1) p1(1)+offset(1) p1(1)+offset(1) p1(1) p1(1)];
        y = [p1(2) p1(2) p1(2)+offset(2) p1(2)+offset(2) p1(2)];
        %hold on
        axis manual
        plot(x,y)
        
        while 1
            pause();
            if point1(1) ~= point2(1) & point1(2) ~= point2(2)
                if strcmpi(get(gcf,'CurrentCharacter'),'z')
                    fid=fopen('data2.txt','a+');
                    fprintf(fid,'%d,%.0f,%.0f,%.0f,%.0f\n',j,p1,offset);
                    fprintf('%d,%.0f,%.0f,%.0f,%.0f\n',j,p1,offset);
                    break;
                end
            end
            if strcmpi(get(gcf,'CurrentCharacter'),'d')
                break;
            end
            if strcmpi(get(gcf,'CurrentCharacter'),'a')
                j=j-2;
                
                break;
            end
        end
        %图像处理过程
        j=j+1;
    end
end