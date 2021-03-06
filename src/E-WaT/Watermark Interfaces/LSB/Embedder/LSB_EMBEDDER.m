%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%                           Hogeschool Antwerpen                          %
%                IndustriŽle Wetenschappen: Elektronica-ICT               %
%                      MultiMediaGroep - Watermarking                     %
%                                                                         %
%                                                                         %
%                             Bachelorproef 3.2                           %
%              Kevin Heylen - Tom Meesters - Luc Verstrepen               %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% LSB embedder                                                          
%This is the embed GUI for LSB watermarking. The message is converted to a
%binary image ans the selected bitplanes will be replaced by this image.

%% STANDARD GUI FUNCTIONS
%%
function varargout = LSB_EMBEDDER(varargin)
% LSB_EMBEDDER M-file for LSB_EMBEDDER.fig
%      LSB_EMBEDDER, by itself, creates a new LSB_EMBEDDER or raises the existing
%      singleton*.
%
%      H = LSB_EMBEDDER returns the handle to a new LSB_EMBEDDER or the handle to
%      the existing singleton*.
%
%      LSB_EMBEDDER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LSB_EMBEDDER.M with the given input arguments.
%
%      LSB_EMBEDDER('Property','Value',...) creates a new LSB_EMBEDDER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LSB_EMBEDDER_nokey_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LSB_EMBEDDER_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help LSB_EMBEDDER

% Last Modified by GUIDE v2.5 12-Feb-2008 20:11:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @LSB_EMBEDDER_OpeningFcn, ...
    'gui_OutputFcn',  @LSB_EMBEDDER_OutputFcn, ...
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


% --- Executes just before LSB_EMBEDDER is made visible.
function LSB_EMBEDDER_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LSB_EMBEDDER (see VARARGIN)

% Choose default command line output for LSB_EMBEDDER
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LSB_EMBEDDER wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%% ICONS
%%
%display icons on buttons
setIcon(handles.zoomIn, imread('Icons\zoomIn.jpg'), 25, 25);        %call setIcon function which displays the passed image in the passed uicontrol with the passed dimensions
setIcon(handles.zoomInClick, imread('Icons\zoomInClick.jpg'), 25, 25);   %call setIcon function which displays the passed image in the passed uicontrol with the passed dimensions
setIcon(handles.pan, imread('Icons\pan.jpg'), 25, 25);              %call setIcon function which displays the passed image in the passed uicontrol with the passed dimensions
setIcon(handles.zoomOutAll, imread('Icons\zoomOutAll.jpg'), 25, 25);%call setIcon function which displays the passed image in the passed uicontrol with the passed dimensions

%% Initialize

attack = get_root_data('attack');
switch attack
    case 'yes'
        im = get_root_data('working_watermarked');
        im_plot = get_root_data('plot_watermarked');
    otherwise
        im = get_root_data('working_original');
        im_plot = get_root_data('plot_original');
end

set(handles.ORIComputing, 'Visible', 'on');
set(handles.computingImageORI, 'Visible', 'on');
workbar(0,'Loading image','Loading image');

workbar(1.0)
im_bp = im2bp(im);       %split image in bitplanes with self written function im2bp
workbar(0.95, 'Displaying bitplanes', 'Displaying bitplanes');
showBP(handles, 'original', im_bp); %show bitplanes
workbar(1.0);
workbar(0.75, 'Displaying original image', 'Displaying original image...');
set(handles.computingImageORI, 'Visible', 'off');
axes(handles.imageORI)
image(im_plot);
set(handles.titleORI, 'Visible', 'on');
set(handles.imageORI, 'Visible', 'on');
axis equal;             %sets the aspect ratio. (Show the image in its right ratio)
axis tight;             %Sets the axis limits to the arrange of the data.
axis off;               %Turn off all axis labeling
workbar(1.0);
set(handles.ORIComputing, 'Visible', 'off');
resize = get(handles.resize, 'Value');

