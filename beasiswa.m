function varargout = beasiswa(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @beasiswa_OpeningFcn, ...
                   'gui_OutputFcn',  @beasiswa_OutputFcn, ...
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

function beasiswa_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = beasiswa_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

function ipk_Callback(hObject, eventdata, handles)
ipk = str2double(get(hObject, 'String'));
handles.ipk = ipk;
guidata(hObject, handles);

function ipk_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function tm_Callback(hObject, eventdata, handles)
tm = str2double(get(hObject, 'String'));
handles.tm = tm;
guidata(hObject, handles);

function tm_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function hitung_Callback(hObject, eventdata, handles)
fis = readfis('beasiswa.fis');
input = [handles.ipk, handles.tm];
out = evalfis(input, fis);
if out < 0.8
    msgbox('Tidak Mendapatkan Beasiswa', 'Hasil', 'warn');
else
    msgbox('Memperoleh Beasiswa', 'Hasil', 'help');
end
