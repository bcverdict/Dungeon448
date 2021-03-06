prevAlpha = draw_get_alpha();
prevColor = draw_get_color();
/*
if(gamepad_button_check_pressed(0,gp_face2))
{
	instance_deactivate_all(true);
	scr_title_menu(buttonPressed);
}
*/
//draw a darker cover over the background
draw_set_alpha(.75);
draw_set_color(c_black);
draw_rectangle(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),0);

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(HeadingFont);
draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/8,"Character Select");

camWidth = camera_get_view_width(view_camera[0])
camHeight = camera_get_view_height(view_camera[0]) 
camx = camera_get_view_x(view_camera[0])
camy = camera_get_view_y(view_camera[0])
players = [s1_Player, s_Player]
playersBool0=[global.playerDr0,global.playerKurt0]
playersBool1=[global.playerDr1,global.playerKurt1]
characterBought = [s1_PlayerBought, s_PlayerBought]

playerDisplay=[s1_Player1,s_Player1]
playerNames = ["Dr Alex Bardas", "Kurt Slagle"];
if(!variable_global_exists("char_index0"))
	global.char_index0 = 0;
if(!variable_global_exists("char_index1"))
	global.char_index1 = 0;
if(gamepad_axis_value(0,gp_axislh)<0)
{
	if(global.char_index0 > 0)
		global.char_index0 = global.char_index0 - 1
}
if(gamepad_axis_value(0,gp_axislh)>0)
{
	if(global.char_index0 < array_length_1d(players)-1)
		global.char_index0 = global.char_index0 + 1
}
if(gamepad_axis_value(1,gp_axislh)<0)
{
	if(global.char_index1 > 0)
		global.char_index1 = global.char_index1 - 1
}
if(gamepad_axis_value(1,gp_axislh)>0)
{
	if(global.char_index1 < array_length_1d(players)-1)
		global.char_index1 = global.char_index1 + 1
}
draw_set_font(UIFont -10)
border_width = 2;
for(i = 0; i < array_length_1d(players); i++) 
{
	//charX = camx + (i+1) *camWidth/(array_length_1d(players)+1) - sprite_get_width(players[i])/2;
	charX = camx + camWidth * 1/2 + 2*i*sprite_get_xoffset(players[i])
	charY = camy + camHeight * 7/10 - sprite_get_yoffset(players[i])
	draw_set_color(c_white);
	if(global.char_index0 == i) 
	{
		draw_set_color(c_yellow);
		draw_rectangle(charX-sprite_get_xoffset(players[i])-border_width-225, charY- sprite_get_yoffset(players[i])-border_width, charX - sprite_get_xoffset(players[i])+ sprite_get_width(players[i]) + border_width-225, charY- sprite_get_yoffset(players[i]) + sprite_get_height(players[i]) + border_width, false);
		draw_set_color(c_black);
		draw_rectangle(charX-sprite_get_xoffset(players[i])-225, charY- sprite_get_yoffset(players[i]), charX - sprite_get_xoffset(players[i])+ sprite_get_width(players[i])-225, charY- sprite_get_yoffset(players[i]) + sprite_get_height(players[i]), false);
		draw_set_color(c_yellow);
		//draw_text(charX, charY + 50, playerNames[i]);
		draw_sprite(playerDisplay[i],0,camera_get_view_x(view_camera[0])+1/4*camWidth,camera_get_view_y(view_camera[0])+2/5*camHeight);
		draw_text(camera_get_view_x(view_camera[0])+1/4*camWidth,camera_get_view_y(view_camera[0])+16/30*camHeight, playerNames[i]);
		/*
		if(i = 0)
			global.localPlayer1.currentPlayer = playerSelect.DrBardas;
		else if(i = 1)
			global.localPlayer1.currentPlayer = playerSelect.Kurt;
		else
			global.localPlayer1.currentPlayer = playerSelect.Kurt;
		*/
	}
	if(playersBool0[i])
		draw_sprite(characterBought[i],0, charX-225, charY);
	else
		draw_sprite(players[i],0, charX-225, charY);
	//draw_text(charX, charY + 50, playerNames[i]);
}
for(i = 0; i < array_length_1d(players); i++) 
{
	charX = camx + camWidth * 1/2 + 2*i*sprite_get_xoffset(players[i])
	charY = camy + camHeight * 7/10 - sprite_get_yoffset(players[i])
	draw_set_color(c_white);
	if(global.char_index1 == i) 
	{
		draw_set_color(c_yellow);
		draw_rectangle(charX-sprite_get_xoffset(players[i])-border_width+175, charY- sprite_get_yoffset(players[i])-border_width, charX - sprite_get_xoffset(players[i])+ sprite_get_width(players[i]) + border_width+175, charY- sprite_get_yoffset(players[i]) + sprite_get_height(players[i]) + border_width, false);
		draw_set_color(c_black);
		draw_rectangle(charX-sprite_get_xoffset(players[i])+175, charY- sprite_get_yoffset(players[i]), charX - sprite_get_xoffset(players[i])+ sprite_get_width(players[i])+175, charY- sprite_get_yoffset(players[i]) + sprite_get_height(players[i]), false);
		draw_set_color(c_yellow);
		//draw_text(charX, charY + 50, playerNames[i]);
		draw_sprite(playerDisplay[i],0,camera_get_view_x(view_camera[0])+3/4*camWidth,camera_get_view_y(view_camera[0])+2/5*camHeight);
		draw_text(camera_get_view_x(view_camera[0])+3/4*camWidth,camera_get_view_y(view_camera[0])+16/30*camHeight, playerNames[i]);
	}
	if(playersBool1[i])
		draw_sprite(characterBought[i],0, charX+175, charY);
	else
		draw_sprite(players[i],0, charX+175, charY);
	//draw_text(charX, charY + 50, playerNames[i]);
}

if(gamepad_button_check_pressed(0,gp_face1))
{
	//Counter = 0;
	global.firstCharSelected = !global.firstCharSelected;
	if(global.char_index0 == 0)
	{
		global.playerDr0 = true;
		global.playerKurt0 = false;
		global.localPlayer0.currentPlayer = playerSelect.DrBardas;
	}
	else if(global.char_index0 == 1)
	{
		global.playerDr0 = false;
		global.playerKurt0 = true;
		global.localPlayer0.currentPlayer = playerSelect.Kurt;
	}
	//global.displayTitleMenu = false;
}
if(gamepad_button_check_pressed(1,gp_face1))
{
	//Counter = 0;
	global.secondCharSelected = !global.secondCharSelected;
	if(global.char_index1 == 0)
	{
		global.playerDr1 = true;
		global.playerKurt1 = false;
		global.localPlayer1.currentPlayer = playerSelect.DrBardas;
	}
	else if(global.char_index1 == 1)
	{
		global.playerDr1 = false;
		global.playerKurt1 = true;
		global.localPlayer1.currentPlayer = playerSelect.Kurt;
	}
	playersBool1[0]=false;
	playersBool1[1]=false;
	playersBool1[global.char_index1]=true;
	//global.displayTitleMenu = false;
}
if((global.firstCharSelected)&&(global.secondCharSelected))
{
	Counter = 0;
	global.charSelect = false
	global.displayTitleMenu = false;
}
draw_set_color(prevColor);
draw_set_alpha(prevAlpha);