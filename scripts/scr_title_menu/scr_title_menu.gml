prevAlpha = draw_get_alpha();
prevColor = draw_get_color();
//draw a darker cover over the background
draw_set_alpha(.75);
draw_set_color(c_black);
draw_rectangle(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),0);

if(!variable_global_exists("charSelect") || global.charSelect = false)
{
	//draw Pause Menu
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(HeadingFont);
	draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/6,"Dungeon 448");
	
	//--------------Draw Buttons--------------
	//button dimensions
	buttonWidth = 175;
	buttonHeight = 55;
	buttonX = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
	buttonY = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/4 + buttonHeight;
	//buttonZ = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/4 + 2*buttonHeight;
	buttonOffset = buttonHeight + 20;
	
	//button vars
	buttonPressed = argument0;
	//draw_sprite(MainMenuCursor,0, buttonX, buttonY-2*buttonOffset);
	if(scr_button(buttonX, buttonY, buttonWidth, buttonHeight, 1, buttonPressed, "Play")||(gamepad_button_check_pressed(0,gp_face1)&&(CursorIndex==2)))
	{
		Counter = 0;
		global.charSelect = true
		//global.displayTitleMenu = false;
	}
	if(scr_button(buttonX, buttonY + buttonOffset, buttonWidth, buttonHeight, 2, buttonPressed, "Test Room")||(gamepad_button_check_pressed(0,gp_face1)&&(CursorIndex==1))) 
	{
		Counter = 0;
		global.charSelect = true
		global.testRoom = true;
	}
	if(scr_button(buttonX, buttonY + buttonOffset, buttonWidth, buttonHeight, 0, buttonPressed, "Quit")||(gamepad_button_check_pressed(0,gp_face1)&&(CursorIndex==0)))
	{
		game_end();
	}
	if(gamepad_is_connected(0))
	{
		draw_sprite(MainMenuCursor, image_index/8, camera_get_view_x(view_camera[0])+1/2*camera_get_view_width(view_camera[0]), buttonY-CursorIndex*buttonOffset);
		if((gamepad_axis_value(0,gp_axislv)<0)&&(CursorIndex!=2)&&(alarm[10]==-1))
		{
			alarm[10]=5;
			CursorIndex++;
		}
		else if((gamepad_axis_value(0,gp_axislv)>0)&&(CursorIndex!=0)&&(alarm[10]==-1))
		{
			alarm[10]=5;
			CursorIndex--;
		}
	}
}
else
{
	scr_char_select();
}
draw_set_color(prevColor);
draw_set_alpha(prevAlpha);