function varargout = SmoveGUI(varargin)
% SMOVEGUI MATLAB code for SmoveGUI.fig
%      SMOVEGUI, by itself, creates a new SMOVEGUI or raises the existing
%      singleton*.
%
%      H = SMOVEGUI returns the handle to a new SMOVEGUI or the handle to
%      the existing singleton*.
%
%      SMOVEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SMOVEGUI.M with the given input arguments.
%
%      SMOVEGUI('Property','Value',...) creates a new SMOVEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SmoveGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SmoveGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SmoveGUI

% Last Modified by GUIDE v2.5 17-Jun-2018 21:43:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SmoveGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SmoveGUI_OutputFcn, ...
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



%----------------------------------------------//-------------------------------------------------



%Lê o excel
data = xlsread ('Acelerometro.xlsx');

% --- Executes just before SmoveGUI is made visible.
function SmoveGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SmoveGUI (see VARARGIN)

% Choose default command line output for SmoveGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SmoveGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SmoveGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%dadosDados = load('massa_de_teste.txt')




% --- Executes on button press in rawButton.
function rawButton_Callback(hObject, eventdata, handles)
% hObject    handle to rawButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = xlsread ('Acelerometro.xlsx');
dadosDados = data(:,1);
accBruto = findobj('Tag', 'accBruto');
graficoPlot = data (:,1);
plot (accBruto,dadosDados)


% --- Executes on button press in filterButtom.
function filterButtom_Callback(hObject, eventdata, handles)
% hObject    handle to filterButtom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = xlsread ('Acelerometro.xlsx');
dadosDados = data(:,1);
[b, a] = butter(6,0.012,'low');
result = filter(b,a,dadosDados);
axes4 = findobj('Tag', 'axes4');
graficoPlot = (result);
plot (axes4,result)








