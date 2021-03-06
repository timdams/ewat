%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%                           Hogeschool Antwerpen                          %
%                Industri�le Wetenschappen: Elektronica-ICT               %
%                      MultiMediaGroep - Watermarking                     %
%                                                                         %
%                                                                         %
%                             Bachelorproef 3.2                           %
%              Kevin Heylen - Tom Meesters - Luc Verstrepen               %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ATTACK GUI
%In this GUI, you can specify an attack to perfom on the watermarked
%image.


%% STANDARD GUI FUNCTION
function varargout = attacks(varargin)
% ATTACKS M-file for attacks.fig
%      ATTACKS, by itself, creates a new ATTACKS or raises the existing
%      singleton*.
%
%      H = ATTACKS returns the handle to a new ATTACKS or the handle to
%      the existing singleton*.
%
%      ATTACKS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ATTACKS.M with the given input arguments.
%
%      ATTACKS('Property','Value',...) creates a new ATTACKS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before attacks_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to attacks_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help attacks

% Last Modified by GUIDE v2.5 13-Feb-2008 21:50:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @attacks_OpeningFcn, ...
    'gui_OutputFcn',  @attacks_OutputFcn, ...
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
% --- Executes just before attacks is made visible.
function attacks_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to attacks (see VARARGIN)

% Choose default command line output for attacks
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes attacks wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%% ICONS
%%
set(handles.tab_compression,'Visible','on');
set(handles.togglebutton_compression,'Value',1);
set(handles.togglebutton_compression,'Enable','off');

set(handles.tab_enhancements,'Visible','off');
set(handles.tab_color_manipulations,'Visible','off');
set(handles.tab_noise,'Visible','off');
set(handles.tab_geometric,'Visible','off');
set(handles.tab_data_compositions,'Visible','off');
set(handles.tab_multiple_watermarks,'Visible','off');
set(handles.tab_other,'Visible','off');

setIcon(handles.rotCW, imread('Icons\CW.jpg'),30, 30);                  %show icon on rotate CW button
setIcon(handles.rotACW, imread('Icons\ACW.jpg'), 30, 30);               %show icon on rotate ACW button
setIcon(handles.flipHor, imread('Icons\flipH.jpg'), 30, 30);            %flip horizontal button
setIcon(handles.flipVert, imread('Icons\flipV.jpg'), 30, 30);           %flip vertical button
setIcon(handles.cropTop, imread('Icons\cropTop.jpg'), 30, 30);          %crop...
setIcon(handles.cropBottom, imread('Icons\cropBottom.jpg'), 30, 30);
setIcon(handles.cropLeft, imread('Icons\cropLeft.jpg'), 30, 30);
setIcon(handles.cropRight, imread('Icons\cropRight.jpg'), 30, 30);
setIcon(handles.cropFree, imread('Icons\cropFree.jpg'), 30, 30);
setIcon(handles.resizeHeight, imread('Icons\resizeH.jpg'), 30, 30);     %resize...
setIcon(handles.resizeWidth, imread('Icons\resizeW.jpg'), 30, 30);
setIcon(handles.shearWup, imread('Icons\shearWup.jpg'), 30,30);         %shear
setIcon(handles.shearWdown, imread('Icons\shearWdown.jpg'), 30,30);
setIcon(handles.shearHup, imread('Icons\shearHup.jpg'), 30,30);
setIcon(handles.shearHdown, imread('Icons\shearHdown.jpg'), 30,30);
setIcon(handles.zoomIn, imread('Icons\zoomIn.jpg'), 25, 25);        %call setIcon function which displays the passed image in the passed uicontrol with the passed dimensions
setIcon(handles.zoomInClick, imread('Icons\zoomInClick.jpg'), 25, 25);   %call setIcon function which displays the passed image in the passed uicontrol with the passed dimensions
setIcon(handles.pan, imread('Icons\pan.jpg'), 25, 25);              %call setIcon function which displays the passed image in the passed uicontrol with the passed dimensions
setIcon(handles.zoomOutAll, imread('Icons\zoomOutAll.jpg'), 25, 25);%call setIcon function which displays the passed image in the passed uicontrol with the passed dimensions

im = get_root_data('plot_watermarked_attacked');

axes(handles.imageBefore)                                           %set this axes active
image(im);                                                          %show image
axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                         %Sets the axis limits to the arrange of the data.
axis off;                                                           %Turn off all axis labeling
axes(handles.imagePreview)                                          %set this axes active
image(im);                                                          %show image
axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                         %Sets the axis limits to the arrange of the data.
axis off;                                                           %Turn off all axis labeling
axes(handles.imageAfter)                                            %set this axes active
image(im);                                                          %show image
axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                         %Sets the axis limits to the arrange of the data.
axis off;                                                           %Turn off all axis labeling

used_component = get_root_data('used_component');
set(handles.watermarkGo,'String',['Watermark ' used_component]);

%% MATLAB STANDARD GUI FUNCTIONS
% --- Outputs from this function are returned to the command line.
function varargout = attacks_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%% PANEL IMAGE
% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im = getimage(handles.imageBefore);                     %get image without attacks
axes(handles.imagePreview);                             %set this axes active
image(im);                                              %display rotated image
axis equal;                                             %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                             %Sets the axis limits to the arrange of the data.
axis off;                                               %Turn off all axis labeling
axes(handles.imageAfter);                               %set this axes active
image(im);                                              %display rotated image
axis equal;                                             %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                             %Sets the axis limits to the arrange of the data.
axis off;                                               %Turn off all axis labeling


%% ROTATE
% --- Executes on button press in rotCW.
function rotCW_Callback(hObject, eventdata, handles)
% hObject    handle to rotCW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rotCW
nrOfDegrees = floor(get(handles.rotSlider, 'Value'));   %get nr of degrees to rotate from slider
im = getimage(handles.imageAfter);                      %get image to rotate
im_rot_rescale = rot(im, nrOfDegrees, 1);                %rotate image clockwise (therefore -1)
axes(handles.imagePreview);                             %set this axes active
image(im_rot_rescale);                                  %display rotated image
axis equal;                                             %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                             %Sets the axis limits to the arrange of the data.
axis off;                                               %Turn off all axis labeling
% --- Executes on button press in rotACW.
function rotACW_Callback(hObject, eventdata, handles)
% hObject    handle to rotACW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rotACW
nrOfDegrees = floor(get(handles.rotSlider, 'Value'));   %get nr of degrees to rotate from slider
im = getimage(handles.imageAfter);                      %get image to rotate
im_rot_rescale = rot(im, nrOfDegrees, 0);                     %rotate image anitclockwise
axes(handles.imagePreview);                             %set this axes active
image(im_rot_rescale);                                  %display rotated image
axis equal;                                             %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                             %Sets the axis limits to the arrange of the data.
axis off;                                               %Turn off all axis labeling
% --- Executes on slider movement.
function rotSlider_Callback(hObject, eventdata, handles)
% hObject    handle to rotSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
nrOfDegrees = floor(get(handles.rotSlider, 'Value'));        %get nr of degrees to rotate from slider
set(handles.rotNrOfDegrees, 'String', [num2str(nrOfDegrees) '�']);

%% FLIP
% --- Executes on button press in flipHor.
function flipHor_Callback(hObject, eventdata, handles)
% hObject    handle to flipHor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of flipHor
im = getimage(handles.imageAfter);                      %read image
im_flip = flip(im, 'H');
axes(handles.imagePreview);                             %set this axes active
image(im_flip);                                         %display rotated image
axis equal;                                             %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                             %Sets the axis limits to the arrange of the data.
axis off;                                               %Turn off all axis labeling
% --- Executes on button press in flipVert.
function flipVert_Callback(hObject, eventdata, handles)
% hObject    handle to flipVert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of flipVert

im = getimage(handles.imageAfter);                      %read image
im_flip = flip(im, 'V');
axes(handles.imagePreview);                             %set this axes active
image(im_flip);                                         %display rotated image
axis equal;                                             %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                             %Sets the axis limits to the arrange of the data.
axis off;                                               %Turn off all axis labeling

%% CROP
% --- Executes on slider movement.
function cropSlider_Callback(hObject, eventdata, handles)
% hObject    handle to cropSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cropPercent = floor(get(handles.cropSlider, 'Value'));              %get value of slider
set(handles.cropPercent, 'String', [num2str(cropPercent), ' %']);   %display value
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% --- Executes on button press in cropTop.
function cropTop_Callback(hObject, eventdata, handles)
% hObject    handle to cropTop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cropPercent = floor(get(handles.cropSlider, 'Value'));  %get value of slider
im = getimage(handles.imageAfter);                      %read image
im_crop = crop(im, cropPercent, 'Top');
[Hc Wc Dc] = size(im_crop);
if(~isempty(im_crop) && Hc >1 && Wc > 1)
    axes(handles.imagePreview)                              %set this axes active
    image(im_crop)                                          %show cropped image in it
    axis equal;                                             %sets the aspect ratio. (Show the image in its right ratio)
    axis tight;                                             %Sets the axis limits to the arrange of the data.
    axis off;                                               %Turn off all axis labeling
else
    msgbox('This action will result in an empty image or an image that can''t be displayed properly', 'Error', 'error');
end
% axes(handles.imageAfter)
% image(im);
% --- Executes on button press in cropBottom.
function cropBottom_Callback(hObject, eventdata, handles)
% hObject    handle to cropBottom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cropPercent = floor(get(handles.cropSlider, 'Value'));  %get value of slider
im = getimage(handles.imageAfter);                      %read image
im_crop = crop(im, cropPercent, 'Bottom');
[Hc Wc Dc] = size(im_crop);
if(~isempty(im_crop) && Hc >1 && Wc > 1)
    axes(handles.imagePreview)                              %set this axes active
    image(im_crop)                                          %show cropped image in it
    axis equal;                                             %sets the aspect ratio. (Show the image in its right ratio)
    axis tight;                                             %Sets the axis limits to the arrange of the data.
    axis off;                                               %Turn off all axis labeling
else
    msgbox('This action will result in an empty image or an image that can''t be displayed properly', 'Error', 'error');
end
% --- Executes on button press in cropLeft.
function cropLeft_Callback(hObject, eventdata, handles)
% hObject    handle to cropLeft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cropPercent = floor(get(handles.cropSlider, 'Value'));  %get value of slider
im = getimage(handles.imageAfter);                      %read image
im_crop = crop(im, cropPercent, 'Left');
[Hc Wc Dc] = size(im_crop);
if(~isempty(im_crop) && Hc >1 && Wc > 1)
    axes(handles.imagePreview)                              %set this axes active
    image(im_crop)                                          %show cropped image in it
    axis equal;                                             %sets the aspect ratio. (Show the image in its right ratio)
    axis tight;                                             %Sets the axis limits to the arrange of the data.
    axis off;                                               %Turn off all axis labeling
else
    msgbox('This action will result in an empty image or an image that can''t be displayed properly', 'Error', 'error');
end
% --- Executes on button press in cropRight.
function cropRight_Callback(hObject, eventdata, handles)
% hObject    handle to cropRight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cropPercent = floor(get(handles.cropSlider, 'Value'));  %get value of slider
im = getimage(handles.imageAfter);                      %read image
im_crop = crop(im, cropPercent, 'Right');
[Hc Wc Dc] = size(im_crop);
if(~isempty(im_crop) && Hc >1 && Wc > 1)
    axes(handles.imagePreview)                              %set this axes active
    image(im_crop)                                          %show cropped image in it
    axis equal;                                             %sets the aspect ratio. (Show the image in its right ratio)
    axis tight;                                             %Sets the axis limits to the arrange of the data.
    axis off;                                               %Turn off all axis labeling
else
    msgbox('This action will result in an empty image or an image that can''t be displayed properly', 'Error', 'error');
end
% --- Executes on button press in cropFree.
function cropFree_Callback(hObject, eventdata, handles)
% hObject    handle to cropFree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im = getimage(handles.imageAfter);                      %read image
h=1;                                                    %set h to an integer (needed for the next line)
figure(h);                                              %create new figure called h (work only if h is an integer)
image(im);                                              %show image in figure h
im_crop = imcrop(im);                                   %use imcrop to let user select which part of image to keep
close(h);                                               %close figure
axes(handles.imagePreview)                              %set this axes active
image(im_crop)                                          %show cropped image in it
axis equal;                                             %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                             %Sets the axis limits to the arrange of the data.
axis off;                                               %Turn off all axis labeling

%% RESIZE
% --- Executes on slider movement.
function resizeSlider_Callback(hObject, eventdata, handles)
% hObject    handle to resizeSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

resizeWPercent = floor(get(handles.resizeSlider, 'Value'));                      %get value of slider
set(handles.resizePercent, 'String', [num2str(resizeWPercent), '%']);            %show value of slider
% --- Executes on button press in resizeWidth.
function resizeWidth_Callback(hObject, eventdata, handles)
% hObject    handle to resizeWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im = getimage(handles.imageAfter);                                  %get image
percent = floor(get(handles.resizeSlider, 'Value'))/100;      %get value of slider
im_resized = resize(im, percent, 'W');
axes(handles.imagePreview)                                          %set this axes active
image(im_resized)                                                   %show cropped image in it
axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                         %Sets the axis limits to the arrange of the data.
axis off;
% --- Executes on button press in resizeHeight.
function resizeHeight_Callback(hObject, eventdata, handles)
% hObject    handle to resizeHeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im = getimage(handles.imageAfter);                                  %get image
percent = floor(get(handles.resizeSlider, 'Value'))/100;      %get value of slider
im_resized = resize(im, percent, 'H');
axes(handles.imagePreview)                                          %set this axes active
image(im_resized)                                                   %show cropped image in it
axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                         %Sets the axis limits to the arrange of the data.
axis off;                                                           %Turn off all axis labeling

%% SHEAR
% --- Executes on slider movement.
function shearSlider_Callback(hObject, eventdata, handles)
% hObject    handle to shearSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of
%        slider

shearValue = round(get(handles.shearSlider, 'Value')*10)/10;      %get value of slider
set(handles.shearValue, 'String', shearValue);              %show value of slider
% --- Executes on button press in shearWup.
function shearWup_Callback(hObject, eventdata, handles)
% hObject    handle to shearWup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

workbar(0.1, 'Applying shear', 'Shear');
percent = get(handles.shearSlider, 'Value');                          %get value of shearSlider
im = getimage(handles.imageAfter);                              %get image
im_s = shear(im, percent, 'WU');
workbar(1.0);
axes(handles.imagePreview)                                      %set this axes as active
image(im_s);                                                    %show image
axis equal;                                                     %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                     %Sets the axis limits to the arrange of the data.
axis off;                                                       %Turn off all axis labeling
% --- Executes on button press in shearWdown.
function shearWdown_Callback(hObject, eventdata, handles)
% hObject    handle to shearWdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
workbar(0.1, 'Applying shear', 'Shear');
percent = get(handles.shearSlider, 'Value');                          %get value of shearSlider
im = getimage(handles.imageAfter);                              %get image
im_s = shear(im, percent, 'WD');
workbar(1.0);
axes(handles.imagePreview)                                      %set this axes as active
image(im_s);                                                    %show image
axis equal;                                                     %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                     %Sets the axis limits to the arrange of the data.
axis off;                                                       %Turn off all axis labeling
% --- Executes on button press in shearHup.
function shearHup_Callback(hObject, eventdata, handles)
% hObject    handle to shearHup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
workbar(0.1, 'Applying shear', 'Shear');
percent = get(handles.shearSlider, 'Value');                          %get value of shearSlider
im = getimage(handles.imageAfter);                              %get image
im_s = shear(im, percent, 'HU');
workbar(1.0);
axes(handles.imagePreview)                                  %set this axes as active
image(im_s);                                                %show image
axis equal;                                                 %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                 %Sets the axis limits to the arrange of the data.
axis off;                                                   %Turn off all axis labeling
% --- Executes on button press in shearHdown.
function shearHdown_Callback(hObject, eventdata, handles)
% hObject    handle to shearHdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
workbar(0.1, 'Applying shear', 'Shear');
percent = get(handles.shearSlider, 'Value');                      %get value of shearSlider
im = getimage(handles.imageAfter);                          %get image
im_s = shear(im, percent, 'HD');
workbar(1.0);
axes(handles.imagePreview)                                  %set this axes as active
image(im_s);                                                %show image
axis equal;                                                 %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                 %Sets the axis limits to the arrange of the data.
axis off;                                                   %Turn off all axis labeling

