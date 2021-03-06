function update_histogram_watermarked_embed(handles)

        set(handles.togglebutton_image_watermarked_embed,'Enable','on');
                
        set(handles.togglebutton_histogram_watermarked_embed,'Enable','off');
        set(handles.togglebutton_histogram_watermarked_embed,'Value',1);
        
        set(handles.togglebutton_fullcolor_watermarked_embed,'Enable','on');
        set(handles.togglebutton_fullcolor_watermarked_embed,'Value',0);
        
        set(handles.togglebutton_dct_watermarked_embed,'Enable','on');
        set(handles.togglebutton_dct_watermarked_embed,'Value',0);
        
        set(handles.togglebutton_dwt_watermarked_embed,'Enable','on');    
        set(handles.togglebutton_dwt_watermarked_embed,'Value',0);
        
        set(handles.radiobutton_icon_ycbcr_watermarked_embed,'Visible','off');
        set(handles.radiobutton_layer_y_watermarked_embed,'Visible','off');
        set(handles.radiobutton_layer_cb_watermarked_embed,'Visible','off');
        set(handles.radiobutton_layer_cr_watermarked_embed,'Visible','off');
        
        set(handles.radiobutton_icon_rgb_watermarked_embed,'Visible','off');
        set(handles.radiobutton_layer_red_watermarked_embed,'Visible','off');
        set(handles.radiobutton_layer_green_watermarked_embed,'Visible','off');
        set(handles.radiobutton_layer_blue_watermarked_embed,'Visible','off');
        
        selected_image = check_selected_component_watermarked_embed(handles);
        
        image_type = get_root_data('image_type');
        
        image_rgb = get_root_data('watermarked_embed_plot_rgb');
        
        switch image_type
            case 'grayscale'
                image_gray = get_root_data('watermarked_embed_plot_grayscale');
                
                set(handles.label_image_watermarked_embed,'String','Histogram');
                
                set_root_data(handles,'watermarked_embed_histogram_grayscale', image_gray);
            case 'layered'
                switch selected_image
                    case 'ycbcr'
                         set(handles.label_image_watermarked_embed,'String','YCbCr Histogram ');
                         
                         set(handles.label_icon_ycbcr_watermarked_embed,'String','YCbCr Histogram ');
                         set(handles.label_icon_rgb_watermarked_embed,'String','RGB Histogram ');
                                                  
                         set(handles.label_layer_y_watermarked_embed,'String','Y Histogram ');
                         set(handles.label_layer_cb_watermarked_embed,'String','Cb Histogram ');
                         set(handles.label_layer_cr_watermarked_embed,'String','Cr Histogram ');
                         
                         set(handles.label_layer_red_watermarked_embed,'String','Red Histogram ');
                         set(handles.label_layer_green_watermarked_embed,'String','Green Histogram ');
                         set(handles.label_layer_blue_watermarked_embed,'String','Blue Histogram ');
                         
                         set_root_data(handles,'watermarked_embed_histogram_ycbcr', image_rgb);
                         set_root_data(handles,'watermarked_embed_histogram_icon_ycbcr', image_rgb);
                         set_root_data(handles,'watermarked_embed_histogram_y', image_rgb);
                         set_root_data(handles,'watermarked_embed_histogram_cb', image_rgb);
                         set_root_data(handles,'watermarked_embed_histogram_cr',image_rgb);
                         set_root_data(handles,'watermarked_embed_histogram_icon_rgb', image_rgb);
                         set_root_data(handles,'watermarked_embed_histogram_red', image_rgb);
                         set_root_data(handles,'watermarked_embed_histogram_green', image_rgb);
                         set_root_data(handles,'watermarked_embed_histogram_blue', image_rgb);
                         
                    case 'rgb'
                        set(handles.label_image_watermarked_embed,'String','RGB Histogram ');
                        
                        set(handles.label_icon_ycbcr_watermarked_embed,'String','YCbCr Histogram ');
                        set(handles.label_icon_rgb_watermarked_embed,'String','RGB Histogram ');
                        
                        set(handles.label_layer_y_watermarked_embed,'String','Y Histogram ');
                        set(handles.label_layer_cb_watermarked_embed,'String','Cb Histogram ');
                        set(handles.label_layer_cr_watermarked_embed,'String','Cr Histogram ');
                         
                        set(handles.label_layer_red_watermarked_embed,'String','Red Histogram ');
                        set(handles.label_layer_green_watermarked_embed,'String','Green Histogram ');
                        set(handles.label_layer_blue_watermarked_embed,'String','Blue Histogram '); 
                        
                        set_root_data(handles,'watermarked_embed_histogram_rgb', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_icon_ycbcr', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_y', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_cb', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_cr',image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_icon_rgb', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_red', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_green', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_blue', image_rgb);
                    case 'y'
                        set(handles.label_image_watermarked_embed,'String','Y Histogram ');
                        
                        set(handles.label_icon_ycbcr_watermarked_embed,'String','YCbCr Histogram ');
                        set(handles.label_icon_rgb_watermarked_embed,'String','RGB Histogram ');
                        
                        set(handles.label_layer_y_watermarked_embed,'String','Y Histogram ');
                        set(handles.label_layer_cb_watermarked_embed,'String','Cb Histogram ');
                        set(handles.label_layer_cr_watermarked_embed,'String','Cr Histogram ');
                         
                        set(handles.label_layer_red_watermarked_embed,'String','Red Histogram ');
                        set(handles.label_layer_green_watermarked_embed,'String','Green Histogram ');
                        set(handles.label_layer_blue_watermarked_embed,'String','Blue Histogram '); 
                        
                        
                        set(handles.label_image_watermarked_embed,'String','Y Histogram ');
                         
                        set(handles.tab_layers_rgb_watermarked_embed,'Visible','off');
                        set(handles.tab_layers_ycbcr_watermarked_embed,'Visible','off');
                        set(handles.tab_image_watermarked_embed,'Visible','on');
                        
                        set(handles.togglebutton_image_watermarked_embed,'Value',1);
                        set(handles.togglebutton_layers_watermarked_embed,'Value',0);
                        
                        set(handles.togglebutton_image_watermarked_embed,'Enable','off');
                        set(handles.togglebutton_layers_watermarked_embed,'Enable','on');
                        
                        [histogram_y,nvt1,nvt2] = histogram(image_rgb,'ycbcr');
                        axes(handles.axes_image_watermarked_embed);
                        stem(histogram_y,'.k','Markersize',1);
                        axis off;
                        
                        set_root_data(handles,'watermarked_embed_histogram_icon_ycbcr', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_y', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_cb', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_cr',image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_icon_rgb', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_red', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_green', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_blue', image_rgb);
                        
                    case 'cb'
                        set(handles.label_image_watermarked_embed,'String','Cb Histogram ');
                        
                        set(handles.label_icon_ycbcr_watermarked_embed,'String','YCbCr Histogram ');
                        set(handles.label_icon_rgb_watermarked_embed,'String','RGB Histogram ');
                        
                        set(handles.label_layer_y_watermarked_embed,'String','Y Histogram ');
                        set(handles.label_layer_cb_watermarked_embed,'String','Cb Histogram ');
                        set(handles.label_layer_cr_watermarked_embed,'String','Cr Histogram ');
                         
                        set(handles.label_layer_red_watermarked_embed,'String','Red Histogram ');
                        set(handles.label_layer_green_watermarked_embed,'String','Green Histogram ');
                        set(handles.label_layer_blue_watermarked_embed,'String','Blue Histogram '); 
                        
                        
                        set(handles.label_image_watermarked_embed,'String','Cb Histogram ');
                        
                        set(handles.tab_layers_rgb_watermarked_embed,'Visible','off');
                        set(handles.tab_layers_ycbcr_watermarked_embed,'Visible','off');
                        set(handles.tab_image_watermarked_embed,'Visible','on');
                        
                        set(handles.togglebutton_image_watermarked_embed,'Value',1);
                        set(handles.togglebutton_layers_watermarked_embed,'Value',0);
                        
                        set(handles.togglebutton_image_watermarked_embed,'Enable','off');
                        set(handles.togglebutton_layers_watermarked_embed,'Enable','on');
                        
                        [nvt1,histogram_cb,nvt2] = histogram(image_rgb,'ycbcr');
                        axes(handles.axes_image_watermarked_embed);
                        stem(histogram_cb,'.c','Markersize',1);
                        axis off;
                        
                        set_root_data(handles,'watermarked_embed_histogram_icon_ycbcr', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_y', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_cb', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_cr',image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_icon_rgb', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_red', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_green', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_blue', image_rgb);
                    case 'cr'
                        set(handles.label_image_watermarked_embed,'String','Cr Histogram ');
                        
                        set(handles.label_icon_ycbcr_watermarked_embed,'String','YCbCr Histogram ');
                        set(handles.label_icon_rgb_watermarked_embed,'String','RGB Histogram ');
                        
                        set(handles.label_layer_y_watermarked_embed,'String','Y Histogram ');
                        set(handles.label_layer_cb_watermarked_embed,'String','Cb Histogram ');
                        set(handles.label_layer_cr_watermarked_embed,'String','Cr Histogram ');
                         
                        set(handles.label_layer_red_watermarked_embed,'String','Red Histogram ');
                        set(handles.label_layer_green_watermarked_embed,'String','Green Histogram ');
                        set(handles.label_layer_blue_watermarked_embed,'String','Blue Histogram '); 
                        
                        
                        set(handles.tab_layers_rgb_watermarked_embed,'Visible','off');
                        set(handles.tab_layers_ycbcr_watermarked_embed,'Visible','off');
                        set(handles.tab_image_watermarked_embed,'Visible','on');
                        
                        set(handles.togglebutton_image_watermarked_embed,'Value',1);
                        set(handles.togglebutton_layers_watermarked_embed,'Value',0);
                        
                        set(handles.togglebutton_image_watermarked_embed,'Enable','off');
                        set(handles.togglebutton_layers_watermarked_embed,'Enable','on');
                        
                        [nvt1,nvt2,histogram_cr] = histogram(image_rgb,'ycbcr');
                        axes(handles.axes_image_watermarked_embed);
                        stem(histogram_cr,'.m','Markersize',1);
                        axis off;  
                        
                        set_root_data(handles,'watermarked_embed_histogram_icon_ycbcr', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_y', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_cb', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_cr',image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_icon_rgb', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_red', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_green', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_blue', image_rgb);
                    case 'red'
                        set(handles.label_image_watermarked_embed,'String','Red Histogram ');
                        
                        set(handles.label_icon_ycbcr_watermarked_embed,'String','YCbCr Histogram ');
                        set(handles.label_icon_rgb_watermarked_embed,'String','RGB Histogram ');
                        
                        set(handles.label_layer_y_watermarked_embed,'String','Y Histogram ');
                        set(handles.label_layer_cb_watermarked_embed,'String','Cb Histogram ');
                        set(handles.label_layer_cr_watermarked_embed,'String','Cr Histogram ');
                         
                        set(handles.label_layer_red_watermarked_embed,'String','Red Histogram ');
                        set(handles.label_layer_green_watermarked_embed,'String','Green Histogram ');
                        set(handles.label_layer_blue_watermarked_embed,'String','Blue Histogram '); 
                        
                        
                        set(handles.tab_layers_rgb_watermarked_embed,'Visible','off');
                        set(handles.tab_layers_ycbcr_watermarked_embed,'Visible','off');
                        set(handles.tab_image_watermarked_embed,'Visible','on');
                        
                        set(handles.togglebutton_image_watermarked_embed,'Value',1);
                        set(handles.togglebutton_layers_watermarked_embed,'Value',0);
                        
                        set(handles.togglebutton_image_watermarked_embed,'Enable','off');
                        set(handles.togglebutton_layers_watermarked_embed,'Enable','on');
                       
                        [histogram_red,nvt1,nvt2] = histogram(image_rgb,'rgb');
                        axes(handles.axes_image_watermarked_embed);
                        stem(histogram_red,'.r','Markersize',1);
                        axis off;
                        
                        set_root_data(handles,'watermarked_embed_histogram_icon_ycbcr', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_y', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_cb', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_cr',image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_icon_rgb', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_red', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_green', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_blue', image_rgb);
                    case 'green'
                        set(handles.label_image_watermarked_embed,'String','Green Histogram ');
                        
                        set(handles.label_icon_ycbcr_watermarked_embed,'String','YCbCr Histogram ');
                        set(handles.label_icon_rgb_watermarked_embed,'String','RGB Histogram ');
                        
                        set(handles.label_layer_y_watermarked_embed,'String','Y Histogram ');
                        set(handles.label_layer_cb_watermarked_embed,'String','Cb Histogram ');
                        set(handles.label_layer_cr_watermarked_embed,'String','Cr Histogram ');
                         
                        set(handles.label_layer_red_watermarked_embed,'String','Red Histogram ');
                        set(handles.label_layer_green_watermarked_embed,'String','Green Histogram ');
                        set(handles.label_layer_blue_watermarked_embed,'String','Blue Histogram '); 
                        
                        
                        set(handles.tab_layers_rgb_watermarked_embed,'Visible','off');
                        set(handles.tab_layers_ycbcr_watermarked_embed,'Visible','off');
                        set(handles.tab_image_watermarked_embed,'Visible','on');
                        
                        set(handles.togglebutton_image_watermarked_embed,'Value',1);
                        set(handles.togglebutton_layers_watermarked_embed,'Value',0);
                        
                        set(handles.togglebutton_image_watermarked_embed,'Enable','off');
                        set(handles.togglebutton_layers_watermarked_embed,'Enable','on');
                                               
                        [nvt1,histogram_green,nvt2] = histogram(image_rgb,'rgb');
                        axes(handles.axes_image_watermarked_embed);
                        stem(histogram_green,'.g','Markersize',1);
                        axis off;
                        
                        set_root_data(handles,'watermarked_embed_histogram_icon_ycbcr', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_y', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_cb', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_cr',image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_icon_rgb', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_red', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_green', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_blue', image_rgb);
                    case 'blue'
                        set(handles.label_image_watermarked_embed,'String','Blue Histogram ');
                        
                        set(handles.label_icon_ycbcr_watermarked_embed,'String','YCbCr Histogram ');
                        set(handles.label_icon_rgb_watermarked_embed,'String','RGB Histogram ');
                        
                        set(handles.label_layer_y_watermarked_embed,'String','Y Histogram ');
                        set(handles.label_layer_cb_watermarked_embed,'String','Cb Histogram ');
                        set(handles.label_layer_cr_watermarked_embed,'String','Cr Histogram ');
                         
                        set(handles.label_layer_red_watermarked_embed,'String','Red Histogram ');
                        set(handles.label_layer_green_watermarked_embed,'String','Green Histogram ');
                        set(handles.label_layer_blue_watermarked_embed,'String','Blue Histogram '); 
                        
                        
                        set(handles.tab_layers_rgb_watermarked_embed,'Visible','off');
                        set(handles.tab_layers_ycbcr_watermarked_embed,'Visible','off');
                        set(handles.tab_image_watermarked_embed,'Visible','on');
                        
                        set(handles.togglebutton_image_watermarked_embed,'Value',1);
                        set(handles.togglebutton_layers_watermarked_embed,'Value',0);
                        
                        set(handles.togglebutton_image_watermarked_embed,'Enable','off');
                        set(handles.togglebutton_layers_watermarked_embed,'Enable','on');
                                               
                        [nvt1,nvt2,histogram_blue] = histogram(image_rgb,'rgb');
                        axes(handles.axes_image_watermarked_embed);
                        stem(histogram_blue,'.b','Markersize',1);
                        axis off;  
                        
                        set_root_data(handles,'watermarked_embed_histogram_icon_ycbcr', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_y', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_cb', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_cr',image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_icon_rgb', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_red', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_green', image_rgb);
                        set_root_data(handles,'watermarked_embed_histogram_blue', image_rgb);
                end;
        end
                        

                 
