function varargout = yyy(varargin)
% YYY MATLAB code for yyy.fig
%      YYY, by itself, creates a new YYY or raises the existing
%      singleton*.
%
%      H = YYY returns the handle to a new YYY or the handle to
%      the existing singleton*.
%
%      YYY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in YYY.M with the given input arguments.
%
%      YYY('Property','Value',...) creates a new YYY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before yyy_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to yyy_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help yyy

% Last Modified by GUIDE v2.5 24-Dec-2017 21:10:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @yyy_OpeningFcn, ...
                   'gui_OutputFcn',  @yyy_OutputFcn, ...
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


% --- Executes just before yyy is made visible.
function yyy_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to yyy (see VARARGIN)

% Choose default command line output for yyy
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes yyy wait for user response (see UIRESUME)
% uiwait(handles.figure1);


%设置对话框内容及显示大小等
set(handles.figure1, 'name', '弱肉强食问题——Volterra模型 自实1501班 杨毅远');
set(handles.figure1, 'units', 'normalized');
set(handles.figure1, 'position', [0.2, 0.2, 0.6, 0.6]);

%读取jpg格式图片并用image函数显示在GUI的axe上
% img = imread('ly.jpg');           
% image(img);
% axis off;

%显示背景图片，满屏，在背景的最后
ha = axes('units','normalized','pos',[0 0 1 1]);
uistack(ha,'down');
img = imread('start.jpg');
image(img);
colormap gray
set(ha,'handlevisibility','off','visible','off');
axis off

%界面文字的创建
%position [左，下，宽，高]
% uicontrol('style', 'text',...  
%           'units', 'normalized',...
%           'position', [0.7, 0.8, 0.2, 0.1],... 
%           'string', '弱肉强食问题',...  
%           'fontSize', 28);
%       
% uicontrol('style', 'text',...  
%           'units', 'normalized',...
%           'position', [0.72,0.67,0.3,0.1],... 
%           'string', '--Volterra模型',...  
%           'fontSize', 25);
%  
% uicontrol('style', 'text',...  
%           'units', 'normalized',...
%           'position', [0.7,0.49,0.25,0.1],... 
%           'string', '作者:',... 
%           'fontSize', 18);
%       
% uicontrol('style', 'text',...  
%           'units', 'normalized',...
%           'position', [0.71,0.43,0.23,0.1],... 
%           'string', '自实1501班 杨毅远',... 
%           'fontSize', 16);
      
%登录按钮句柄的创建
uicontrol('style', 'push',...  
          'units', 'normalized',...
          'position', [0.75, 0.2, 0.2, 0.1],... 
          'string', '进入仿真',...
          'callback','play_voice();close(gcf);main();',...
          'backgroundColor', [45, 126, 0]/255,...          
          'fontSize', 16,...
          'ForegroundColor', 'w');
      
 uicontrol('style', 'push',...  
          'units', 'normalized',...
          'position', [0.75, 0.05, 0.2, 0.1],... 
          'string', '退出系统',...
          'callback',['close(gcf)'],...
          'backgroundColor', [1, 1, 2]/255,...          
          'fontSize', 16,...
          'ForegroundColor', 'w');
      

% --- Outputs from this function are returned to the command line.
function varargout = yyy_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in soundFile.


% --------------------------------------------------------------------
function jieshao_Callback(hObject, eventdata, handles)
% hObject    handle to jieshao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function timulijie_Callback(hObject, eventdata, handles)
% hObject    handle to timulijie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
about_timu();  %题目理解界面

% --------------------------------------------------------------------
function shiyongshuoming_Callback(hObject, eventdata, handles)
% hObject    handle to shiyongshuoming (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
about_shiyong();  %使用说明界面

% --------------------------------------------------------------------
function guanyuzuozhe_Callback(hObject, eventdata, handles)
% hObject    handle to guanyuzuozhe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
about_yyy();  %作者介绍界面  