%% REMOVE PIXEL ROW(S) OR COLUMN(S)
% --- Executes on button press in radiobutton_row.
function radiobutton_row_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_row (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_row
row = get(handles.radiobutton_row, 'Value');
if (row == 1.0)
    im = getimage(handles.imageAfter);
    [H W D] = size(im);
    %uncheck radio button columns
    set(handles.radiobutton_column, 'Value', 0.0);
    %initalize titles
    set(handles.title_nr_of_rows_colums, 'String', 'Row width (pixels):');
    set(handles.title_offset, 'String', 'Offset (X)');
    %initialize sliders
    set(handles.slider_nr_of_rows_columns, 'Max', W-1);
    set(handles.nr_of_rows_columns_max, 'String', num2str(W-1));
    max = W - floor(get(handles.slider_nr_of_rows_columns, 'Value'));
    set(handles.slider_offset, 'Max', max);
    set(handles.offset_max, 'String', num2str(max));
    val = floor(W/2 - get(handles.slider_nr_of_rows_columns, 'Value')/2);
    set(handles.slider_offset, 'Value', val);
    set(handles.offset, 'String', num2str(val));
else
    set(handles.radiobutton_column, 'Value', 1.0);
    radiobutton_column_Callback;
end

% --- Executes on button press in radiobutton_column.
function radiobutton_column_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_column (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_column
col = get(handles.radiobutton_column, 'Value');
if (col == 1.0)
    im = getimage(handles.imageAfter);
    [H W D] = size(im);
    %uncheck radio button row
    set(handles.radiobutton_row, 'Value', 0.0);
    %initalize titles
    set(handles.title_nr_of_rows_colums, 'String', 'Column height (pixels):');
    set(handles.title_offset, 'String', 'Offset (Y)');
    %initialize sliders
    set(handles.slider_nr_of_rows_columns, 'Max', H-1);
    set(handles.nr_of_rows_columns_max, 'String', num2str(H-1));
    max = H - floor(get(handles.slider_nr_of_rows_columns, 'Value'));
    set(handles.slider_offset, 'Max', max);
    set(handles.offset_max, 'String', num2str(max));
    val = floor(H/2 - get(handles.slider_nr_of_rows_columns, 'Value')/2);
    set(handles.slider_offset, 'Value', val);
    set(handles.offset, 'String', num2str(val));
else
    set(handles.radiobutton_column, 'Value', 1.0);
    radiobutton_row_Callback;
end


% --- Executes during object creation, after setting all properties.
function slider_nr_of_rows_columns_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_nr_of_rows_columns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider_nr_of_rows_columns_Callback(hObject, eventdata, handles)
% hObject    handle to slider_nr_of_rows_columns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
nr = floor(get(handles.slider_nr_of_rows_columns, 'Value'));
set(handles.nr_of_rows_columns, 'String', num2str(nr));
im = getimage(handles.imageAfter);
[H W D] = size(im);
max = H - floor(get(handles.slider_nr_of_rows_columns, 'Value'));
set(handles.slider_offset, 'Max', max);
set(handles.offset_max, 'String', num2str(max));
val = floor(H/2 - get(handles.slider_nr_of_rows_columns, 'Value')/2);
set(handles.slider_offset, 'Value', val);
set(handles.offset, 'String', num2str(val));
step1 = get(handles.slider_nr_of_rows_columns, 'SliderStep');
step1(1) = 1/get(handles.slider_nr_of_rows_columns, 'Max');
set(handles.slider_nr_of_rows_columns, 'SliderStep', step1);
step2 = get(handles.slider_offset, 'SliderStep');
step2(1) = 1/get(handles.slider_offset, 'Max');
set(handles.slider_offset, 'SliderStep', step2);


% --- Executes during object creation, after setting all properties.
function slider_offset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_offset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider_offset_Callback(hObject, eventdata, handles)
% hObject    handle to slider_offset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
offset = floor(get(handles.slider_offset, 'Value'));
set(handles.offset, 'String', num2str(offset));

% --- Executes on button press in remove_row_column_GO.
function remove_row_column_GO_Callback(hObject, eventdata, handles)
% hObject    handle to remove_row_column_GO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im = getimage(handles.imageAfter);                  %get image
if (get(handles.radiobutton_row, 'Value') == 1.0)            %determine wether rows (1) or columns (0) have to be removed
    row = 1;
else
    row = 0;
end
nr = floor(get(handles.slider_nr_of_rows_columns, 'Value'));    %get width/height of row/column
offset = floor(get(handles.slider_offset, 'Value'));            %get offset
im_rem = remove_row_column(im, row, nr, offset);
axes(handles.imagePreview)                                  %set this axes as active
image(im_rem);                                              %show image
axis equal;                                                 %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                 %Sets the axis limits to the arrange of the data.
axis off;                                                   %Turn off all axis labeling




%% LOSSY COMPRESSION
% --- Executes on button press in jpegGO.
function jpegGO_Callback(hObject, eventdata, handles)
% hObject    handle to jpegGO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im = getimage(handles.imageAfter);                          %get image
Q_factor = get(handles.JPEGslider, 'Value');                %get quality factor
setting = get_root_data('image_type');

switch setting
    case 'grayscale'
        type = 'grayscale';
    case 'layered'
        type = 'color';
end

if (Q_factor == 100)
    im_compr = im;
else
    im_compr = jpeg(im, Q_factor, type);
end
axes(handles.imagePreview)                                  %set this axes as active
imshow(im_compr);                                            %show image
axis equal;                                                 %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                 %Sets the axis limits to the arrange of the data.
axis off;
% --- Executes on slider movement.
function JPEGslider_Callback(hObject, eventdata, handles)
% hObject    handle to JPEGslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

Q_factor = floor(get(handles.JPEGslider, 'Value'));
set(handles.JPEGscale, 'String', Q_factor);

%% LOSSLESS COMPRESSION
% --- Executes during object creation, after setting all properties.
function JPEG2000slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to JPEG2000slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on slider movement.
function JPEG2000slider_Callback(hObject, eventdata, handles)
% hObject    handle to JPEG2000slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes on button press in JPEG2000GO.
function JPEG2000GO_Callback(hObject, eventdata, handles)
% hObject    handle to JPEG2000GO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%% SHARPEN
% % --- Executes during object creation, after setting all properties.
function sharpenSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sharpenSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on slider movement.
function sharpenSlider_Callback(hObject, eventdata, handles)
% hObject    handle to sharpenSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

sharpenFactor = floor(get(handles.sharpenSlider, 'Value')*10)/10;
set(handles.sharpenAlpha, 'String', sharpenFactor);
im = getimage(handles.imageAfter);
sharpenFactor = get(handles.sharpenSlider, 'Value');
im_sharp = sharpen(im, sharpenFactor);
axes(handles.imagePreview)                                  %set this axes as active
image(im_sharp);                                            %show image
axis equal;                                                 %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                 %Sets the axis limits to the arrange of the data.
axis off;

%% INTENSITY
% --- Executes on slider movement.
function intensitySlider_Callback(hObject, eventdata, handles)
% hObject    handle to intensitySlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

intensityFactor = floor(get(handles.intensitySlider, 'Value'));    %get value of slider
set(handles.intensityFactor, 'String', [num2str(intensityFactor), '%']);           %display value of slider
set(handles.redSlider, 'Value', intensityFactor);
set(handles.red, 'String', [num2str(intensityFactor), '%']);            %display value
set(handles.greenSlider, 'Value', intensityFactor);
set(handles.green, 'String', [num2str(intensityFactor), '%']);            %display value
set(handles.blueSlider, 'Value', intensityFactor);
set(handles.blue, 'String', [num2str(intensityFactor), '%']);            %display value
intensityFactor = get(handles.intensitySlider,'value')/33.333333333;     %get value of slider and convert it to range 0..3
im = getimage(handles.imageAfter);                          %get image
im_int = intensity(im, intensityFactor);
axes(handles.imagePreview)                                  %set this axes as active
image(im_int);                                              %show image
axis equal;                                                 %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                 %Sets the axis limits to the arrange of the data.
axis off;

%% BLUR
% % --- Executes during object creation, after setting all properties.
function blurSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blurSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on slider movement.
function blurSlider_Callback(hObject, eventdata, handles)
% hObject    handle to blurSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
radius = round(get(handles.blurSlider, 'Value'));
set(handles.blurRadius, 'String', radius);
workbar(0.1, 'Reading pararmeters','Blur');
radius = floor(get(handles.blurSlider,'value'));        %get value from slider
im = getimage(handles.imageAfter);                      %get image
im_blur = blur(im, radius);
axes(handles.imagePreview)                                  %set this axes as active
image(im_blur);                                         %show image
axis equal;                                             %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                             %Sets the axis limits to the arrange of the data.
axis off;
workbar(1.0);

%% MOTION
% --- Executes during object creation, after setting all properties.
function motionSliderAngle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to motionSliderAngle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes during object creation, after setting all properties.
function motionSliderNrOfPixels_CreateFcn(hObject, eventdata, handles)
% hObject    handle to motionSliderNrOfPixels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on slider movement.
function motionSliderNrOfPixels_Callback(hObject, eventdata, handles)
% hObject    handle to motionSliderNrOfPixels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
nrOfPixels = floor(get(handles.motionSliderNrOfPixels, 'Value'));           %get value from slider
set(handles.motionNrOfPixels, 'String', nrOfPixels);                        %display value of slider
angle = get(handles.motionSliderAngle,'value');                     %get angle
im = getimage(handles.imageAfter);                                  %get image
im_mot = motion(im, nrOfPixels, angle);
axes(handles.imagePreview)                                          %set this axes as active
image(im_mot);                                                      %show image
axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                         %Sets the axis limits to the arrange of the data.
axis off;
% --- Executes on slider movement.
function motionSliderAngle_Callback(hObject, eventdata, handles)
% hObject    handle to motionSliderAngle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
angle = floor(get(handles.motionSliderAngle, 'Value'));                     %get value from slider
set(handles.motionAngle, 'String', [num2str(angle), '�']);                  %display value of slider

nrOfPixels = floor(get(handles.motionSliderNrOfPixels,'value'));    %get nr of pixels
angle = get(handles.motionSliderAngle,'value');                     %get angle
im = getimage(handles.imageAfter);                                  %get image
im_mot = motion(im, nrOfPixels, angle);
axes(handles.imagePreview)                                          %set this axes as active
image(im_mot);                                                      %show image
axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                         %Sets the axis limits to the arrange of the data.
axis off;

%% EDGE DETECTION
% --- Executes during object creation, after setting all properties.
function edge_filter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edge_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes during object creation, after setting all properties.
function edgeSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edgeSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on slider movement.
function edgeSlider_Callback(hObject, eventdata, handles)
% hObject    handle to edgeSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

thresh = floor(get(handles.edgeSlider, 'Value')*1000)/1000;     %get value of slider�
set(handles.edgeThreshold, 'String', thresh);                 %display value
% --- Executes on selection change in edge_filter.
function edge_filter_Callback(hObject, eventdata, handles)
% hObject    handle to edge_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns edge_filter contents as cell array
%        contents{get(hObject,'Value')} returns selected item from edge_filter

filter = get(handles.edge_filter, 'Value');                         %get type of filter
switch(filter)
    case 1.0
        set(handles.edgeTitle, 'Visible', 'on');
        set(handles.edgeThreshold, 'String', '0.1');
        set(handles.edgeThreshold, 'Visible', 'on');
        set(handles.edgeSlider, 'Max', 0.2);
        set(handles.edgeSlider, 'Value', 0.1);
        set(handles.edgeSlider, 'Visible', 'on');
        set(handles.edgeSliderMin, 'Visible', 'on');
        set(handles.edgeSliderMax, 'String', '0.2');
        set(handles.edgeSliderMax, 'visible', 'on');
    case 2.0
        set(handles.edgeTitle, 'Visible', 'on');
        set(handles.edgeThreshold, 'String', '0.01');
        set(handles.edgeThreshold, 'Visible', 'on');
        set(handles.edgeSlider, 'Value', 0.01);
        set(handles.edgeSlider, 'Max', 0.02);
        set(handles.edgeSlider, 'Visible', 'on');
        set(handles.edgeSliderMin, 'Visible', 'on');
        set(handles.edgeSliderMax, 'String', '0.02');
        set(handles.edgeSliderMax, 'visible', 'on');
    case 3.0
        set(handles.edgeTitle, 'Visible', 'on');
        set(handles.edgeThreshold, 'String', '0.1');
        set(handles.edgeThreshold, 'Visible', 'on');
        set(handles.edgeSlider, 'Max', 0.2);
        set(handles.edgeSlider, 'Value', 0.1);
        set(handles.edgeSlider, 'Visible', 'on');
        set(handles.edgeSliderMin, 'Visible', 'on');
        set(handles.edgeSliderMax, 'String', '0.2');
        set(handles.edgeSliderMax, 'visible', 'on');
    case 4.0
        set(handles.edgeTitle, 'Visible', 'on');
        set(handles.edgeThreshold, 'String', '0.1');
        set(handles.edgeThreshold, 'Visible', 'on');
        set(handles.edgeSlider, 'Max', 0.2);
        set(handles.edgeSlider, 'Value', 0.1);
        set(handles.edgeSlider, 'Visible', 'on');
        set(handles.edgeSliderMin, 'Visible', 'on');
        set(handles.edgeSliderMax, 'String', '0.2');
        set(handles.edgeSliderMax, 'visible', 'on');
    case 5.0
        set(handles.edgeTitle, 'Visible', 'on');
        set(handles.edgeThreshold, 'String', '0.1');
        set(handles.edgeThreshold, 'Visible', 'on');
        set(handles.edgeSlider, 'Max', 0.2);
        set(handles.edgeSlider, 'Value', 0.1);
        set(handles.edgeSlider, 'Visible', 'on');
        set(handles.edgeSliderMin, 'Visible', 'on');
        set(handles.edgeSliderMax, 'String', '0.2');
        set(handles.edgeSliderMax, 'visible', 'on');
    case 6.0
        set(handles.edgeTitle, 'Visible', 'on');
        set(handles.edgeThreshold, 'String', '0.01');
        set(handles.edgeThreshold, 'Visible', 'on');
        set(handles.edgeSlider, 'Value', 0.01);
        set(handles.edgeSlider, 'Max', 0.02);
        set(handles.edgeSlider, 'Visible', 'on');
        set(handles.edgeSliderMin, 'Visible', 'on');
        set(handles.edgeSliderMax, 'String', '0.02');
        set(handles.edgeSliderMax, 'visible', 'on');
    otherwise
        set(handles.edgeTitle, 'Visible', 'off');
        set(handles.edgeThreshold, 'Visible', 'off');
        set(handles.edgeSlider, 'Visible', 'off');
        set(handles.edgeSliderMin, 'Visible', 'off');
        set(handles.edgeSliderMax, 'visible', 'off');
end
% --- Executes on button press in edge_go.
function edge_go_Callback(hObject, eventdata, handles)
% hObject    handle to edge_go (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
thresh = get(handles.edgeSlider, 'Value');                          %get value of slider
filter = get(handles.edge_filter, 'Value');                         %get type of filter
im = rgb2gray(getimage(handles.imageAfter));                        %get image and convert to grayscale (needed for edge filter)

switch(filter)
    case 1.0
        im_edge = edge(im, 'canny', thresh);
    case 2.0
        im_edge = edge(im, 'log', thresh);
    case 3.0
        im_edge = edge(im, 'prewitt', thresh);
    case 4.0
        im_edge = edge(im, 'roberts', thresh);
    case 5.0
        im_edge = edge(im, 'sobel', thresh);
    case 6.0
        im_edge = edge(im, 'zerocross', thresh);
    otherwise
        im_edge = edge(im);
end
im_edge = cat(3, im_edge, im_edge, im_edge);                        %create 3 layered image
axes(handles.imagePreview)                                          %set this axes as active
image(im_edge);                                                     %show image
axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                         %Sets the axis limits to the arrange of the data.
axis off;

%% GAMMA
% --- Executes during object creation, after setting all properties.
function gammaSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gammaSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on slider movement.
function gammaSlider_Callback(hObject, eventdata, handles)
% hObject    handle to gammaSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

g = floor(get(handles.gammaSlider, 'Value')*100)/100;           %get value of slider
set(handles.gamma, 'String', g);                                %display value
g = get(handles.gammaSlider,'value');                           %get value of slider
im = getimage(handles.imageAfter);                                  %get image
im_gamma = gamma(im, g);
axes(handles.imagePreview)                                          %set this axes as active
image(im_gamma);                                                    %show image
axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                         %Sets the axis limits to the arrange of the data.
axis off;

%% LUMINANCE
% --- Executes on slider movement.
function lumSlider_Callback(hObject, eventdata, handles)
% hObject    handle to lumSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

lum = floor(get(handles.lumSlider, 'Value'));                       %get value from slider
set(handles.lum, 'String', [num2str(lum), '%']);                    %display value
im = getimage(handles.imageAfter);                                  %get image
lum = floor(get(handles.lumSlider, 'Value'))/33.333333333;          %get value of slider
setting = get_root_data('image_type');
im_lum = luminance(im, lum, setting);
axes(handles.imagePreview)                                          %set this axes as active
image(im_lum);                                                      %show image
axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                         %Sets the axis limits to the arrange of the data.
axis off;

%% Cb
% --- Executes on slider movement.
function chromSlider_Callback(hObject, eventdata, handles)
% hObject    handle to chromSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

chr = floor(get(handles.chromSlider, 'Value'));               %get value from slider
set(handles.chrom, 'String', [num2str(chr), '%']);            %display value
im = getimage(handles.imageAfter);                                  %get image
chrom = floor(get(handles.chromSlider, 'Value'))/33.333333333;        %get value of slider                                                %determine siz of image
setting = get_root_data('image_type');
im_chrom = cb(im, chrom, setting);
axes(handles.imagePreview)                                          %set this axes as active
image(im_chrom);                                                    %show image
axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                         %Sets the axis limits to the arrange of the data.
axis off;

%% CR
% --- Executes on slider movement.
function crSlider_Callback(hObject, eventdata, handles)
% hObject    handle to crSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

cr_ = floor(get(handles.crSlider, 'Value'));               %get value from slider
set(handles.cr, 'String', [num2str(cr_), '%']);            %display value
im = getimage(handles.imageAfter);                                  %get image
cr_ = floor(get(handles.crSlider, 'Value'))/33.333333333;            %get value of slider

setting = get_root_data('image_type');
im_cr = cr(im, cr_, setting);
axes(handles.imagePreview)                                          %set this axes as active
image(im_cr);                                                       %show image
axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                         %Sets the axis limits to the arrange of the data.
axis off;

%% RED
% --- Executes on slider movement.
function redSlider_Callback(hObject, eventdata, handles)
% hObject    handle to redSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

r = floor(get(handles.redSlider, 'Value'));               %get value from slider
set(handles.red, 'String', [num2str(r), '%']);            %display value
im = getimage(handles.imageAfter);                                  %get image
r = get(handles.redSlider, 'Value')/33.333333333;          %get value of slider
setting = get_root_data('image_type');
im_r = red(im, r, setting);
axes(handles.imagePreview)                                          %set this axes as active
image(im_r);                                                       %show image
axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                         %Sets the axis limits to the arrange of the data.
axis off;

%% GREEN
% --- Executes on slider movement.
function greenSlider_Callback(hObject, eventdata, handles)
% hObject    handle to greenSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

g = floor(get(handles.greenSlider, 'Value'));               %get value from slider
set(handles.green, 'String', [num2str(g), '%']);            %display value
im = getimage(handles.imageAfter);                                  %get image
g = get(handles.greenSlider, 'Value')/33.333333333;          %get value of slider
setting = get_root_data('image_type');
im_g = green(im, g, setting);
axes(handles.imagePreview)                                          %set this axes as active
image(im_g);                                                       %show image
axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                         %Sets the axis limits to the arrange of the data.
axis off;

%% BLUE
% --- Executes on slider movement.
function blueSlider_Callback(hObject, eventdata, handles)
% hObject    handle to blueSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

b = floor(get(handles.blueSlider, 'Value'));               %get value from slider
set(handles.blue, 'String', [num2str(b), '%']);            %display value
im = getimage(handles.imageAfter);                                  %get image
b = get(handles.blueSlider, 'Value')/33.333333333;          %get value of slider
setting = get_root_data('image_type');
im_b = blue(im, b, setting);
axes(handles.imagePreview)                                          %set this axes as active
image(im_b);                                                       %show image
axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                         %Sets the axis limits to the arrange of the data.
axis off;

%% INSERT IMAGE
% --- Executes on button press in pasteBrowse.
function pasteBrowse_Callback(hObject, eventdata, handles)
% hObject    handle to pasteBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%open GUI to read in image
[tempname, temppath] = uigetfile({'*.jpg;*.jpeg;*.gif;*.bmp;*.tif;*.tiff;*.png','Images(*.bmp, *.jpg, *.jpeg, *.gif,*.png, *.tif, *.tiff)'},'Select an image');
if ((~strcmp(num2str(tempname), '0')) && (~strcmp(num2str(temppath), '0')))
    [filepath ,filename,ext,tempver] = fileparts(strcat(temppath, '\', tempname));
    set(handles.pastePath, 'String', [filepath filename ext]);
    image_info= imfinfo([filepath filename ext]);
    image_type = getfield(image_info,'ColorType');
    switch image_type
        case 'grayscale'
            image_read = imread([filepath filename ext]);
            im = cat(3,image_read,image_read,image_read);
        case 'truecolor'
            im =imread([filepath filename ext]);
        case 'indexed'
            [image_index,image_map] =imread([filepath filename ext]);
            im = im2uint8(ind2rgb(image_index,image_map));
        otherwise
            msgbox('Unsupported file format...','Error','error');
    end
    [pH pW pD] = size(im);                                      %get size of selected image
    [H W D] = size(getimage(handles.imageAfter));               %get size of image After
    coverX = floor((pW/W)*100);                             %compute ratio pasted image to watermarked (Y)
    coverY = floor((pH/H)*100);                             %compute ratio pasted image to watermarked (X)
    set(handles.pasteSliderCoverX, 'Value', coverX);            %initialize cover slider
    set(handles.pasteCoverX, 'String', num2str(floor(coverX)));
    set(handles.pasteSliderCoverY, 'Value', coverY);            %initialize cover slider
    set(handles.pasteCoverY, 'String', num2str(floor(coverY)));
    if (coverX < 100)
        offsetXmax = W - pW;                                    %determine max offsets
        set(handles.pasteSliderOffsetX, 'Max', offsetXmax);         %set max value of sliders
        set(handles.pasteOffsetXmax, 'String', num2str(offsetXmax));
        stepX = get(handles.pasteSliderOffsetX, 'SliderStep');      %get and set slider step
        stepX(1) = (1/offsetXmax);
        set(handles.pasteSliderOffsetX, 'Sliderstep', stepX);
        set(handles.pasteSliderOffsetX, 'Value', floor(offsetXmax/2));
        set(handles.pasteOffsetX, 'String', floor(offsetXmax/2));
        set(handles.pasteSliderOffsetX, 'Visible', 'on');           %show rest of panel
        set(handles.pasteTitleOffsetX, 'Visible', 'on');
        set(handles.pasteOffsetX, 'Visible', 'on');
        set(handles.pasteOffsetXmin, 'Visible', 'on');
        set(handles.pasteOffsetXmax, 'Visible', 'on');
        set(handles.pasteSliderCoverX, 'Visible', 'on');
        set(handles.pasteTitleCoverX, 'Visible', 'on');
        set(handles.pasteCoverX, 'Visible', 'on');
        set(handles.pasteCoverXMin, 'Visible', 'on');
        set(handles.pasteCoverXMax, 'Visible', 'on');
    else
        set(handles.pasteSliderOffsetX, 'Visible', 'off');           %show rest of panel
        set(handles.pasteTitleOffsetX, 'Visible', 'off');
        set(handles.pasteOffsetX, 'Visible', 'off');
        set(handles.pasteOffsetXmin, 'Visible', 'off');
        set(handles.pasteOffsetXmax, 'Visible', 'off');
        set(handles.pasteSliderCoverX, 'Visible', 'on');
        set(handles.pasteTitleCoverX, 'Visible', 'on');
        set(handles.pasteCoverX, 'Visible', 'on');
        set(handles.pasteCoverXMin, 'Visible', 'on');
        set(handles.pasteCoverXMax, 'Visible', 'on');
    end
    if (coverY < 100)
        offsetYmax = H - pH;                                    %determine max offsets
        set(handles.pasteSliderOffsetY, 'Max', offsetYmax);
        set(handles.pasteOffsetYmax, 'String', num2str(offsetYmax));
        stepY = get(handles.pasteSliderOffsetY, 'SliderStep');      %get and set slider step
        stepY(1) = (1/offsetYmax);
        set(handles.pasteSliderOffsetY, 'Sliderstep', stepY);
        set(handles.pasteSliderOffsetY, 'Value', floor(offsetYmax/2));
        set(handles.pasteOffsetY, 'String', floor(offsetYmax/2));
        set(handles.pasteSliderOffsetY, 'Visible', 'on');
        set(handles.pasteTitleOffsetY, 'Visible', 'on');
        set(handles.pasteOffsetY, 'Visible', 'on');
        set(handles.pasteOffsetYmin, 'Visible', 'on');
        set(handles.pasteOffsetYmax, 'Visible', 'on');
        set(handles.pasteSliderCoverY, 'Visible', 'on');
        set(handles.pasteTitleCoverY, 'Visible', 'on');
        set(handles.pasteCoverY, 'Visible', 'on');
        set(handles.pasteCoverYMin, 'Visible', 'on');
        set(handles.pasteCoverYMax, 'Visible', 'on');
    else
        set(handles.pasteSliderOffsetY, 'Visible', 'off');
        set(handles.pasteTitleOffsetY, 'Visible', 'off');
        set(handles.pasteOffsetY, 'Visible', 'off');
        set(handles.pasteOffsetYmin, 'Visible', 'off');
        set(handles.pasteOffsetYmax, 'Visible', 'off');
        set(handles.pasteSliderCoverY, 'Visible', 'on');
        set(handles.pasteTitleCoverY, 'Visible', 'on');
        set(handles.pasteCoverY, 'Visible', 'on');
        set(handles.pasteCoverYMin, 'Visible', 'on');
        set(handles.pasteCoverYMax, 'Visible', 'on');
    end
    set(handles.pasteGo, 'Visible', 'on');
    set(handles.pastePreview, 'Visible', 'on');
    set(handles.pasteRBgrayscale, 'Visible', 'on');
    axes(handles.pastePreview)                                  %show image
    imshow(im);
    axis equal;                                                 %sets the aspect ratio. (Show the image in its right ratio)
    axis tight;                                                 %Sets the axis limits to the arrange of the data.
    axis off;
end
% --- Executes on slider movement.
function pasteSliderOffsetX_Callback(hObject, eventdata, handles)
% hObject    handle to pasteSliderOffsetX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

offsetX = floor(get(handles.pasteSliderOffsetX, 'Value'));
set(handles.pasteOffsetX, 'String', offsetX);
% --- Executes on slider movement.
function pasteSliderOffsetY_Callback(hObject, eventdata, handles)
% hObject    handle to pasteSliderOffsetY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

offsetY = floor(get(handles.pasteSliderOffsetY, 'Value'));
set(handles.pasteOffsetY, 'String', offsetY);

% --- Executes on slider movement.
function pasteSliderCoverX_Callback(hObject, eventdata, handles)
% hObject    handle to pasteSliderCoverX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of
%        slider
coverX = floor(get(handles.pasteSliderCoverX, 'Value'));
set(handles.pasteCoverX, 'String', [num2str(coverX), '%']);

im = getimage(handles.pastePreview);

[H W D] = size(getimage(handles.imageAfter));               %get size of image After
pW = floor((coverX/100)*W);

if (coverX < 100)
    offsetXmax = W - pW;                                  %determine max offsets
    set(handles.pasteSliderOffsetX, 'Max', offsetXmax);         %set max value of sliders
    set(handles.pasteOffsetXmax, 'String', num2str(offsetXmax));
    stepX = get(handles.pasteSliderOffsetX, 'SliderStep');      %get and set slider step
    stepX(1) = (1/offsetXmax);
    set(handles.pasteSliderOffsetX, 'Sliderstep', stepX);
    set(handles.pasteSliderOffsetX, 'Value', floor(offsetXmax/2));
    set(handles.pasteOffsetX, 'String', floor(offsetXmax/2));
    set(handles.pasteSliderOffsetX, 'Visible', 'on');           %show rest of panel
    set(handles.pasteTitleOffsetX, 'Visible', 'on');
    set(handles.pasteOffsetX, 'Visible', 'on');
    set(handles.pasteOffsetXmin, 'Visible', 'on');
    set(handles.pasteOffsetXmax, 'Visible', 'on');
    set(handles.pasteGo, 'Visible', 'on');
    set(handles.pastePreview, 'Visible', 'on');
    set(handles.pasteRBgrayscale, 'Visible', 'on');
else
    set(handles.pasteSliderOffsetX, 'Visible', 'off');           %show rest of panel
    set(handles.pasteTitleOffsetX, 'Visible', 'off');
    set(handles.pasteOffsetX, 'Visible', 'off');
    set(handles.pasteOffsetXmin, 'Visible', 'off');
    set(handles.pasteOffsetXmax, 'Visible', 'off');
    set(handles.pasteGo, 'Visible', 'on');
    set(handles.pastePreview, 'Visible', 'on');
    set(handles.pasteRBgrayscale, 'Visible', 'on');
end

axes(handles.pastePreview)                                  %show image
imshow(im);
axis equal;                                                 %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                 %Sets the axis limits to the arrange of the data.
axis off;

% --- Executes during object creation, after setting all properties.
function pasteSliderCoverY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pasteSliderCoverY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function pasteSliderCoverY_Callback(hObject, eventdata, handles)
% hObject    handle to pasteSliderCoverY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
coverY = floor(get(handles.pasteSliderCoverY, 'Value'));
set(handles.pasteCoverY, 'String', [num2str(coverY), '%']);

im = getimage(handles.pastePreview);

[H W D] = size(getimage(handles.imageAfter));               %get size of image After
pH = floor((coverY/100)*H);

if (coverY < 100)
    offsetYmax = H - pH;                                  %determine max offsets
    set(handles.pasteSliderOffsetY, 'Max', offsetYmax);         %set max value of sliders
    set(handles.pasteOffsetYmax, 'String', num2str(offsetYmax));
    stepY = get(handles.pasteSliderOffsetY, 'SliderStep');      %get and set slider step
    stepY(1) = (1/offsetYmax);
    set(handles.pasteSliderOffsetY, 'Sliderstep', stepY);
    set(handles.pasteSliderOffsetY, 'Value', floor(offsetYmax/2));
    set(handles.pasteOffsetY, 'String', floor(offsetYmax/2));
    set(handles.pasteSliderOffsetY, 'Visible', 'on');           %show rest of panel
    set(handles.pasteTitleOffsetY, 'Visible', 'on');
    set(handles.pasteOffsetY, 'Visible', 'on');
    set(handles.pasteOffsetYmin, 'Visible', 'on');
    set(handles.pasteOffsetYmax, 'Visible', 'on');
    set(handles.pasteGo, 'Visible', 'on');
    set(handles.pastePreview, 'Visible', 'on');
    set(handles.pasteRBgrayscale, 'Visible', 'on');
else
    set(handles.pasteSliderOffsetY, 'Visible', 'off');           %show rest of panel
    set(handles.pasteTitleOffsetY, 'Visible', 'off');
    set(handles.pasteOffsetY, 'Visible', 'off');
    set(handles.pasteOffsetYmin, 'Visible', 'off');
    set(handles.pasteOffsetYmax, 'Visible', 'off');
    set(handles.pasteGo, 'Visible', 'on');
    set(handles.pastePreview, 'Visible', 'on');
    set(handles.pasteRBgrayscale, 'Visible', 'on');
end
axes(handles.pastePreview)                                  %show image
imshow(im);
axis equal;                                                 %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                 %Sets the axis limits to the arrange of the data.
axis off;


% --- Executes on button press in pasteGo.
function pasteGo_Callback(hObject, eventdata, handles)
% hObject    handle to pasteGo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im_cover = getimage(handles.imageAfter);                    %get cover image
im_paste = getimage(handles.pastePreview);                  %get image to embed
coverX = get(handles.pasteSliderCoverX, 'Value');           %get percent to cover (X)
coverY = get(handles.pasteSliderCoverY, 'Value');           %get percent to cover (Y)
[H W D] = size(im_cover);                                   %determine size of images
pH = floor((coverY/100)*H);
pW = floor((coverX/100)*W);
im_paste = imresize(im_paste, [pH pW]);                     %resize im_paste to obtain user cover settings
if(get(handles.pasteRBgrayscale, 'Value') == 1.0)           %radio button import als grayscale is cheched
    im_paste = rgb2gray(im_paste);
    im_paste = cat(3, im_paste, im_paste, im_paste);
end
[pH pW pD] = size(im_paste);                                %get size of image_paste
offsetX = floor(get(handles.pasteSliderOffsetX, 'Value'));  %get offsets
offsetY = floor(get(handles.pasteSliderOffsetY, 'Value'));
if (H >= pH && W >= pW)                                      %if cover image is large enough
    im_cover(offsetY+1:offsetY+pH, offsetX+1:offsetX+pW, :) = im_paste(:,:,:);
elseif (H < pH)
    if(W < pW)
        im_cover(:,:,:) = im_paste(1:H,1:W,:);
    else
        im_cover(:,offsetX+1:offsetX+pW,:,:) = im_paste(1:H,:,:);
    end
else
    im_cover(offsetY+1:offsetY+pH,:,:) = im_paste(:,1:W,:);
end
axes(handles.imagePreview)                                          %set this axes as active
image(im_cover);                                                    %show image
axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                         %Sets the axis limits to the arrange of the data.
axis off;

%% NOISE
% --- Executes on selection change in noiseType.
function noiseType_Callback(hObject, eventdata, handles)
% hObject    handle to noiseType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns noiseType contents as cell array
%        contents{get(hObject,'Value')} returns selected item from noiseType

noiseType = get(hObject, 'Value');                      %get selected noise type
switch(noiseType)
    case 2.0                                            %Gaussian white noise
        set(handles.noiseTitleMean, 'Visible', 'on');       %show components of noise panel
        set(handles.noiseMean, 'Visible', 'on');
        set(handles.noiseSliderMean, 'Visible', 'on');
        set(handles.noiseMeanMin, 'Visible', 'on');
        set(handles.noiseMeanMax, 'Visible', 'on');
        set(handles.noiseTitleVariance, 'Visible', 'on');
        set(handles.noiseVariance, 'String', 0.01);
        set(handles.noiseVariance, 'Visible', 'on');
        set(handles.noiseSliderVariance, 'Value', 0.01);
        set(handles.noiseSliderVariance, 'Max', 5.0);
        set(handles.noiseSliderVariance, 'Sliderstep', [0.002 0.1]);
        set(handles.noiseVarianceMax, 'String', 5.0);
        set(handles.noiseSliderVariance, 'Visible', 'on');
        set(handles.noiseVarianceMin, 'Visible', 'on');
        set(handles.noiseVarianceMax, 'Visible', 'on');
        set(handles.noiseTitleDensity, 'Visible', 'off');
        set(handles.noiseDensity, 'Visible', 'off');
        set(handles.noiseSliderDensity, 'Visible', 'off');
        set(handles.noiseDensityMin, 'Visible', 'off');
        set(handles.noiseDensityMax, 'Visible', 'off');
    case 3.0
        set(handles.noiseTitleMean, 'Visible', 'off');
        set(handles.noiseMean, 'Visible', 'off');
        set(handles.noiseSliderMean, 'Visible', 'off');
        set(handles.noiseMeanMin, 'Visible', 'off');
        set(handles.noiseMeanMax, 'Visible', 'off');
        set(handles.noiseTitleVariance, 'Visible', 'on');
        set(handles.noiseVariance, 'String', 0.1);
        set(handles.noiseVariance, 'Visible', 'on');
        set(handles.noiseSliderVariance, 'Value', 0.01);
        set(handles.noiseSliderVariance, 'Max', 5.0);
        set(handles.noiseSliderVariance, 'Sliderstep', [0.002 0.1]);
        set(handles.noiseVarianceMax, 'String', 5.0);
        set(handles.noiseSliderVariance, 'Visible', 'on');
        set(handles.noiseVarianceMin, 'Visible', 'on');
        set(handles.noiseVarianceMax, 'Visible', 'on');
        set(handles.noiseTitleDensity, 'Visible', 'off');
        set(handles.noiseDensity, 'Visible', 'off');
        set(handles.noiseSliderDensity, 'Visible', 'off');
        set(handles.noiseDensityMin, 'Visible', 'off');
        set(handles.noiseDensityMax, 'Visible', 'off');
    case 5.0                                            %salt & pepper
        set(handles.noiseTitleDensity, 'Visible', 'on');
        set(handles.noiseDensity, 'Visible', 'on');
        set(handles.noiseSliderDensity, 'Visible', 'on');
        set(handles.noiseDensityMin, 'Visible', 'on');
        set(handles.noiseDensityMax, 'Visible', 'on');
        set(handles.noiseTitleMean, 'Visible', 'off');
        set(handles.noiseMean, 'Visible', 'off');
        set(handles.noiseSliderMean, 'Visible', 'off');
        set(handles.noiseMeanMin, 'Visible', 'off');
        set(handles.noiseMeanMax, 'Visible', 'off');
        set(handles.noiseTitleVariance, 'Visible', 'off');
        set(handles.noiseVariance, 'Visible', 'off');
        set(handles.noiseSliderVariance, 'Visible', 'off');
        set(handles.noiseVarianceMin, 'Visible', 'off');
        set(handles.noiseVarianceMax, 'Visible', 'off');
    case 6.0                                            %speckle
        set(handles.noiseTitleMean, 'Visible', 'off');       %show components of noise panel
        set(handles.noiseMean, 'Visible', 'off');
        set(handles.noiseSliderMean, 'Visible', 'off');
        set(handles.noiseMeanMin, 'Visible', 'off');
        set(handles.noiseMeanMax, 'Visible', 'off');
        set(handles.noiseTitleVariance, 'Visible', 'on');
        set(handles.noiseVariance, 'String', 0.01);
        set(handles.noiseVariance, 'Visible', 'on');
        set(handles.noiseSliderVariance, 'Value', 0.01);
        set(handles.noiseSliderVariance, 'Max', 5.0);
        set(handles.noiseSliderVariance, 'Sliderstep', [0.002 0.1]);
        set(handles.noiseSliderVariance, 'Visible', 'on');
        set(handles.noiseVarianceMax, 'String', 5.0);
        set(handles.noiseVarianceMin, 'Visible', 'on');
        set(handles.noiseVarianceMax, 'Visible', 'on');
        set(handles.noiseTitleDensity, 'Visible', 'off');
        set(handles.noiseDensity, 'Visible', 'off');
        set(handles.noiseSliderDensity, 'Visible', 'off');
        set(handles.noiseDensityMin, 'Visible', 'off');
        set(handles.noiseDensityMax, 'Visible', 'off');
    otherwise                                                     %other noise types
        set(handles.noiseTitleMean, 'Visible', 'off');
        set(handles.noiseMean, 'Visible', 'off');
        set(handles.noiseSliderMean, 'Visible', 'off');
        set(handles.noiseMeanMin, 'Visible', 'off');
        set(handles.noiseMeanMax, 'Visible', 'off');
        set(handles.noiseTitleVariance, 'Visible', 'off');
        set(handles.noiseVariance, 'Visible', 'off');
        set(handles.noiseSliderVariance, 'Visible', 'off');
        set(handles.noiseVarianceMin, 'Visible', 'off');
        set(handles.noiseVarianceMax, 'Visible', 'off');
        set(handles.noiseTitleDensity, 'Visible', 'off');
        set(handles.noiseDensity, 'Visible', 'off');
        set(handles.noiseSliderDensity, 'Visible', 'off');
        set(handles.noiseDensityMin, 'Visible', 'off');
        set(handles.noiseDensityMax, 'Visible', 'off');
end
% --- Executes on slider movement.
function noiseSliderMean_Callback(hObject, eventdata, handles)
% hObject    handle to noiseSliderMean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

mean = floor(get(hObject, 'Value')*100)/100;            %get value of slider
set(handles.noiseMean, 'String', mean);                 %display value
noiseGo_Callback(hObject, eventdata, handles);
% --- Executes on slider movement.
function noiseSliderVariance_Callback(hObject, eventdata, handles)
% hObject    handle to noiseSliderVariance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

var = floor(get(hObject, 'Value')*100)/100;                %get value of slider
set(handles.noiseVariance, 'String', var);                 %display value
noiseGo_Callback(hObject, eventdata, handles);
% --- Executes on slider movement.
function noiseSliderDensity_Callback(hObject, eventdata, handles)
% hObject    handle to noiseSliderDensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

dens = floor(get(hObject, 'Value')*100)/100;                %get value of slider
set(handles.noiseDensity, 'String', dens);                  %display value
noiseGo_Callback(hObject, eventdata, handles);
% --- Executes on button press in noiseGo.
function noiseGo_Callback(hObject, eventdata, handles)
% hObject    handle to noiseGo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handle

im = getimage(handles.imageAfter);                                          %get image
noiseType = get(handles.noiseType, 'Value');                                %get noise type from popup menu
mean = floor(get(handles.noiseSliderMean, 'Value')*100)/100;        %get mean value
var = floor(get(handles.noiseSliderVariance, 'Value')*100)/100;     %get variance value
d = get(handles.noiseSliderDensity,'Value');                       %get density from slider
im_noise = noise(im, noiseType, mean, var, d);
axes(handles.imagePreview)                                          %set this axes as active
image(im_noise);                                                    %show image
axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                         %Sets the axis limits to the arrange of the data.
axis off;

%% DENOISE
function popupDenoise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupDenoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function popupmenu_fspecial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_fspecial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function slider_average_hsize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_average_hsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function slider_disk_radius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_disk_radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function slider_gausian_hsize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_gausian_hsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
%--- Executes during object creation, after setting all properties.
function slider_gausian_sigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_gausian_sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function slider_laplacian_alpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_laplacian_alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function slider_log_sigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_log_sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes during object creation, after setting all properties.
function slider_log_hsize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_log_hsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function slider_motion_angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_motion_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes during object creation, after setting all properties.
function slider_motion_nr_pixels_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_motion_nr_pixels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function slider_unsharp_alpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_unsharp_alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes during object creation, after setting all properties.
function slider_med_hsize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_med_hsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function slider_adapt_hsize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_adapt_hsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function denoiseGo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to denoiseGo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on selection change in popupDenoise.
function popupDenoise_Callback(hObject, eventdata, handles)
% hObject    handle to popupDenoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns popupDenoise contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupDenoise
% --- Executes during object creation, after setting all properties.
% --- Executes on slider movement.
im = getimage(handles.imageAfter);
[H W D] = size(im);
class = get(handles.popupDenoise, 'Value');                  %get selected class
switch(class)
    case 2.0            %linear
        set(handles.popupmenu_fspecial, 'Visible', 'on');    %show popupmenu with filter types
        set(handles.title_average_hsize, 'Visible', 'on');
        set(handles.average_hsize, 'Visible', 'on');
        set(handles.slider_average_hsize, 'Visible', 'on');
        set(handles.hsize_min, 'Visible', 'on');
        set(handles.hsize_max, 'Visible', 'on');
        set(handles.title_med_hsize, 'Visible', 'off');
        set(handles.med_hsize, 'Visible', 'off');
        set(handles.slider_med_hsize, 'Visible', 'off');
        set(handles.med_hsize_min, 'Visible', 'off');
        set(handles.med_hsize_max, 'Visible', 'off');
        set(handles.cb_red, 'Visible', 'off');
        set(handles.cb_green, 'Visible', 'off');
        set(handles.cb_blue, 'Visible', 'off');
        set(handles.title_adapt_hsize, 'Visible', 'off');
        set(handles.adapt_hsize, 'Visible', 'off');
        set(handles.slider_adapt_hsize, 'Visible', 'off');
        set(handles.adapt_hsize_min, 'Visible', 'off');
        set(handles.adapt_hsize_max, 'Visible', 'off');
        set(handles.rb_hor, 'Visible', 'off');
        set(handles.rb_vert, 'Visible', 'off');
    case 3.0            %median
        set(handles.title_med_hsize, 'Visible', 'on');
        set(handles.med_hsize, 'Visible', 'on');
        set(handles.cb_red, 'Visible', 'on');
        set(handles.cb_green, 'Visible', 'on');
        set(handles.cb_blue, 'Visible', 'on');
        set(handles.slider_med_hsize, 'Visible', 'on');
        set(handles.med_hsize_min, 'Visible', 'on');
        set(handles.med_hsize_max, 'Visible', 'on');
        set(handles.popupmenu_fspecial, 'Visible', 'off');   %hide popupmenu with filter types
        set(handles.title_average_hsize, 'Visible', 'off');
        set(handles.average_hsize, 'Visible', 'off');
        set(handles.slider_average_hsize, 'Visible', 'off');
        set(handles.hsize_min, 'Visible', 'off');
        set(handles.hsize_max, 'Visible', 'off');
        set(handles.title_disk_radius, 'Visible', 'off');
        set(handles.disk_radius, 'Visible', 'off');
        set(handles.slider_disk_radius, 'Visible', 'off');
        set(handles.disk_radius_min, 'Visible', 'off');
        set(handles.disk_radius_max, 'Visible', 'off');
        set(handles.title_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize, 'Visible', 'off');
        set(handles.slider_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize_min, 'Visible', 'off');
        set(handles.gausian_hsize_max, 'Visible', 'off');
        set(handles.title_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma, 'Visible', 'off');
        set(handles.slider_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma_min, 'Visible', 'off');
        set(handles.gausian_sigma_max, 'Visible', 'off');
        set(handles.title_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha, 'Visible', 'off');
        set(handles.slider_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha_min, 'Visible', 'off');
        set(handles.laplacian_alpha_max, 'Visible', 'off');
        set(handles.title_log_hsize, 'Visible', 'off');
        set(handles.log_hsize, 'Visible', 'off');
        set(handles.slider_log_hsize, 'Visible', 'off');
        set(handles.log_hsize_min, 'Visible', 'off');
        set(handles.log_hsize_max, 'Visible', 'off');
        set(handles.title_log_sigma, 'Visible', 'off');
        set(handles.log_sigma, 'Visible', 'off');
        set(handles.slider_log_sigma, 'Visible', 'off');
        set(handles.log_sigma_min, 'Visible', 'off');
        set(handles.log_sigma_max, 'Visible', 'off');
        set(handles.title_motion_nr_pixels, 'Visible', 'off');
        set(handles.motion_nr_pixels, 'Visible', 'off');
        set(handles.slider_motion_nr_pixels, 'Visible', 'off');
        set(handles.nr_pixels_min, 'Visible', 'off');
        set(handles.nr_pixels_max, 'Visible', 'off');
        set(handles.title_motion_angle, 'Visible', 'off');
        set(handles.motion_angle, 'Visible', 'off');
        set(handles.slider_motion_angle, 'Visible', 'off');
        set(handles.motion_angle_min, 'Visible', 'off');
        set(handles.motion_angle_max, 'Visible', 'off');
        set(handles.title_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha, 'Visible', 'off');
        set(handles.slider_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha_min, 'Visible', 'off');
        set(handles.unsharp_alpha_max, 'Visible', 'off');
        set(handles.title_adapt_hsize, 'Visible', 'off');
        set(handles.adapt_hsize, 'Visible', 'off');
        set(handles.slider_adapt_hsize, 'Visible', 'off');
        set(handles.adapt_hsize_min, 'Visible', 'off');
        set(handles.adapt_hsize_max, 'Visible', 'off');
        set(handles.rb_hor, 'Visible', 'off');
        set(handles.rb_vert, 'Visible', 'off');
    case 4.0            %adaptive
        set(handles.title_adapt_hsize, 'Visible', 'on');
        set(handles.adapt_hsize, 'Visible', 'on');
        set(handles.slider_adapt_hsize, 'Visible', 'on');
        set(handles.adapt_hsize_min, 'Visible', 'on');
        set(handles.adapt_hsize_max, 'Visible', 'on');
        set(handles.popupmenu_fspecial, 'Visible', 'off');   %hide popupmenu with filter types
        set(handles.title_average_hsize, 'Visible', 'off');
        set(handles.average_hsize, 'Visible', 'off');
        set(handles.slider_average_hsize, 'Visible', 'off');
        set(handles.hsize_min, 'Visible', 'off');
        set(handles.hsize_max, 'Visible', 'off');
        set(handles.title_disk_radius, 'Visible', 'off');
        set(handles.disk_radius, 'Visible', 'off');
        set(handles.slider_disk_radius, 'Visible', 'off');
        set(handles.disk_radius_min, 'Visible', 'off');
        set(handles.disk_radius_max, 'Visible', 'off');
        set(handles.title_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize, 'Visible', 'off');
        set(handles.slider_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize_min, 'Visible', 'off');
        set(handles.gausian_hsize_max, 'Visible', 'off');
        set(handles.title_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma, 'Visible', 'off');
        set(handles.slider_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma_min, 'Visible', 'off');
        set(handles.gausian_sigma_max, 'Visible', 'off');
        set(handles.title_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha, 'Visible', 'off');
        set(handles.slider_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha_min, 'Visible', 'off');
        set(handles.laplacian_alpha_max, 'Visible', 'off');
        set(handles.title_log_hsize, 'Visible', 'off');
        set(handles.log_hsize, 'Visible', 'off');
        set(handles.slider_log_hsize, 'Visible', 'off');
        set(handles.log_hsize_min, 'Visible', 'off');
        set(handles.log_hsize_max, 'Visible', 'off');
        set(handles.title_log_sigma, 'Visible', 'off');
        set(handles.log_sigma, 'Visible', 'off');
        set(handles.slider_log_sigma, 'Visible', 'off');
        set(handles.log_sigma_min, 'Visible', 'off');
        set(handles.log_sigma_max, 'Visible', 'off');
        set(handles.title_motion_nr_pixels, 'Visible', 'off');
        set(handles.motion_nr_pixels, 'Visible', 'off');
        set(handles.slider_motion_nr_pixels, 'Visible', 'off');
        set(handles.nr_pixels_min, 'Visible', 'off');
        set(handles.nr_pixels_max, 'Visible', 'off');
        set(handles.title_motion_angle, 'Visible', 'off');
        set(handles.motion_angle, 'Visible', 'off');
        set(handles.slider_motion_angle, 'Visible', 'off');
        set(handles.motion_angle_min, 'Visible', 'off');
        set(handles.motion_angle_max, 'Visible', 'off');
        set(handles.title_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha, 'Visible', 'off');
        set(handles.slider_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha_min, 'Visible', 'off');
        set(handles.unsharp_alpha_max, 'Visible', 'off');
        set(handles.title_med_hsize, 'Visible', 'off');
        set(handles.med_hsize, 'Visible', 'off');
        set(handles.slider_med_hsize, 'Visible', 'off');
        set(handles.med_hsize_min, 'Visible', 'off');
        set(handles.med_hsize_max, 'Visible', 'off');
        set(handles.cb_red, 'Visible', 'off');
        set(handles.cb_green, 'Visible', 'off');
        set(handles.cb_blue, 'Visible', 'off');
        set(handles.rb_hor, 'Visible', 'off');
        set(handles.rb_vert, 'Visible', 'off');
    otherwise
        set(handles.popupmenu_fspecial, 'Visible', 'off');   %hide popupmenu with filter types
        set(handles.title_average_hsize, 'Visible', 'off');
        set(handles.average_hsize, 'Visible', 'off');
        set(handles.slider_average_hsize, 'Visible', 'off');
        set(handles.hsize_min, 'Visible', 'off');
        set(handles.hsize_max, 'Visible', 'off');
        set(handles.title_disk_radius, 'Visible', 'off');
        set(handles.disk_radius, 'Visible', 'off');
        set(handles.slider_disk_radius, 'Visible', 'off');
        set(handles.disk_radius_min, 'Visible', 'off');
        set(handles.disk_radius_max, 'Visible', 'off');
        set(handles.title_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize, 'Visible', 'off');
        set(handles.slider_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize_min, 'Visible', 'off');
        set(handles.gausian_hsize_max, 'Visible', 'off');
        set(handles.title_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma, 'Visible', 'off');
        set(handles.slider_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma_min, 'Visible', 'off');
        set(handles.gausian_sigma_max, 'Visible', 'off');
        set(handles.title_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha, 'Visible', 'off');
        set(handles.slider_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha_min, 'Visible', 'off');
        set(handles.laplacian_alpha_max, 'Visible', 'off');
        set(handles.title_log_hsize, 'Visible', 'off');
        set(handles.log_hsize, 'Visible', 'off');
        set(handles.slider_log_hsize, 'Visible', 'off');
        set(handles.log_hsize_min, 'Visible', 'off');
        set(handles.log_hsize_max, 'Visible', 'off');
        set(handles.title_log_sigma, 'Visible', 'off');
        set(handles.log_sigma, 'Visible', 'off');
        set(handles.slider_log_sigma, 'Visible', 'off');
        set(handles.log_sigma_min, 'Visible', 'off');
        set(handles.log_sigma_max, 'Visible', 'off');
        set(handles.title_motion_nr_pixels, 'Visible', 'off');
        set(handles.motion_nr_pixels, 'Visible', 'off');
        set(handles.slider_motion_nr_pixels, 'Visible', 'off');
        set(handles.nr_pixels_min, 'Visible', 'off');
        set(handles.nr_pixels_max, 'Visible', 'off');
        set(handles.title_motion_angle, 'Visible', 'off');
        set(handles.motion_angle, 'Visible', 'off');
        set(handles.slider_motion_angle, 'Visible', 'off');
        set(handles.motion_angle_min, 'Visible', 'off');
        set(handles.motion_angle_max, 'Visible', 'off');
        set(handles.title_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha, 'Visible', 'off');
        set(handles.slider_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha_min, 'Visible', 'off');
        set(handles.unsharp_alpha_max, 'Visible', 'off');
        set(handles.title_med_hsize, 'Visible', 'off');
        set(handles.med_hsize, 'Visible', 'off');
        set(handles.slider_med_hsize, 'Visible', 'off');
        set(handles.med_hsize_min, 'Visible', 'off');
        set(handles.med_hsize_max, 'Visible', 'off');
        set(handles.cb_red, 'Visible', 'off');
        set(handles.cb_green, 'Visible', 'off');
        set(handles.cb_blue, 'Visible', 'off');
        set(handles.title_adapt_hsize, 'Visible', 'off');
        set(handles.adapt_hsize, 'Visible', 'off');
        set(handles.slider_adapt_hsize, 'Visible', 'off');
        set(handles.adapt_hsize_min, 'Visible', 'off');
        set(handles.adapt_hsize_max, 'Visible', 'off');
        set(handles.rb_hor, 'Visible', 'off');
        set(handles.rb_vert, 'Visible', 'off');
end

% --- Executes on selection change in popupmenu_fspecial.
function popupmenu_fspecial_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_fspecial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu_fspecial contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_fspecial
im = getimage(handles.imageAfter);
[H W D] = size(im);
type = get(handles.popupmenu_fspecial, 'Value');
switch(type)
    case 1.0   %average
        set(handles.title_average_hsize, 'Visible', 'on');
        set(handles.average_hsize, 'Visible', 'on');
        set(handles.slider_average_hsize, 'Visible', 'on');
        set(handles.hsize_min, 'Visible', 'on');
        set(handles.hsize_max, 'Visible', 'on');
        set(handles.title_disk_radius, 'Visible', 'off');
        set(handles.disk_radius, 'Visible', 'off');
        set(handles.slider_disk_radius, 'Visible', 'off');
        set(handles.disk_radius_min, 'Visible', 'off');
        set(handles.disk_radius_max, 'Visible', 'off');
        set(handles.title_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize, 'Visible', 'off');
        set(handles.slider_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize_min, 'Visible', 'off');
        set(handles.gausian_hsize_max, 'Visible', 'off');
        set(handles.title_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma, 'Visible', 'off');
        set(handles.slider_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma_min, 'Visible', 'off');
        set(handles.gausian_sigma_max, 'Visible', 'off');
        set(handles.title_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha, 'Visible', 'off');
        set(handles.slider_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha_min, 'Visible', 'off');
        set(handles.laplacian_alpha_max, 'Visible', 'off');
        set(handles.title_log_hsize, 'Visible', 'off');
        set(handles.log_hsize, 'Visible', 'off');
        set(handles.slider_log_hsize, 'Visible', 'off');
        set(handles.log_hsize_min, 'Visible', 'off');
        set(handles.log_hsize_max, 'Visible', 'off');
        set(handles.title_log_sigma, 'Visible', 'off');
        set(handles.log_sigma, 'Visible', 'off');
        set(handles.slider_log_sigma, 'Visible', 'off');
        set(handles.log_sigma_min, 'Visible', 'off');
        set(handles.log_sigma_max, 'Visible', 'off');
        set(handles.title_motion_nr_pixels, 'Visible', 'off');
        set(handles.motion_nr_pixels, 'Visible', 'off');
        set(handles.slider_motion_nr_pixels, 'Visible', 'off');
        set(handles.nr_pixels_min, 'Visible', 'off');
        set(handles.nr_pixels_max, 'Visible', 'off');
        set(handles.title_motion_angle, 'Visible', 'off');
        set(handles.motion_angle, 'Visible', 'off');
        set(handles.slider_motion_angle, 'Visible', 'off');
        set(handles.motion_angle_min, 'Visible', 'off');
        set(handles.motion_angle_max, 'Visible', 'off');
        set(handles.title_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha, 'Visible', 'off');
        set(handles.slider_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha_min, 'Visible', 'off');
        set(handles.unsharp_alpha_max, 'Visible', 'off');
        set(handles.rb_hor, 'Visible', 'off');
        set(handles.rb_vert, 'Visible', 'off');
    case 2.0   %disk
        set(handles.title_disk_radius, 'Visible', 'on');
        set(handles.disk_radius, 'Visible', 'on');
        set(handles.slider_disk_radius, 'Visible', 'on');
        set(handles.disk_radius_min, 'Visible', 'on');
        set(handles.disk_radius_max, 'Visible', 'on');
        set(handles.title_average_hsize, 'Visible', 'off');
        set(handles.average_hsize, 'Visible', 'off');
        set(handles.slider_average_hsize, 'Visible', 'off');
        set(handles.hsize_min, 'Visible', 'off');
        set(handles.hsize_max, 'Visible', 'off');
        set(handles.title_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize, 'Visible', 'off');
        set(handles.slider_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize_min, 'Visible', 'off');
        set(handles.gausian_hsize_max, 'Visible', 'off');
        set(handles.title_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma, 'Visible', 'off');
        set(handles.slider_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma_min, 'Visible', 'off');
        set(handles.gausian_sigma_max, 'Visible', 'off');
        set(handles.title_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha, 'Visible', 'off');
        set(handles.slider_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha_min, 'Visible', 'off');
        set(handles.laplacian_alpha_max, 'Visible', 'off');
        set(handles.title_log_hsize, 'Visible', 'off');
        set(handles.log_hsize, 'Visible', 'off');
        set(handles.slider_log_hsize, 'Visible', 'off');
        set(handles.log_hsize_min, 'Visible', 'off');
        set(handles.log_hsize_max, 'Visible', 'off');
        set(handles.title_log_sigma, 'Visible', 'off');
        set(handles.log_sigma, 'Visible', 'off');
        set(handles.slider_log_sigma, 'Visible', 'off');
        set(handles.log_sigma_min, 'Visible', 'off');
        set(handles.log_sigma_max, 'Visible', 'off');
        set(handles.title_motion_nr_pixels, 'Visible', 'off');
        set(handles.motion_nr_pixels, 'Visible', 'off');
        set(handles.slider_motion_nr_pixels, 'Visible', 'off');
        set(handles.nr_pixels_min, 'Visible', 'off');
        set(handles.nr_pixels_max, 'Visible', 'off');
        set(handles.title_motion_angle, 'Visible', 'off');
        set(handles.motion_angle, 'Visible', 'off');
        set(handles.slider_motion_angle, 'Visible', 'off');
        set(handles.motion_angle_min, 'Visible', 'off');
        set(handles.motion_angle_max, 'Visible', 'off');
        set(handles.title_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha, 'Visible', 'off');
        set(handles.slider_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha_min, 'Visible', 'off');
        set(handles.unsharp_alpha_max, 'Visible', 'off');
        set(handles.rb_hor, 'Visible', 'off');
        set(handles.rb_vert, 'Visible', 'off');
    case 3.0   %gaussian
        set(handles.title_gausian_hsize, 'Visible', 'on');
        set(handles.gausian_hsize, 'Visible', 'on');
        set(handles.slider_gausian_hsize, 'Visible', 'on');
        set(handles.gausian_hsize_min, 'Visible', 'on');
        set(handles.gausian_hsize_max, 'Visible', 'on');
        set(handles.title_gausian_sigma, 'Visible', 'on');
        set(handles.gausian_sigma, 'Visible', 'on');
        set(handles.slider_gausian_sigma, 'Visible', 'on');
        set(handles.gausian_sigma_min, 'Visible', 'on');
        set(handles.gausian_sigma_max, 'Visible', 'on');
        set(handles.title_average_hsize, 'Visible', 'off');
        set(handles.average_hsize, 'Visible', 'off');
        set(handles.slider_average_hsize, 'Visible', 'off');
        set(handles.hsize_min, 'Visible', 'off');
        set(handles.hsize_max, 'Visible', 'off');
        set(handles.title_disk_radius, 'Visible', 'off');
        set(handles.disk_radius, 'Visible', 'off');
        set(handles.slider_disk_radius, 'Visible', 'off');
        set(handles.disk_radius_min, 'Visible', 'off');
        set(handles.disk_radius_max, 'Visible', 'off');
        set(handles.title_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha, 'Visible', 'off');
        set(handles.slider_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha_min, 'Visible', 'off');
        set(handles.laplacian_alpha_max, 'Visible', 'off');
        set(handles.title_log_hsize, 'Visible', 'off');
        set(handles.log_hsize, 'Visible', 'off');
        set(handles.slider_log_hsize, 'Visible', 'off');
        set(handles.log_hsize_min, 'Visible', 'off');
        set(handles.log_hsize_max, 'Visible', 'off');
        set(handles.title_log_sigma, 'Visible', 'off');
        set(handles.log_sigma, 'Visible', 'off');
        set(handles.slider_log_sigma, 'Visible', 'off');
        set(handles.log_sigma_min, 'Visible', 'off');
        set(handles.log_sigma_max, 'Visible', 'off');
        set(handles.title_motion_nr_pixels, 'Visible', 'off');
        set(handles.motion_nr_pixels, 'Visible', 'off');
        set(handles.slider_motion_nr_pixels, 'Visible', 'off');
        set(handles.nr_pixels_min, 'Visible', 'off');
        set(handles.nr_pixels_max, 'Visible', 'off');
        set(handles.title_motion_angle, 'Visible', 'off');
        set(handles.motion_angle, 'Visible', 'off');
        set(handles.slider_motion_angle, 'Visible', 'off');
        set(handles.motion_angle_min, 'Visible', 'off');
        set(handles.motion_angle_max, 'Visible', 'off');
        set(handles.title_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha, 'Visible', 'off');
        set(handles.slider_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha_min, 'Visible', 'off');
        set(handles.unsharp_alpha_max, 'Visible', 'off');
        set(handles.rb_hor, 'Visible', 'off');
        set(handles.rb_vert, 'Visible', 'off');
    case 4.0   %laplacian
        set(handles.title_laplacian_alpha, 'Visible', 'on');
        set(handles.laplacian_alpha, 'Visible', 'on');
        set(handles.slider_laplacian_alpha, 'Visible', 'on');
        set(handles.laplacian_alpha_min, 'Visible', 'on');
        set(handles.laplacian_alpha_max, 'Visible', 'on');
        set(handles.title_average_hsize, 'Visible', 'off');
        set(handles.average_hsize, 'Visible', 'off');
        set(handles.slider_average_hsize, 'Visible', 'off');
        set(handles.hsize_min, 'Visible', 'off');
        set(handles.hsize_max, 'Visible', 'off');
        set(handles.title_disk_radius, 'Visible', 'off');
        set(handles.disk_radius, 'Visible', 'off');
        set(handles.slider_disk_radius, 'Visible', 'off');
        set(handles.disk_radius_min, 'Visible', 'off');
        set(handles.disk_radius_max, 'Visible', 'off');
        set(handles.title_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize, 'Visible', 'off');
        set(handles.slider_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize_min, 'Visible', 'off');
        set(handles.gausian_hsize_max, 'Visible', 'off');
        set(handles.title_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma, 'Visible', 'off');
        set(handles.slider_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma_min, 'Visible', 'off');
        set(handles.gausian_sigma_max, 'Visible', 'off');
        set(handles.title_log_hsize, 'Visible', 'off');
        set(handles.log_hsize, 'Visible', 'off');
        set(handles.slider_log_hsize, 'Visible', 'off');
        set(handles.log_hsize_min, 'Visible', 'off');
        set(handles.log_hsize_max, 'Visible', 'off');
        set(handles.title_log_sigma, 'Visible', 'off');
        set(handles.log_sigma, 'Visible', 'off');
        set(handles.slider_log_sigma, 'Visible', 'off');
        set(handles.log_sigma_min, 'Visible', 'off');
        set(handles.log_sigma_max, 'Visible', 'off');
        set(handles.title_motion_nr_pixels, 'Visible', 'off');
        set(handles.motion_nr_pixels, 'Visible', 'off');
        set(handles.slider_motion_nr_pixels, 'Visible', 'off');
        set(handles.nr_pixels_min, 'Visible', 'off');
        set(handles.nr_pixels_max, 'Visible', 'off');
        set(handles.title_motion_angle, 'Visible', 'off');
        set(handles.motion_angle, 'Visible', 'off');
        set(handles.slider_motion_angle, 'Visible', 'off');
        set(handles.motion_angle_min, 'Visible', 'off');
        set(handles.motion_angle_max, 'Visible', 'off');
        set(handles.title_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha, 'Visible', 'off');
        set(handles.slider_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha_min, 'Visible', 'off');
        set(handles.unsharp_alpha_max, 'Visible', 'off');
        set(handles.rb_hor, 'Visible', 'off');
        set(handles.rb_vert, 'Visible', 'off');
    case 5.0   %log
        set(handles.title_log_hsize, 'Visible', 'on');
        set(handles.log_hsize, 'Visible', 'on');
        set(handles.slider_log_hsize, 'Visible', 'on');
        set(handles.log_hsize_min, 'Visible', 'on');
        set(handles.log_hsize_max, 'Visible', 'on');
        set(handles.title_log_sigma, 'Visible', 'on');
        set(handles.log_sigma, 'Visible', 'on');
        set(handles.slider_log_sigma, 'Visible', 'on');
        set(handles.log_sigma_min, 'Visible', 'on');
        set(handles.log_sigma_max, 'Visible', 'on');
        set(handles.title_average_hsize, 'Visible', 'off');
        set(handles.average_hsize, 'Visible', 'off');
        set(handles.slider_average_hsize, 'Visible', 'off');
        set(handles.hsize_min, 'Visible', 'off');
        set(handles.hsize_max, 'Visible', 'off');
        set(handles.title_disk_radius, 'Visible', 'off');
        set(handles.disk_radius, 'Visible', 'off');
        set(handles.slider_disk_radius, 'Visible', 'off');
        set(handles.disk_radius_min, 'Visible', 'off');
        set(handles.disk_radius_max, 'Visible', 'off');
        set(handles.title_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize, 'Visible', 'off');
        set(handles.slider_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize_min, 'Visible', 'off');
        set(handles.gausian_hsize_max, 'Visible', 'off');
        set(handles.title_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma, 'Visible', 'off');
        set(handles.slider_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma_min, 'Visible', 'off');
        set(handles.gausian_sigma_max, 'Visible', 'off');
        set(handles.title_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha, 'Visible', 'off');
        set(handles.slider_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha_min, 'Visible', 'off');
        set(handles.laplacian_alpha_max, 'Visible', 'off');
        set(handles.title_motion_nr_pixels, 'Visible', 'off');
        set(handles.motion_nr_pixels, 'Visible', 'off');
        set(handles.slider_motion_nr_pixels, 'Visible', 'off');
        set(handles.nr_pixels_min, 'Visible', 'off');
        set(handles.nr_pixels_max, 'Visible', 'off');
        set(handles.title_motion_angle, 'Visible', 'off');
        set(handles.motion_angle, 'Visible', 'off');
        set(handles.slider_motion_angle, 'Visible', 'off');
        set(handles.motion_angle_min, 'Visible', 'off');
        set(handles.motion_angle_max, 'Visible', 'off');
        set(handles.title_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha, 'Visible', 'off');
        set(handles.slider_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha_min, 'Visible', 'off');
        set(handles.unsharp_alpha_max, 'Visible', 'off');
        set(handles.rb_hor, 'Visible', 'off');
        set(handles.rb_vert, 'Visible', 'off');
    case 6.0   %motion
        set(handles.title_motion_nr_pixels, 'Visible', 'on');
        set(handles.motion_nr_pixels, 'Visible', 'on');
        set(handles.slider_motion_nr_pixels, 'Visible', 'on');
        set(handles.nr_pixels_min, 'Visible', 'on');
        set(handles.nr_pixels_max, 'Visible', 'on');
        set(handles.title_motion_angle, 'Visible', 'on');
        set(handles.motion_angle, 'Visible', 'on');
        set(handles.slider_motion_angle, 'Visible', 'on');
        set(handles.motion_angle_min, 'Visible', 'on');
        set(handles.motion_angle_max, 'Visible', 'on');
        set(handles.title_average_hsize, 'Visible', 'off');
        set(handles.average_hsize, 'Visible', 'off');
        set(handles.slider_average_hsize, 'Visible', 'off');
        set(handles.hsize_min, 'Visible', 'off');
        set(handles.hsize_max, 'Visible', 'off');
        set(handles.title_disk_radius, 'Visible', 'off');
        set(handles.disk_radius, 'Visible', 'off');
        set(handles.slider_disk_radius, 'Visible', 'off');
        set(handles.disk_radius_min, 'Visible', 'off');
        set(handles.disk_radius_max, 'Visible', 'off');
        set(handles.title_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize, 'Visible', 'off');
        set(handles.slider_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize_min, 'Visible', 'off');
        set(handles.gausian_hsize_max, 'Visible', 'off');
        set(handles.title_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma, 'Visible', 'off');
        set(handles.slider_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma_min, 'Visible', 'off');
        set(handles.gausian_sigma_max, 'Visible', 'off');
        set(handles.title_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha, 'Visible', 'off');
        set(handles.slider_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha_min, 'Visible', 'off');
        set(handles.laplacian_alpha_max, 'Visible', 'off');
        set(handles.title_log_hsize, 'Visible', 'off');
        set(handles.log_hsize, 'Visible', 'off');
        set(handles.slider_log_hsize, 'Visible', 'off');
        set(handles.log_hsize_min, 'Visible', 'off');
        set(handles.log_hsize_max, 'Visible', 'off');
        set(handles.title_log_sigma, 'Visible', 'off');
        set(handles.log_sigma, 'Visible', 'off');
        set(handles.slider_log_sigma, 'Visible', 'off');
        set(handles.log_sigma_min, 'Visible', 'off');
        set(handles.log_sigma_max, 'Visible', 'off');
        set(handles.title_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha, 'Visible', 'off');
        set(handles.slider_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha_min, 'Visible', 'off');
        set(handles.unsharp_alpha_max, 'Visible', 'off');
        set(handles.rb_hor, 'Visible', 'off');
        set(handles.rb_vert, 'Visible', 'off');
    case 7.0   %prewitt
        set(handles.rb_hor, 'Visible', 'on');
        set(handles.rb_vert, 'Visible', 'on');
        set(handles.title_average_hsize, 'Visible', 'off');
        set(handles.average_hsize, 'Visible', 'off');
        set(handles.slider_average_hsize, 'Visible', 'off');
        set(handles.hsize_min, 'Visible', 'off');
        set(handles.hsize_max, 'Visible', 'off');
        set(handles.title_disk_radius, 'Visible', 'off');
        set(handles.disk_radius, 'Visible', 'off');
        set(handles.slider_disk_radius, 'Visible', 'off');
        set(handles.disk_radius_min, 'Visible', 'off');
        set(handles.disk_radius_max, 'Visible', 'off');
        set(handles.title_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize, 'Visible', 'off');
        set(handles.slider_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize_min, 'Visible', 'off');
        set(handles.gausian_hsize_max, 'Visible', 'off');
        set(handles.title_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma, 'Visible', 'off');
        set(handles.slider_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma_min, 'Visible', 'off');
        set(handles.gausian_sigma_max, 'Visible', 'off');
        set(handles.title_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha, 'Visible', 'off');
        set(handles.slider_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha_min, 'Visible', 'off');
        set(handles.laplacian_alpha_max, 'Visible', 'off');
        set(handles.title_log_hsize, 'Visible', 'off');
        set(handles.log_hsize, 'Visible', 'off');
        set(handles.slider_log_hsize, 'Visible', 'off');
        set(handles.log_hsize_min, 'Visible', 'off');
        set(handles.log_hsize_max, 'Visible', 'off');
        set(handles.title_log_sigma, 'Visible', 'off');
        set(handles.log_sigma, 'Visible', 'off');
        set(handles.slider_log_sigma, 'Visible', 'off');
        set(handles.log_sigma_min, 'Visible', 'off');
        set(handles.log_sigma_max, 'Visible', 'off');
        set(handles.title_motion_nr_pixels, 'Visible', 'off');
        set(handles.motion_nr_pixels, 'Visible', 'off');
        set(handles.slider_motion_nr_pixels, 'Visible', 'off');
        set(handles.nr_pixels_min, 'Visible', 'off');
        set(handles.nr_pixels_max, 'Visible', 'off');
        set(handles.title_motion_angle, 'Visible', 'off');
        set(handles.motion_angle, 'Visible', 'off');
        set(handles.slider_motion_angle, 'Visible', 'off');
        set(handles.motion_angle_min, 'Visible', 'off');
        set(handles.motion_angle_max, 'Visible', 'off');
        set(handles.title_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha, 'Visible', 'off');
        set(handles.slider_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha_min, 'Visible', 'off');
        set(handles.unsharp_alpha_max, 'Visible', 'off');
    case 8.0   %sobel
        set(handles.rb_hor, 'Visible', 'on');
        set(handles.rb_vert, 'Visible', 'on');
        set(handles.title_average_hsize, 'Visible', 'off');
        set(handles.average_hsize, 'Visible', 'off');
        set(handles.slider_average_hsize, 'Visible', 'off');
        set(handles.hsize_min, 'Visible', 'off');
        set(handles.hsize_max, 'Visible', 'off');
        set(handles.title_disk_radius, 'Visible', 'off');
        set(handles.disk_radius, 'Visible', 'off');
        set(handles.slider_disk_radius, 'Visible', 'off');
        set(handles.disk_radius_min, 'Visible', 'off');
        set(handles.disk_radius_max, 'Visible', 'off');
        set(handles.title_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize, 'Visible', 'off');
        set(handles.slider_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize_min, 'Visible', 'off');
        set(handles.gausian_hsize_max, 'Visible', 'off');
        set(handles.title_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma, 'Visible', 'off');
        set(handles.slider_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma_min, 'Visible', 'off');
        set(handles.gausian_sigma_max, 'Visible', 'off');
        set(handles.title_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha, 'Visible', 'off');
        set(handles.slider_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha_min, 'Visible', 'off');
        set(handles.laplacian_alpha_max, 'Visible', 'off');
        set(handles.title_log_hsize, 'Visible', 'off');
        set(handles.log_hsize, 'Visible', 'off');
        set(handles.slider_log_hsize, 'Visible', 'off');
        set(handles.log_hsize_min, 'Visible', 'off');
        set(handles.log_hsize_max, 'Visible', 'off');
        set(handles.title_log_sigma, 'Visible', 'off');
        set(handles.log_sigma, 'Visible', 'off');
        set(handles.slider_log_sigma, 'Visible', 'off');
        set(handles.log_sigma_min, 'Visible', 'off');
        set(handles.log_sigma_max, 'Visible', 'off');
        set(handles.title_motion_nr_pixels, 'Visible', 'off');
        set(handles.motion_nr_pixels, 'Visible', 'off');
        set(handles.slider_motion_nr_pixels, 'Visible', 'off');
        set(handles.nr_pixels_min, 'Visible', 'off');
        set(handles.nr_pixels_max, 'Visible', 'off');
        set(handles.title_motion_angle, 'Visible', 'off');
        set(handles.motion_angle, 'Visible', 'off');
        set(handles.slider_motion_angle, 'Visible', 'off');
        set(handles.motion_angle_min, 'Visible', 'off');
        set(handles.motion_angle_max, 'Visible', 'off');
        set(handles.title_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha, 'Visible', 'off');
        set(handles.slider_unsharp_alpha, 'Visible', 'off');
        set(handles.unsharp_alpha_min, 'Visible', 'off');
        set(handles.unsharp_alpha_max, 'Visible', 'off');
    case 9.0   %unsharp
        set(handles.rb_hor, 'Visible', 'off');
        set(handles.rb_vert, 'Visible', 'off');
        set(handles.title_unsharp_alpha, 'Visible', 'on');
        set(handles.unsharp_alpha, 'Visible', 'on');
        set(handles.slider_unsharp_alpha, 'Visible', 'on');
        set(handles.unsharp_alpha_min, 'Visible', 'on');
        set(handles.unsharp_alpha_max, 'Visible', 'on');
        set(handles.title_average_hsize, 'Visible', 'off');
        set(handles.average_hsize, 'Visible', 'off');
        set(handles.slider_average_hsize, 'Visible', 'off');
        set(handles.hsize_min, 'Visible', 'off');
        set(handles.hsize_max, 'Visible', 'off');
        set(handles.title_disk_radius, 'Visible', 'off');
        set(handles.disk_radius, 'Visible', 'off');
        set(handles.slider_disk_radius, 'Visible', 'off');
        set(handles.disk_radius_min, 'Visible', 'off');
        set(handles.disk_radius_max, 'Visible', 'off');
        set(handles.title_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize, 'Visible', 'off');
        set(handles.slider_gausian_hsize, 'Visible', 'off');
        set(handles.gausian_hsize_min, 'Visible', 'off');
        set(handles.gausian_hsize_max, 'Visible', 'off');
        set(handles.title_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma, 'Visible', 'off');
        set(handles.slider_gausian_sigma, 'Visible', 'off');
        set(handles.gausian_sigma_min, 'Visible', 'off');
        set(handles.gausian_sigma_max, 'Visible', 'off');
        set(handles.title_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha, 'Visible', 'off');
        set(handles.slider_laplacian_alpha, 'Visible', 'off');
        set(handles.laplacian_alpha_min, 'Visible', 'off');
        set(handles.laplacian_alpha_max, 'Visible', 'off');
        set(handles.title_log_hsize, 'Visible', 'off');
        set(handles.log_hsize, 'Visible', 'off');
        set(handles.slider_log_hsize, 'Visible', 'off');
        set(handles.log_hsize_min, 'Visible', 'off');
        set(handles.log_hsize_max, 'Visible', 'off');
        set(handles.title_log_sigma, 'Visible', 'off');
        set(handles.log_sigma, 'Visible', 'off');
        set(handles.slider_log_sigma, 'Visible', 'off');
        set(handles.log_sigma_min, 'Visible', 'off');
        set(handles.log_sigma_max, 'Visible', 'off');
        set(handles.title_motion_nr_pixels, 'Visible', 'off');
        set(handles.motion_nr_pixels, 'Visible', 'off');
        set(handles.slider_motion_nr_pixels, 'Visible', 'off');
        set(handles.nr_pixels_min, 'Visible', 'off');
        set(handles.nr_pixels_max, 'Visible', 'off');
        set(handles.title_motion_angle, 'Visible', 'off');
        set(handles.motion_angle, 'Visible', 'off');
        set(handles.slider_motion_angle, 'Visible', 'off');
        set(handles.motion_angle_min, 'Visible', 'off');
        set(handles.motion_angle_max, 'Visible', 'off');
    otherwise
end

% --- Executes on slider movement.
function slider_average_hsize_Callback(hObject, eventdata, handles)
% hObject    handle to slider_average_hsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val = floor(get(handles.slider_average_hsize, 'Value'));
set(handles.average_hsize, 'String', val);

% --- Executes on slider movement.
function slider_disk_radius_Callback(hObject, eventdata, handles)
% hObject    handle to slider_disk_radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of
%        slider
val = floor(get(handles.slider_disk_radius, 'Value'));
set(handles.disk_radius, 'String', val);


% --- Executes on slider movement.
function slider_gausian_hsize_Callback(hObject, eventdata, handles)
% hObject    handle to slider_gausian_hsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val = floor(get(handles.slider_gausian_hsize, 'Value'));
set(handles.gausian_hsize, 'String', val);

% --- Executes on slider movement.
function slider_gausian_sigma_Callback(hObject, eventdata, handles)
% hObject    handle to slider_gausian_sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of
%        slider
val = floor(get(handles.slider_gausian_sigma, 'Value')*10)/10;
set(handles.gausian_sigma, 'String', val);


% --- Executes on slider movement.
function slider_laplacian_alpha_Callback(hObject, eventdata, handles)
% hObject    handle to slider_laplacian_alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val = floor(get(handles.slider_laplacian_alpha, 'Value')*100)/100;
set(handles.laplacian_alpha, 'String', val);

% --- Executes on slider movement.
function slider_log_hsize_Callback(hObject, eventdata, handles)
% hObject    handle to slider_log_hsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of
%        slider
val = floor(get(handles.slider_log_hsize, 'Value'));
set(handles.log_hsize, 'String', val);

% --- Executes on slider movement.
function slider_log_sigma_Callback(hObject, eventdata, handles)
% hObject    handle to slider_log_sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of
%        slider
val = floor(get(handles.slider_log_sigma, 'Value')*100)/100;
set(handles.log_sigma, 'String', val);

% --- Executes on slider movement.
function slider_motion_nr_pixels_Callback(hObject, eventdata, handles)
% hObject    handle to slider_motion_nr_pixels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val = floor(get(handles.slider_motion_nr_pixels, 'Value'));
set(handles.motion_nr_pixels, 'String', val);


% --- Executes on slider movement.
function slider_motion_angle_Callback(hObject, eventdata, handles)
% hObject    handle to slider_motion_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val = floor(get(handles.slider_motion_angle, 'Value'));
set(handles.motion_angle, 'String', val);


% --- Executes on slider movement.
function slider_unsharp_alpha_Callback(hObject, eventdata, handles)
% hObject    handle to slider_unsharp_alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val = floor(get(handles.slider_unsharp_alpha, 'Value')*100)/100;
set(handles.unsharp_alpha, 'String', val);

% --- Executes on button press in rb_hor.
function rb_hor_Callback(hObject, eventdata, handles)
% hObject    handle to rb_hor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb_hor
if(get(handles.rb_hor, 'Value') == 1.0)
    set(handles.rb_vert, 'Value', 0.0);
else
    set(handles.rb_vert, 'Value', 1.0);
end

% --- Executes on button press in rb_vert.
function rb_vert_Callback(hObject, eventdata, handles)
% hObject    handle to rb_vert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb_vert

if(get(handles.rb_vert, 'Value') == 1.0)
    set(handles.rb_hor, 'Value', 0.0);
else
    set(handles.rb_hor, 'Value', 1.0);
end

% --- Executes on slider movement.
function slider_med_hsize_Callback(hObject, eventdata, handles)
% hObject    handle to slider_med_hsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val = floor(get(handles.slider_med_hsize, 'Value'));
set(handles.med_hsize, 'String', val);

% --- Executes on slider movement.
function slider_adapt_hsize_Callback(hObject, eventdata, handles)
% hObject    handle to slider_adapt_hsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val = floor(get(handles.slider_adapt_hsize, 'Value'));
set(handles.adapt_hsize, 'String', val);

function denoiseGo_Callback(hObject, eventdata, handles)
% hObject    handle to denoiseGo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

im = getimage(handles.imageAfter);
[H W D] = size(im);
class = get(handles.popupDenoise, 'Value');
switch(class)
    case 2.0   %linear
        type = get(handles.popupmenu_fspecial, 'Value');
        switch(type)
            case 1.0   %average
                hsize = floor(get(handles.slider_average_hsize, 'Value'));          %get value of hsize
                h = fspecial('average', hsize);                                     %define filter
                im_den = imfilter(im, h);                                           %apply filter
                axes(handles.imagePreview)                                          %set this axes as active
                image(im_den);                                                      %show image
                axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
                axis tight;                                                         %Sets the axis limits to the arrange of the data.
                axis off;
            case 2.0   %disk
                radius = floor(get(handles.slider_disk_radius, 'Value'));           %get value of radius
                h = fspecial('disk', radius);                                       %define filter
                im_den = imfilter(im, h);                                           %apply filter
                axes(handles.imagePreview)                                          %set this axes as active
                image(im_den);                                                      %show image
                axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
                axis tight;                                                         %Sets the axis limits to the arrange of the data.
                axis off;
            case 3.0   %gausian
                hsize = floor(get(handles.slider_gausian_hsize, 'Value'));          %get value of hsize
                sigma = floor(get(handles.slider_gausian_sigma, 'Value')*100)/100;  %get value of sigma
                h = fspecial('gaussian', hsize, sigma);                             %define filter
                im_den = imfilter(im, h);                                           %apply filter
                axes(handles.imagePreview)                                          %set this axes as active
                image(im_den);                                                      %show image
                axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
                axis tight;                                                         %Sets the axis limits to the arrange of the data.
                axis off;
            case 4.0   %laplacian
                alpha = floor(get(handles.slider_laplacian_alpha, 'Value')*100)/100;  %get value of alpha
                h = fspecial('laplacian', alpha);                                     %define filter
                im_den = imfilter(im, h);                                             %apply filter
                axes(handles.imagePreview)                                            %set this axes as active
                image(im_den);                                                        %show image
                axis equal;                                                           %sets the aspect ratio. (Show the image in its right ratio)
                axis tight;                                                           %Sets the axis limits to the arrange of the data.
                axis off;
            case 5.0   %log
                hsize = floor(get(handles.slider_log_hsize, 'Value'));              %get value of hsize
                sigma = floor(get(handles.slider_log_sigma, 'Value')*100)/100;      %get value of sigma
                h = fspecial('log', hsize, sigma);                                  %define filter
                im_den = imfilter(im, h);                                           %apply filter
                axes(handles.imagePreview)                                          %set this axes as active
                image(im_den);                                                      %show image
                axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
                axis tight;                                                         %Sets the axis limits to the arrange of the data.
                axis off;
            case 6.0   %motion
                nr = floor(get(handles.slider_motion_nr_pixels, 'Value'));          %get value of nr of pixels
                angle = floor(get(handles.slider_motion_angle, 'Value'));           %get value of angle
                h = fspecial('motion', nr, angle);                                  %define filter
                im_den = imfilter(im, h);                                           %apply filter
                axes(handles.imagePreview)                                          %set this axes as active
                image(im_den);                                                      %show image
                axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
                axis tight;                                                         %Sets the axis limits to the arrange of the data.
                axis off;
            case 7.0   %prewitt
                hor =get(handles.rb_hor, 'Value');                                  %get value of radio button horizontal
                h = fspecial('prewitt');                                            %define filter
                if (hor == 1.0)
                    im_den = imfilter(im,h);                                        %apply filter (horizontal)
                else
                    im_den = imfilter(im,h');                                       %apply filter (vertical)
                end
                axes(handles.imagePreview)                                          %set this axes as active
                image(im_den);                                                      %show image
                axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
                axis tight;                                                         %Sets the axis limits to the arrange of the data.
                axis off;
            case 8.0   %sobel
                hor =get(handles.rb_hor, 'Value');                                  %get value of radio button horizontal
                h = fspecial('sobel');                                              %define filter
                if (hor == 1.0)
                    im_den = imfilter(im,h);                                        %apply filter (horizontal)
                else
                    im_den = imfilter(im,h');                                       %apply filter (vertical)
                end
                axes(handles.imagePreview)                                          %set this axes as active
                image(im_den);                                                      %show image
                axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
                axis tight;                                                         %Sets the axis limits to the arrange of the data.
                axis off;
            case 9.0   %unsharp
                alpha = floor(get(handles.slider_unsharp_alpha, 'Value')*100)/100;  %get value of angle
                h = fspecial('unsharp', alpha);                                     %define filter
                im_den = imfilter(im, h);                                           %apply filter
                axes(handles.imagePreview)                                          %set this axes as active
                image(im_den);                                                      %show image
                axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
                axis tight;                                                         %Sets the axis limits to the arrange of the data.
                axis off;
            otherwise
                msgbox('Unknown error', 'Error', 'error');
        end
    case 3.0   %median
        hsize = floor(get(handles.slider_med_hsize, 'Value'));              %get value of angle
        im_den = im;
        if(get(handles.cb_red, 'Value') == 1.0)
            im_den(:,:,1) = medfilt2(im(:,:,1), [hsize hsize]);             %apply filter on red layer
        end
        if(get(handles.cb_green, 'Value') == 1.0)
            im_den(:,:,2) = medfilt2(im(:,:,1), [hsize hsize]);             %apply filter on green layer
        end
        if(get(handles.cb_blue, 'Value') == 1.0)
            im_den(:,:,3) = medfilt2(im(:,:,1), [hsize hsize]);             %apply filter on blue layer
        end
        axes(handles.imagePreview)                                          %set this axes as active
        image(im_den);                                                      %show image
        axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
        axis tight;                                                         %Sets the axis limits to the arrange of the data.
        axis off;
        if(get(handles.cb_red, 'Value') == 0.0 && get(handles.cb_green, 'Value') == 0.0 && get(handles.cb_blue, 'Value') == 0.0)
            msgbox('Please select at least one layer', 'Error', 'error');
        end
    case 4.0   %adaptive
        hsize = floor(get(handles.slider_adapt_hsize, 'Value'));            %get value of angle
        im_den = uint8(zeros(size(im)));                                    %create empty image
        im_den(:,:,1) = wiener2(im(:,:,1));                                 %apply filter
        im_den(:,:,2) = wiener2(im(:,:,2));                                 %apply filter
        im_den(:,:,3) = wiener2(im(:,:,3));                                 %apply filter
        axes(handles.imagePreview);                                         %set this axes as active
        image(im_den);                                                      %show image
        axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
        axis tight;                                                         %Sets the axis limits to the arrange of the data.
        axis off;
        %msgbox('Image was converted to grayscale before adaptive filtering could be applied', 'Warning', 'warn');
    otherwise
        msgbox('No denoise filter class selected!', 'Error', 'error');
end
type = get(handles.popupmenu_fspecial, 'Value');
switch(type)
end


%% REPLACE BITPLANE WITH NOISE
% --- Executes on button press in replaceBPgo.
function replaceBPgo_Callback(hObject, eventdata, handles)
% hObject    handle to replaceBPgo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

im = getimage(handles.imageAfter);                  %get image to attack
N = zeros(1,8);                                         %check wich checkboxes are checked and put selected bitplanes in array N
i = 1;
if(get(handles.BP1, 'Value') == 1.0)
    N(i) = 1;
    i = i+1;
end
if(get(handles.BP2, 'Value') == 1.0)
    N(i) = 2;
    i = i+1;
end
if(get(handles.BP3, 'Value') == 1.0)
    N(i) = 3;
    i = i+1;
end
if(get(handles.BP4, 'Value') == 1.0)
    N(i) = 4;
    i = i+1;
end
if(get(handles.BP5, 'Value') == 1.0)
    N(i) = 5;
    i = i+1;
end
if(get(handles.BP6, 'Value') == 1.0)
    N(i) = 6;
    i = i+1;
end
if(get(handles.BP7, 'Value') == 1.0)
    N(i) = 7;
    i = i+1;
end
if(get(handles.BP8, 'Value') == 1.0)
    N(i) = 8;
end

RGBYCbCr = zeros(1,6);
RGBYCbCr(1) = get(handles.R, 'Value');
RGBYCbCr(2) = get(handles.G, 'Value');
RGBYCbCr(3) = get(handles.B, 'Value');
RGBYCbCr(4) = get(handles.Y, 'Value');
RGBYCbCr(5) = get(handles.Cb, 'Value');
RGBYCbCr(6) = get(handles.Cr, 'Value');

im_bp_replaced = replace_bitplane(im, N, RGBYCbCr);

axes(handles.imagePreview)                                          %set this axes as active
image(im_bp_replaced);                                                    %show image
axis equal;                                                         %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                         %Sets the axis limits to the arrange of the data.
axis off;
% --- Executes on button press in R.
function R_Callback(hObject, eventdata, handles)
% hObject    handle to R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of R

if(get(handles.R, 'Value') == 1.0)
    set(handles.Y, 'Value', 0.0);
    set(handles.Cb, 'Value', 0.0);
    set(handles.Cr, 'Value', 0.0);
end
% --- Executes on button press in G.
function G_Callback(hObject, eventdata, handles)
% hObject    handle to G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of G

if(get(handles.G, 'Value') == 1.0)
    set(handles.Y, 'Value', 0.0);
    set(handles.Cb, 'Value', 0.0);
    set(handles.Cr, 'Value', 0.0);
end
% --- Executes on button press in B.
function B_Callback(hObject, eventdata, handles)
% hObject    handle to B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of B
if(get(handles.B, 'Value') == 1.0)
    set(handles.Y, 'Value', 0.0);
    set(handles.Cb, 'Value', 0.0);
    set(handles.Cr, 'Value', 0.0);
end
% --- Executes on button press in Y.
function Y_Callback(hObject, eventdata, handles)
% hObject    handle to Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Y

if(get(handles.Y, 'Value') == 1.0)
    set(handles.R, 'Value', 0.0);
    set(handles.G, 'Value', 0.0);
    set(handles.B, 'Value', 0.0);
end
% --- Executes on button press in Cb.
function Cb_Callback(hObject, eventdata, handles)
% hObject    handle to Cb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Cb
if(get(handles.Cb, 'Value') == 1.0)
    set(handles.R, 'Value', 0.0);
    set(handles.G, 'Value', 0.0);
    set(handles.B, 'Value', 0.0);
end
% --- Executes on button press in Cr.
function Cr_Callback(hObject, eventdata, handles)
% hObject    handle to Cr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Cr

if(get(handles.Cr, 'Value') == 1.0)
    set(handles.R, 'Value', 0.0);
    set(handles.G, 'Value', 0.0);
    set(handles.B, 'Value', 0.0);
end

%% ADD WATERMARK
% --- Executes on button press in watermarkGo.
function watermarkGo_Callback(hObject, eventdata, handles)
% hObject    handle to watermarkGo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%set_variables_watermarked_attacked(handles);
set_root_data(handles,'attack','yes');
set_root_data(handles,'handles_attack',handles);
watermarking;
% im = get image from root

%% HELP
% --- Executes on button press in helpWM.
function helpWM_Callback(hObject, eventdata, handles)
% hObject    handle to helpWM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

msgbox('This attack adds an additional watermark to the watermarked image. The layer that will be watermarked is the same as was selected for the first watermark. ', 'Info', 'info');

%% APPLY
% --- Executes on button press in apply.
function apply_Callback(hObject, eventdata, handles)
% hObject    handle to apply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

im = getimage(handles.imagePreview);
axes(handles.imageAfter)                                    %set this axes as active
image(im);                                                  %show image
axis equal;                                                 %sets the aspect ratio. (Show the image in its right ratio)
axis tight;                                                 %Sets the axis limits to the arrange of the data.
axis off;

%% DONE
% --- Executes on button press in done.
function done_Callback(hObject, eventdata, handles)
% hObject    handle to done (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

im_watermarked = get_root_data('plot_watermarked_attacked');
im_attacked = getimage(handles.imageAfter);
im_attacked_resized = im_attacked;
[Ww Hw Dw] = size(im_watermarked);
[Wa Ha Da] = size(im_attacked);
button = 'Yes';
if (Ww ~= Wa || Hw ~= Ha || Dw ~= Da)
    button = questdlg('One or more of the performed attacks made the attacked image size incompatible with DCT/DWT and some of the watermarking algorithms. Therefore, the attacked image was resized to match the watermarked image size. To avoid this, please use nog-geometric attacks. Continue?','WARNING: image will be resized','Yes','No','Yes');
    im_attacked_resized = imresize(im_attacked,[Ww Hw]);
end
if(strcmp(button,'Yes'))
    graph = 'attacked';
    close;
    set_root_data(handles,'attack','no');            %reset the component
    fhupdate_axes(graph,im_attacked_resized);
end

%% TABS
%% Compression
function togglebutton_compression_Callback(hObject, eventdata, handles)

set(handles.togglebutton_compression,'Enable','off');
set(handles.togglebutton_enhancements,'Enable','on');
set(handles.togglebutton_color_manipulations,'Enable','on');
set(handles.togglebutton_noise,'Enable','on');
set(handles.togglebutton_geometric,'Enable','on');
set(handles.togglebutton_data_compositions,'Enable','on');
set(handles.togglebutton_multiple_watermarks,'Enable','on');
set(handles.togglebutton_other,'Enable','on');

set(handles.togglebutton_compression,'Value',1);
set(handles.togglebutton_enhancements,'Value',0);
set(handles.togglebutton_color_manipulations,'Value',0);
set(handles.togglebutton_noise,'Value',0);
set(handles.togglebutton_geometric,'Value',0);
set(handles.togglebutton_data_compositions,'Value',0);
set(handles.togglebutton_multiple_watermarks,'Value',0);
set(handles.togglebutton_other,'Value',0);

set(handles.tab_compression,'Visible','on');
set(handles.tab_enhancements,'Visible','off');
set(handles.tab_color_manipulations,'Visible','off');
set(handles.tab_noise,'Visible','off');
set(handles.tab_geometric,'Visible','off');
set(handles.tab_data_compositions,'Visible','off');
set(handles.tab_multiple_watermarks,'Visible','off');
set(handles.tab_other,'Visible','off');
%% Enhancements.
function togglebutton_enhancements_Callback(hObject, eventdata, handles)

set(handles.togglebutton_compression,'Enable','on');
set(handles.togglebutton_enhancements,'Enable','off');
set(handles.togglebutton_color_manipulations,'Enable','on');
set(handles.togglebutton_noise,'Enable','on');
set(handles.togglebutton_geometric,'Enable','on');
set(handles.togglebutton_data_compositions,'Enable','on');
set(handles.togglebutton_multiple_watermarks,'Enable','on');
set(handles.togglebutton_other,'Enable','on');

set(handles.togglebutton_compression,'Value',0);
set(handles.togglebutton_enhancements,'Value',1);
set(handles.togglebutton_color_manipulations,'Value',0);
set(handles.togglebutton_noise,'Value',0);
set(handles.togglebutton_geometric,'Value',0);
set(handles.togglebutton_data_compositions,'Value',0);
set(handles.togglebutton_multiple_watermarks,'Value',0);
set(handles.togglebutton_other,'Value',0);

set(handles.tab_compression,'Visible','off');
set(handles.tab_enhancements,'Visible','on');
set(handles.tab_color_manipulations,'Visible','off');
set(handles.tab_noise,'Visible','off');
set(handles.tab_geometric,'Visible','off');
set(handles.tab_data_compositions,'Visible','off');
set(handles.tab_multiple_watermarks,'Visible','off');
set(handles.tab_other,'Visible','off');
%% Color_manipulations.
function togglebutton_color_manipulations_Callback(hObject, eventdata, handles)

set(handles.togglebutton_compression,'Enable','on');
set(handles.togglebutton_enhancements,'Enable','on');
set(handles.togglebutton_color_manipulations,'Enable','off');
set(handles.togglebutton_noise,'Enable','on');
set(handles.togglebutton_geometric,'Enable','on');
set(handles.togglebutton_data_compositions,'Enable','on');
set(handles.togglebutton_multiple_watermarks,'Enable','on');
set(handles.togglebutton_other,'Enable','on');

set(handles.togglebutton_compression,'Value',0);
set(handles.togglebutton_enhancements,'Value',0);
set(handles.togglebutton_color_manipulations,'Value',1);
set(handles.togglebutton_noise,'Value',0);
set(handles.togglebutton_geometric,'Value',0);
set(handles.togglebutton_data_compositions,'Value',0);
set(handles.togglebutton_multiple_watermarks,'Value',0);
set(handles.togglebutton_other,'Value',0);

set(handles.tab_compression,'Visible','off');
set(handles.tab_enhancements,'Visible','off');
set(handles.tab_color_manipulations,'Visible','on');
set(handles.tab_noise,'Visible','off');
set(handles.tab_geometric,'Visible','off');
set(handles.tab_data_compositions,'Visible','off');
set(handles.tab_multiple_watermarks,'Visible','off');
set(handles.tab_other,'Visible','off');
%% Noise.
function togglebutton_noise_Callback(hObject, eventdata, handles)

set(handles.togglebutton_compression,'Enable','on');
set(handles.togglebutton_enhancements,'Enable','on');
set(handles.togglebutton_color_manipulations,'Enable','on');
set(handles.togglebutton_noise,'Enable','off');
set(handles.togglebutton_geometric,'Enable','on');
set(handles.togglebutton_data_compositions,'Enable','on');
set(handles.togglebutton_multiple_watermarks,'Enable','on');
set(handles.togglebutton_other,'Enable','on');

set(handles.togglebutton_compression,'Value',0);
set(handles.togglebutton_enhancements,'Value',0);
set(handles.togglebutton_color_manipulations,'Value',0);
set(handles.togglebutton_noise,'Value',1);
set(handles.togglebutton_geometric,'Value',0);
set(handles.togglebutton_data_compositions,'Value',0);
set(handles.togglebutton_multiple_watermarks,'Value',0);
set(handles.togglebutton_other,'Value',0);

set(handles.tab_compression,'Visible','off');
set(handles.tab_enhancements,'Visible','off');
set(handles.tab_color_manipulations,'Visible','off');
set(handles.tab_noise,'Visible','on');
set(handles.tab_geometric,'Visible','off');
set(handles.tab_data_compositions,'Visible','off');
set(handles.tab_multiple_watermarks,'Visible','off');
set(handles.tab_other,'Visible','off');
%% Geometric.
function togglebutton_geometric_Callback(hObject, eventdata, handles)

set(handles.togglebutton_compression,'Enable','on');
set(handles.togglebutton_enhancements,'Enable','on');
set(handles.togglebutton_color_manipulations,'Enable','on');
set(handles.togglebutton_noise,'Enable','on');
set(handles.togglebutton_geometric,'Enable','off');
set(handles.togglebutton_data_compositions,'Enable','on');
set(handles.togglebutton_multiple_watermarks,'Enable','on');
set(handles.togglebutton_other,'Enable','on');

set(handles.togglebutton_compression,'Value',0);
set(handles.togglebutton_enhancements,'Value',0);
set(handles.togglebutton_color_manipulations,'Value',0);
set(handles.togglebutton_noise,'Value',0);
set(handles.togglebutton_geometric,'Value',1);
set(handles.togglebutton_data_compositions,'Value',0);
set(handles.togglebutton_multiple_watermarks,'Value',0);
set(handles.togglebutton_other,'Value',0);

set(handles.tab_compression,'Visible','off');
set(handles.tab_enhancements,'Visible','off');
set(handles.tab_color_manipulations,'Visible','off');
set(handles.tab_noise,'Visible','off');
set(handles.tab_geometric,'Visible','on');
set(handles.tab_data_compositions,'Visible','off');
set(handles.tab_multiple_watermarks,'Visible','off');
set(handles.tab_other,'Visible','off');

% initialize sliders for remove pixel row/column
im = getimage(handles.imageAfter);                          %get image
[H W D] = size(im);
row = get(handles.radiobutton_row, 'Value');
if (row == 1.0)
    set(handles.slider_nr_of_rows_columns, 'Max', W-1);
    set(handles.nr_of_rows_columns_max, 'String', num2str(W-1));
    max = floor(W - get(handles.slider_nr_of_rows_columns, 'Value'));
    set(handles.slider_offset, 'Max', max);
    set(handles.offset_max, 'String', num2str(max));
    val = floor(W/2 - get(handles.slider_nr_of_rows_columns, 'Value')/2);
    set(handles.slider_offset, 'Value', val);
    set(handles.offset, 'String', num2str(val));
else
    set(handles.slider_nr_of_rows_columns, 'Max', H-1);
    set(handles.nr_of_rows_columns_max, 'String', num2str(H-1));
    max = floor(H - get(handles.slider_nr_of_rows_columns, 'Value'));
    set(handles.slider_offset, 'Max', max);
    set(handles.offset_max, 'String', num2str(max));
    val = floor(H/2 - get(handles.slider_nr_of_rows_columns, 'Value')/2);
    set(handles.slider_offset, 'Value', val);
    set(handles.offset, 'String', num2str(val));
end
step1 = get(handles.slider_nr_of_rows_columns, 'SliderStep');
step1(1) = 1/get(handles.slider_nr_of_rows_columns, 'Max');
set(handles.slider_nr_of_rows_columns, 'SliderStep', step1);
step2 = get(handles.slider_offset, 'SliderStep');
step2(1) = 1/get(handles.slider_offset, 'Max');
set(handles.slider_offset, 'SliderStep', step2);

%% Data_compositions.
function togglebutton_data_compositions_Callback(hObject, eventdata, handles)

set(handles.togglebutton_compression,'Enable','on');
set(handles.togglebutton_enhancements,'Enable','on');
set(handles.togglebutton_color_manipulations,'Enable','on');
set(handles.togglebutton_noise,'Enable','on');
set(handles.togglebutton_geometric,'Enable','on');
set(handles.togglebutton_data_compositions,'Enable','off');
set(handles.togglebutton_multiple_watermarks,'Enable','on');
set(handles.togglebutton_other,'Enable','on');

set(handles.togglebutton_compression,'Value',0);
set(handles.togglebutton_enhancements,'Value',0);
set(handles.togglebutton_color_manipulations,'Value',0);
set(handles.togglebutton_noise,'Value',0);
set(handles.togglebutton_geometric,'Value',0);
set(handles.togglebutton_data_compositions,'Value',1);
set(handles.togglebutton_multiple_watermarks,'Value',0);
set(handles.togglebutton_other,'Value',0);

set(handles.tab_compression,'Visible','off');
set(handles.tab_enhancements,'Visible','off');
set(handles.tab_color_manipulations,'Visible','off');
set(handles.tab_noise,'Visible','off');
set(handles.tab_geometric,'Visible','off');
set(handles.tab_data_compositions,'Visible','on');
set(handles.tab_multiple_watermarks,'Visible','off');
set(handles.tab_other,'Visible','off');
%% Multiple_watermarks.
function togglebutton_multiple_watermarks_Callback(hObject, eventdata, handles)

set(handles.togglebutton_compression,'Enable','on');
set(handles.togglebutton_enhancements,'Enable','on');
set(handles.togglebutton_color_manipulations,'Enable','on');
set(handles.togglebutton_noise,'Enable','on');
set(handles.togglebutton_geometric,'Enable','on');
set(handles.togglebutton_data_compositions,'Enable','on');
set(handles.togglebutton_multiple_watermarks,'Enable','off');
set(handles.togglebutton_other,'Enable','on');

set(handles.togglebutton_compression,'Value',0);
set(handles.togglebutton_enhancements,'Value',0);
set(handles.togglebutton_color_manipulations,'Value',0);
set(handles.togglebutton_noise,'Value',0);
set(handles.togglebutton_geometric,'Value',0);
set(handles.togglebutton_data_compositions,'Value',0);
set(handles.togglebutton_multiple_watermarks,'Value',1);
set(handles.togglebutton_other,'Value',0);

set(handles.tab_compression,'Visible','off');
set(handles.tab_enhancements,'Visible','off');
set(handles.tab_color_manipulations,'Visible','off');
set(handles.tab_noise,'Visible','off');
set(handles.tab_geometric,'Visible','off');
set(handles.tab_data_compositions,'Visible','off');
set(handles.tab_multiple_watermarks,'Visible','on');
set(handles.tab_other,'Visible','off');
%% Other.
function togglebutton_other_Callback(hObject, eventdata, handles)

set(handles.togglebutton_compression,'Enable','on');
set(handles.togglebutton_enhancements,'Enable','on');
set(handles.togglebutton_color_manipulations,'Enable','on');
set(handles.togglebutton_noise,'Enable','on');
set(handles.togglebutton_geometric,'Enable','on');
set(handles.togglebutton_data_compositions,'Enable','on');
set(handles.togglebutton_multiple_watermarks,'Enable','on');
set(handles.togglebutton_other,'Enable','off');

set(handles.togglebutton_compression,'Value',0);
set(handles.togglebutton_enhancements,'Value',0);
set(handles.togglebutton_color_manipulations,'Value',0);
set(handles.togglebutton_noise,'Value',0);
set(handles.togglebutton_geometric,'Value',0);
set(handles.togglebutton_data_compositions,'Value',0);
set(handles.togglebutton_multiple_watermarks,'Value',0);
set(handles.togglebutton_other,'Value',1);

set(handles.tab_compression,'Visible','off');
set(handles.tab_enhancements,'Visible','off');
set(handles.tab_color_manipulations,'Visible','off');
set(handles.tab_noise,'Visible','off');
set(handles.tab_geometric,'Visible','off');
set(handles.tab_data_compositions,'Visible','off');
set(handles.tab_multiple_watermarks,'Visible','off');
set(handles.tab_other,'Visible','on');



%% slider 94 (unknown what is does, but without this error)
% --- Executes on slider movement.
function slider94_Callback(hObject, eventdata, handles)
% hObject    handle to slider94 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider94_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider94 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end