switch attack
    case 'yes'
        messageType = get_root_data('chosen_message_attack');
        switch messageType
            case 'text'
                message = get_root_data('chosen_message_text_attack');
                cover = getimage(handles.ORIbitplane1);
                nokey = get(handles.cb_no_key, 'Value');                             %check usekey was selected
                if (nokey == 1)
                    computeWatermark_nokey(handles, message, messageType, cover, resize);
                else
                    computeWatermark_key(handles, message, messageType, cover, resize);
                end
            case 'imag'
                cover = getimage(handles.ORIbitplane1);
                [H W D] = size(cover);
                max = min(H,W);
                if (max < 40)
                    set(handles.blocksizeSlider, 'Max', max);
                    set(handles.blocksize, 'String', num2str(max));
                    step = 1/(max-4);
                    set(handles.blocksizeSlider, 'SliderStep', [step, 0.1]);
                end
                set(handles.blocksizeSlider, 'Visible', 'on');
                set(handles.titleBlocksize, 'Visible', 'on');
                set(handles.blocksize, 'Visible', 'on');
                set(handles.blocksizeMin, 'Visible', 'on');
                set(handles.blocksizeMax, 'Visible', 'on');
                set(handles.blocksize, 'Visible', 'on');
                set(handles.resize, 'Visible', 'on');
                message = get_root_data('chosen_message_image_attack');
                [mH mW mD] = size(message);                                             %get size of message file
                if (mD == 1 )                                                       %make sure that the images consist of 3 layers
                    message = cat(3, message, message, message);
                elseif (mD == 2)
                    message = cat(2, message, message(:,:,2));
                elseif (mD > 3)
                    message = message(1:3);
                end
                message = rgb2gray(uint8(message));                                     %convert message to grayscale (1 layer);
                cover = getimage(handles.ORIbitplane1);
                nokey = get(handles.cb_no_key, 'Value');                             %check usekey was selected
                if (nokey == 1)
                    computeWatermark_nokey(handles, message, messageType, cover, resize);
                else
                    computeWatermark_key(handles, message, messageType, cover, resize);
                end
        end;
    otherwise
        messageType = get_root_data('chosen_message');
        switch messageType
            case 'text'
                message = get_root_data('chosen_message_text');
                cover = getimage(handles.ORIbitplane1);
                nokey = get(handles.cb_no_key, 'Value');                             %check usekey was selected
                if (nokey == 1)
                    computeWatermark_nokey(handles, message, messageType, cover, resize);
                else
                    computeWatermark_key(handles, message, messageType, cover, resize);
                end
            case 'imag'
                cover = getimage(handles.ORIbitplane1);
                [H W D] = size(cover);
                max = min(H,W);
                if (max < 40)
                    set(handles.blocksizeSlider, 'Max', max);
                    set(handles.blocksize, 'String', num2str(max));
                    step = 1/(max-4);
                    set(handles.blocksizeSlider, 'SliderStep', [step, 0.1]);
                end
                set(handles.blocksizeSlider, 'Visible', 'on');
                set(handles.titleBlocksize, 'Visible', 'on');
                set(handles.blocksize, 'Visible', 'on');
                set(handles.blocksizeMin, 'Visible', 'on');
                set(handles.blocksizeMax, 'Visible', 'on');
                set(handles.blocksize, 'Visible', 'on');
                set(handles.resize, 'Visible', 'on');
                message = get_root_data('chosen_message_image');
                [mH mW mD] = size(message);                                             %get size of message file
                if (mD == 1 )                                                       %make sure that the images consist of 3 layers
                    message = cat(3, message, message, message);
                elseif (mD == 2)
                    message = cat(2, message, message(:,:,2));
                elseif (mD > 3)
                    message = message(1:3);
                end
                message = rgb2gray(uint8(message));                                     %convert message to grayscale (1 layer);
                cover = getimage(handles.ORIbitplane1);
                nokey = get(handles.cb_no_key, 'Value');                             %check usekey was selected
                if (nokey == 1)
                    computeWatermark_nokey(handles, message, messageType, cover, resize);
                else
                    computeWatermark_key(handles, message, messageType, cover, resize);
                end
        end;
end;

%% STANDARD GUI FUNTIONS
%%
% --- Outputs from this function are returned to the command line.
function varargout = LSB_EMBEDDER_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




