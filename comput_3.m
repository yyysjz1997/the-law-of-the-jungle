function[] = comput_3()

%�ٶ�������Ϊ�����Լ��ǵ���е����⣬��ʳ�����򣬲�ʳ�ߵ��ǣ��ټ��Ͽ��ǵ��ǵ���еĴ���

%���ñ��������
H1 = figure('color', [1,1,1], ...
            'units', 'normalized', ...
            'position', [0.2, 0.2, 0.6, 0.6], ...
            'Name', '����ǿʳ����D�DVolterraģ�� ��ʵ1501�� ����Զ', ...
            'NumberTitle', 'off', ...
            'MenuBar', 'none', ...
            'CloseRequestFcn', @my3_closereq);
set(H1, 'color', [240 240 240]/255);
%���֮ǰ���е���ʾ
cla

x1_0 = 100;  %x1_0����ĳ�ʼ����
x2_0 = 40;   %x2_0���ǵĳ�ʼ����
x3_0 = 6;    %x3_0���ǵ���г�ʼ����
u1 = 0.1;    %�ǵ���ж����ǵĲ�ʳ����
l1= 0.1;    %l1��Ⱥ������Ⱥ�Ĳ�ʳ����
l2 = 0.02;   %l2��Ⱥ����Ⱥ�Ĺ�������
l3 = 0.06;  %l3��Ⱥ���ǵ���еĹ�������
r1 = 1;    %r1��Ⱥ���������������
r2 = 0.5;   %r2��Ⱥ��������ʱ��������
r3 = 0.6;   %r3�ǵ���ж�������ʱ��������
T = 50;  %T�Ƿ���ʱ��
    
%��ode45������ֱ�Ӷ�΢�ַ��������
odefun = @(t1,x)[(r1 - l1 * x(2)) * x(1) (-(r2 - l2 * x(1) + u1 * x(3)) * x(2)) x(3)*(-r3 + l3 * x(2))]';
tspan = [1 T];
x0 = [x1_0 x2_0 x3_0]';
[t1,y] = ode45(odefun,tspan,x0);
    
cla
%��Ϊ�����������棬����һ��ʾ��ʱ��ı仯
subplot(121);
hold on
plot(t1,y(:,1));
plot(t1,y(:,2));
plot(t1,y(:,3));
xlabel('ʱ�䣨������');
ylabel('�ǡ����Լ��ǵ��������');
title('�ǡ����Լ��ǵ����������ʱ��仯ͼ');     %���ͼ�����
legend('��Ⱥ����','��Ⱥ����','�ǵ��������');

%�������ʾ������֮��Ĺ�ϵ
subplot(122);
plot3(y(:,1),y(:,2),y(:,3));
xlabel('������');
ylabel('������');
zlabel('���������')
title('�ǡ����Լ������������ͼ');     %���ͼ�����
grid on
hold off
    
end
    
%�˳��Ի���Ľ���    
function my3_closereq(src, callbackdata)
% Close request function 
% to display a question dialog box 
selection = questdlg('�Ƿ��˳�����ͼ�ν��棿', ...
                     '��ʾ', ...
                     'Yes','No','No'); 
switch selection %ѡ���Ƿ��˳�
	case 'Yes'
        delete(gcf);
	case 'No'
        return 
end
end