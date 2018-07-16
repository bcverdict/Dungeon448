//default character
LAttack = ((mouse_check_button_pressed(mb_left))||(gamepad_button_check_pressed(Playernum,gp_face2)));
if((LAttack)&&(ProjCount == 0))
{
	if(global.equippedItem != noone)//if an item is equipped
	{
		//offset = 35;
		//hypot = sqrt(power(mouse_x - x, 2) + power(mouse_y - y, 2))
		//myX = x + sprite_get_width(sprite_index)/2 * (mouse_x - x)/hypot - sprite_get_xoffset(sprite_index) + sprite_get_width(sprite_index)/2;
		//myY = y + sprite_get_height(sprite_index)/2 * (mouse_y - y)/hypot - sprite_get_yoffset(sprite_index) + sprite_get_height(sprite_index)/2
		var Proj = instance_create_layer(x, y,"Player_Instance",obj_PlayerProjectile);//create a projectile
		ProjCount++;//increment projectile count
	}
}

//Turn Around
if(MoveLeft+MoveRight!=0)
{
	image_xscale = sign(MoveLeft+MoveRight);
}
if((MoveLeft+MoveRight == 0)&&(MoveUp+MoveDown == 0))
{
	if(sprite_index != SlimeSprite && argument_count > 0) //if the player is not being polymorphed
	{
		sprite_index = argument[0];
	}
}
else
{
	if(sprite_index != SlimeSprite && argument_count > 1) //if the player is not being polymorphed
	{
		sprite_index = argument[1];
	}
}