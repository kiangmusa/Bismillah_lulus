function varargout = fix1(varargin)
% FIX1 MATLAB code for fix1.fig
%      FIX1, by itself, creates a new FIX1 or raises the existing
%      singleton*.
%
%      H = FIX1 returns the handle to a new FIX1 or the handle to
%      the existing singleton*.
%
%      FIX1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIX1.M with the given input arguments.
%
%      FIX1('Property','Value',...) creates a new FIX1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fix1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fix1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fix1

% Last Modified by GUIDE v2.5 23-Jun-2018 14:42:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fix1_OpeningFcn, ...
                   'gui_OutputFcn',  @fix1_OutputFcn, ...
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



% --- Executes just before fix1 is made visible.
function fix1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fix1 (see VARARGIN)

% Choose default command line output for fix1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fix1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fix1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function setGlobalKlusterR(val)
    global a
    a = val;
    
function k = getGlobalKlusterR
    global a
    k = a;  

function setGlobalxsl(xsl)
    global b
    b = xsl;
    
function r = getGlobalxsl
    global b
    r = b;  


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over edit1.
function edit1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function EdUkuranCitra_Callback(hObject, eventdata, handles)
% hObject    handle to EdUkuranCitra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EdUkuranCitra as text
%        str2double(get(hObject,'String')) returns contents of EdUkuranCitra as a double


% --- Executes during object creation, after setting all properties.
function EdUkuranCitra_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EdUkuranCitra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PBBrowseCitra.
function PBBrowseCitra_Callback(hObject, eventdata, handles)
% hObject    handle to PBBrowseCitra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in PBConvertCitra.
function PBConvertCitra_Callback(hObject, eventdata, handles)
% hObject    handle to PBConvertCitra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in PBConvertCitra.
function PBSimpanKluster_Callback(hObject, eventdata, handles)
% hObject    handle to PBConvertCitra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fname = 'kluster.xlsx';
[R,G,B]=simpanKlWarna(fname);
tulis = strcat('Merah = ',int2str(R'));
set(handles.EDKlusterR,'string',tulis);

function EDKlusterWarna_Callback(hObject, eventdata, handles)
% hObject    handle to EDKlusterWarna (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDKlusterWarna as text
%        str2double(get(hObject,'String')) returns contents of EDKlusterWarna as a double


% --- Executes during object creation, after setting all properties.
function EDKlusterWarna_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDKlusterWarna (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PBEditKluster.
function PBEditKluster_Callback(hObject, eventdata, handles)
% hObject    handle to PBEditKluster (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function EDKlusterR_Callback(hObject, eventdata, handles)
% hObject    handle to EDKlusterR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDKlusterR as text
%        str2double(get(hObject,'String')) returns contents of EDKlusterR as a double


% --- Executes during object creation, after setting all properties.
function EDKlusterR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDKlusterR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
