function varargout = about_yyy(varargin)  %作者介绍界面，完全在GUI上完成
% ABOUT_YYY MATLAB code for about_yyy.fig
%      ABOUT_YYY, by itself, creates a new ABOUT_YYY or raises the existing
%      singleton*.
%
%      H = ABOUT_YYY returns the handle to a new ABOUT_YYY or the handle to
%      the existing singleton*.
%
%      ABOUT_YYY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ABOUT_YYY.M with the given input arguments.
%
%      ABOUT_YYY('Property','Value',...) creates a new ABOUT_YYY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before about_yyy_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to about_yyy_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help about_yyy

% Last Modified by GUIDE v2.5 24-Dec-2017 21:18:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @about_yyy_OpeningFcn, ...
                   'gui_OutputFcn',  @about_yyy_OutputFcn, ...
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


% --- Executes just before about_yyy is made visible.
function about_yyy_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to about_yyy (see VARARGIN)

% Choose default command line output for about_yyy
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes about_yyy wait for user response (see UIRESUME)
% uiwait(handles.figure1);

set(handles.figure1, 'name', '关于作者');

% --- Outputs from this function are returned to the command line.
function varargout = about_yyy_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
