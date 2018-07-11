//get the previous alpha and color values
prevAlpha = draw_get_alpha();
prevColor = draw_get_color();

draw_set_alpha(global.dim);//set the alpha to global.dim
draw_set_color(c_black);//sets the color
draw_rectangle(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),0);	//draws the cover over the current camera area

//draw the previous alpha and color values (prevents other objects from going invisible)
draw_set_alpha(prevAlpha);
draw_set_color(prevColor);