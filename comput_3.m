function[] = comput_3()

%假定此问题为狼羊以及狼的天敌的问题，即食饵是羊，捕食者的狼，再加上考虑的狼的天敌的存在

%设置标题的属性
H1 = figure('color', [1,1,1], ...
            'units', 'normalized', ...
            'position', [0.2, 0.2, 0.6, 0.6], ...
            'Name', '弱肉强食问题――Volterra模型 自实1501班 杨毅远', ...
            'NumberTitle', 'off', ...
            'MenuBar', 'none', ...
            'CloseRequestFcn', @my3_closereq);
set(H1, 'color', [240 240 240]/255);
%清空之前所有的显示
cla

x1_0 = 100;  %x1_0是羊的初始数量
x2_0 = 40;   %x2_0是狼的初始数量
x3_0 = 6;    %x3_0是狼的天敌初始数量
u1 = 0.1;    %狼的天敌对于狼的捕食能力
l1= 0.1;    %l1狼群对于羊群的捕食能力
l2 = 0.02;   %l2羊群对狼群的供养能力
l3 = 0.06;  %l3狼群对狼的天敌的供养能力
r1 = 1;    %r1羊群独立生存的增长率
r2 = 0.5;   %r2狼群独自生存时的死亡率
r3 = 0.6;   %r3狼的天敌独自生存时的死亡率
T = 50;  %T是仿真时间
    
%用ode45函数，直接对微分方程组求解
odefun = @(t1,x)[(r1 - l1 * x(2)) * x(1) (-(r2 - l2 * x(1) + u1 * x(3)) * x(2)) x(3)*(-r3 + l3 * x(2))]';
tspan = [1 T];
x0 = [x1_0 x2_0 x3_0]';
[t1,y] = ode45(odefun,tspan,x0);
    
cla
%分为左右两个界面，界面一显示随时间的变化
subplot(121);
hold on
plot(t1,y(:,1));
plot(t1,y(:,2));
plot(t1,y(:,3));
xlabel('时间（天数）');
ylabel('狼、羊以及狼的天敌数量');
title('狼、羊以及狼的天敌数量随时间变化图');     %添加图像标题
legend('羊群数量','狼群数量','狼的天敌数量');

%界面二显示，三者之间的关系
subplot(122);
plot3(y(:,1),y(:,2),y(:,3));
xlabel('羊数量');
ylabel('狼数量');
zlabel('狼天敌数量')
title('狼、羊以及狼天敌数量相图');     %添加图像标题
grid on
hold off
    
end
    
%退出对话框的建立    
function my3_closereq(src, callbackdata)
% Close request function 
% to display a question dialog box 
selection = questdlg('是否退出仿真图形界面？', ...
                     '提示', ...
                     'Yes','No','No'); 
switch selection %选择是否退出
	case 'Yes'
        delete(gcf);
	case 'No'
        return 
end
end