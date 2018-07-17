//draw a darker cover over the background
if(global.fade>=1)
{
	instance_deactivate_object(inst_78C8041E);
	instance_deactivate_object(inst_4F75CE06);
}
prevAlpha = draw_get_alpha();
prevColor = draw_get_color();

draw_set_alpha(global.fade);
draw_set_color(c_black);
draw_rectangle(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),0);	

if(global.fade >= 1)
{
	//draw Pause Menu
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(HeadingFont);
	draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/4,"You Died.");
	
	//--------------Draw Buttons--------------
	//button dimensions
	buttonWidth = 155;
	buttonHeight = 55;
	buttonX = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
	buttonY = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/4 + buttonHeight;
	buttonOffset = buttonHeight + 20;
	
	//the colors for the normal button
	darkGrey = make_color_rgb(137,137,137);
	mediumGrey = make_color_rgb(183,183,183);
	lightGrey = make_color_rgb(215,215,215);
	
	//the colors for the hover button
	darkGreen = make_color_rgb(0,166,81);
	mediumGreen = make_color_rgb(53,181,74);
	lightGreen = make_color_rgb(124,197,118);
	
	//color offsets
	mediumOffset = 1;
	innerOffset = mediumOffset + 2;
	
	//button vars
	buttonPressed = argument0;
	if(scr_button(buttonX, buttonY, buttonWidth, buttonHeight, 0, buttonPressed, "Respawn")||(gamepad_button_check_pressed(0,gp_face1)&&(CursorIndex==1))) 
	{
		if(gamepad_is_connected(1))
		{
			instance_activate_object(inst_78C8041E);
			inst_78C8041E.PlayerHealth = inst_78C8041E.MaxPlayerHealth;
			inst_78C8041E.player_speed = inst_78C8041E.MaxPlayerSpeed;
		}
		instance_activate_object(inst_4F75CE06);
		inst_4F75CE06.PlayerHealth = inst_4F75CE06.MaxPlayerHealth;
		inst_4F75CE06.player_speed = inst_4F75CE06.MaxPlayerSpeed;
		if(room_get_name(room) == "room5")
		{
			room_goto(room5);
			if(gamepad_is_connected(1))
			{
				inst_78C8041E.x = 640;
				inst_78C8041E.y = 750;
			}
			inst_4F75CE06.x = 640;
			inst_4F75CE06.y = 750;
			global.fade = 0.01;
		}
		else
		{
			room_goto(room0);
			if(gamepad_is_connected(1))
			{
				inst_78C8041E.x = 612;
				inst_78C8041E.y = 1428;
			}
			inst_4F75CE06.x = 476;
			inst_4F75CE06.y = 1428;
			global.fade = 0.01;
		}
		Counter = 0;
	}
	if(scr_button(buttonX, buttonY + buttonOffset, buttonWidth, buttonHeight, 2, buttonPressed, "Quit")||(gamepad_button_check_pressed(0,gp_face1)&&(CursorIndex==0)))  
	{
		game_end();
	}
	//xbox cursor
	if(gamepad_is_connected(0))
	{
		draw_sprite(MainMenuCursor, image_index/8, camera_get_view_x(view_camera[0])+1/2*camera_get_view_width(view_camera[0]), buttonY-CursorIndex*buttonOffset);
		if((gamepad_axis_value(0,gp_axislv)<0)&&(CursorIndex!=1)&&(alarm[10]==-1))
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
draw_set_alpha(prevAlpha);
draw_set_color(prevColor);