%% RESIZE
%%

% --- Executes on button press in resize.
function resize_Callback(hObject, eventdata, handles)
% hObject    handle to resize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of resize
resize = get(handles.resize, 'Value');

attack = get_root_data('attack');
switch attack
    case 'yes'
        messageType = get_root_data('chosen_message_attack');
        switch messageType
            case 'text'
                message = get_root_data('chosen_message_text_attack');
                cover = getimage(handles.ORIbitplane1);
                nokey = get(handles.cb_no_key, 'Value');                             %check usekey was selected
                if (nokey == 1)
                    computeWatermark_nokey(handles, message, messageType, cover, resize);
                else
                    computeWatermark_key(handles, message, messageType, cover, resize);
                end
            case 'imag'
                cover = getimage(handles.ORIbitplane1);
                [H W D] = size(cover);
                max = min(H,W);
                if (max < 40)
                    set(handles.blocksizeSlider, 'Max', max);
                    set(handles.blocksize, 'String', num2str(max));
                    step = 1/(max-4);
                    set(handles.blocksizeSlider, 'SliderStep', [step, 0.1]);
                end
                set(handles.blocksizeSlider, 'Visible', 'on');
                set(handles.titleBlocksize, 'Visible', 'on');
                set(handles.blocksize, 'Visible', 'on');
                set(handles.blocksizeMin, 'Visible', 'on');
                set(handles.blocksizeMax, 'Visible', 'on');
                set(handles.blocksize, 'Visible', 'on');
                message = get_root_data('chosen_message_image_attack');
                [mH mW mD] = size(message);                                             %get size of message file
                if (mD == 1 )                                                       %make sure that the images consist of 3 layers
                    message = cat(3, message, message, message);
                elseif (mD == 2)
                    message = cat(2, message, message(:,:,2));
                elseif (mD > 3)
                    message = message(1:3);
                end
                message = rgb2gray(uint8(message));                                     %convert message to grayscale (1 layer);
                cover = getimage(handles.ORIbitplane1);
                nokey = get(handles.cb_no_key, 'Value');                             %check usekey was selected
                if (nokey == 1)
                    computeWatermark_nokey(handles, message, messageType, cover, resize);
                else
                    computeWatermark_key(handles, message, messageType, cover, resize);
                end
        end;

    otherwise
        messageType = get_root_data('chosen_message');
        switch messageType
            case 'text'
                message = get_root_data('chosen_message_text');
                cover = getimage(handles.ORIbitplane1);
                nokey = get(handles.cb_no_key, 'Value');                             %check usekey was selected
                if (nokey == 1)
                    computeWatermark_nokey(handles, message, messageType, cover, resize);
                else
                    computeWatermark_key(handles, message, messageType, cover, resize);
                end
            case 'imag'
                cover = getimage(handles.ORIbitplane1);
                [H W D] = size(cover);
                max = min(H,W);
                if (max < 40)
                    set(handles.blocksizeSlider, 'Max', max);
                    set(handles.blocksize, 'String', num2str(max));
                    step = 1/(max-4);
                    set(handles.blocksizeSlider, 'SliderStep', [step, 0.1]);
                end
                set(handles.blocksizeSlider, 'Visible', 'on');
                set(handles.titleBlocksize, 'Visible', 'on');
                set(handles.blocksize, 'Visible', 'on');
                set(handles.blocksizeMin, 'Visible', 'on');
                set(handles.blocksizeMax, 'Visible', 'on');
                set(handles.blocksize, 'Visible', 'on');
                message = get_root_data('chosen_message_image');
                [mH mW mD] = size(message);                                             %get size of message file
                if (mD == 1 )                                                       %make sure that the images consist of 3 layers
                    message = cat(3, message, message, message);
                elseif (mD == 2)
                    message = cat(2, message, message(:,:,2));
                elseif (mD > 3)
                    message = message(1:3);
                end
                message = rgb2gray(uint8(message));                                     %convert message to grayscale (1 layer);
                cover = getimage(handles.ORIbitplane1);
                nokey = get(handles.cb_no_key, 'Value');                             %check usekey was selected
                if (nokey == 1)
                    computeWatermark_nokey(handles, message, messageType, cover, resize);
                else
                    computeWatermark_key(handles, message, messageType, cover, resize);
                end
        end;
