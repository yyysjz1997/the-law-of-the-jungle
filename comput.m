function[] = comput(choose,x1_0,x2_0,r1,l1,r2,l2,T,N,N1,N2,i1)

%�ٶ�������Ϊ�������⣬��ʳ�����򣬲�ʳ�ߵ���

%choose�Ƿ����ѡ����� choose = 1Ϊֻ�����������仯
%                      choose = 2Ϊֻ�����������仯 
%                      choose = 3Ϊͬʱ�������������仯 

%N���Ƿ�����Ⱥ�����������õ���� 0Ϊ������ 
%                                1Ϊ���� 
%T�Ƿ���ʱ��
%x1_0����ĳ�ʼ����
%x2_0���ǵĳ�ʼ����
%r1��Ⱥ���������������
%l1��Ⱥ������Ⱥ�Ĳ�ʳ����
%r2��Ⱥ��������ʱ��������
%l2��Ⱥ����Ⱥ�Ĺ�������
%N1��Ⱥ�������
%N2��Ⱥ�������

%���ñ��������
H1 = figure('color', [1,1,1], ...
            'units', 'normalized', ...
            'position', [0.2, 0.2, 0.6, 0.6], ...
            'Name', '����ǿʳ����D�DVolterraģ�� ��ʵ1501�� ����Զ', ...
            'NumberTitle', 'off', ...
            'MenuBar', 'none', ...
            'CloseRequestFcn', @my_closereq);
set(H1, 'color', [240 240 240]/255);
%���֮ǰ���е���ʾ
cla


%�ж��Ƿ�����Ⱥ�����������õ���� 
switch N
    case 0  %0Ϊ������
        x1 = x1_0;  
        x2 = x2_0;
        result_x1 = zeros(1,T);   %��������1��T�еĿվ���result_x1&result_x2
        result_x2 = zeros(1,T);
        for t = 1 : T    %ģ�����
            x1 = (x1 * (1 + r1)) - (x1 * l1 * x2 ) ;
            x2 = (x2 * (1 - r2)) + (x2 * l2 * x1 ) ;
            if x1 < 0  %����ʵ����������ָ��������̹�0
                x1 = 0;
            end
            if x2 < 0
                x2 = 0;
            end
            %����ʵ����� ��Ⱥ����һ��Ϊ����������ʹ��round�������н���ȡ��
            result_x1(1,t) = x1 ; %x1Ϊʳ�������
            result_x2(1,t) = x2 ; %x2Ϊ��ʳ�������
        end 
    
        %ͬ��Ҳ������ode45������ֱ�Ӷ�΢�ַ��������
        odefun = @(t1,x)[(r1 - l1 * x(2)) * x(1) (-(r2 - l2 * x(1)) * x(2))]';
        tspan = [1 T];
        x0 = [x1_0 x2_0]';
        [t1,y] = ode45(odefun,tspan,x0);

  
        switch choose   %choose�Ƿ����ѡ����� 
            case 1    %choose = 1Ϊֻ�����������仯
                cla   %�������֮ǰ����ʾ
            
                comet(round(result_x1));   %��̬��ͼ
                xlabel('ʱ�䣨������');
                ylabel('��Ⱥ����');
                title('��Ⱥ������ʱ��仯ͼ');     %���ͼ�����
                legend('��Ⱥ����');    %��ע��
            case 2     %choose = Ϊֻ�����������仯
                cla
                
                comet(round(result_x2));
                xlabel('ʱ�䣨������');
                ylabel('��Ⱥ����');
                title('��Ⱥ������ʱ��仯ͼ');     %���ͼ�����
                legend('��Ⱥ����');
            case 3    %choose = 3Ϊͬʱ�������������仯 
                cla
                subplot(121);  %��Ϊ�����������棬����һ��ʾ��ʱ��ı仯
                hold on
                plot(result_x1);
                plot(result_x2);
                xlabel('ʱ�䣨������');
                ylabel('�ǡ�������');
                title('�ǡ���������ʱ��仯ͼ');     %���ͼ�����
                legend('��Ⱥ����','��Ⱥ����');

                subplot(122);  %�������ʾ������֮��Ĺ�ϵ
                plot(y(:,1),y(:,2));
                xlabel('������');
                ylabel('������');
                title('�ǡ���������ͼ');     %���ͼ�����
                hold off
                
                name1 = strcat('don_t_have_self_block_',date);
                name2 = strcat(name1,'_');
                name = strcat(name2,num2str(i1));  %����ͼ�������Ϊ��don_t_have_self_block+ʱ��+�ڼ���
                saveas(gcf,name,'jpg'); %����ͼ��
        end
    
    case 1  %����������������
        x1 = x1_0;
        x2 = x2_0;
       
        %ֱ��ʹ��ode45���΢�ַ�����
        odefun = @(t1,x)[(r1-x(1)*r1/N1-l1*x(2))*x(1) (-(r2 - l2 * x(1)) * x(2)) + r2 * x(2) * x(2)/N2]';
        tspan = [1 T];
        x0 = [x1_0 x2_0]';
        [t1,y] = ode45(odefun,tspan,x0);

        %����������
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
                xlabel('������');
                ylabel('������');
                title('�ǡ���������ͼ');     %���ͼ�����
                hold off
                
                name1 = strcat('have_self_block ',date);
                name2 = strcat(name1,'_');
                name = strcat(name2,num2str(i1));  %����ͼ�������Ϊ��have_self_block+ʱ��+�ڼ���
                saveas(gcf,name,'jpg'); %����ͼ��
        end
end
end

%�˳��Ի���Ľ���
function my_closereq(src, callbackdata)
% Close request function 
% to display a question dialog box 
selection = questdlg('�Ƿ��˳�����ͼ�ν��棿', ...
                     '��ʾ', ...
                     'Yes','No','No'); 
switch selection  %ѡ���Ƿ��˳�
	case 'Yes'
        delete(gcf);
	case 'No'
        return 
end
end