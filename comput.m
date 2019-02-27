function[] = comput(choose,x1_0,x2_0,r1,l1,r2,l2,T,N,N1,N2,i1)

%假定此问题为狼羊问题，即食饵是羊，捕食者的狼

%choose是仿真的选择情况 choose = 1为只仿真羊数量变化
%                      choose = 2为只仿真狼数量变化 
%                      choose = 3为同时仿真狼羊数量变化 

%N是是否考虑种群自身阻滞作用的情况 0为不考虑 
%                                1为考虑 
%T是仿真时间
%x1_0是羊的初始数量
%x2_0是狼的初始数量
%r1羊群独立生存的增长率
%l1狼群对于羊群的捕食能力
%r2狼群独自生存时的死亡率
%l2羊群对狼群的供养能力
%N1羊群最大存活量
%N2狼群最大存活量

%设置标题的属性
H1 = figure('color', [1,1,1], ...
            'units', 'normalized', ...
            'position', [0.2, 0.2, 0.6, 0.6], ...
            'Name', '弱肉强食问题――Volterra模型 自实1501班 杨毅远', ...
            'NumberTitle', 'off', ...
            'MenuBar', 'none', ...
            'CloseRequestFcn', @my_closereq);
set(H1, 'color', [240 240 240]/255);
%清空之前所有的显示
cla


%判断是否考虑种群自身阻滞作用的情况 
switch N
    case 0  %0为不考虑
        x1 = x1_0;  
        x2 = x2_0;
        result_x1 = zeros(1,T);   %建立两个1行T列的空矩阵result_x1&result_x2
        result_x2 = zeros(1,T);
        for t = 1 : T    %模型求解
            x1 = (x1 * (1 + r1)) - (x1 * l1 * x2 ) ;
            x2 = (x2 * (1 - r2)) + (x2 * l2 * x1 ) ;
            if x1 < 0  %根据实际情况，出现负数，立刻归0
                x1 = 0;
            end
            if x2 < 0
                x2 = 0;
            end
            %根据实际情况 种群数量一定为正整数，故使用round函数进行近似取整
            result_x1(1,t) = x1 ; %x1为食饵最后结果
            result_x2(1,t) = x2 ; %x2为捕食者最后结果
        end 
    
        %同样也可以用ode45函数，直接对微分方程组求解
        odefun = @(t1,x)[(r1 - l1 * x(2)) * x(1) (-(r2 - l2 * x(1)) * x(2))]';
        tspan = [1 T];
        x0 = [x1_0 x2_0]';
        [t1,y] = ode45(odefun,tspan,x0);

  
        switch choose   %choose是仿真的选择情况 
            case 1    %choose = 1为只仿真羊数量变化
                cla   %清除所有之前的显示
            
                comet(round(result_x1));   %动态画图
                xlabel('时间（天数）');
                ylabel('羊群数量');
                title('羊群数量随时间变化图');     %添加图像标题
                legend('羊群数量');    %加注释
            case 2     %choose = 为只仿真狼数量变化
                cla
                
                comet(round(result_x2));
                xlabel('时间（天数）');
                ylabel('狼群数量');
                title('狼群数量随时间变化图');     %添加图像标题
                legend('狼群数量');
            case 3    %choose = 3为同时仿真狼羊数量变化 
                cla
                subplot(121);  %分为左右两个界面，界面一显示随时间的变化
                hold on
                plot(result_x1);
                plot(result_x2);
                xlabel('时间（天数）');
                ylabel('狼、羊数量');
                title('狼、羊数量随时间变化图');     %添加图像标题
                legend('羊群数量','狼群数量');

                subplot(122);  %界面二显示，两者之间的关系
                plot(y(:,1),y(:,2));
                xlabel('羊数量');
                ylabel('狼数量');
                title('狼、羊数量相图');     %添加图像标题
                hold off
                
                name1 = strcat('don_t_have_self_block_',date);
                name2 = strcat(name1,'_');
                name = strcat(name2,num2str(i1));  %保存图像的名称为：don_t_have_self_block+时间+第几张
                saveas(gcf,name,'jpg'); %保存图像
        end
    
    case 1  %考虑自身阻滞作用
        x1 = x1_0;
        x2 = x2_0;
       
        %直接使用ode45求解微分方程组
        odefun = @(t1,x)[(r1-x(1)*r1/N1-l1*x(2))*x(1) (-(r2 - l2 * x(1)) * x(2)) + r2 * x(2) * x(2)/N2]';
        tspan = [1 T];
        x0 = [x1_0 x2_0]';
        [t1,y] = ode45(odefun,tspan,x0);

        %与上面类似
        switch choose
            case 1
                cla
                plot(t1,y(:,1));

                xlabel('时间（天数）');
                ylabel('羊群数量');
                title('羊群数量随时间变化图');     %添加图像标题
                legend('羊群数量');
            case 2
                cla
                plot(t1,y(:,2));

                xlabel('时间（天数）');
                ylabel('狼群数量');
                title('狼群数量随时间变化图');     %添加图像标题
                legend('狼群数量');
            case 3
                cla
                subplot(121);
                hold on
                plot(t1,y(:,1));
                plot(t1,y(:,2));
                xlabel('时间（天数）');
                ylabel('狼、羊数量');
                title('狼、羊数量随时间变化图');     %添加图像标题
                legend('羊群数量','狼群数量');

                subplot(122);
                plot(y(:,1),y(:,2));
                xlabel('羊数量');
                ylabel('狼数量');
                title('狼、羊数量相图');     %添加图像标题
                hold off
                
                name1 = strcat('have_self_block ',date);
                name2 = strcat(name1,'_');
                name = strcat(name2,num2str(i1));  %保存图像的名称为：have_self_block+时间+第几张
                saveas(gcf,name,'jpg'); %保存图像
        end
end
end

%退出对话框的建立
function my_closereq(src, callbackdata)
% Close request function 
% to display a question dialog box 
selection = questdlg('是否退出仿真图形界面？', ...
                     '提示', ...
                     'Yes','No','No'); 
switch selection  %选择是否退出
	case 'Yes'
        delete(gcf);
	case 'No'
        return 
end
end