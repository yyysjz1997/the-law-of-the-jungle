function varargout = about_shiyong(varargin)
% ABOUT_SHIYONG MATLAB code for about_shiyong.fig
%      ABOUT_SHIYONG, by itself, creates a new ABOUT_SHIYONG or raises the existing
%      singleton*.
%
%      H = ABOUT_SHIYONG returns the handle to a new ABOUT_SHIYONG or the handle to
%      the existing singleton*.
%
%      ABOUT_SHIYONG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ABOUT_SHIYONG.M with the given input arguments.
%
%      ABOUT_SHIYONG('Property','Value',...) creates a new ABOUT_SHIYONG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before about_shiyong_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to about_shiyong_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help about_shiyong

% Last Modified by GUIDE v2.5 27-Dec-2017 16:39:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @about_shiyong_OpeningFcn, ...
                   'gui_OutputFcn',  @about_shiyong_OutputFcn, ...
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


% --- Executes just before about_shiyong is made visible.
function about_shiyong_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to about_shiyong (see VARARGIN)

% Choose default command line output for about_shiyong
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes about_shiyong wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1, 'name', '使用说明');

% --- Outputs from this function are returned to the command line.
function varargout = about_shiyong_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
