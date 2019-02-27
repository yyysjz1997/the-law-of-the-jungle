syms x
for m = 1 : 20
    f = exp(-x) * x^(m+1) / factorial(m)  ;
    a = int( f,x,0,inf);
    a
end

function[] = comput(choose,x1_0,x2_0,r1,l1,r2,l2,T,N,N1,N2)

%假定此问题为狼羊草问题，即食饵的食物是草，食饵是羊，捕食者的狼，人工捕获时狼和羊都会被捕获

H1 = figure('color', [1,1,1], ...
            'units', 'normalized', ...
            'position', [0.2, 0.2, 0.6, 0.6], ...
            'Name', '弱肉强食问题――Volterra模型 自实1501班 杨毅远', ...
            'NumberTitle', 'off', ...
            'MenuBar', 'none', ...
            'CloseRequestFcn', @my_closereq);
set(H1, 'color', [240 240 240]/255);
cla
%键盘输入仿真参数
% T = input('请输入仿真时间:');
% x1_0 = input('食饵初始时刻的数量:');
% x2_0 = input('捕食者初始时刻的数量:');
% r1 = input('食饵独立生存增长率:');
% l1 = input('捕食者掠取食饵的能力:');
% r2 = input('捕食者独自存在时的死亡率:');
% l2 = input('食饵对捕食者的供养能力:');
% l3 = input('人工捕获食饵的能力:');
% l4 = input('人工捕获捕食者的能力:');
% x3_0 = input('食饵的食物初始时刻的数量:');
% r3 = input('食饵食物的增长率：');
% l5 = input('食饵的食物对食饵的供养能力:');
% l6 = input('食饵掠取食饵的食物的能力:');
%T = 500;

%情况一：假设食饵独立生存（没有捕食者）

% t = 1 : T;
% x1 = x1_0;
% result = zeros(1,T); 
% for t = 1 : T
%     x1 = x1 * (1 + r1);
%     result(1,t) = x1; %x1为食饵最后结果
% end
% 
% plot(result);

%hold on

%情况二：假设存在捕食者,且捕食者数量不变化

% t = 1 : T;
% x1 = x1_0;
% x2 = x2_0;
% result_x1 = zeros(1,T); 
% for t = 1 : T
%     x1 = (x1 * (1 + r1)) - (x1 * l1 * x2 );
%     result_x1(1,t) = x1; %x1为食饵最后结果
% end
% 
% plot(result_x1)

%情况三：假设存在捕食者,且捕食者数量会随食饵数量变化

% t = 1 : T;
% x1 = x1_0;
% x2 = x2_0;
% result_x1 = zeros(1,T); 
% result_x2 = zeros(1,T);
% for t = 1 : T
%     x1 = (x1 * (1 + r1)) - (x1 * l1 * x2 );
%     x2 = (x2 * (1 - r2)) + (x2 * l2 * x1 );
%     if x1 < 0
%         x1 = 0;
%     end
%     if x2 < 0
%         x2 = 0;
%     end
%     result_x1(1,t) = x1; %x1为食饵最后结果
%     result_x2(1,t) = x2; %x2为捕食者最后结果
% end
% 
% plot(result_x1)%蓝色
% hold on
% plot(result_x2)%红色

% 一组比较好的结果

% 请输入仿真时间:10000
% 食饵初始时刻的数量:20
% 捕食者初始时刻的数量:10
% 食饵独立生存增长率:0.1
% 捕食者掠取食饵的能力:0.001
% 捕食者独自存在时的死亡率:0.01
% 食饵对捕食者的供养能力:0.001


%情况四：有人工捕获食饵的情况下的情况三
switch N
    case 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    x1 = x1_0;
    x2 = x2_0;
    result_x1 = zeros(1,T); 
    result_x2 = zeros(1,T);
    for t = 1 : T
        x1 = (x1 * (1 + r1)) - (x1 * l1 * x2 ) ;
        x2 = (x2 * (1 - r2)) + (x2 * l2 * x1 ) ;
        if x1 < 0
            x1 = 0;
        end
        if x2 < 0
            x2 = 0;
        end
        result_x1(1,t) = round(x1) ;%x1为食饵最后结果
        result_x2(1,t) = round(x2) ;%x2为捕食者最后结果
    end 

    odefun = @(t1,x)[(r1 - l1 * x(2)) * x(1) (-(r2 - l2 * x(1)) * x(2))]';
    tspan = [1 T];
    x0 = [x1_0 x2_0]';
    [t1,y] = ode45(odefun,tspan,x0);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    switch choose
        case 1
            cla
    %        plot(t,y(:,1));
    %        plot(result_x1);

            comet(round(result_x1));
            xlabel('时间（天数）');
            ylabel('羊群数量');
            title('羊群数量随时间变化图');     %添加图像标题
            legend('羊群数量');
        case 2
            cla
    %         plot(t,y(:,2));
    %        plot(result_x2);
            comet(round(result_x2));
            xlabel('时间（天数）');
            ylabel('狼群数量');
            title('狼群数量随时间变化图');     %添加图像标题
            legend('狼群数量');
        case 3
            cla
            subplot(121);
            hold on
            plot(result_x1);
            plot(result_x2);
            xlabel('时间（天数）');
            ylabel('狼、羊数量');
            title('狼、羊数量随时间变化图');     %添加图像标题
            legend('羊群数量','狼群数量');

            subplot(122);
            plot(y(:,1),y(:,2));
    %         plot(t,y(:,1),t,y(:,2));
            xlabel('羊数量');
            ylabel('狼数量');
            title('狼、羊数量相图');     %添加图像标题
            hold off
    end
    
    case 1  %考虑自身阻力
        x1 = x1_0;
        x2 = x2_0;


    odefun = @(t1,x)[(r1 - x(1)*r1/N1 - l1 * x(2)) * x(1) (-(r2 - l2 * x(1)) * x(2)) + r2 * x(2) * x(2) / N2]';
    tspan = [1 T];
    x0 = [x1_0 x2_0]';
    [t1,y] = ode45(odefun,tspan,x0);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
    %         plot(t,y(:,1),t,y(:,2));
            xlabel('羊数量');
            ylabel('狼数量');
            title('狼、羊数量相图');     %添加图像标题
            hold off
