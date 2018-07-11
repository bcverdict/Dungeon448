if(sprite_get_name(sprite_index) != sprite_get_name(argument0))
{
	sprite_index = argument0;
}
//Turn Around
if(MoveLeft+MoveRight!=0)
{
	image_xscale = sign(MoveLeft+MoveRight);
}
if(image_index <=4)
{
	obj = instance_create_depth(x,y,-10000,obj_Hitbox);
	var me = self;
	with(obj)
	{
		image_xscale = inst_78C8041E.image_xscale;
		with(instance_place(x,y,obj_Enemy_Hurtbox))
		{
			if(place_meeting(x,y,obj_Hitbox))
			{
				with(instance_place(x,y,obj_Monster))
				{
					if(CurrentDamageCooldown==FullDamageCooldown || mouse_check_button_pressed(mb_right) && CurrentDamageCooldown >= 8)
					{
						Health--;
						CurrentDamageCooldown = 0;
						me.sprite_index = argument0;
					}
				}
			}
		}
	}
	instance_destroy(obj);
}
else
{
	state = states.normal;
}