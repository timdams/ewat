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

%computeWatermark: embeds the watermark in the image and shows results
%@handles: active set of handles
%@messageFile: source file for message
%@type: type of source file ('text' or 'image')
%@cover: bitplane 1 from cover work
%@resize: boolean which indicates wether or not to resize the message file
%to fit in cover work
function computeWatermark_nokey(handles, messageFile, type, cover, resize)

attack = get_root_data('attack');
switch attack 
    case 'no'
        switch type
            case 'imag'                                                            %message is an image file
                workbar(0.1,  'Computing watermark', 'Computing watermark');
                [cH cW cD] = size(cover);                                             %get size of cover work
                set(handles.computingWMPreview, 'Visible', 'on');                     %show info message 'computing'
                [H W D] = size(messageFile);                                          %get size of messageFile
                blocksize = floor(get(handles.blocksizeSlider, 'Value'));
                set_root_data(handles, 'blocksize', blocksize);
                if(resize == 1.0)
                    if((H*blocksize > cH) && (W*blocksize > cW))
                        messageFile = imresize(messageFile, [floor(cH/blocksize) floor(cW/blocksize)]);
                    elseif(H*blocksize > cH)
                        messageFile = imresize(messageFile, [floor(cH/blocksize) W]);
                    elseif(W*blocksize > cW)
                        messageFile = imresize(messageFile, [H floor(cW/blocksize)]);
                    end
                    [H W D] = size(messageFile);
                end
                factor = 1;
                while((H*blocksize*factor < cH) && (W*blocksize*factor < cW))                             %one pixel of messageFile will be converted to 4 pixels in a sqaure, so deteremine max factor so that messageFile still fits in cover work
                    factor = factor + 1;
                end
                if (factor > 1)
                    factor = factor - 1;                                            %compensate for last +1
                end
                set_root_data(handles, 'factor', factor);
                messageFile = im2bw(messageFile);                                     %convert imageFile to binary image
                watermark = ones(cH, cW);                                             %create empty watermark (ones because 1 = white)
                if (floor((cH - H*blocksize*factor)/2) >= 1)
                    offsetH = floor((cH - H*blocksize*factor)/2);                                %compute vertical offset to assure center align vertically
                else
                    offsetH = 0;
                end
                if(floor((cW - W*blocksize*factor)/2) >= 1)
                    offsetW = floor((cW - W*blocksize*factor)/2);                       %compute horizontal offset so that text apears centered
                else
                    offsetW = 0;
                end
                M_0 = zeros(blocksize*factor);
                M_1 = ones(blocksize*factor);
                if(H*blocksize*factor > cH)
                    a = floor(cH/(blocksize*factor));
                else
                    a = H;
                end
                if(W*blocksize*factor > cW)
                    b = floor(cW/(blocksize*factor));
                else
                    b = W;
                end
                set_root_data(handles, 'embedded_message', messageFile(1:a,1:b));
                for i=1:a
                    for j=1:b
                        ind = messageFile(i,j);                                     %index in messageFile
                        if(ind == 1)
                            M = M_1;
                        else
                            M = M_0;
                        end
                        watermark((i-1)*blocksize*factor+1 + offsetH : i*blocksize*factor + offsetH, (j-1)*blocksize*factor+1 + offsetW : j*blocksize*factor + offsetW) = M; %translate message into character matrices and align
                    end
                    workbar((i/a)*0.85+0.1);
                end

                watermark = cat(3, watermark, watermark, watermark);          %make sure watermark consists of 3 layers
                axes(handles.WMPreview);                                      %set WMPreview axes as active
                workbar(0.97);
                image(watermark);                                             %show message
                axis equal;                                                   %sets the aspect ratio. (Show the image in its right ratio)
                axis tight;                                                   %Sets the axis limits to the arrange of the data.
                axis off;                                                     %Turn off all axis labeling
                set(handles.computingWMPreview, 'Visible', 'off');            %hide info message 'computing'
                workbar(1.0);


            case 'text'                                                               %message source file is a text file
                set(handles.computingWMPreview, 'Visible', 'on');                     %show info message 'computing'
                [aH aW aD] = size(alphabet('a'));                                     %determine size of character matrices (all characters should have same size)
                [cH cW cD] = size(cover);                                             %get size of cover work
                L = length(messageFile);                                              %determine length of messageFile
                areaC = cH*cW;                                                        %determine area of cover work
                factor = 1;                                                           %initialis factor to 1
                nrR = floor(cH/(factor*aH));                                          %nr of rows possible = floor(cH,aH))
                nrC = floor(cW/(factor*aW));                                          %nr of colums possible: floor(cW/aW) = nr of characters that fits in 1 row of the cover work
                nrR_needed = ceil(L/nrC);                                             %ceil(L/nrC)) = nr of rows needed
                if(nrR >= nrR_needed && cW >= aW*nrC)                                 %if cover work is big enough for message (message is max when factor is one)
                    n = mod(L,nrC);                                                       %use n so we can set n to nrC when mod() is zero
                    if(n==0)
                        n = nrC;
                    end
                    nrC_last_row = n;                                                     %nr of colums for last row
                    while(nrR >= nrR_needed) %cH >= factor*aH && cW >= factor*aW && nrR >= nrR_needed )      %as long as cover work is large enough, higher factor with one
                        factor = factor + 1;                                              %recompute nrR, ...
                        nrR = floor(cH/(factor*aH));                                      %nr of rows possible = floor(cH,aH))
                        nrC = floor(cW/(factor*aW));                                      %nr of colums possible: floor(cW/aW) = nr of characters that fits in 1 row of the cover work
                        nrR_needed = ceil(L/nrC);                                         %ceil(L/nrC)) = nr of rows needed
                        n = mod(L,nrC);                                                   %use n so we can set n to nrC when mod() is zero
                        if(n==0)
                            n = nrC;
                        end
                        nrC_last_row = n;                                                 %nr of colums for last row
                    end
                    factor = factor - 1;                                                  %factor is now 1 too high, so do minus 1 and recompute nrR,..
                    set_root_data(handles, 'factor', factor);
                    nrR = floor(cH/(factor*aH));                                          %nr of rows possible = floor(cH,aH))
                    nrC = floor(cW/(factor*aW));                                          %nr of colums possible: floor(cW/aW) = nr of characters that fits in 1 row of the cover work
                    nrR_needed = ceil(L/nrC);                                             %ceil(L/nrC)) = nr of rows needed
                    n = mod(L,nrC);                                                       %use n so we can set n to nrC when mod() is zero
                    if(n==0)
                        n = nrC;
                    end
                    nrC_last_row = n;                                                     %nr of colums for last row
                    watermark = ones(cH, cW);                                     %create empty watermark (ones because 1 = white)
                    offsetH = floor((cH - nrR_needed*aH*factor)/2);               %compute vertical offset to assure center align vertically
                    for i=1:nrR_needed
                        if (i == nrR_needed)                                      %last row
                            workbar(0.85+0.1);
                            for j=1:nrC_last_row
                                offsetW = floor((cW - nrC_last_row*aW*factor)/2); %compute horizontal offset so that text apears centered
                                ind = messageFile((i-1)*nrC+j);                   %index in messageFile
                                m = alphabet(ind);                                %original matrix represenataion
                                M = ones(aH*factor, aW*factor);                   %M = new (larger) matrix representation of the characters depending on factor
                                for v = 1:factor*aH                               %copy date from m into M (take each value of m factor times in M)
                                    for w = 1:factor*aW
                                        M(v,w) = m(ceil(v/factor), ceil(w/factor));
                                    end
                                end
                                watermark((i-1)*aH*factor+1 + offsetH : i*aH*factor + offsetH, (j-1)*aW*factor+1 + offsetW : j*aW*factor + offsetW) = M; %translate message into character matrices and align
                                workbar((j/nrC_last_row)*0.95 + 0.1);
                            end
                        else                                                      %other rows
                            for j=1:nrC
                                offsetW = floor((cW - nrC*aW*factor)/2);          %compute horizontal offset so that text apears centered
                                ind = messageFile((i-1)*nrC+j);                   %index in messageFile
                                M = ones(aH*factor, aW*factor);                   %original matrix represenataion
                                m = alphabet(ind);                                %M = new (larger) matrix representation of the characters depending on factor
                                for v = 1:factor*aH                               %copy date from m into M (take each value of m factor times in M)
                                    for w = 1:factor*aW
                                        M(v,w) = m(ceil(v/factor), ceil(w/factor));
                                    end
                                end
                                watermark((i-1)*aH*factor+1 + offsetH : i*aH*factor + offsetH, (j-1)*aW*factor+1 + offsetW : j*aW*factor + offsetW) = M; %translate message into character matrices and align
                            end
                            workbar((i/nrR_needed)*0.85+0.1);
                        end
                    end
                    watermark = cat(3, watermark, watermark, watermark);          %make sure watermark consists of 3 layers
                    set(handles.WMPreview, 'Visible', 'on');                      %show axes watermark preview
                    axes(handles.WMPreview);                                      %set WMPreview axes as active
                    workbar(0.97);
                    image(watermark);                                             %show message
                    axis equal;                                                   %sets the aspect ratio. (Show the image in its right ratio)
                    axis tight;                                                   %Sets the axis limits to the arrange of the data.
                    axis off;                                                     %Turn off all axis labeling
                    workbar(1.0);
                    set(handles.computingWMPreview, 'Visible', 'off');            %hide info message 'computing'
                else
                    %make message shorter so it does fit in the cover work
                    while(nrR < nrR_needed || cW < aW*nrC)
                        L = L - 1;
                        nrR = floor(cH/(factor*aH));                                          %nr of rows possible = floor(cH,aH))
                        nrC = floor(cW/(factor*aW));                                          %nr of colums possible: floor(cW/aW) = nr of characters that fits in 1 row of the cover work
                        nrR_needed = ceil(L/nrC);                                             %ceil(L/nrC)) = nr of rows needed
                    end
                    messageFile = substring(messageFile, 0, L);
                    n = mod(L,nrC);                                                       %use n so we can set n to nrC when mod() is zero
                    if(n==0)
                        n = nrC;
                    end
                    nrC_last_row = n;                                                     %nr of colums for last row
                    while(nrR >= nrR_needed) %cH >= factor*aH && cW >= factor*aW && nrR >= nrR_needed )      %as long as cover work is large enough, higher factor with one
                        factor = factor + 1;                                              %recompute nrR, ...
                        nrR = floor(cH/(factor*aH));                                      %nr of rows possible = floor(cH,aH))
                        nrC = floor(cW/(factor*aW));                                      %nr of colums possible: floor(cW/aW) = nr of characters that fits in 1 row of the cover work
                        nrR_needed = ceil(L/nrC);                                         %ceil(L/nrC)) = nr of rows needed
                        n = mod(L,nrC);                                                   %use n so we can set n to nrC when mod() is zero
                        if(n==0)
                            n = nrC;
                        end
                        nrC_last_row = n;                                                 %nr of colums for last row
                    end
                    factor = factor - 1;                                                  %factor is now 1 too high, so do minus 1 and recompute nrR,..
                    nrR = floor(cH/(factor*aH));                                          %nr of rows possible = floor(cH,aH))
                    nrC = floor(cW/(factor*aW));                                          %nr of colums possible: floor(cW/aW) = nr of characters that fits in 1 row of the cover work
                    nrR_needed = ceil(L/nrC);                                             %ceil(L/nrC)) = nr of rows needed
                    n = mod(L,nrC);                                                       %use n so we can set n to nrC when mod() is zero
                    if(n==0)
                        n = nrC;
                    end
                    nrC_last_row = n;                                                     %nr of colums for last row
                    watermark = ones(cH, cW);                                     %create empty watermark (ones because 1 = white)
                    offsetH = floor((cH - nrR_needed*aH*factor)/2);               %compute vertical offset to assure center align vertically
                    for i=1:nrR_needed
                        if (i == nrR_needed)                                      %last row
                            workbar(0.85+0.1);
                            for j=1:nrC_last_row
                                offsetW = floor((cW - nrC_last_row*aW*factor)/2); %compute horizontal offset so that text apears centered
                                ind = messageFile((i-1)*nrC+j);                   %index in messageFile
                                m = alphabet(ind);                                %original matrix represenataion
                                M = ones(aH*factor, aW*factor);                   %M = new (larger) matrix representation of the characters depending on factor
                                for v = 1:factor*aH                               %copy date from m into M (take each value of m factor times in M)
                                    for w = 1:factor*aW
                                        M(v,w) = m(ceil(v/factor), ceil(w/factor));
                                    end
                                end
                                watermark((i-1)*aH*factor+1 + offsetH : i*aH*factor + offsetH, (j-1)*aW*factor+1 + offsetW : j*aW*factor + offsetW) = M; %translate message into character matrices and align
                                workbar((j/nrC_last_row)*0.95 + 0.1);
                            end
                        else                                                      %other rows
                            for j=1:nrC
                                offsetW = floor((cW - nrC*aW*factor)/2);          %compute horizontal offset so that text apears centered
                                ind = messageFile((i-1)*nrC+j);                   %index in messageFile
                                M = ones(aH*factor, aW*factor);                   %original matrix represenataion
                                m = alphabet(ind);                                %M = new (larger) matrix representation of the characters depending on factor
                                for v = 1:factor*aH                               %copy date from m into M (take each value of m factor times in M)
                                    for w = 1:factor*aW
                                        M(v,w) = m(ceil(v/factor), ceil(w/factor));
                                    end
                                end
                                watermark((i-1)*aH*factor+1 + offsetH : i*aH*factor + offsetH, (j-1)*aW*factor+1 + offsetW : j*aW*factor + offsetW) = M; %translate message into character matrices and align
                            end
                            workbar((i/nrR_needed)*0.85+0.1);
                        end
                    end
                    watermark = cat(3, watermark, watermark, watermark);          %make sure watermark consists of 3 layers
                    set(handles.titleWMPreview, 'Visible', 'on');                 %show title watermark preview
                    set(handles.WMPreview, 'Visible', 'on');                      %show axes watermark preview
                    axes(handles.WMPreview);                                      %set WMPreview axes as active
                    workbar(0.97);
                    image(watermark);                                             %show message
                    axis equal;                                                   %sets the aspect ratio. (Show the image in its right ratio)
                    axis tight;                                                   %Sets the axis limits to the arrange of the data.
                    axis off;                                                     %Turn off all axis labeling
                    workbar(1.0);
                    set(handles.computingWMPreview, 'Visible', 'off');            %hide info message 'computing'
                    msgbox('Message too long for cover work. Only a part of it will be embedded...', 'Warning', 'info');
                end
                set_root_data(handles, 'embedded_message', messageFile);

            otherwise
                msgbox('Error', 'Error', 'error');
        end
    otherwise
        switch type
            case 'imag'                                                            %message is an image file
                workbar(0.1,  'Computing watermark', 'Computing watermark');
                [cH cW cD] = size(cover);                                             %get size of cover work
                set(handles.computingWMPreview, 'Visible', 'on');                     %show info message 'computing'
                [H W D] = size(messageFile);                                          %get size of messageFile
                blocksize = floor(get(handles.blocksizeSlider, 'Value'));
                set_root_data(handles, 'blocksize_attack', blocksize);
                factor = 1;
                while(H*blocksize*factor < cH && W*blocksize*factor < cW)                             %one pixel of messageFile will be converted to 4 pixels in a sqaure, so deteremine max factor so that messageFile still fits in cover work
                    factor = factor + 1;
                end
                if (factor > 1)
                    factor = factor - 1;                                            %compensate for last +1
                end
                set_root_data(handles, 'factor_attack', factor);
                messageFile = im2bw(messageFile);                                     %convert imageFile to binary image
                watermark = ones(cH, cW);                                             %create empty watermark (ones because 1 = white)
                if (floor((cH - H*blocksize*factor)/2) >= 1)
                    offsetH = floor((cH - H*blocksize*factor)/2);                                %compute vertical offset to assure center align vertically
                else
                    offsetH = 0;
                end
                if(floor((cW - W*blocksize*factor)/2) >= 1)
                    offsetW = floor((cW - W*blocksize*factor)/2);                       %compute horizontal offset so that text apears centered
                else
                    offsetW = 0;
                end
                M_0 = zeros(blocksize*factor);
                M_1 = ones(blocksize*factor);
                if(resize == 1.0 && ((H*blocksize*factor > cH) || (W*blocksize*factor > cW)))
                    messageFile = imresize(messageFile, [floor(cH/(blocksize*factor)) cW/(blocksize*factor)]);
                    [H W D] = size(messageFile);
                end
                if(H*blocksize*factor >= cH)
                    a = floor(cH/(blocksize*factor));
                else
                    if(H < cH/(blocksize*factor))
                        a = H;
                    else
                        a = ceil(H/(blocksize*factor));
                    end
                end
                if(W*blocksize*factor >= cW)
                    b = floor(cW/(blocksize*factor));
                else
                    if(W < cW/(blocksize*factor))
                        b = W;
                    else
                        b = ceil(W/(blocksize*factor));
                    end
                end
                set_root_data(handles, 'embedded_message_attack', messageFile(1:a,1:b));
                for i=1:a
                    for j=1:b
                        ind = messageFile(i,j);                                     %index in messageFile
                        if(ind == 1)
                            M = M_1;
                        else
                            M = M_0;
                        end
                        watermark((i-1)*blocksize*factor+1 + offsetH : i*blocksize*factor + offsetH, (j-1)*blocksize*factor+1 + offsetW : j*blocksize*factor + offsetW) = M; %translate message into character matrices and align
                    end
                    workbar((i/a)*0.85+0.1);
                end

                watermark = cat(3, watermark, watermark, watermark);          %make sure watermark consists of 3 layers
                axes(handles.WMPreview);                                      %set WMPreview axes as active
                workbar(0.97);
                image(watermark);                                             %show message
                axis equal;                                                   %sets the aspect ratio. (Show the image in its right ratio)
                axis tight;                                                   %Sets the axis limits to the arrange of the data.
                axis off;                                                     %Turn off all axis labeling
                set(handles.computingWMPreview, 'Visible', 'off');            %hide info message 'computing'
                workbar(1.0);


            case 'text'                                                               %message source file is a text file
                set(handles.computingWMPreview, 'Visible', 'on');                     %show info message 'computing'
                [aH aW aD] = size(alphabet('a'));                                     %determine size of character matrices (all characters should have same size)
                [cH cW cD] = size(cover);                                             %get size of cover work
                L = length(messageFile);                                              %determine length of messageFile
                areaC = cH*cW;                                                        %determine area of cover work
                factor = 1;                                                           %initialis factor to 1
                nrR = floor(cH/(factor*aH));                                          %nr of rows possible = floor(cH,aH))
                nrC = floor(cW/(factor*aW));                                          %nr of colums possible: floor(cW/aW) = nr of characters that fits in 1 row of the cover work
                nrR_needed = ceil(L/nrC);                                             %ceil(L/nrC)) = nr of rows needed
                if(nrR >= nrR_needed && cW >= aW*nrC)                                 %if cover work is big enough for message (message is max when factor is one)
                    n = mod(L,nrC);                                                       %use n so we can set n to nrC when mod() is zero
                    if(n==0)
                        n = nrC;
                    end
                    nrC_last_row = n;                                                     %nr of colums for last row
                    while(nrR >= nrR_needed) %cH >= factor*aH && cW >= factor*aW && nrR >= nrR_needed )      %as long as cover work is large enough, higher factor with one
                        factor = factor + 1;                                              %recompute nrR, ...
                        nrR = floor(cH/(factor*aH));                                      %nr of rows possible = floor(cH,aH))
                        nrC = floor(cW/(factor*aW));                                      %nr of colums possible: floor(cW/aW) = nr of characters that fits in 1 row of the cover work
                        nrR_needed = ceil(L/nrC);                                         %ceil(L/nrC)) = nr of rows needed
                        n = mod(L,nrC);                                                   %use n so we can set n to nrC when mod() is zero
                        if(n==0)
                            n = nrC;
                        end
                        nrC_last_row = n;                                                 %nr of colums for last row
                    end
                    factor = factor - 1;                                                  %factor is now 1 too high, so do minus 1 and recompute nrR,..
                    nrR = floor(cH/(factor*aH));                                          %nr of rows possible = floor(cH,aH))
                    nrC = floor(cW/(factor*aW));                                          %nr of colums possible: floor(cW/aW) = nr of characters that fits in 1 row of the cover work
                    nrR_needed = ceil(L/nrC);                                             %ceil(L/nrC)) = nr of rows needed
                    n = mod(L,nrC);                                                       %use n so we can set n to nrC when mod() is zero
                    if(n==0)
                        n = nrC;
                    end
                    nrC_last_row = n;                                                     %nr of colums for last row
                    watermark = ones(cH, cW);                                     %create empty watermark (ones because 1 = white)
                    offsetH = floor((cH - nrR_needed*aH*factor)/2);               %compute vertical offset to assure center align vertically
                    for i=1:nrR_needed
                        if (i == nrR_needed)                                      %last row
                            workbar(0.85+0.1);
                            for j=1:nrC_last_row
                                offsetW = floor((cW - nrC_last_row*aW*factor)/2); %compute horizontal offset so that text apears centered
                                ind = messageFile((i-1)*nrC+j);                   %index in messageFile
                                m = alphabet(ind);                                %original matrix represenataion
                                M = ones(aH*factor, aW*factor);                   %M = new (larger) matrix representation of the characters depending on factor
                                for v = 1:factor*aH                               %copy date from m into M (take each value of m factor times in M)
                                    for w = 1:factor*aW
                                        M(v,w) = m(ceil(v/factor), ceil(w/factor));
                                    end
                                end
                                watermark((i-1)*aH*factor+1 + offsetH : i*aH*factor + offsetH, (j-1)*aW*factor+1 + offsetW : j*aW*factor + offsetW) = M; %translate message into character matrices and align
                                workbar((j/nrC_last_row)*0.95 + 0.1);
                            end
                        else                                                      %other rows
                            for j=1:nrC
                                offsetW = floor((cW - nrC*aW*factor)/2);          %compute horizontal offset so that text apears centered
                                ind = messageFile((i-1)*nrC+j);                   %index in messageFile
                                M = ones(aH*factor, aW*factor);                   %original matrix represenataion
                                m = alphabet(ind);                                %M = new (larger) matrix representation of the characters depending on factor
                                for v = 1:factor*aH                               %copy date from m into M (take each value of m factor times in M)
                                    for w = 1:factor*aW
                                        M(v,w) = m(ceil(v/factor), ceil(w/factor));
                                    end
                                end
                                watermark((i-1)*aH*factor+1 + offsetH : i*aH*factor + offsetH, (j-1)*aW*factor+1 + offsetW : j*aW*factor + offsetW) = M; %translate message into character matrices and align
                            end
                            workbar((i/nrR_needed)*0.85+0.1);
                        end
                    end
                    watermark = cat(3, watermark, watermark, watermark);          %make sure watermark consists of 3 layers
                    set(handles.WMPreview, 'Visible', 'on');                      %show axes watermark preview
                    axes(handles.WMPreview);                                      %set WMPreview axes as active
                    workbar(0.97);
                    image(watermark);                                             %show message
                    axis equal;                                                   %sets the aspect ratio. (Show the image in its right ratio)
                    axis tight;                                                   %Sets the axis limits to the arrange of the data.
                    axis off;                                                     %Turn off all axis labeling
                    workbar(1.0);
                    set(handles.computingWMPreview, 'Visible', 'off');            %hide info message 'computing'
                else
                    %make message shorter so it does fit in the cover work
                    while(nrR < nrR_needed || cW < aW*nrC)
                        L = L - 1;
                        nrR = floor(cH/(factor*aH));                                          %nr of rows possible = floor(cH,aH))
                        nrC = floor(cW/(factor*aW));                                          %nr of colums possible: floor(cW/aW) = nr of characters that fits in 1 row of the cover work
                        nrR_needed = ceil(L/nrC);                                             %ceil(L/nrC)) = nr of rows needed
                    end
                    messageFile = substring(messageFile, 0, L);
                    n = mod(L,nrC);                                                       %use n so we can set n to nrC when mod() is zero
                    if(n==0)
                        n = nrC;
                    end
                    nrC_last_row = n;                                                     %nr of colums for last row
                    while(nrR >= nrR_needed) %cH >= factor*aH && cW >= factor*aW && nrR >= nrR_needed )      %as long as cover work is large enough, higher factor with one
                        factor = factor + 1;                                              %recompute nrR, ...
                        nrR = floor(cH/(factor*aH));                                      %nr of rows possible = floor(cH,aH))
                        nrC = floor(cW/(factor*aW));                                      %nr of colums possible: floor(cW/aW) = nr of characters that fits in 1 row of the cover work
                        nrR_needed = ceil(L/nrC);                                         %ceil(L/nrC)) = nr of rows needed
                        n = mod(L,nrC);                                                   %use n so we can set n to nrC when mod() is zero
                        if(n==0)
                            n = nrC;
                        end
                        nrC_last_row = n;                                                 %nr of colums for last row
                    end
                    factor = factor - 1;                                                  %factor is now 1 too high, so do minus 1 and recompute nrR,..
                    nrR = floor(cH/(factor*aH));                                          %nr of rows possible = floor(cH,aH))
                    nrC = floor(cW/(factor*aW));                                          %nr of colums possible: floor(cW/aW) = nr of characters that fits in 1 row of the cover work
                    nrR_needed = ceil(L/nrC);                                             %ceil(L/nrC)) = nr of rows needed
                    n = mod(L,nrC);                                                       %use n so we can set n to nrC when mod() is zero
                    if(n==0)
                        n = nrC;
                    end
                    nrC_last_row = n;                                                     %nr of colums for last row
                    watermark = ones(cH, cW);                                     %create empty watermark (ones because 1 = white)
                    offsetH = floor((cH - nrR_needed*aH*factor)/2);               %compute vertical offset to assure center align vertically
                    for i=1:nrR_needed
                        if (i == nrR_needed)                                      %last row
                            workbar(0.85+0.1);
                            for j=1:nrC_last_row
                                offsetW = floor((cW - nrC_last_row*aW*factor)/2); %compute horizontal offset so that text apears centered
                                ind = messageFile((i-1)*nrC+j);                   %index in messageFile
                                m = alphabet(ind);                                %original matrix represenataion
                                M = ones(aH*factor, aW*factor);                   %M = new (larger) matrix representation of the characters depending on factor
                                for v = 1:factor*aH                               %copy date from m into M (take each value of m factor times in M)
                                    for w = 1:factor*aW
                                        M(v,w) = m(ceil(v/factor), ceil(w/factor));
                                    end
                                end
                                watermark((i-1)*aH*factor+1 + offsetH : i*aH*factor + offsetH, (j-1)*aW*factor+1 + offsetW : j*aW*factor + offsetW) = M; %translate message into character matrices and align
                                workbar((j/nrC_last_row)*0.95 + 0.1);
                            end
                        else                                                      %other rows
                            for j=1:nrC
                                offsetW = floor((cW - nrC*aW*factor)/2);          %compute horizontal offset so that text apears centered
                                ind = messageFile((i-1)*nrC+j);                   %index in messageFile
                                M = ones(aH*factor, aW*factor);                   %original matrix represenataion
                                m = alphabet(ind);                                %M = new (larger) matrix representation of the characters depending on factor
                                for v = 1:factor*aH                               %copy date from m into M (take each value of m factor times in M)
                                    for w = 1:factor*aW
                                        M(v,w) = m(ceil(v/factor), ceil(w/factor));
                                    end
                                end
                                watermark((i-1)*aH*factor+1 + offsetH : i*aH*factor + offsetH, (j-1)*aW*factor+1 + offsetW : j*aW*factor + offsetW) = M; %translate message into character matrices and align
                            end
                            workbar((i/nrR_needed)*0.85+0.1);
                        end
                    end
                    watermark = cat(3, watermark, watermark, watermark);          %make sure watermark consists of 3 layers
                    set(handles.titleWMPreview, 'Visible', 'on');                 %show title watermark preview
                    set(handles.WMPreview, 'Visible', 'on');                      %show axes watermark preview
                    axes(handles.WMPreview);                                      %set WMPreview axes as active
                    workbar(0.97);
                    image(watermark);                                             %show message
                    axis equal;                                                   %sets the aspect ratio. (Show the image in its right ratio)
                    axis tight;                                                   %Sets the axis limits to the arrange of the data.
                    axis off;                                                     %Turn off all axis labeling
                    workbar(1.0);
                    set(handles.computingWMPreview, 'Visible', 'off');            %hide info message 'computing'
                    msgbox('Message too long for cover work. Only a part of it will be embedded...', 'Warning', 'info');
                end
                set_root_data(handles, 'embedded_message_attack', messageFile);

            otherwise
                msgbox('Error', 'Error', 'error');
        end
end
