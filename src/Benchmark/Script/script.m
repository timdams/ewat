function varargout = script(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @script_OpeningFcn, ...
                   'gui_OutputFcn',  @script_OutputFcn, ...
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

function script_OpeningFcn(hObject, eventdata, handles, varargin)
    handles.output = hObject;
    guidata(hObject, handles);
    
    setappdata(0,'hroot_data',gcf);
    set_root_data(handles,'local_path',cd);
        
    set(handles.btn_remove_script,'Enable','off');
    set(handles.btn_benchmark,'Enable','off');
function varargout = script_OutputFcn(hObject, eventdata, handles) 
    varargout{1} = handles.output;

function btn_load_script_Callback(hObject, eventdata, handles)

    global iMark_script;
    global script_struct;
        
    [name_script, path] = uigetfile({'*.txt','Script files(.txt)'},'Select a Script file');
    
    if name_script == 0;
        msgbox('No script was selected','Warning','warn');
    else
        try
            
            iMark_script = generate_script(strcat(path,name_script));
            current_list = get(handles.listbox_script,'String');
            
            if isempty(current_list)
                script_struct = struct(iMark_script);
                set_root_data(handles,'script_struct',script_struct);
                
                set(handles.listbox_script,'String',name_script);
            else
                complete_list = strvcat(current_list,name_script);
                
                script_struct = get_root_data('script_struct');
                W_struct = size(script_struct,2);
                                
                script_struct(W_struct+1) = struct(iMark_script); 
                set_root_data(handles,'script_struct',script_struct);
                
                set(handles.listbox_script,'String',complete_list);
            end
            
            set(handles.btn_remove_script,'Enable','on');
            set(handles.btn_benchmark,'Enable','on');
            
        catch
            errordlg('There was a problem when loading the script. Please check the script for syntax errors','Script Error');
        end
        
                
    end
function btn_remove_script_Callback(hObject, eventdata, handles)

script_struct = get_root_data('script_struct');
selected = get(handles.listbox_script,'Value');
script_struct(selected) = [];
set_root_data(handles,'script_struct',script_struct);

list = get(handles.listbox_script,'String');
height  = size(list,1);
new_list = {};

for i=1:1:height
    if selected == i && selected ~=height && selected ~= 1
        i = i+2;
    else
            if  selected == 1 && selected ~= height
                
                if i ~= height 
                    new_value = list(i+1,:);
                    new_list = strvcat(new_list,new_value);
                else
                end
                
            elseif selected == height && selected ~= 1
                
                if i ~= height 
                    new_value = list(i,:);
                    new_list = strvcat(new_list,new_value);
                else
                    
                end
            elseif selected == 1 && height == 1
                new_list = {};
                set(handles.btn_remove_script,'Enable','off');
                
                
                set(handles.btn_benchmark,'Enable','off');
            else
                new_value = list(i,:);
                new_list = strvcat(new_list,new_value);
            end
     end
end

set(handles.listbox_script,'String',new_list,'Value',1);    
    
function btn_benchmark_Callback(hObject, eventdata, handles)

script_struct = get_root_data('script_struct');
   W_struct = size(script_struct,2);
   for i = 1:1:W_struct             
        benchmark(script_struct(i));
   end

function listbox_script_Callback(hObject, eventdata, handles)
function listbox_script_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end