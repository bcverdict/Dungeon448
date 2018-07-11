prevAlpha = draw_get_alpha();
prevColor = draw_get_color();

//draw a darker cover over the background
draw_set_alpha(.75);
draw_set_color(c_black);
draw_rectangle(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),0);

//draw Pause Menu
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(HeadingFont);
draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/6,"Help");
	
draw_set_font(UIFont);
//--------------Draw Buttons--------------
images = [s_wasd_keys, s_tab_key, s_left_mouse, s_right_mouse, s_e_key]; 
imagesx = [camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])*11/30, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])*3/30, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])*20/30, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])*25/30, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])*13/30];
imagesy = [camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])*20/30, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])*12/30, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])*12/30, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])*12/30, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])*12/30];

i = 0;
for(i=0; i < array_length_1d(images); i++){
	draw_sprite_ext(images[i], 0,imagesx[i],imagesy[i],0.5,0.5,0,c_white,1);
	switch(i){
		case 0:
			draw_text(imagesx[i] + sprite_get_width(images[i])/4, imagesy[i] - 30,"Movement");
			break;
		case 1:
			draw_text(imagesx[i] + sprite_get_width(images[i])/4, imagesy[i] - 30,"Inventory");
			break;
		case 2:
			draw_text(imagesx[i] + sprite_get_width(images[i])/4, imagesy[i] - 30,"Spells");
			break;
		case 3:
			draw_text(imagesx[i] + sprite_get_width(images[i])/4, imagesy[i] - 30,"Slash");
			break;
		case 4:
			draw_text(imagesx[i] + sprite_get_width(images[i])/4,imagesy[i] - 35,"Interact/\nEquip");
			break;
	}
}

buttonOffset = 15;
if(scr_button(camera_get_view_x(view_camera[0]) +155/2 +buttonOffset, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) -55 -buttonOffset,155, 55, 0, argument0,"Back")||gamepad_button_check_pressed(0,gp_face2))
	global.help = false;

draw_set_alpha(prevAlpha);
draw_set_color(prevColor);