function varargout = SmoveGUI(varargin)
%Global variables
global pathJump;
pathJump = 'Dados de exemplo/salto_exemplo_4m.xls';

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
varargout{1} = handles.output;




% --- Executes on button press in rawButton.
function rawButton_Callback(hObject, eventdata, handles)
global pathJump;

%Puxa os Excel
dataSheet = xlsread(pathJump, 'dados');

%Puxa e manipula os dados
dadosAccX = dataSheet(:,1);

%Plota 
accXGraph = findobj('Tag', 'accBruto');
plot (accXGraph, dadosAccX)

% --- Executes on button press in filterButtom.
function filterButtom_Callback(hObject, eventdata, handles)
global pathJump;

%Puxa os Excel
dataSheet = xlsread(pathJump, 'dados');
% Puxar dados num�ricos, caracteres e outros
[a, infoSheet, c] = xlsread(pathJump, 'sobre');

%Puxa os dados
dadosAccX = dataSheet(:,1);
% Transformar caracteres em n�meros
frequency = str2double(infoSheet(4,2));

%Filtro
filterOrder = 6;
Fc = 6;
[b, a] = butter(filterOrder,Fc/(frequency/2),'low');
result = filter(b,a,dadosAccX);
axes4 = findobj('Tag', 'axes4');
graficoPlot = (result);
plot (axes4, result)
