switch(currentPlayer)
{	
	case playerSelect.DrBardas:
		name = "Dr. Bardas"
		playerProfile = s1_Player
		playerMoveSpr = s1_PlayerMovement;
		playerAttackSpr = s1_PlayerAttack;
		playerDyingSpr = s1_Death_Animation;
		playerDeadSpr = s1_Death_Down;
		break;
		
	case playerSelect.Kurt:
	default:
		name = "Kurt Slagle"
		playerProfile = s_Player
		playerMoveSpr = s_PlayerMovement;
		playerAttackSpr = s_PlayerAttack;
		playerDyingSpr = s_DeathAnimation;
		playerDeadSpr = s_Death_Down;
		break;
}
if((!arrowBool)&&(gamepad_is_connected(0)))
{
	instance_create_depth(x,y,0,obj_Arrow);
	arrowBool = true;
}
else if((arrowBool)&&(!gamepad_is_connected(0)))
{
	instance_destroy(obj_Arrow);
	arrowBool = false;
}
if(PlayerXp>=MaxPlayerXP)
{
	PlayerLevel+=1;
	global.PlayerAbilityCredits+=1;
	PlayerXp-=MaxPlayerXP;
}
if(TankCooldown<30)
{
	TankCooldown++;
	if(TankCooldown==30)
	{
		var Proj = instance_create_layer(x, y,"Player_Instance",obj_PlayerTankProjectile);//create a projectile
		PlayerHealth = PreviousHealth;
	}
}
if(PlayerHealth>0)//if the player is not dead
{
	if(BounceCooldown<30)
		BounceCooldown++;
	if(deflectCoolDown<20)
		deflectCoolDown++;
	dying = false;
	if(global.DeflectLeveled)
		Deflect = (keyboard_check_pressed(ord("E"))||(gamepad_button_check_pressed(0,gp_shoulderl)));
	RAttack = (mouse_check_button_pressed(mb_right)||(gamepad_button_check_pressed(0,gp_face1))) && sprite_get_name(sprite_index) != "SlimeSprite"; //right mouse click
	if(global.TankLeveled)
		Tank = (keyboard_check_pressed(ord("R"))||(gamepad_button_check_pressed(0,gp_shoulderr)))
	if(global.BounceLeveled)
		Bounce = ((keyboard_check_pressed(ord("H")))||(gamepad_button_check_pressed(0, gp_shoulderrb)));
	if((Deflect)&&(deflectCoolDown==20))
	{
		deflectCoolDown=0;
		state=states.deflect;
	}
	if(RAttack)//enters attack state
	{
		image_index = 0;
		state=states.attack;
	}
	if((Tank)&&(TankCooldown==30))//enters tank state
	{
		PreviousHealth = PlayerHealth;
		TankCooldown = 0;
	}
	if((Bounce)&&(BounceCooldown==30))
	{
		var Proj = instance_create_layer(x, y,"Player_Instance",obj_ProjectileBounce);//create a projectile
		BounceCooldown = 0;
	}
	scr_player_movement(); //movement script
	myHurtbox.image_xscale = image_xscale;
	var ThisPlayer = self; //stores the id of the current player
	//------------
	
	//----------
	switch(state)
	{
		case states.normal:
			scr_player_default(playerProfile, playerMoveSpr);
			break;
		case states.deflect:
			scr_player_deflect(playerAttackSpr);
			break;
		break;
		case states.attack:
			scr_player_attack(playerAttackSpr);
			break;
	}
	
	mid = true;


	if(x-370 < 0 && y-280 < 0)
	{
		camera_set_view_pos(view_camera[0], 0, 0);
		mid = false;
	}
	else if(x-370 < 0 && y+295 > room_height)
	{
		camera_set_view_pos(view_camera[0], 0, room_height-580);
		mid = false;
	}
	else if(x+410 > room_width&& y-280 < 0)
	{
		camera_set_view_pos(view_camera[0], room_width-780, 0);
		mid = false;
	}
	else if(x+410 > room_width && y+295 > room_height)
	{
		camera_set_view_pos(view_camera[0], room_width-780, room_height-580);
		mid = false;
	}
	else
	{
		if(x-370 < 0)
		{
			camera_set_view_pos(view_camera[0], 0, y-280);
			mid = false;
		}
	
		if(x+410 > room_width)
		{
			camera_set_view_pos(view_camera[0], room_width-780, y-280);
			mid = false;
		}
	
		if(y-280 < 0)
		{
			camera_set_view_pos(view_camera[0], x-370, 0);
			mid = false;
		}
	
		if(y+295 > room_height)
		{
			camera_set_view_pos(view_camera[0], x-370, room_height-580);
			mid = false;
		}
	}

	if(mid)
	{
		camera_set_view_pos(view_camera[0], x-370, y-280);
	}
	
	myHurtbox.x = x
	myHurtbox.y = y

}
else if (PlayerHealth <= 0 && !dying) //if player died
{
	sprite_index = playerDyingSpr;
	dying = true;
}	
else if (dying) //after player died
{
	if (image_speed > 0)//if death animation is stopped
	{
		if (image_index > image_number - 1)
		{
			sprite_index=playerDeadSpr; //still death sprite
		}
	}
}

if(keyboard_check_pressed((ord("G"))))
{
	god = !god;
	global.BounceLeveled = !global.BounceLeveled;
	global.TankLeveled = !global.TankLeveled;
	global.DeflectLeveled = !global.DeflectLeveled;
}

if(god)
{
	PlayerHealth = MaxPlayerHealth;
}
if(ProjCount >= MaxProjCount)
{
	ProjCount = 0;
}
else if(ProjCount != 0)
{
	ProjCount++;
}