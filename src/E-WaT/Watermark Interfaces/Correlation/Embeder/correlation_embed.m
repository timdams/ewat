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
 
%%
%correlation_embed: This is the correlation gui for embedding the message

function varargout = correlation_embed(varargin)
        % CORRELATION_EMBED M-file for correlation_embed.fig
        %      CORRELATION_EMBED, by itself, creates a new CORRELATION_EMBED or raises the existing
        %      singleton*.
        %
        %      H = CORRELATION_EMBED returns the handle to a new CORRELATION_EMBED or the handle to
        %      the existing singleton*.
        %
        %      CORRELATION_EMBED('CALLBACK',hObject,eventData,handles,...) calls the local
        %      function named CALLBACK in CORRELATION_EMBED.M with the given input arguments.
        %
        %      CORRELATION_EMBED('Property','Value',...) creates a new CORRELATION_EMBED or raises the
        %      existing singleton*.  Starting from the left, property value pairs are
        %      applied to the GUI before correlation_embed_OpeningFunction gets called.  An
        %      unrecognized property name or invalid value makes property application
        %      stop.  All inputs are passed to correlation_embed_OpeningFcn via varargin.
        %
        %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
        %      instance to run (singleton)".
        %
        % See also: GUIDE, GUIDATA, GUIHANDLES

        % Edit the above text to modify the response to help correlation_embed

        % Last Modified by GUIDE v2.5 07-Jun-2007 01:02:30

        % Begin initialization code - DO NOT EDIT
        gui_Singleton = 1;
        gui_State = struct('gui_Name',       mfilename, ...
                           'gui_Singleton',  gui_Singleton, ...
                           'gui_OpeningFcn', @correlation_embed_OpeningFcn, ...
                           'gui_OutputFcn',  @correlation_embed_OutputFcn, ...
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


%% Opening function
function correlation_embed_OpeningFcn(hObject, eventdata, handles, varargin)
        
        % Choose default command line output for correlation_embed
        handles.output = hObject;

        % Update handles structure
        guidata(hObject, handles);

        % UIWAIT makes correlation_embed wait for user response (see UIRESUME)
        % uiwait(handles.figure1);

        %load the image
        
        attack = get_root_data('attack');
        switch attack
            case 'yes'        
                im_plot = get_root_data('plot_watermarked');
            otherwise
                im_plot = get_root_data('plot_original');
        end;
        
        axes(handles.origIm);
        imshow(im_plot);   
        axis equal;
        axis tight;
        axis off;

        %Hide the unused axes
        set(handles.bit0,'Visible','off');
        set(handles.bit1,'Visible','off');
        set(handles.patIm,'Visible','off');
        set(handles.watIm,'Visible','off');

        attack = get_root_data('attack');
        switch attack
            case 'no'
                messageType = get_root_data('chosen_message');
                switch messageType
                    case 'text'
                        message = get_root_data('chosen_message_text');
                    case 'imag'
                        message = get_root_data('chosen_message_image');
                end;
            otherwise
                messageType = get_root_data('chosen_message');
                switch messageType
                    case 'text'
                        message = get_root_data('chosen_message_text_attack');
                    case 'imag'
                        message = get_root_data('chosen_message_image_attack');
                end;
        end;
        
       

        if (strcmp(messageType,'text'))

            %Convert the message to binary form - 0's and 1's
            message_binary = dec2bin(message);

            %read in the cover work
            
            cover_work = get_root_data('working_original');

            %determine size of cover work
            Mc=size(cover_work,1);	%Height
            Nc=size(cover_work,2);	%Width

            %Create a message string from the binary form and find the size
            message_string = num2str(message_binary);
            k = size(message_string,1);
            l = size(message_string,2);

            %determine the maximum blocksize
            max_blocksize = floor(sqrt(floor((Mc*Nc)/(k*l))));

            if(max_blocksize > 32)
                max_blocksize = 32;
            end

            %set the range of allowed blocksizes
            set(handles.blocksize,'Max',max_blocksize);
            set(handles.blocksize,'Value',max_blocksize);
            set(handles.text6,'String',max_blocksize);
            set(handles.blocksize,'SliderStep',[1/get(handles.blocksize,'Max'),0.1]);
        else
            %read in the cover work
            cover_work = get_root_data('working_original');

            [mH mW mD] = size(message);                                             %get size of message file
                if (mD == 1 )                                                       %make sure that the images consist of 3 layers
                    message = cat(3, message, message, message);
                elseif (mD == 2)
                    message = cat(2, message, message(:,:,2));
                elseif (mD > 3)
                    message = message(1:3);
                end
            message = rgb2gray(uint8(message));                                     %convert message to grayscale (1 layer);

            %determine size of cover work
            Mc=size(cover_work,1);	%Height
            Nc=size(cover_work,2);	%Width

            %determine size of message image
            Mm=size(message,1);	%Height
            Nm=size(message,2);	%Width

            %determine maximum message size based on cover work, and blocksize
            max_blocksize = floor(sqrt(floor((Mc*Nc)/(Mm*Nm))));

            if(max_blocksize > 32)
                max_blocksize = 32;
            end

            %set the range of allowed blocksizes
            set(handles.blocksize,'Max',max_blocksize);
            set(handles.blocksize,'Value',max_blocksize);
            set(handles.text6,'String',max_blocksize);
            set(handles.blocksize,'SliderStep',[1/get(handles.blocksize,'Max'),0.1]);
        end

        blocksize = get(handles.blocksize,'Value');

        switch attack
            case 'no'
                type_key = get_root_data('chosen_key');
                switch type_key
                    case 'text'
                        key = get_root_data('chosen_key_text');

                    case 'imag'
                        key = get_root_data('chosen_key_image');
                end;
            otherwise
                type_key = get_root_data('chosen_key');
                switch type_key
                    case 'text'
                        key = get_root_data('chosen_key_text_attack');

                    case 'imag'
                        key = get_root_data('chosen_key_image_attack');
                end;
        end
        
        %the called function make_sequences will calculate both PRNG sequences for 0
        %and 1
        [pn_sequence_zero,pn_sequence_one] = make_sequences(blocksize,key,type_key);

        axes(handles.bit0);                                 %show the image in the axes 'bit0'
        imshow(pn_sequence_zero,[0 1]);                     %show the image
        axis equal;
        axis tight;
        axis off;

        axes(handles.bit1);                                 %show the image in the axes 'bit1'
        imshow(pn_sequence_one,[0 1]);                      %show the image
        axis equal;
        axis tight;
        axis off;

function varargout = correlation_embed_OutputFcn(hObject, eventdata, handles) 
        varargout{1} = handles.output;

%% Button show PRNG
function show_btn_Callback(hObject, eventdata, handles)
        
        %protection against false blocksize value of 0 
        if(round(get(handles.blocksize,'Value')) == 0)
            blocksize = 1;
        else
            blocksize=round(get(handles.blocksize,'Value'));           %set the size of one block in the cover work to be used for each bit in watermark
        end

        attack = get_root_data('attack');
        switch attack
            case 'no'
                type_key = get_root_data('chosen_key');
                switch type_key
                    case 'text'
                        key = get_root_data('chosen_key_text');

                    case 'imag'
                        key = get_root_data('chosen_key_image');
                end;
            otherwise
                type_key = get_root_data('chosen_key');
                switch type_key
                    case 'text'
                        key = get_root_data('chosen_key_text_attack');

                    case 'imag'
                        key = get_root_data('chosen_key_image_attack');
                end;
        end

        %the called function make_sequences will calculate both PRNG sequences for 0
        %and 1
        [pn_sequence_zero,pn_sequence_one] = make_sequences(blocksize,key,type_key);

        axes(handles.bit0);                                 %show the image in the axes 'bit0'
        imshow(pn_sequence_zero,[0 1]);                     %show the image
        axis equal;
        axis tight;
        axis off;

        axes(handles.bit1);                                 %show the image in the axes 'bit1'
        imshow(pn_sequence_one,[0 1]);                      %show the image
        axis equal;
        axis tight;
        axis off;

        %read in the cover work
        cover_work = double(get_root_data('working_original'));

        switch attack
            case 'no'
                type = get_root_data('chosen_message');
                switch type
                    case 'text'
                        message = get_root_data('chosen_message_text');
                    case 'imag'
                        message = get_root_data('chosen_message_image');
                end;
            otherwise
                type = get_root_data('chosen_message');
                switch type
                    case 'text'
                        message = get_root_data('chosen_message_text_attack');
                    case 'imag'
                        message = get_root_data('chosen_message_image_attack');
                end;
        end
        
        

        %call the function that creates the watermark mask
        watermark_mask = make_watermark_cor(blocksize,cover_work,message,type,key,type_key);

        axes(handles.patIm);                                %show the image in the axes 'patIm'
        imshow(watermark_mask,[0 1]);                       %show the image
        axis equal;
        axis tight;
        axis off;


%% Slider blocksize
function blocksize_Callback(hObject, eventdata, handles)
        %read the blocksize in
        size = round(get(handles.blocksize,'Value'));
        set(handles.text6,'String',size);

        if size < 4
            msgbox('To avoid slow detection choose a blocksize larger then 4','Warning','info'); 
        end;
function blocksize_CreateFcn(hObject, eventdata, handles)
        if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
            set(hObject,'BackgroundColor',[.9 .9 .9]);
        end


%% Button Embed
function embed_btn_Callback(hObject, eventdata, handles)
        
        %protection against false blocksize value of 0 
        if(round(get(handles.blocksize,'Value')) == 0)
            blocksize = 1;
        else
            blocksize=round(get(handles.blocksize,'Value'));           %set the size of one block in the cover work to be used for each bit in watermark
        end

        %write the used blocksize to file
        set_root_data(handles,'cor_blocksize',blocksize);

        type_key = get_root_data('chosen_key');
        switch type_key
            case 'text'
                key = get_root_data('chosen_key_text');

            case 'imag'
                key = get_root_data('chosen_key_image');
        end;

        type = get_root_data('chosen_message');
        switch type
            case 'text'
                message = get_root_data('chosen_message_text');
            case 'imag'
                message = get_root_data('chosen_message_image');
        end;

        cover_work = double(get_root_data('working_original'));

        %call the function that creates the watermark mask
        watermark_mask = make_watermark_cor(blocksize,cover_work,message,type,key,type_key);

        %read in the embedding strength
        k = get(handles.strength,'Value');

        % add watermark mask to cover image using gain factor k 
        watermarked_image=uint8(cover_work+k*watermark_mask);

        %calculate the psnr
        psnr_value = PSNR(double(cover_work),double(watermarked_image));
        set(handles.edit13,'String',psnr_value);

        set_root_data(handles,'temp',watermarked_image);

        rgb_watermarked = recontruct_from_working_image_for_plotting(watermarked_image);

        axes(handles.watIm);                                %show the image in the axes 'watIm'
        imshow(rgb_watermarked);                            %show the image
        axis equal;
        axis tight;
        axis off;


%% Embedding strength
function strength_Callback(hObject, eventdata, handles)
        if(round(get(handles.blocksize,'Value')) == 0)
            blocksize = 1;
        else
            blocksize=round(get(handles.blocksize,'Value'));           %set the size of one block in the cover work to be used for each bit in watermark
        end

        %write the used blocksize to file
        set_root_data(handles,'cor_blocksize',blocksize);

        %read in the embedding strength
        k = round(get(handles.strength,'Value'));
        set(handles.text8,'String',k);
function strength_CreateFcn(hObject, eventdata, handles)
        if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
            set(hObject,'BackgroundColor',[.9 .9 .9]);
        end

%% PSNR
function edit13_Callback(hObject, eventdata, handles)

function edit13_CreateFcn(hObject, eventdata, handles)
        if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
            set(hObject,'BackgroundColor','white');
        end

%% Make sequences
function [sequence_zero,sequence_one] = make_sequences(blocksize,key,type_key)

        if(type_key == 'text')
            key_text = key;

            %calculate the average of all values in the key text file
            m = size(key_text,1);
            sum = 0;
            for i = 1:m
                sum = sum + key_text(i,1);
            end
            average = round(sum/m);
        else
            key_image = key;

            %determine size of key image
            Mm=size(key_image,1);	%Height
            Nm=size(key_image,2);	%Width

            %calculate the average of all values in the key image file
            sum = 0;
            for i = 1:Mm
                for j = 1:Nm
                    sum = sum + key_image(i,j);
                end
            end
            average = round(sum/(Mm*Nm));
        end

        %reset MATLAB's PN generator to state with value 'average'
        rand('state',double(average));

        %generate PN sequences to implement "1" and "0"
        %all values are 0 or 1
        pn_sequence_one=round( rand(blocksize,blocksize) );
        pn_sequence_zero=ones(blocksize,blocksize) - pn_sequence_one;
        %pn_sequence_zero=round( rand(blocksize,blocksize) );

        %find two highly un-correlated PN sequences
        %while (corr2(pn_sequence_one,pn_sequence_zero) > -0.5)
        %    pn_sequence_one=round( rand(blocksize,blocksize) );
        %    pn_sequence_zero=round( rand(blocksize,blocksize) );
        %end

        sequence_zero = pn_sequence_zero;
        sequence_one = pn_sequence_one;

%% Button Done
function pushbutton17_Callback(hObject, eventdata, handles)

        watermarked_image = get_root_data('temp');
        rgb_watermarked = recontruct_from_working_image_for_gui(watermarked_image);

        graph = 'watermarked';
        close;
        fhupdate_axes(graph,rgb_watermarked);
%% Info
function pushbutton_correlation_info_Callback(hObject, eventdata, handles)

        msgbox('In this GUI, you can adjust the blocksize and the embedding strength for the correlation technique.','Help','help');

