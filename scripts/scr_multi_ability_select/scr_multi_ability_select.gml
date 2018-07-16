prevAlpha = draw_get_alpha();
prevColor = draw_get_color();

//draw a darker cover over the background
draw_set_alpha(.75);
draw_set_color(c_black);
draw_rectangle(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),0);

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(HeadingFont);
draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/8,"Ability Select");
draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])*1/4,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/8+40,"Credits: "+string(global.PlayerAbilityCredits0));
draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])*3/4,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/8+40,"Credits: "+string(global.PlayerAbilityCredits1));
camWidth = camera_get_view_width(view_camera[0])
camHeight = camera_get_view_height(view_camera[0]) 
camx = camera_get_view_x(view_camera[0])
camy = camera_get_view_y(view_camera[0])
players = [s_Player, s_Deflect, s_Bounce]
playerDisplay=[s_Player1,s_Deflect1, s_Bounce1]
playerNames = ["Energy absorb", "Deflect","Bouncing Projectiles"];
if(!variable_global_exists("char_index0"))
	global.char_index0 = 0;
if(!variable_global_exists("char_index1"))
	global.char_index1 = 0;

if((gamepad_axis_value(0,gp_axislh)<0)&&(global.char_index0>0)&&(alarm[10]==-1))
{
	alarm[10]=5;
	global.char_index0 = global.char_index0 - 1
}
else if((gamepad_axis_value(0,gp_axislh)>0)&&(global.char_index0 < array_length_1d(players)-1)&&(alarm[10]==-1))
{
	alarm[10]=5;
	global.char_index0 = global.char_index0 + 1
}

if((gamepad_axis_value(1,gp_axislh)<0)&&(global.char_index1>0)&&(alarm[10]==-1))
{
	alarm[10]=5;
	global.char_index1 = global.char_index1 - 1
}
else if((gamepad_axis_value(1,gp_axislh)>0)&&(global.char_index1 < array_length_1d(players)-1)&&(alarm[10]==-1))
{
	alarm[10]=5;
	global.char_index1 = global.char_index1 + 1
}
if(keyboard_check_pressed(ord("A")))
{
	if(global.char_index0 > 0)
		global.char_index0 = global.char_index0 - 1
}
if(keyboard_check_pressed(ord("D")))
{
	if(global.char_index0 < array_length_1d(players)-1)
		global.char_index0 = global.char_index0 + 1
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
	}
	global.abilityIndex0 = i;
	draw_sprite(players[i],0, charX-225, charY);
	//draw_text(charX, charY + 50, playerNames[i]);
}
for(i = 0; i < array_length_1d(players); i++) 
{
	//charX = camx + (i+1) *camWidth/(array_length_1d(players)+1) - sprite_get_width(players[i])/2;
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
	global.abilityIndex1 = i;
	draw_sprite(players[i],0, charX+175, charY);
	//draw_text(charX, charY + 50, playerNames[i]);
}
if((scr_button(camx + camWidth/2, camy + camHeight * 9/10 - buttonHeight, buttonWidth, buttonHeight, 0, buttonPressed, "Select"))||(gamepad_button_check_pressed(0,gp_face1)))
{
	instance_activate_object(obj_Pause);
	if(global.char_index0==0)
	{
		if(global.TankLeveled0)
		{
			global.TankLeveled0 = false;
			global.PlayerAbilityCredits0+=1;
		}
		else if((global.PlayerAbilityCredits0>0)&&(!global.TankLeveled0))
		{
			global.TankLeveled0 = true;
			global.PlayerAbilityCredits0-=1;
		}
	}
	else if(global.char_index0==1)
	{
		if(global.DeflectLeveled0)
		{
			global.DeflectLeveled0 = false;
			global.PlayerAbilityCredits0+=1;
		}
		else if((global.PlayerAbilityCredits0>0)&&(!global.DeflectLeveled0))
		{
			global.DeflectLeveled0 = true;
			global.PlayerAbilityCredits0-=1;
		}
	}
	else if(global.char_index0==2)
	{
		if(global.BounceLeveled0)
		{
			global.BounceLeveled0 = false;
			global.PlayerAbilityCredits0+=1;
		}
		else if((global.PlayerAbilityCredits0>0)&&(!global.BounceLeveled0))
		{
				global.BounceLeveled0 = true;
				global.PlayerAbilityCredits0-=1;
		}
	}
	Counter = 0;
	global.charSelect = false
	global.displayTitleMenu = false;
}
if(gamepad_button_check_pressed(1,gp_face1))
{
		if(global.char_index1==0)
	{
		if(global.TankLeveled1)
		{
			global.TankLeveled1 = false;
			global.PlayerAbilityCredits1+=1;
		}
		else if((global.PlayerAbilityCredits1>0)&&(!global.TankLeveled1))
		{
			global.TankLeveled1 = true;
			global.PlayerAbilityCredits1-=1;
		}
	}
	else if(global.char_index1==1)
	{
		if(global.DeflectLeveled1)
		{
			global.DeflectLeveled1 = false;
			global.PlayerAbilityCredits1+=1;
		}
		else if((global.PlayerAbilityCredits1>0)&&(!global.DeflectLeveled1))
		{
			global.DeflectLeveled1 = true;
			global.PlayerAbilityCredits1-=1;
		}
	}
	else if(global.char_index1==2)
	{
		if(global.BounceLeveled1)
		{
			global.BounceLeveled1 = false;
			global.PlayerAbilityCredits1+=1;
		}
		else if((global.PlayerAbilityCredits1>0)&&(!global.BounceLeveled1))
		{
				global.BounceLeveled1 = true;
				global.PlayerAbilityCredits1-=1;
		}
	}
	Counter = 0;
	global.charSelect = false
	global.displayTitleMenu = false;
}
draw_set_color(prevColor);
draw_set_alpha(prevAlpha);