function set_variables_original(handles)

type = get_root_data('image_type');

selected = check_selected_component_original(handles);


switch type
    case 'grayscale'
        plot_image = get_root_data('original_plot_grayscale');
        working_image = get_root_data('original_working_grayscale');
                
        set_root_data(handles,'working_original',working_image);
        set_root_data(handles,'plot_original',plot_image);
        set_root_data(handles,'used_component','grayscale');
    case 'layered'
        switch selected
            case 'ycbcr' 
                plot_image = get_root_data('original_plot_y');
                working_image = get_root_data('original_working_y');
                
                set_root_data(handles,'working_original',working_image);
                set_root_data(handles,'plot_original',plot_image);
                set_root_data(handles,'used_component','ycbcr');
            case 'rgb' 
                plot_image = get_root_data('original_plot_y');
                working_image = get_root_data('original_working_y');
                
                set_root_data(handles,'working_original',working_image);
                set_root_data(handles,'plot_original',plot_image);
                set_root_data(handles,'used_component','ycbcr');
            case 'y'
                plot_image = get_root_data('original_plot_y');
                working_image = get_root_data('original_working_y');
                
                set_root_data(handles,'working_original',working_image);
                set_root_data(handles,'plot_original',plot_image);
                set_root_data(handles,'used_component','y');
            case 'cb'
                plot_image = get_root_data('original_plot_cb');
                working_image = get_root_data('original_working_cb');
                
                set_root_data(handles,'working_original',working_image);
                set_root_data(handles,'plot_original',plot_image);
                set_root_data(handles,'used_component','cb');
            case 'cr'
                plot_image = get_root_data('original_plot_cr');
                working_image = get_root_data('original_working_cr');
                
                set_root_data(handles,'working_original',working_image);
                set_root_data(handles,'plot_original',plot_image);
                set_root_data(handles,'used_component','cr');
            case 'red'
                plot_image = get_root_data('original_plot_red');
                working_image = get_root_data('original_working_red');
                
                set_root_data(handles,'working_original',working_image);
                set_root_data(handles,'plot_original',plot_image);
                set_root_data(handles,'used_component','red');
            case 'green'
                plot_image = get_root_data('original_plot_green');
                working_image = get_root_data('original_working_green');
                
                set_root_data(handles,'working_original',working_image);
                set_root_data(handles,'plot_original',plot_image);
                set_root_data(handles,'used_component','green');
            case 'blue'
                plot_image = get_root_data('original_plot_blue');
                working_image = get_root_data('original_working_blue');
                
                set_root_data(handles,'working_original',working_image);
                set_root_data(handles,'plot_original',plot_image);
                set_root_data(handles,'used_component','blue');
        end;
end;

set(handles.tab_attacked_attacked,'Visible','off');
set(handles.tab_attacked_decode,'Visible','off');

set(handles.tab_decoded_image,'Visible','off');
set(handles.tab_decoded_text,'Visible','off');