end;


%% BLOCKSIZE
%%
% --- Executes on slider movement.
function blocksizeSlider_Callback(hObject, eventdata, handles)
% hObject    handle to blocksizeSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

blocksize = floor(get(handles.blocksizeSlider, 'Value'));
set(handles.blocksize, 'String', blocksize);
cover = getimage(handles.ORIbitplane1);
attack = get_root_data('attack');
switch attack
    case 'yes'
        message = get_root_data('chosen_message_image_attack');
    otherwise
        message = get_root_data('chosen_message_image');
end
resize = get(handles.resize, 'Value');
nokey = get(handles.cb_no_key, 'Value');                             %check usekey was selected
if (nokey == 1)
    computeWatermark_nokey(handles, message, 'imag', cover, resize);
else
    computeWatermark_key(handles, message, 'imag', cover, resize);
end



%% use no key
%%

% --- Executes on button press in cb_no_key.
function cb_no_key_Callback(hObject, eventdata, handles)
% hObject    handle to cb_no_key (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cb_no_key

resize = get(handles.resize, 'Value');
attack = get_root_data('attack');
switch attack
    case 'yes'
        messageType = get_root_data('chosen_message_attack');
        switch messageType
            case 'text'
                message = get_root_data('chosen_message_text_attack');
                cover = getimage(handles.ORIbitplane1);
                nokey = get(handles.cb_no_key, 'Value');                             %check usekey was selected
                if (nokey == 1)
                    computeWatermark_nokey(handles, message, messageType, cover, resize);
                else
                    computeWatermark_key(handles, message, messageType, cover, resize);
                end
            case 'imag'
                cover = getimage(handles.ORIbitplane1);
                message = get_root_data('chosen_message_image_attack');
                [mH mW mD] = size(message);                                             %get size of message file
                if (mD == 1 )                                                       %make sure that the images consist of 3 layers
                    message = cat(3, message, message, message);
                elseif (mD == 2)
                    message = cat(2, message, message(:,:,2));
                elseif (mD > 3)
                    message = message(1:3);
                end
                message = rgb2gray(uint8(message));                                     %convert message to grayscale (1 layer);
                cover = getimage(handles.ORIbitplane1);
                nokey = get(handles.cb_no_key, 'Value');                             %check usekey was selected
                if (nokey == 1)
                    computeWatermark_nokey(handles, message, messageType, cover, resize);
                else
                    computeWatermark_key(handles, message, messageType, cover, resize);
                end
        end;
    otherwise
        messageType = get_root_data('chosen_message');
        switch messageType
            case 'text'
                message = get_root_data('chosen_message_text');
                cover = getimage(handles.ORIbitplane1);
                nokey = get(handles.cb_no_key, 'Value');                             %check usekey was selected
                if (nokey == 1)
                    computeWatermark_nokey(handles, message, messageType, cover, resize);
                else
                    computeWatermark_key(handles, message, messageType, cover, resize);
                end
            case 'imag'
                cover = getimage(handles.ORIbitplane1);
                message = get_root_data('chosen_message_image');
                [mH mW mD] = size(message);                                             %get size of message file
                if (mD == 1 )                                                       %make sure that the images consist of 3 layers
                    message = cat(3, message, message, message);
                elseif (mD == 2)
                    message = cat(2, message, message(:,:,2));
                elseif (mD > 3)
                    message = message(1:3);
                end
                message = rgb2gray(uint8(message));                                     %convert message to grayscale (1 layer);
                cover = getimage(handles.ORIbitplane1);
                nokey = get(handles.cb_no_key, 'Value');                             %check usekey was selected
                if (nokey == 1)
                    computeWatermark_nokey(handles, message, messageType, cover, resize);
                else
                    computeWatermark_key(handles, message, messageType, cover, resize);
                end
        end;
end;


%% EMBED
%%
% --- Executes on button press in embed.
function embed_Callback(hObject, eventdata, handles)
% hObject    handle to embed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% compute watermark if message is ok
if(isempty(getimage(handles.WMPreview)))                                                    %if message is not ok (WMPreview contains no image)
    msgbox('No message file selected...', 'Error', 'error');                                %show error message box
else                                                                                        %message ok
    set(handles.WMComputing, 'Visible', 'on');              %show info message 'computing' for watermarked bitplanes
    set(handles.computingImageWM, 'Visible', 'on');         %show info message 'computing' for watermarked image

    workbar(0, 'Embedding watermark', 'Embedding watermark...');

    cover = get_root_data('working_original');              %get original image
    wm = im2bw(im2double(getimage(handles.WMPreview)));     %get watermark
    BP = bitplanes_to_watermark(handles);                   %determine which bitplanes were selected to watermark

    im_WM = embedLSB(cover, wm, BP);                        %call embedLSB which embeds the WM and shows the results

    im_bp_WM = im2bp(im_WM);                                %convert im_WM into bitplanes
    showBP(handles, 'WM', im_bp_WM);                        %show bitplanes
    set(handles.WMComputing, 'Visible', 'off');             %hide info message 'computing'
    %set(handles.titleWM, 'Visible', 'on');                 %show title
    set(handles.computingImageWM, 'Visible', 'off');        %hide info 'computing...'
    axes(handles.imageWM);                                  %show watermarked image

    set_root_data(handles,'temp',im_WM);
    plot_watermarked_image = recontruct_from_working_image_for_plotting(im_WM);

    imshow(plot_watermarked_image);
    axis equal;                                             %sets the aspect ratio. (Show the image in its right ratio)
    axis tight;                                             %Sets the axis limits to the arrange of the data.
    axis off;
end

attack = get_root_data('attack');
switch attack
    case 'yes'
        messageType = get_root_data('chosen_message_attack');
        if(strcmp(messageType,'imag'))
            [H W D] = size(get_root_data('chosen_message_image_attack'));
            cover = getimage(handles.ORIbitplane1);
            [cH cW cD] = size(cover);
            blocksize = get_root_data('blocksize_attack');
            part = floor(((cH*cW)/(H*blocksize*W*blocksize))*10000)/100;
            resize = get(handles.resize, 'Value');
            if((resize ~= 1) && (H*blocksize > cH || W*blocksize > cW))
                msgbox(['Message too large for cover work, only ', num2str(part) , '% ',' of it will be embedded.'], 'Warning', 'help');
            end
        end
    otherwise
        messageType = get_root_data('chosen_message');
        if(strcmp(messageType,'imag'))
            [H W D] = size(get_root_data('chosen_message_image'));
            cover = getimage(handles.ORIbitplane1);
            [cH cW cD] = size(cover);
            blocksize = get_root_data('blocksize');
            part = floor(((cH*cW)/(H*blocksize*W*blocksize))*10000)/100;
            resize = get(handles.resize, 'Value');
            if((resize ~= 1) && (H*blocksize > cH || W*blocksize > cW))
                msgbox(['Message too large for cover work, only ', num2str(part) , '% ',' of it will be embedded.'], 'Warning', 'help');
            end
        end
end;

%% ZOOM
%%
% --- Executes on button press in zoomIn.
function zoomIn_Callback(hObject, eventdata, handles)
% hObject    handle to zoomIn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%
if(get(handles.zoomIn, 'Value') == 1.0)             %zoom toggled on
    set(handles.pan, 'Value', 0.0);                     %toglle pan-button of
    pan off                                             %turn pan off
    axes_handles = zeros(1,19);                         %put handles of all axes in one vector
    axes_handles(1) = handles.imageORI;
    axes_handles(2) = handles.ORIbitplane1;
    axes_handles(3) = handles.ORIbitplane2;
    axes_handles(4) = handles.ORIbitplane3;
    axes_handles(5) = handles.ORIbitplane4;
    axes_handles(6) = handles.ORIbitplane5;
    axes_handles(7) = handles.ORIbitplane6;
    axes_handles(8) = handles.ORIbitplane7;
    axes_handles(9) = handles.ORIbitplane8;
    axes_handles(10) = handles.imageWM;
    axes_handles(11) = handles.WMbitplane1;
    axes_handles(12) = handles.WMbitplane2;
    axes_handles(13) = handles.WMbitplane3;
    axes_handles(14) = handles.WMbitplane4;
    axes_handles(15) = handles.WMbitplane5;
    axes_handles(16) = handles.WMbitplane6;
    axes_handles(17) = handles.WMbitplane7;
    axes_handles(18) = handles.WMbitplane8;
    axes_handles(19) = handles.WMPreview;
    linkaxes(axes_handles);                             %links axes together
    zoom                                                %enable dynamic zoom
else
    zoom off
end

%%
% --- Executes on button press in zoomInClick.
function zoomInClick_Callback(hObject, eventdata, handles)
% hObject    handle to zoomInClick (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.zoomIn, 'Value', 0.0);      %toggle zoom button off
zoom off
set(handles.pan, 'Value', 0.0);     %toglle pan-button of
pan off                             %turn pan off
ax = get(gcf,'CurrentAxes');        %get current active axes
im = getimage(ax);                  %get image of current active axes
figure                              %open new figure
imshow(im);                         %show image

%%
% --- Executes on button press in pan.
function pan_Callback(hObject, eventdata, handles)
% hObject    handle to pan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%
if(get(handles.pan, 'Value') == 1.0)
    set(handles.zoomIn, 'Value', 0.0);                      %toglle pan-button of
    zoom off                                                %turn zoom off
    pan                                                     %enable pan
else
    pan off
end

%%
% --- Executes on button press in zoomOutAll.
function zoomOutAll_Callback(hObject, eventdata, handles)
% hObject    handle to zoomOutAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%
set(handles.zoomIn, 'Value', 0.0);                      %toggle zoomIn-button off
zoom off                                                %turn zoom off
set(handles.pan, 'Value', 0.0);                         %toggle pan-button off
pan off                                                 %turn pan off
zoomOutAll_emb_nokey(handles);                                    %resets all axes to initial zoom

%%
% --- Executes on button press in helpZoom.
function helpZoom_Callback(hObject, eventdata, handles)
% hObject    handle to helpZoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%show info help message
msgbox('To zoom in on any of the images or axes of the figure, click on the ''zoom in''-button. Then click on an image to zoom in or use the mouse to scroll up. To zoom in on a specific area, simply select that area. You can zoom out by holding CTRL while clicking on an image or axe or by scrolling down. To open an image in a new figure, click on the image and then hit the view-in-new-figure button. To restore an image, simply double click on it. To restore all the images and axes, use the ''zoom out all''-button. Panning is possible after clicking the pan-button.', 'Info', 'help');



%% help

% --- Executes on button press in helpLSBnokey.
function helpLSBnokey_Callback(hObject, eventdata, handles)
% hObject    handle to helpLSBnokey (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

msgbox('In this GUI, you an select the parameters for the embedding of the watermark. If the selected message is an image, you can change the blocksize. The blocksize determines the number of pixels that will be used to represent 1 pixel of the message image. If the image is too large, it will be cropped. You can also choose te resize the image by checking the checkbox under the watermark. In the middle panel, you can select in which bitplane you want to embed the watermark.', 'Help', 'help');


%% DONE
%%
% --- Executes on button press in Done.
%return to main GUI and close figure
function done_Callback(hObject, eventdata, handles)
% hObject    handle to Done (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%
%TODO: place objects in root
%
nokey = get(handles.cb_no_key, 'Value');
set_root_data(handles, 'no_key', nokey);

blocksize = floor(get(handles.blocksizeSlider, 'Value'));
close;

watermarked_image = get_root_data('temp');
rgb_watermarked = recontruct_from_working_image_for_gui(watermarked_image);

graph = 'watermarked';

attack = get_root_data('attack');
switch attack
    case 'no'
        set_root_data(handles, 'blocksize', blocksize);
    otherwise
end

fhupdate_axes(graph,rgb_watermarked);












% --- Executes during object creation, after setting all properties.
function blocksizeSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blocksizeSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


