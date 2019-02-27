function varargout = movie(varargin)
% MOVIE MATLAB code for movie.fig
%      MOVIE, by itself, creates a new MOVIE or raises the existing
%      singleton*.
%
%      H = MOVIE returns the handle to a new MOVIE or the handle to
%      the existing singleton*.
%
%      MOVIE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOVIE.M with the given input arguments.
%
%      MOVIE('Property','Value',...) creates a new MOVIE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before movie_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to movie_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help movie

% Last Modified by GUIDE v2.5 26-Dec-2017 23:37:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @movie_OpeningFcn, ...
                   'gui_OutputFcn',  @movie_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before movie is made visible.
function movie_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to movie (see VARARGIN)

% Choose default command line output for movie
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes movie wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%�����Ի������
set(handles.figure1, 'name', '����ǿʳ���⡪��Volterraģ�� ��̬����');
set(handles.figure1, 'units', 'normalized');
set(handles.figure1, 'color', [0, 200, 100]/255);
set(handles.figure1, 'position', [0.2, 0.2, 0.6, 0.6]);


uicontrol('style', 'push',...  
          'units', 'normalized',...
          'position', [0.843, 0.1, 0.15, 0.08],... 
          'string', '�˳�',...
          'callback','close(gcf);',...
          'backgroundColor', [255, 255, 255]/255,...          
          'fontSize', 14,...
          'ForegroundColor', 'k');
    
% --- Outputs from this function are returned to the command line.
function varargout = movie_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%�����ʼ��ť�Ժ�Ĺ���
axes(handles.axes2);

cla;%���֮ǰ�������ڲ���ͼ��
axis off;%ȥ��������

global x1_0 x2_0 r1 l1 r2 l2 T ;

x1 = x1_0;
x2 = x2_0;
result_x1 = zeros(1,T);   %��������1��T�еĿվ���result_x1&result_x2
result_x2 = zeros(1,T);

for t = 1 : T/10
        x1 = (x1 * (1 + r1)) - (x1 * l1 * x2 ) ;  %ģ�����
        x2 = (x2 * (1 - r2)) + (x2 * l2 * x1 ) ;
        if x1 < 0  %����ʵ����������ָ��������̹�0
            x1 = 0;
        end
        if x2 < 0
            x2 = 0;
        end
         %����ʵ����� ��Ⱥ����һ��Ϊ����������ʹ��round�������н���ȡ��
        result_x1(1,t) = round(x1) ;%x1Ϊʳ�������
        result_x2(1,t) = round(x2) ;%x2Ϊ��ʳ�������

        %�������һ��1-100�ľ���1��x1�У�A1 A2�ֱ���Ϊ����������һ��A1  A2��Ӧһ���㣬����x1��������ʾ����Ⱥ������ֲ�������Ⱥ��
        A1 = 1+(100-1)*rand(1,round(x1));
        A2 = 1+(100-1)*rand(1,round(x1));

        %�������һ��1-100�ľ���1��x2�У�A3 A4�ֱ���Ϊ����������һ��A3  A4��Ӧһ���㣬����x2��������ʾ����Ⱥ������ֲ�������Ⱥ��
        A3 = 1+(100-1)*rand(1,round(x2));
        A4 = 1+(100-1)*rand(1,round(x2));

        %�Ӿ�ͣ����������Ⱥ�Ķ�̬�仯
        pause(0.1);
        %set(handles.axes1);
%         if (exist('handles.axes2'))
%             begin            
                 set(handles.axes2);
%         end

        % axis([0,100,0,100]);
        cla; %���֮ǰ��������ʾ

        hold on;
        plot(A1(1,:),A2(1,:),'*r');  %��*��ʾx1ֻ��
        plot(A3(1,:),A4(1,:),'*b');  %��*��ʾx2ֻ��

        set(handles.text1,'String',round(x1));   %���Ա������Ⱥ����Ⱥ�Ķ�̬���
        set(handles.text2,'String',round(x2));       
        axis([0,100,0,100]);  %������̶�λ100*100�����۶���
end 
%{
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global button
button = get(hObfect,'Value');
%}