end
        

end
end

% 一组比较好的结果

% 请输入仿真时间:10000
% 食饵初始时刻的数量:20
% 捕食者初始时刻的数量:10
% 食饵独立生存增长率:0.1
% 捕食者掠取食饵的能力:0.001
% 捕食者独自存在时的死亡率:0.01
% 食饵对捕食者的供养能力:0.001
% 人工捕获食饵的能力:0.00001
% 人工捕获捕食者的能力:0.00001

%情况五：考虑食饵的食物的增长情况对于食饵的影响情况（食饵的食物只增加不减少）

% t = 1 : T;
% x1 = x1_0;
% x2 = x2_0;
% x3 = x3_0;
% result_x1 = zeros(1,T); 
% result_x2 = zeros(1,T);
% result_x3 = zeros(1,T);
% for t = 1 : T
%        
%     x1 = (x1 * (1 + l5)) - (x1 * l1 * x2 ) - (x1 * l3);
%     x2 = (x2 * (1 - r2)) + (x2 * l2 * x1 ) - (x2 * l4);
%     x3 = (x3 * (1 + r3)) - ( x1 * l6 * x3 )
% 
%     if x1 < 0
%         x1 = 0;
%     elseif x1 > 1000
%         x1 = 1000;
%     end
%     if x2 < 0
%         x2 = 0;
%     elseif x2 > 1000
%         x2 = 1000;
%     end
%     if x3 < 0
%         x3 = 0;
%     elseif x3 > 1000
%         x3 = 1000;
%     end
%     
%         
%     result_x1(1,t) = x1; %x1为食饵最后结果
%     result_x2(1,t) = x2; %x2为捕食者最后结果
%     result_x3(1,t) = x3; %x3为食饵的食物最后结果
% end

%         hold on
%         plot(result_x1);%蓝色
%         plot(result_x2);%红色
%         plot(result_x3);%黄色
%         xlabel('时间（天数）');
%         ylabel('狼、羊、草数量');
%         title('弱肉强食问题仿真模型输出图像');     %添加图像标题
%         legend('羊群数量','狼群数量','草数量');

% switch choose
% 	case 1
%         comet(result_x1);
%         xlabel('时间（天数）');
%         ylabel('羊群数量');
%         title('弱肉强食问题仿真模型羊群数量输出图像');     %添加图像标题
%         legend('羊群数量');
% 	case 2
%         comet(result_x2);
%         xlabel('时间（天数）');
%         ylabel('狼群数量');
%         title('弱肉强食问题仿真模型狼群数量输出图像');     %添加图像标题
%         legend('狼群数量');
%     case 3
%         comet(result_x3);
%         xlabel('时间（天数）');
%         ylabel('草数量');
%         title('弱肉强食问题仿真模型草数量输出图像');     %添加图像标题
%         legend('草数量');
%     case 4
%         hold on
%         plot(result_x1);%蓝色
%         plot(result_x2);%红色
%         plot(result_x3);%黄色
%         xlabel('时间（天数）');
%         ylabel('狼、羊、草数量');
%         title('弱肉强食问题仿真模型输出图像');     %添加图像标题
%         legend('羊群数量','狼群数量','草数量');
% end
% end

%一组比较好的结果

% 请输入仿真时间:100
% 食饵初始时刻的数量:20
% 捕食者初始时刻的数量:10
% 食饵独立生存增长率:0.1
% 捕食者掠取食饵的能力:0.001
% 捕食者独自存在时的死亡率:0.01
% 食饵对捕食者的供养能力:0.001
% 人工捕获食饵的能力:0.00001
% 人工捕获捕食者的能力:0.00001
% 食饵的食物初始时刻的数量:20
% 食饵食物的增长率：0.5
% 食饵的食物对食饵的供养能力:0.001
% 食饵掠取食饵的食物的能力:0.01
function my_closereq(src, callbackdata)
% Close request function 
% to display a question dialog box 
selection = questdlg('是否退出仿真图形界面？', ...
                     '提示', ...
                     'Yes','No','No'); 
switch selection
	case 'Yes'
        delete(gcf);
	case 'No'
        return 
end
end