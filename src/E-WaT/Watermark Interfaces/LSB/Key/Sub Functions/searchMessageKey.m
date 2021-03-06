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


function [messageType message_im message_t] = searchMessageKey(handles, cover)

attack = get_root_data('attack');

switch(attack)
    case 'yes'
        messageType = get_root_data('chosen_message_attack');
        switch(messageType)
            case 'text'
                message = get_root_data('chosen_message_text_attack');
            otherwise
                message = get_root_data('chosen_message_image_attack');
        end
    otherwise
        messageType = get_root_data('chosen_message');
         switch(messageType)
            case 'text'
                message = get_root_data('chosen_message_text');
             otherwise
                 message = get_root_data('chosen_message_image');
        end
end

type_key = get_root_data('chosen_key');
switch type_key
    case 'text'
        key = get_root_data('chosen_key_text');
        
    case 'imag'
        key = get_root_data('chosen_key_image');
end;

switch type_key                  %computes the key
    case 'text'
        key = sum(key);
    case 'imag'
        key = sum(sum(sum(key)));
    otherwise
        msgbox('Problem with key...', 'Error', 'error');
end

switch(messageType)
    case 'imag'
        % SEARCH FOR IMAGE
        [mH mW mD] = size(message);
        [cH cW cD] = size(cover);                                                   %get size of cover work
        blocksize = get_root_data('blocksize');%floor(get(handles.sliderBlocksize, 'Value'));
        workbar(0.15);
        L = mH;
        K = mW;
        [message_im maxCounts_im] = searchImage_key(handles, L, K, blocksize, cover,key);                                 %call search message function to determine any message                                %determine maximum of all maxCounts averages
        message_t = 0;

    case 'text'
        [cH cW cD] = size(cover);                                                   %get size of cover work
        [aH aW aD] = size(alphabet('a'));                                           %determine size of character matrices (all characters should have same size)
        L = length(message);                                                                      %intialize L to 1 (messagelength = 1)
        workbar(0.65, 'Searching for text watermark', 'Searching for text watermark');
        [message_t maxCounts_t] = searchMessage_key(handles, L, cover);                                 %call search message function to determine any message
        count = 0;
        for i=1:L
            if(message(i) == '?')
                count = count + 1;
            end
        end
        message_im = 0;
    otherwise
end

