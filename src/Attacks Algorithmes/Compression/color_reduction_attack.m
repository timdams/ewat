%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%                           Hogeschool Antwerpen                          %
%                Industri�le Wetenschappen: Elektronica-ICT               %
%                      MultiMediaGroep - Watermarking                     %
%                                                                         %
%                                                                         %
%                             Masterthesis 4.2                            %
%                               Kevin Heylen                              %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%jpeg: applies jpeg compression to the passed image
%@im: RGB image (format uint8, 0..255) to compress
%@Q_factor: scaling factor for quantizer
%�im_compr: compressed RGB image (format YCbCr uint8, 0..255)

function im_reduction = color_reduction_attack(im, Q_factor)

try
    [H W D] = size(im);

    if D == 3.0
        [im_reduction_X im_reduction_map] = rgb2ind(im,Q_factor);
        im_reduction = ind2rgb(im_reduction_X, im_reduction_map);
    else
        empty_layer = zeros(H,W);
        layered = cat(3,im(:,:,1),empty_layer,empty_layer);
        [im_reduction_X im_reduction_map] = rgb2ind(layered,Q_factor);
        im_reduction_rgb = ind2rgb(im_reduction_X, im_reduction_map);
        im_reduction = im_reduction_rgb(:,:,1);
    end
catch
    im_reduction = im;
end
    