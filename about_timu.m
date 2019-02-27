function varargout = about_timu(varargin)
% ABOUT_TIMU MATLAB code for about_timu.fig
%      ABOUT_TIMU, by itself, creates a new ABOUT_TIMU or raises the existing
%      singleton*.
%
%      H = ABOUT_TIMU returns the handle to a new ABOUT_TIMU or the handle to
%      the existing singleton*.
%
%      ABOUT_TIMU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ABOUT_TIMU.M with the given input arguments.
%
%      ABOUT_TIMU('Property','Value',...) creates a new ABOUT_TIMU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before about_timu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to about_timu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help about_timu

% Last Modified by GUIDE v2.5 27-Dec-2017 16:28:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @about_timu_OpeningFcn, ...
                   'gui_OutputFcn',  @about_timu_OutputFcn, ...
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


% --- Executes just before about_timu is made visible.
function about_timu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to about_timu (see VARARGIN)

% Choose default command line output for about_timu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes about_timu wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1, 'name', '题目理解');

% --- Outputs from this function are returned to the command line.
function varargout = about_timu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
