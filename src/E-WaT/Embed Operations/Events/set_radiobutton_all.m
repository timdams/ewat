function set_radiobutton_all(handles)

        rgb    = get(handles.radiobutton_icon_rgb_original,'Value');
        red    = get(handles.radiobutton_layer_red_original,'Value');
        green  = get(handles.radiobutton_layer_green_original,'Value');
        blue   = get(handles.radiobutton_layer_blue_original,'Value');
        ycbcr  = get(handles.radiobutton_icon_ycbcr_original,'Value');
        y      = get(handles.radiobutton_layer_y_original,'Value');
        cb     = get(handles.radiobutton_layer_cb_original,'Value');
        cr     = get(handles.radiobutton_layer_cr_original,'Value');
        
        if rgb == 1.0
            set(handles.radiobutton_icon_rgb_watermarked_embed,'Value',1);
            set(handles.radiobutton_icon_rgb_watermarked_embed,'Enable','off');
            
            set(handles.radiobutton_layer_red_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_red_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_green_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_green_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_blue_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_blue_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_watermarked_embed,'Value',0);
            set(handles.radiobutton_icon_ycbcr_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_y_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_y_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_cb_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_cb_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_cr_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_cr_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_watermarked_attacked,'Value',1);
            set(handles.radiobutton_icon_rgb_watermarked_attacked,'Enable','off');
            
            set(handles.radiobutton_layer_red_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_red_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_green_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_green_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_blue_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_blue_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_watermarked_attacked,'Value',0);
            set(handles.radiobutton_icon_ycbcr_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_y_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_y_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cb_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_cb_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cr_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_cr_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_attacked_attacked,'Value',1);
            set(handles.radiobutton_icon_rgb_attacked_attacked,'Enable','off');
            
            set(handles.radiobutton_layer_red_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_red_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_green_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_green_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_blue_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_blue_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_attacked_attacked,'Value',0);
            set(handles.radiobutton_icon_ycbcr_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_y_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_y_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cb_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_cb_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cr_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_cr_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_attacked_decode,'Value',1);
            set(handles.radiobutton_icon_rgb_attacked_decode,'Enable','off');
            
            set(handles.radiobutton_layer_red_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_red_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_green_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_green_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_blue_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_blue_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_attacked_decode,'Value',0);
            set(handles.radiobutton_icon_ycbcr_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_y_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_y_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_cb_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_cb_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_cr_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_cr_attacked_decode,'Enable','on');
        elseif red == 1.0
            set(handles.radiobutton_icon_rgb_watermarked_embed,'Value',0);
            set(handles.radiobutton_icon_rgb_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_red_watermarked_embed,'Value',1);
            set(handles.radiobutton_layer_red_watermarked_embed,'Enable','off');
            
            set(handles.radiobutton_layer_green_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_green_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_blue_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_blue_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_watermarked_embed,'Value',0);
            set(handles.radiobutton_icon_ycbcr_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_y_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_y_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_cb_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_cb_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_cr_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_cr_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_watermarked_attacked,'Value',0);
            set(handles.radiobutton_icon_rgb_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_red_watermarked_attacked,'Value',1);
            set(handles.radiobutton_layer_red_watermarked_attacked,'Enable','off');
            
            set(handles.radiobutton_layer_green_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_green_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_blue_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_blue_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_watermarked_attacked,'Value',0);
            set(handles.radiobutton_icon_ycbcr_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_y_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_y_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cb_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_cb_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cr_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_cr_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_attacked_attacked,'Value',0);
            set(handles.radiobutton_icon_rgb_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_red_attacked_attacked,'Value',1);
            set(handles.radiobutton_layer_red_attacked_attacked,'Enable','off');
            
            set(handles.radiobutton_layer_green_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_green_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_blue_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_blue_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_attacked_attacked,'Value',0);
            set(handles.radiobutton_icon_ycbcr_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_y_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_y_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cb_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_cb_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cr_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_cr_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_attacked_decode,'Value',0);
            set(handles.radiobutton_icon_rgb_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_red_attacked_decode,'Value',1);
            set(handles.radiobutton_layer_red_attacked_decode,'Enable','off');
            
            set(handles.radiobutton_layer_green_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_green_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_blue_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_blue_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_attacked_decode,'Value',0);
            set(handles.radiobutton_icon_ycbcr_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_y_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_y_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_cb_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_cb_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_cr_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_cr_attacked_decode,'Enable','on');
        elseif green == 1.0
            set(handles.radiobutton_icon_rgb_watermarked_embed,'Value',0);
            set(handles.radiobutton_icon_rgb_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_red_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_red_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_green_watermarked_embed,'Value',1);
            set(handles.radiobutton_layer_green_watermarked_embed,'Enable','off');
            
            set(handles.radiobutton_layer_blue_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_blue_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_watermarked_embed,'Value',0);
            set(handles.radiobutton_icon_ycbcr_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_y_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_y_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_cb_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_cb_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_cr_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_cr_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_watermarked_attacked,'Value',0);
            set(handles.radiobutton_icon_rgb_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_red_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_red_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_green_watermarked_attacked,'Value',1);
            set(handles.radiobutton_layer_green_watermarked_attacked,'Enable','off');
            
            set(handles.radiobutton_layer_blue_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_blue_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_watermarked_attacked,'Value',0);
            set(handles.radiobutton_icon_ycbcr_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_y_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_y_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cb_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_cb_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cr_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_cr_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_attacked_attacked,'Value',0);
            set(handles.radiobutton_icon_rgb_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_red_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_red_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_green_attacked_attacked,'Value',1);
            set(handles.radiobutton_layer_green_attacked_attacked,'Enable','off');
            
            set(handles.radiobutton_layer_blue_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_blue_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_attacked_attacked,'Value',0);
            set(handles.radiobutton_icon_ycbcr_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_y_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_y_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cb_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_cb_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cr_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_cr_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_attacked_decode,'Value',0);
            set(handles.radiobutton_icon_rgb_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_red_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_red_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_green_attacked_decode,'Value',1);
            set(handles.radiobutton_layer_green_attacked_decode,'Enable','off');
            
            set(handles.radiobutton_layer_blue_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_blue_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_attacked_decode,'Value',0);
            set(handles.radiobutton_icon_ycbcr_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_y_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_y_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_cb_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_cb_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_cr_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_cr_attacked_decode,'Enable','on');
            
        elseif blue == 1.0
            set(handles.radiobutton_icon_rgb_watermarked_embed,'Value',0);
            set(handles.radiobutton_icon_rgb_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_red_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_red_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_green_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_green_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_blue_watermarked_embed,'Value',1);
            set(handles.radiobutton_layer_blue_watermarked_embed,'Enable','off');
            
            set(handles.radiobutton_icon_ycbcr_watermarked_embed,'Value',0);
            set(handles.radiobutton_icon_ycbcr_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_y_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_y_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_cb_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_cb_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_cr_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_cr_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_watermarked_attacked,'Value',0);
            set(handles.radiobutton_icon_rgb_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_red_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_red_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_green_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_green_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_blue_watermarked_attacked,'Value',1);
            set(handles.radiobutton_layer_blue_watermarked_attacked,'Enable','off');
            
            set(handles.radiobutton_icon_ycbcr_watermarked_attacked,'Value',0);
            set(handles.radiobutton_icon_ycbcr_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_y_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_y_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cb_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_cb_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cr_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_cr_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_attacked_attacked,'Value',0);
            set(handles.radiobutton_icon_rgb_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_red_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_red_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_green_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_green_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_blue_attacked_attacked,'Value',1);
            set(handles.radiobutton_layer_blue_attacked_attacked,'Enable','off');
            
            set(handles.radiobutton_icon_ycbcr_attacked_attacked,'Value',0);
            set(handles.radiobutton_icon_ycbcr_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_y_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_y_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cb_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_cb_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cr_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_cr_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_attacked_decode,'Value',0);
            set(handles.radiobutton_icon_rgb_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_red_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_red_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_green_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_green_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_blue_attacked_decode,'Value',1);
            set(handles.radiobutton_layer_blue_attacked_decode,'Enable','off');
            
            set(handles.radiobutton_icon_ycbcr_attacked_decode,'Value',0);
            set(handles.radiobutton_icon_ycbcr_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_y_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_y_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_cb_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_cb_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_cr_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_cr_attacked_decode,'Enable','on');
        elseif ycbcr == 1.0
            set(handles.radiobutton_icon_rgb_watermarked_embed,'Value',0);
            set(handles.radiobutton_icon_rgb_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_red_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_red_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_green_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_green_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_blue_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_blue_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_watermarked_embed,'Value',1);
            set(handles.radiobutton_icon_ycbcr_watermarked_embed,'Enable','off');
            
            set(handles.radiobutton_layer_y_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_y_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_cb_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_cb_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_cr_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_cr_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_watermarked_attacked,'Value',0);
            set(handles.radiobutton_icon_rgb_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_red_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_red_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_green_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_green_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_blue_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_blue_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_watermarked_attacked,'Value',1);
            set(handles.radiobutton_icon_ycbcr_watermarked_attacked,'Enable','off');
            
            set(handles.radiobutton_layer_y_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_y_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cb_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_cb_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cr_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_cr_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_attacked_attacked,'Value',0);
            set(handles.radiobutton_icon_rgb_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_red_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_red_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_green_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_green_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_blue_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_blue_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_attacked_attacked,'Value',1);
            set(handles.radiobutton_icon_ycbcr_attacked_attacked,'Enable','off');
            
            set(handles.radiobutton_layer_y_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_y_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cb_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_cb_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cr_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_cr_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_attacked_decode,'Value',0);
            set(handles.radiobutton_icon_rgb_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_red_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_red_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_green_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_green_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_blue_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_blue_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_attacked_decode,'Value',1);
            set(handles.radiobutton_icon_ycbcr_attacked_decode,'Enable','off');
            
            set(handles.radiobutton_layer_y_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_y_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_cb_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_cb_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_cr_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_cr_attacked_decode,'Enable','on');
        elseif y == 1.0
            set(handles.radiobutton_icon_rgb_watermarked_embed,'Value',0);
            set(handles.radiobutton_icon_rgb_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_red_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_red_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_green_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_green_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_blue_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_blue_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_watermarked_embed,'Value',0);
            set(handles.radiobutton_icon_ycbcr_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_y_watermarked_embed,'Value',1);
            set(handles.radiobutton_layer_y_watermarked_embed,'Enable','off');
            
            set(handles.radiobutton_layer_cb_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_cb_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_cr_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_cr_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_watermarked_attacked,'Value',0);
            set(handles.radiobutton_icon_rgb_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_red_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_red_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_green_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_green_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_blue_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_blue_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_watermarked_attacked,'Value',0);
            set(handles.radiobutton_icon_ycbcr_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_y_watermarked_attacked,'Value',1);
            set(handles.radiobutton_layer_y_watermarked_attacked,'Enable','off');
            
            set(handles.radiobutton_layer_cb_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_cb_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cr_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_cr_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_attacked_attacked,'Value',0);
            set(handles.radiobutton_icon_rgb_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_red_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_red_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_green_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_green_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_blue_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_blue_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_attacked_attacked,'Value',0);
            set(handles.radiobutton_icon_ycbcr_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_y_attacked_attacked,'Value',1);
            set(handles.radiobutton_layer_y_attacked_attacked,'Enable','off');
            
            set(handles.radiobutton_layer_cb_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_cb_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cr_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_cr_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_attacked_decode,'Value',0);
            set(handles.radiobutton_icon_rgb_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_red_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_red_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_green_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_green_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_blue_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_blue_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_attacked_decode,'Value',0);
            set(handles.radiobutton_icon_ycbcr_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_y_attacked_decode,'Value',1);
            set(handles.radiobutton_layer_y_attacked_decode,'Enable','off');
            
            set(handles.radiobutton_layer_cb_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_cb_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_cr_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_cr_attacked_decode,'Enable','on');
        elseif cb == 1.0
            set(handles.radiobutton_icon_rgb_watermarked_embed,'Value',0);
            set(handles.radiobutton_icon_rgb_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_red_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_red_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_green_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_green_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_blue_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_blue_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_watermarked_embed,'Value',0);
            set(handles.radiobutton_icon_ycbcr_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_y_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_y_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_cb_watermarked_embed,'Value',1);
            set(handles.radiobutton_layer_cb_watermarked_embed,'Enable','off');
            
            set(handles.radiobutton_layer_cr_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_cr_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_watermarked_attacked,'Value',0);
            set(handles.radiobutton_icon_rgb_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_red_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_red_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_green_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_green_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_blue_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_blue_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_watermarked_attacked,'Value',0);
            set(handles.radiobutton_icon_ycbcr_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_y_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_y_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cb_watermarked_attacked,'Value',1);
            set(handles.radiobutton_layer_cb_watermarked_attacked,'Enable','off');
            
            set(handles.radiobutton_layer_cr_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_cr_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_attacked_attacked,'Value',0);
            set(handles.radiobutton_icon_rgb_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_red_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_red_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_green_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_green_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_blue_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_blue_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_attacked_attacked,'Value',0);
            set(handles.radiobutton_icon_ycbcr_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_y_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_y_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cb_attacked_attacked,'Value',1);
            set(handles.radiobutton_layer_cb_attacked_attacked,'Enable','off');
            
            set(handles.radiobutton_layer_cr_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_cr_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_attacked_decode,'Value',0);
            set(handles.radiobutton_icon_rgb_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_red_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_red_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_green_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_green_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_blue_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_blue_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_attacked_decode,'Value',0);
            set(handles.radiobutton_icon_ycbcr_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_y_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_y_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_cb_attacked_decode,'Value',1);
            set(handles.radiobutton_layer_cb_attacked_decode,'Enable','off');
            
            set(handles.radiobutton_layer_cr_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_cr_attacked_decode,'Enable','on');
        elseif cr == 1.0
            set(handles.radiobutton_icon_rgb_watermarked_embed,'Value',0);
            set(handles.radiobutton_icon_rgb_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_red_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_red_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_green_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_green_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_blue_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_blue_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_watermarked_embed,'Value',0);
            set(handles.radiobutton_icon_ycbcr_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_y_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_y_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_cb_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_cb_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_cr_watermarked_embed,'Value',1);
            set(handles.radiobutton_layer_cr_watermarked_embed,'Enable','off');
            
            set(handles.radiobutton_icon_rgb_watermarked_attacked,'Value',0);
            set(handles.radiobutton_icon_rgb_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_red_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_red_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_green_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_green_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_blue_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_blue_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_watermarked_attacked,'Value',0);
            set(handles.radiobutton_icon_ycbcr_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_y_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_y_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cb_watermarked_attacked,'Value',0);
            set(handles.radiobutton_layer_cb_watermarked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cr_watermarked_attacked,'Value',1);
            set(handles.radiobutton_layer_cr_watermarked_attacked,'Enable','off');
            
            set(handles.radiobutton_icon_rgb_attacked_attacked,'Value',0);
            set(handles.radiobutton_icon_rgb_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_red_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_red_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_green_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_green_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_blue_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_blue_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_attacked_attacked,'Value',0);
            set(handles.radiobutton_icon_ycbcr_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_y_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_y_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cb_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_cb_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cr_attacked_attacked,'Value',1);
            set(handles.radiobutton_layer_cr_attacked_attacked,'Enable','off');
            
            set(handles.radiobutton_icon_rgb_attacked_decode,'Value',0);
            set(handles.radiobutton_icon_rgb_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_red_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_red_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_green_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_green_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_blue_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_blue_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_attacked_decode,'Value',0);
            set(handles.radiobutton_icon_ycbcr_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_y_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_y_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_cb_attacked_decode,'Value',0);
            set(handles.radiobutton_layer_cb_attacked_decode,'Enable','on');
            
            set(handles.radiobutton_layer_cr_attacked_decode,'Value',1);
            set(handles.radiobutton_layer_cr_attacked_decode,'Enable','off');
        else
            set(handles.radiobutton_icon_rgb_watermarked_embed,'Value',1);
            set(handles.radiobutton_icon_rgb_watermarked_embed,'Enable','off');
            
            set(handles.radiobutton_layer_red_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_red_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_green_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_green_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_blue_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_blue_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_watermarked_embed,'Value',0);
            set(handles.radiobutton_icon_ycbcr_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_y_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_y_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_cb_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_cb_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_layer_cr_watermarked_embed,'Value',0);
            set(handles.radiobutton_layer_cr_watermarked_embed,'Enable','on');
            
            set(handles.radiobutton_icon_rgb_attacked_attacked,'Value',1);
            set(handles.radiobutton_icon_rgb_attacked_attacked,'Enable','off');
            
            set(handles.radiobutton_layer_red_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_red_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_green_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_green_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_blue_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_blue_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_icon_ycbcr_attacked_attacked,'Value',0);
            set(handles.radiobutton_icon_ycbcr_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_y_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_y_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cb_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_cb_attacked_attacked,'Enable','on');
            
            set(handles.radiobutton_layer_cr_attacked_attacked,'Value',0);
            set(handles.radiobutton_layer_cr_attacked_attacked,'Enable','on');
        end