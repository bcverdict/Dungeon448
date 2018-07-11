if(run)
{	
	//draw a darker cover over the background
	draw_set_alpha(.75);
	draw_set_color(c_black);
	draw_rectangle(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),0);
	
	//draw the note message
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(HeadingFont-20);
	draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2,NoteContent);
	
	self.visible = true;
}
else
{
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(HeadingFont-20);
	draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2-string_length(Message)*5,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/4+40,Message);

	self.visible = false;
}