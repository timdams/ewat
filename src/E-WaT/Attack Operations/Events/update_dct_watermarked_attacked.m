function update_dct_watermarked_attacked(handles)

        set(handles.radiobutton_icon_ycbcr_watermarked_attacked,'Visible','off');
        set(handles.radiobutton_layer_y_watermarked_attacked,'Visible','off');
        set(handles.radiobutton_layer_cb_watermarked_attacked,'Visible','off');
        set(handles.radiobutton_layer_cr_watermarked_attacked,'Visible','off');
        
        set(handles.radiobutton_icon_rgb_watermarked_attacked,'Visible','off');
        set(handles.radiobutton_layer_red_watermarked_attacked,'Visible','off');
        set(handles.radiobutton_layer_green_watermarked_attacked,'Visible','off');
        set(handles.radiobutton_layer_blue_watermarked_attacked,'Visible','off');
        
        set(handles.togglebutton_dct_watermarked_attacked,'Enable','off');
        set(handles.togglebutton_dct_watermarked_attacked,'Value',1);
       
         set(handles.togglebutton_histogram_watermarked_attacked,'Enable','on');
         set(handles.togglebutton_histogram_watermarked_attacked,'Value',0);

         set(handles.togglebutton_fullcolor_watermarked_attacked,'Enable','on');
         set(handles.togglebutton_fullcolor_watermarked_attacked,'Value',0);

         set(handles.togglebutton_dwt_watermarked_attacked,'Enable','on');
         set(handles.togglebutton_dwt_watermarked_attacked,'Value',0);
         
         image_type = get_root_data('image_type');
         selected_image = check_selected_component_watermarked_attacked(handles);
         
         plot = get_root_data('watermarked_attacked_plot_rgb');
         
         blocksize = 8;
        switch image_type
            case 'grayscale'
                image_gray = get_root_data('watermarked_attacked_dct_grayscale');
                
                set(handles.label_image_watermarked_attacked,'String','DCT');
                
                axes(handles.axes_image_watermarked_attacked);
                imshow(image_gray);
                colormap pink;
            case 'layered'
                switch selected_image
                    case 'ycbcr' 
                        set(handles.label_icon_ycbcr_watermarked_attacked,'String','Icon Image');
                        set(handles.label_icon_rgb_watermarked_attacked,'String','Icon Image');
                                                  
                        set(handles.label_layer_y_watermarked_attacked,'String','Y DCT ');
                        set(handles.label_layer_cb_watermarked_attacked,'String','Cb DCT ');
                        set(handles.label_layer_cr_watermarked_attacked,'String','Cr DCT ');
                         
                        set(handles.label_layer_red_watermarked_attacked,'String','Red DCT ');
                        set(handles.label_layer_green_watermarked_attacked,'String','Green DCT ');
                        set(handles.label_layer_blue_watermarked_attacked,'String','Blue DCT ');
                        
                        set(handles.togglebutton_image_watermarked_attacked,'Value',0);
                        set(handles.togglebutton_image_watermarked_attacked,'Enable','off');
                
                        set(handles.togglebutton_layers_watermarked_attacked,'Value',1);
                        set(handles.togglebutton_layers_watermarked_attacked,'Enable','off');
                        
                        set(handles.tab_layers_rgb_watermarked_attacked,'Visible','off');
                        set(handles.tab_layers_ycbcr_watermarked_attacked,'Visible','on');
                        set(handles.tab_image_watermarked_attacked,'Visible','off');
                        
                        y = get_root_data('watermarked_attacked_dct_y');
                        cb = get_root_data('watermarked_attacked_dct_cb');
                        cr = get_root_data('watermarked_attacked_dct_cr');
                        
                        red = get_root_data('watermarked_attacked_dct_red');
                        green = get_root_data('watermarked_attacked_dct_green');
                        blue = get_root_data('watermarked_attacked_dct_blue');
                        
                        axes(handles.axes_icon_rgb_watermarked_attacked);
                        imshow(plot);
                        axis off;
                        
                        axes(handles.axes_layer_red_watermarked_attacked);
                        imshow(red);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_green_watermarked_attacked);
                        imshow(green);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_blue_watermarked_attacked);
                        imshow(blue);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_icon_ycbcr_watermarked_attacked);
                        imshow(plot);
                        axis off;
                        
                        axes(handles.axes_layer_y_watermarked_attacked);
                        imshow(y);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_cb_watermarked_attacked);
                        imshow(cb);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_cr_watermarked_attacked);
                        imshow(cr);
                        colormap pink;
                        axis off;
                        
                    case 'rgb'
                        set(handles.label_icon_ycbcr_watermarked_attacked,'String','Icon Image');
                        set(handles.label_icon_rgb_watermarked_attacked,'String','Icon Image');
                                                  
                        set(handles.label_layer_y_watermarked_attacked,'String','Y DCT ');
                        set(handles.label_layer_cb_watermarked_attacked,'String','Cb DCT ');
                        set(handles.label_layer_cr_watermarked_attacked,'String','Cr DCT ');
                         
                        set(handles.label_layer_red_watermarked_attacked,'String','Red DCT ');
                        set(handles.label_layer_green_watermarked_attacked,'String','Green DCT ');
                        set(handles.label_layer_blue_watermarked_attacked,'String','Blue DCT ');
                        
                        set(handles.togglebutton_image_watermarked_attacked,'Value',0);
                        set(handles.togglebutton_image_watermarked_attacked,'Enable','off');
                
                        set(handles.togglebutton_layers_watermarked_attacked,'Value',1);
                        set(handles.togglebutton_layers_watermarked_attacked,'Enable','off');
                        
                        set(handles.tab_layers_rgb_watermarked_attacked,'Visible','on');
                        set(handles.tab_layers_ycbcr_watermarked_attacked,'Visible','off');
                        set(handles.tab_image_watermarked_attacked,'Visible','off');
                        
                        plot = get_root_data('watermarked_attacked_plot_rgb');
                        
                        red = get_root_data('watermarked_attacked_dct_red');
                        green = get_root_data('watermarked_attacked_dct_green');
                        blue = get_root_data('watermarked_attacked_dct_blue');
                        
                        y = get_root_data('watermarked_attacked_dct_y');
                        cb = get_root_data('watermarked_attacked_dct_cb');
                        cr = get_root_data('watermarked_attacked_dct_cr');
                                                
                        axes(handles.axes_icon_ycbcr_watermarked_attacked);
                        imshow(plot);
                        axis off;
                        
                        axes(handles.axes_layer_y_watermarked_attacked);
                        imshow(y);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_cb_watermarked_attacked);
                        imshow(cb);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_cr_watermarked_attacked);
                        imshow(cr);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_icon_rgb_watermarked_attacked);
                        image(plot);
                        axis off;
                        
                        axes(handles.axes_layer_red_watermarked_attacked);
                        imshow(red);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_green_watermarked_attacked);
                        imshow(green);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_blue_watermarked_attacked);
                        imshow(blue);
                        colormap pink;
                        axis off;
                    case 'y'
                        set(handles.label_image_watermarked_attacked,'String','Y DCT ');
                        
                        set(handles.label_icon_ycbcr_watermarked_attacked,'String','Icon Image');
                        set(handles.label_icon_rgb_watermarked_attacked,'String','Icon Image');
                                                  
                        set(handles.label_layer_y_watermarked_attacked,'String','Y DCT ');
                        set(handles.label_layer_cb_watermarked_attacked,'String','Cb DCT ');
                        set(handles.label_layer_cr_watermarked_attacked,'String','Cr DCT ');
                         
                        set(handles.label_layer_red_watermarked_attacked,'String','Red DCT ');
                        set(handles.label_layer_green_watermarked_attacked,'String','Green DCT ');
                        set(handles.label_layer_blue_watermarked_attacked,'String','Blue DCT ');
                        
                        set(handles.tab_layers_rgb_watermarked_attacked,'Visible','off');
                        set(handles.tab_layers_ycbcr_watermarked_attacked,'Visible','off');
                        set(handles.tab_image_watermarked_attacked,'Visible','on');
                        
                        set(handles.togglebutton_image_watermarked_attacked,'Value',1);
                        set(handles.togglebutton_layers_watermarked_attacked,'Value',0);
                        
                        set(handles.togglebutton_image_watermarked_attacked,'Enable','off');
                        set(handles.togglebutton_layers_watermarked_attacked,'Enable','on');
                        
                        y = get_root_data('watermarked_attacked_dct_y');
                        
                        axes(handles.axes_image_watermarked_attacked);
                        imshow(y);
                        colormap pink;
                        axis off;
                        
                        red = get_root_data('watermarked_attacked_dct_red');
                        green = get_root_data('watermarked_attacked_dct_green');
                        blue = get_root_data('watermarked_attacked_dct_blue');
                        
                        y = get_root_data('watermarked_attacked_dct_y');
                        cb = get_root_data('watermarked_attacked_dct_cb');
                        cr = get_root_data('watermarked_attacked_dct_cr');
                                                
                        axes(handles.axes_icon_ycbcr_watermarked_attacked);
                        imshow(plot);
                        axis off;
                        
                        axes(handles.axes_layer_y_watermarked_attacked);
                        imshow(y);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_cb_watermarked_attacked);
                        imshow(cb);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_cr_watermarked_attacked);
                        imshow(cr);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_icon_rgb_watermarked_attacked);
                        image(plot);
                        axis off;
                        
                        axes(handles.axes_layer_red_watermarked_attacked);
                        imshow(red);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_green_watermarked_attacked);
                        imshow(green);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_blue_watermarked_attacked);
                        imshow(blue);
                        colormap pink;
                        axis off;
                    case 'cb'
                        set(handles.label_image_watermarked_attacked,'String','Cb DCT ');
                        
                        set(handles.label_icon_ycbcr_watermarked_attacked,'String','Icon Image');
                        set(handles.label_icon_rgb_watermarked_attacked,'String','Icon Image');
                                                  
                        set(handles.label_layer_y_watermarked_attacked,'String','Y DCT ');
                        set(handles.label_layer_cb_watermarked_attacked,'String','Cb DCT ');
                        set(handles.label_layer_cr_watermarked_attacked,'String','Cr DCT ');
                         
                        set(handles.label_layer_red_watermarked_attacked,'String','Red DCT ');
                        set(handles.label_layer_green_watermarked_attacked,'String','Green DCT ');
                        set(handles.label_layer_blue_watermarked_attacked,'String','Blue DCT ');
                        
                        set(handles.tab_layers_rgb_watermarked_attacked,'Visible','off');
                        set(handles.tab_layers_ycbcr_watermarked_attacked,'Visible','off');
                        set(handles.tab_image_watermarked_attacked,'Visible','on');
                        
                        set(handles.togglebutton_image_watermarked_attacked,'Value',1);
                        set(handles.togglebutton_layers_watermarked_attacked,'Value',0);
                        
                        set(handles.togglebutton_image_watermarked_attacked,'Enable','off');
                        set(handles.togglebutton_layers_watermarked_attacked,'Enable','on');
                        
                        cb = get_root_data('watermarked_attacked_dct_cb');
                        
                        axes(handles.axes_image_watermarked_attacked);
                        imshow(cb);
                        colormap pink;
                        axis off;
                        
                        red = get_root_data('watermarked_attacked_dct_red');
                        green = get_root_data('watermarked_attacked_dct_green');
                        blue = get_root_data('watermarked_attacked_dct_blue');
                        
                        y = get_root_data('watermarked_attacked_dct_y');
                        cb = get_root_data('watermarked_attacked_dct_cb');
                        cr = get_root_data('watermarked_attacked_dct_cr');
                                                
                        axes(handles.axes_icon_ycbcr_watermarked_attacked);
                        imshow(plot);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_y_watermarked_attacked);
                        imshow(y);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_cb_watermarked_attacked);
                        imshow(cb);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_cr_watermarked_attacked);
                        imshow(cr);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_icon_rgb_watermarked_attacked);
                        image(plot);
                        axis off;
                        
                        axes(handles.axes_layer_red_watermarked_attacked);
                        imshow(red);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_green_watermarked_attacked);
                        imshow(green);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_blue_watermarked_attacked);
                        imshow(blue);
                        colormap pink;
                        axis off;
                    case 'cr'
                        set(handles.label_image_watermarked_attacked,'String','Cr DCT ');
                        
                        set(handles.label_icon_ycbcr_watermarked_attacked,'String','Icon Image');
                        set(handles.label_icon_rgb_watermarked_attacked,'String','Icon Image');
                                                  
                        set(handles.label_layer_y_watermarked_attacked,'String','Y DCT ');
                        set(handles.label_layer_cb_watermarked_attacked,'String','Cb DCT ');
                        set(handles.label_layer_cr_watermarked_attacked,'String','Cr DCT ');
                         
                        set(handles.label_layer_red_watermarked_attacked,'String','Red DCT ');
                        set(handles.label_layer_green_watermarked_attacked,'String','Green DCT ');
                        set(handles.label_layer_blue_watermarked_attacked,'String','Blue DCT ');
                        
                        set(handles.tab_layers_rgb_watermarked_attacked,'Visible','off');
                        set(handles.tab_layers_ycbcr_watermarked_attacked,'Visible','off');
                        set(handles.tab_image_watermarked_attacked,'Visible','on');
                        
                        set(handles.togglebutton_image_watermarked_attacked,'Value',1);
                        set(handles.togglebutton_layers_watermarked_attacked,'Value',0);
                        
                        set(handles.togglebutton_image_watermarked_attacked,'Enable','off');
                        set(handles.togglebutton_layers_watermarked_attacked,'Enable','on');
                        
                        cr = get_root_data('watermarked_attacked_dct_cr');
                        
                        axes(handles.axes_image_watermarked_attacked);
                        imshow(cr);
                        colormap pink;
                        axis off;
                        
                        red = get_root_data('watermarked_attacked_dct_red');
                        green = get_root_data('watermarked_attacked_dct_green');
                        blue = get_root_data('watermarked_attacked_dct_blue');
                        
                        y = get_root_data('watermarked_attacked_dct_y');
                        cb = get_root_data('watermarked_attacked_dct_cb');
                        cr = get_root_data('watermarked_attacked_dct_cr');
                                                
                        axes(handles.axes_icon_ycbcr_watermarked_attacked);
                        imshow(plot);
                        axis off;
                        
                        axes(handles.axes_layer_y_watermarked_attacked);
                        imshow(y);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_cb_watermarked_attacked);
                        imshow(cb);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_cr_watermarked_attacked);
                        imshow(cr);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_icon_rgb_watermarked_attacked);
                        image(plot);
                        axis off;
                        
                        axes(handles.axes_layer_red_watermarked_attacked);
                        imshow(red);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_green_watermarked_attacked);
                        imshow(green);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_blue_watermarked_attacked);
                        imshow(blue);
                        colormap pink;
                        axis off;
                    
                    case 'red'
                        set(handles.label_image_watermarked_attacked,'String','Red DCT ');
                        
                        set(handles.label_icon_ycbcr_watermarked_attacked,'String','Icon Image');
                        set(handles.label_icon_rgb_watermarked_attacked,'String','Icon Image');
                                                  
                        set(handles.label_layer_y_watermarked_attacked,'String','Y DCT ');
                        set(handles.label_layer_cb_watermarked_attacked,'String','Cb DCT ');
                        set(handles.label_layer_cr_watermarked_attacked,'String','Cr DCT ');
                         
                        set(handles.label_layer_red_watermarked_attacked,'String','Red DCT ');
                        set(handles.label_layer_green_watermarked_attacked,'String','Green DCT ');
                        set(handles.label_layer_blue_watermarked_attacked,'String','Blue DCT ');
                        
                        set(handles.tab_layers_rgb_watermarked_attacked,'Visible','off');
                        set(handles.tab_layers_ycbcr_watermarked_attacked,'Visible','off');
                        set(handles.tab_image_watermarked_attacked,'Visible','on');
                        
                        set(handles.togglebutton_image_watermarked_attacked,'Value',1);
                        set(handles.togglebutton_layers_watermarked_attacked,'Value',0);
                        
                        set(handles.togglebutton_image_watermarked_attacked,'Enable','off');
                        set(handles.togglebutton_layers_watermarked_attacked,'Enable','on');
                        
                        red = get_root_data('watermarked_attacked_dct_red');
                        
                        axes(handles.axes_image_watermarked_attacked);
                        imshow(red);
                        colormap pink;
                        axis off;
                        
                        red = get_root_data('watermarked_attacked_dct_red');
                        green = get_root_data('watermarked_attacked_dct_green');
                        blue = get_root_data('watermarked_attacked_dct_blue');
                        
                        y = get_root_data('watermarked_attacked_dct_y');
                        cb = get_root_data('watermarked_attacked_dct_cb');
                        cr = get_root_data('watermarked_attacked_dct_cr');
                                                
                        axes(handles.axes_icon_ycbcr_watermarked_attacked);
                        imshow(plot);
                        axis off;
                        
                        axes(handles.axes_layer_y_watermarked_attacked);
                        imshow(y);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_cb_watermarked_attacked);
                        imshow(cb);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_cr_watermarked_attacked);
                        imshow(cr);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_icon_rgb_watermarked_attacked);
                        image(plot);
                        axis off;
                        
                        axes(handles.axes_layer_red_watermarked_attacked);
                        imshow(red);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_green_watermarked_attacked);
                        imshow(green);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_blue_watermarked_attacked);
                        imshow(blue);
                        colormap pink;
                        axis off;
                    case 'green'
                        set(handles.label_image_watermarked_attacked,'String','Green DCT ');
                        
                        set(handles.label_icon_ycbcr_watermarked_attacked,'String','Icon Image');
                        set(handles.label_icon_rgb_watermarked_attacked,'String','Icon Image');
                                                  
                        set(handles.label_layer_y_watermarked_attacked,'String','Y DCT ');
                        set(handles.label_layer_cb_watermarked_attacked,'String','Cb DCT ');
                        set(handles.label_layer_cr_watermarked_attacked,'String','Cr DCT ');
                         
                        set(handles.label_layer_red_watermarked_attacked,'String','Red DCT ');
                        set(handles.label_layer_green_watermarked_attacked,'String','Green DCT ');
                        set(handles.label_layer_blue_watermarked_attacked,'String','Blue DCT ');
                        
                        set(handles.tab_layers_rgb_watermarked_attacked,'Visible','off');
                        set(handles.tab_layers_ycbcr_watermarked_attacked,'Visible','off');
                        set(handles.tab_image_watermarked_attacked,'Visible','on');
                        
                        set(handles.togglebutton_image_watermarked_attacked,'Value',1);
                        set(handles.togglebutton_layers_watermarked_attacked,'Value',0);
                        
                        set(handles.togglebutton_image_watermarked_attacked,'Enable','off');
                        set(handles.togglebutton_layers_watermarked_attacked,'Enable','on');
                        
                        green = get_root_data('watermarked_attacked_dct_green');
                        
                        axes(handles.axes_image_watermarked_attacked);
                        imshow(green);
                        colormap pink;
                        axis off;
                        
                        red = get_root_data('watermarked_attacked_dct_red');
                        green = get_root_data('watermarked_attacked_dct_green');
                        blue = get_root_data('watermarked_attacked_dct_blue');
                        
                        y = get_root_data('watermarked_attacked_dct_y');
                        cb = get_root_data('watermarked_attacked_dct_cb');
                        cr = get_root_data('watermarked_attacked_dct_cr');
                                                
                        axes(handles.axes_icon_ycbcr_watermarked_attacked);
                        imshow(plot);
                        axis off;
                        
                        axes(handles.axes_layer_y_watermarked_attacked);
                        imshow(y);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_cb_watermarked_attacked);
                        imshow(cb);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_cr_watermarked_attacked);
                        imshow(cr);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_icon_rgb_watermarked_attacked);
                        image(plot);
                        axis off;
                        
                        axes(handles.axes_layer_red_watermarked_attacked);
                        imshow(red);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_green_watermarked_attacked);
                        imshow(green);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_blue_watermarked_attacked);
                        imshow(blue);
                        colormap pink;
                        axis off;
                    case 'blue'
                        set(handles.label_image_watermarked_attacked,'String','Blue DCT ');
                        
                        set(handles.label_icon_ycbcr_watermarked_attacked,'String','Icon Image');
                        set(handles.label_icon_rgb_watermarked_attacked,'String','Icon Image');
                                                  
                        set(handles.label_layer_y_watermarked_attacked,'String','Y DCT ');
                        set(handles.label_layer_cb_watermarked_attacked,'String','Cb DCT ');
                        set(handles.label_layer_cr_watermarked_attacked,'String','Cr DCT ');
                         
                        set(handles.label_layer_red_watermarked_attacked,'String','Red DCT ');
                        set(handles.label_layer_green_watermarked_attacked,'String','Green DCT ');
                        set(handles.label_layer_blue_watermarked_attacked,'String','Blue DCT ');
                        
                        set(handles.tab_layers_rgb_watermarked_attacked,'Visible','off');
                        set(handles.tab_layers_ycbcr_watermarked_attacked,'Visible','off');
                        set(handles.tab_image_watermarked_attacked,'Visible','on');
                        
                        set(handles.togglebutton_image_watermarked_attacked,'Value',1);
                        set(handles.togglebutton_layers_watermarked_attacked,'Value',0);
                        
                        set(handles.togglebutton_image_watermarked_attacked,'Enable','off');
                        set(handles.togglebutton_layers_watermarked_attacked,'Enable','on');
                        
                        blue = get_root_data('watermarked_attacked_dct_blue');
                        
                        axes(handles.axes_image_watermarked_attacked);
                        imshow(blue);
                        colormap pink;
                        axis off;
                        
                        red = get_root_data('watermarked_attacked_dct_red');
                        green = get_root_data('watermarked_attacked_dct_green');
                        blue = get_root_data('watermarked_attacked_dct_blue');
                        
                        y = get_root_data('watermarked_attacked_dct_y');
                        cb = get_root_data('watermarked_attacked_dct_cb');
                        cr = get_root_data('watermarked_attacked_dct_cr');
                                                
                        axes(handles.axes_icon_ycbcr_watermarked_attacked);
                        imshow(plot);
                        axis off;
                        
                        axes(handles.axes_layer_y_watermarked_attacked);
                        colormap pink;
                        imshow(y);
                        axis off;
                        
                        axes(handles.axes_layer_cb_watermarked_attacked);
                        imshow(cb);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_cr_watermarked_attacked);
                        imshow(cr);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_icon_rgb_watermarked_attacked);
                        image(plot);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_red_watermarked_attacked);
                        colormap pink;
                        imshow(red);
                        axis off;
                        
                        axes(handles.axes_layer_green_watermarked_attacked);
                        imshow(green);
                        colormap pink;
                        axis off;
                        
                        axes(handles.axes_layer_blue_watermarked_attacked);
                        imshow(blue);
                        colormap pink;
                        axis off;
                end
         end;
        
        