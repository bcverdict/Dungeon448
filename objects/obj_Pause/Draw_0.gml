/// @description Insert description here
// You can write your code in this editor

dead = inst_4F75CE06.PlayerHealth <=0;
depth = -300;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
//show_message(string(Counter));
if((keyboard_check_pressed(vk_escape)||gamepad_button_check_pressed(0,gp_start)||gamepad_button_check_pressed(1,gp_start)) && !dead && !global.inventoryIsOpened)//if escape key is pressed and no other interface is open
{
	Counter = 0;
	global.pause = not(global.pause);
	if(!global.pause)
	{
		global.help = false;
	}
}
else if(((keyboard_check_pressed(vk_tab))||(gamepad_button_check_pressed(0,gp_face4))||(gamepad_button_check_pressed(1,gp_face4))) && !dead)//if tab key is pressed and no other interface is open
{
	global.inventoryIsOpened = !global.inventoryIsOpened;
}
else if(((keyboard_check_pressed(vk_lshift))||(gamepad_button_check_pressed(0,gp_select))||(gamepad_button_check_pressed(1,gp_select)))&&(!dead))//if tab key is pressed and no other interface is open
{
	global.abilitySelect = !global.abilitySelect;
}

if(global.displayTitleMenu)
{
	if(Counter == 0)
	{
		CursorIndex = 2;
		Counter++;
	}
	instance_deactivate_all(global.displayTitleMenu);//deactivates all objects
	scr_title_menu(buttonPressed);//displays title menu
}
else if(global.pause)
{
	if(Counter == 0)
	{
		CursorIndex = 2;
		Counter++;
	}
	instance_deactivate_all(global.pause);//deactivates all objects
	scr_pause_menu(buttonPressed);//displays pause menu
}
else if(global.inventoryIsOpened)
{
	instance_deactivate_all(global.inventoryIsOpened);//deactivates all objects
	for(var i = 0; i < array_length_1d(global.inventory); i++)
	{
		instance_activate_object(global.inventory[i]);
	}
	scr_inventory_menu();//displays inventory menu
}
else if(global.abilitySelect)
{
	instance_deactivate_all(global.abilitySelect);//deactivates all objects
	if(gamepad_is_connected(1))
		scr_multi_ability_select();
	else
		scr_ability_select();//displays ability menu
}
else if(dead)//if player has died
{
	//show_message(string(Counter))
	if(Counter == 0)
	{
		CursorIndex = 1;
		Counter++;
	}
	//fade to black screen
	if(fadeStartTime == 0)
	{
		fadeStartTime = current_time;	
	}
	global.fade = (current_time - fadeStartTime)/1000 / 1.5;
	scr_death_menu(buttonPressed);//displays death menu
}
else
{
	//activates the objects within region shown by the camera
	instance_activate_region(camera_get_view_x(view_camera[0])-100,camera_get_view_y(view_camera[0])-100,camera_get_view_width(view_camera[0])+100,camera_get_view_height(view_camera[0])+100,true);
	
	fadeStartTime = 0;
	healthOffset = 5;
	healthLength = 200;
	healthHeight = 20;
	borderWidth = 2;
	borderColor = c_blue;
	profileOffsetX = 2;
	profileOffsetY = healthOffset + healthHeight;
	profileSize = 60;
	player = instance_find(obj_Player,0);
	if(!global.pause && !global.displayTitleMenu)
	{
		for(i = 0; i<instance_number(obj_Player); i++)
		{
			Player[i] = instance_find(obj_Player,i)
		
			//draw player0 health bar
			scr_slider(camera_get_view_x(view_camera[0]) + profileSize + healthOffset + profileOffsetX +(400-i*400)*gamepad_is_connected(1), camera_get_view_y(view_camera[0]) + profileSize + healthOffset-25, borderWidth,  healthLength, healthHeight, Player[i].PlayerHealth/Player[i].MaxPlayerHealth, borderColor, c_red, c_green);
			//draw player0 XP bar
			scr_slider(camera_get_view_x(view_camera[0]) + profileSize + healthOffset + profileOffsetX +(400-i*400)*gamepad_is_connected(1), camera_get_view_y(view_camera[0]) + profileSize + healthOffset, borderWidth,  healthLength, healthHeight/2, Player[i].PlayerXp/Player[i].MaxPlayerXP, borderColor, c_red, c_green);
	
			//draw player0 profile
			draw_rectangle_color(camera_get_view_x(view_camera[0]) + profileOffsetX+(400-i*400)*gamepad_is_connected(1),camera_get_view_y(view_camera[0]) + profileOffsetY - borderWidth, camera_get_view_x(view_camera[0]) + profileSize + profileOffsetX + borderWidth*2+(400-i*400)*gamepad_is_connected(1),camera_get_view_y(view_camera[0]) + profileSize + profileOffsetY + borderWidth,borderColor, borderColor,borderColor, borderColor, false);
			draw_sprite_ext(Player[i].playerProfile, 0, camera_get_view_x(view_camera[0]) + profileOffsetX + borderWidth + sprite_get_xoffset(Player[i].playerProfile)+(400-i*400)*gamepad_is_connected(1), camera_get_view_y(view_camera[0]) + profileOffsetY+ sprite_get_yoffset(Player[i].playerProfile), profileSize/sprite_get_width(s_Player), profileSize/sprite_get_width(s_Player),0,c_white,1 );
	
			//draw player0 name
			//playerName = instance_find(obj_Player, 0).name;
			textOffsetX = 3
			draw_set_color(borderColor);
			draw_set_alpha(1);
			draw_set_font(NameFont);
			draw_set_halign(fa_left);
			draw_outlined_text(camera_get_view_x(view_camera[0])+profileSize + healthOffset + textOffsetX+(400-i*400)*gamepad_is_connected(1),camera_get_view_y(view_camera[0])+profileSize + healthOffset - 35, Player[i].name, c_dkgray, c_ltgray);
		
			//draw player0 level
			draw_outlined_text(camera_get_view_x(view_camera[0])+profileSize + healthOffset + textOffsetX+130+(400-i*400)*gamepad_is_connected(1),camera_get_view_y(view_camera[0])+profileSize + healthOffset - 35, Player[i].PlayerLevel, c_dkgray, c_ltgray);
		}
		//draw the player0 ability icon	
		if(global.equippedItem != noone)
		{
			abilityBoxSize = 60;
			abilityBackgroundColor = c_gray;
			ability1X = camera_get_view_x(view_camera[0]) - abilityBoxSize/2 + 100;
			ability1Y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])- abilityBoxSize/2 - 30;
			draw_rectangle_color(ability1X - abilityBoxSize/2,ability1Y - abilityBoxSize/2,ability1X + abilityBoxSize/2,ability1Y + abilityBoxSize/2, borderColor,borderColor,borderColor,borderColor,false);
			draw_rectangle_color(ability1X - abilityBoxSize/2+2,ability1Y - abilityBoxSize/2+2,ability1X + abilityBoxSize/2-2,ability1Y + abilityBoxSize/2-2, abilityBackgroundColor,abilityBackgroundColor,abilityBackgroundColor,abilityBackgroundColor,false);
			draw_sprite(s_FireBall,0,ability1X+2,ability1Y+4);
			scr_cooldown_box(ability1X, ability1Y, abilityBoxSize, abilityBoxSize, (player.MaxProjCount - player.ProjCount)/player.MaxProjCount, 1);
		}
	
		if(instance_find(obj_Player,0).PlayerHealth > 0)
		{
			//draw all monster health bars
			monsterHealthXOffset = -10;
			monsterHealthYOffset = -5;
			monsterHealthLength = 30;
			monsterHealthHeight = 5;
			monsterBorderWidth = 1;
			for (i = 0; i < instance_number(obj_Monster); i += 1)
			{
				monster = instance_find(obj_Monster,i);
				currentMonsterHealthLength = monsterHealthLength * monster.MaxHealth / 3;
				scr_slider(monster.x-sprite_get_xoffset(monster.sprite_index) + sprite_get_width(monster.sprite_index)/2 - currentMonsterHealthLength/2, monster.y+monsterHealthYOffset-sprite_get_yoffset(monster.sprite_index), monsterBorderWidth,currentMonsterHealthLength, monsterHealthHeight, monster.Health/monster.MaxHealth, c_black, c_red, c_green);
			}
		}
	}
}

if(global.testRoom && instance_exists(obj_Player))
{
	room_goto(room5);
	inst_78C8041E.x = 607;
	inst_78C8041E.y = 714;
	inst_4F75CE06.x = 637;
	inst_4F75CE06.y = 714;
	global.testRoom = false;
}