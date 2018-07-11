draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(HeadingFont-20);
draw_set_halign(fa_center);
draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/4+40,Message);

self.visible = false;