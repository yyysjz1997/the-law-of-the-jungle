syms x
for m = 1 : 20
    f = exp(-x) * x^(m+1) / factorial(m)  ;
    a = int( f,x,0,inf);
    a
end

function[] = comput(choose,x1_0,x2_0,r1,l1,r2,l2,T,N,N1,N2)

%�ٶ�������Ϊ��������⣬��ʳ����ʳ���ǲݣ�ʳ�����򣬲�ʳ�ߵ��ǣ��˹�����ʱ�Ǻ��򶼻ᱻ����

H1 = figure('color', [1,1,1], ...
            'units', 'normalized', ...
            'position', [0.2, 0.2, 0.6, 0.6], ...
            'Name', '����ǿʳ����D�DVolterraģ�� ��ʵ1501�� ����Զ', ...
            'NumberTitle', 'off', ...
            'MenuBar', 'none', ...
            'CloseRequestFcn', @my_closereq);
set(H1, 'color', [240 240 240]/255);
cla
%��������������
% T = input('���������ʱ��:');
% x1_0 = input('ʳ����ʼʱ�̵�����:');
% x2_0 = input('��ʳ�߳�ʼʱ�̵�����:');
% r1 = input('ʳ����������������:');
% l1 = input('��ʳ����ȡʳ��������:');
% r2 = input('��ʳ�߶��Դ���ʱ��������:');
% l2 = input('ʳ���Բ�ʳ�ߵĹ�������:');
% l3 = input('�˹�����ʳ��������:');
% l4 = input('�˹�����ʳ�ߵ�����:');
% x3_0 = input('ʳ����ʳ���ʼʱ�̵�����:');
% r3 = input('ʳ��ʳ��������ʣ�');
% l5 = input('ʳ����ʳ���ʳ���Ĺ�������:');
% l6 = input('ʳ����ȡʳ����ʳ�������:');
%T = 500;

%���һ������ʳ���������棨û�в�ʳ�ߣ�

% t = 1 : T;
% x1 = x1_0;
% result = zeros(1,T); 
% for t = 1 : T
%     x1 = x1 * (1 + r1);
%     result(1,t) = x1; %x1Ϊʳ�������
% end
% 
% plot(result);

%hold on

%�������������ڲ�ʳ��,�Ҳ�ʳ���������仯

% t = 1 : T;
% x1 = x1_0;
% x2 = x2_0;
% result_x1 = zeros(1,T); 
% for t = 1 : T
%     x1 = (x1 * (1 + r1)) - (x1 * l1 * x2 );
%     result_x1(1,t) = x1; %x1Ϊʳ�������
% end
% 
% plot(result_x1)

%�������������ڲ�ʳ��,�Ҳ�ʳ����������ʳ�������仯

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
%     result_x1(1,t) = x1; %x1Ϊʳ�������
%     result_x2(1,t) = x2; %x2Ϊ��ʳ�������
% end
% 
% plot(result_x1)%��ɫ
% hold on
% plot(result_x2)%��ɫ

% һ��ȽϺõĽ��

% ���������ʱ��:10000
% ʳ����ʼʱ�̵�����:20
% ��ʳ�߳�ʼʱ�̵�����:10
% ʳ����������������:0.1
% ��ʳ����ȡʳ��������:0.001
% ��ʳ�߶��Դ���ʱ��������:0.01
% ʳ���Բ�ʳ�ߵĹ�������:0.001


%����ģ����˹�����ʳ��������µ������
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
        result_x1(1,t) = round(x1) ;%x1Ϊʳ�������
        result_x2(1,t) = round(x2) ;%x2Ϊ��ʳ�������
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
            xlabel('ʱ�䣨������');
            ylabel('��Ⱥ����');
            title('��Ⱥ������ʱ��仯ͼ');     %���ͼ�����
            legend('��Ⱥ����');
        case 2
            cla
    %         plot(t,y(:,2));
    %        plot(result_x2);
            comet(round(result_x2));
            xlabel('ʱ�䣨������');
            ylabel('��Ⱥ����');
            title('��Ⱥ������ʱ��仯ͼ');     %���ͼ�����
            legend('��Ⱥ����');
        case 3
            cla
            subplot(121);
            hold on
            plot(result_x1);
            plot(result_x2);
            xlabel('ʱ�䣨������');
            ylabel('�ǡ�������');
            title('�ǡ���������ʱ��仯ͼ');     %���ͼ�����
            legend('��Ⱥ����','��Ⱥ����');

            subplot(122);
            plot(y(:,1),y(:,2));
    %         plot(t,y(:,1),t,y(:,2));
            xlabel('������');
            ylabel('������');
            title('�ǡ���������ͼ');     %���ͼ�����
            hold off
    end
    
    case 1  %������������
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

            xlabel('ʱ�䣨������');
            ylabel('��Ⱥ����');
            title('��Ⱥ������ʱ��仯ͼ');     %���ͼ�����
            legend('��Ⱥ����');
        case 2
            cla
            plot(t1,y(:,2));

            xlabel('ʱ�䣨������');
            ylabel('��Ⱥ����');
            title('��Ⱥ������ʱ��仯ͼ');     %���ͼ�����
            legend('��Ⱥ����');
        case 3
            cla
            subplot(121);
            hold on
            plot(t1,y(:,1));
            plot(t1,y(:,2));
            xlabel('ʱ�䣨������');
            ylabel('�ǡ�������');
            title('�ǡ���������ʱ��仯ͼ');     %���ͼ�����
            legend('��Ⱥ����','��Ⱥ����');

            subplot(122);
            plot(y(:,1),y(:,2));
    %         plot(t,y(:,1),t,y(:,2));
            xlabel('������');
            ylabel('������');
            title('�ǡ���������ͼ');     %���ͼ�����
            hold off
