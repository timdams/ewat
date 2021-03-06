%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %  
%                           Hogeschool Antwerpen                          %
%                IndustriŽle Wetenschappen: Elektronica-ICT               %
%                      MultiMediaGroep - Watermarking                     %
%                                                                         %
%                                                                         %
%                             Masterthesis 4.2                            %
%                                Kevin Heylen                             %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%hue_attack: changes the hue component of the image
%@image: image of which luminance will be changed
%@setting: amount of change

function im_adjusted = hue_attack(image, setting)
try
    [H W D] = size(image);                                                 %determine siz of image
    if D==3.0
            image = (rgb2hsv(image));
            new_layer = zeros(H,W);
            for i = 1:H
                for j = 1:W
                    if image(i,j,1)+setting/100 > 1
                        new_layer(i,j) = image(i,j,1)+setting/100 - 1;
                    else
                        new_layer(i,j) = image(i,j,1)+setting/100;
                    end
                end
            end
            im_adjusted_hsv = cat(3,new_layer,image(:,:,2),image(:,:,3));                                    %apply change
            im_adjusted = hsv2rgb(im_adjusted_hsv);
    else
            im_adjusted = image+2.55*setting;
    end               
catch
    im_adjusted = image;
end