end
        

end
end

% һ��ȽϺõĽ��

% ���������ʱ��:10000
% ʳ����ʼʱ�̵�����:20
% ��ʳ�߳�ʼʱ�̵�����:10
% ʳ����������������:0.1
% ��ʳ����ȡʳ��������:0.001
% ��ʳ�߶��Դ���ʱ��������:0.01
% ʳ���Բ�ʳ�ߵĹ�������:0.001
% �˹�����ʳ��������:0.00001
% �˹�����ʳ�ߵ�����:0.00001

%����壺����ʳ����ʳ��������������ʳ����Ӱ�������ʳ����ʳ��ֻ���Ӳ����٣�

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
%     result_x1(1,t) = x1; %x1Ϊʳ�������
%     result_x2(1,t) = x2; %x2Ϊ��ʳ�������
%     result_x3(1,t) = x3; %x3Ϊʳ����ʳ�������
% end

%         hold on
%         plot(result_x1);%��ɫ
%         plot(result_x2);%��ɫ
%         plot(result_x3);%��ɫ
%         xlabel('ʱ�䣨������');
%         ylabel('�ǡ��򡢲�����');
%         title('����ǿʳ�������ģ�����ͼ��');     %���ͼ�����
%         legend('��Ⱥ����','��Ⱥ����','������');

% switch choose
% 	case 1
%         comet(result_x1);
%         xlabel('ʱ�䣨������');
%         ylabel('��Ⱥ����');
%         title('����ǿʳ�������ģ����Ⱥ�������ͼ��');     %���ͼ�����
%         legend('��Ⱥ����');
% 	case 2
%         comet(result_x2);
%         xlabel('ʱ�䣨������');
%         ylabel('��Ⱥ����');
%         title('����ǿʳ�������ģ����Ⱥ�������ͼ��');     %���ͼ�����
%         legend('��Ⱥ����');
%     case 3
%         comet(result_x3);
%         xlabel('ʱ�䣨������');
%         ylabel('������');
%         title('����ǿʳ�������ģ�Ͳ��������ͼ��');     %���ͼ�����
%         legend('������');
%     case 4
%         hold on
%         plot(result_x1);%��ɫ
%         plot(result_x2);%��ɫ
%         plot(result_x3);%��ɫ
%         xlabel('ʱ�䣨������');
%         ylabel('�ǡ��򡢲�����');
%         title('����ǿʳ�������ģ�����ͼ��');     %���ͼ�����
%         legend('��Ⱥ����','��Ⱥ����','������');
% end
% end

%һ��ȽϺõĽ��

% ���������ʱ��:100
% ʳ����ʼʱ�̵�����:20
% ��ʳ�߳�ʼʱ�̵�����:10
% ʳ����������������:0.1
% ��ʳ����ȡʳ��������:0.001
% ��ʳ�߶��Դ���ʱ��������:0.01
% ʳ���Բ�ʳ�ߵĹ�������:0.001
% �˹�����ʳ��������:0.00001
% �˹�����ʳ�ߵ�����:0.00001
% ʳ����ʳ���ʼʱ�̵�����:20
% ʳ��ʳ��������ʣ�0.5
% ʳ����ʳ���ʳ���Ĺ�������:0.001
% ʳ����ȡʳ����ʳ�������:0.01
function my_closereq(src, callbackdata)
% Close request function 
% to display a question dialog box 
selection = questdlg('�Ƿ��˳�����ͼ�ν��棿', ...
                     '��ʾ', ...
                     'Yes','No','No'); 
switch selection
	case 'Yes'
        delete(gcf);
	case 'No'
        return 
end
end