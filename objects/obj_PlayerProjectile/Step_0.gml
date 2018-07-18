/// @description Insert description here
// You can write your code in this editor
var me = self;
if(place_meeting(x,y,obj_Enemy_Hurtbox))
{
	global.temp_damage = self.Damage;
	//show_message(temp_damage);
	DeleteProjectile = true; //destroy character projectile
	with(instance_nearest(x,y,obj_Monster))
	{
		Health-=global.temp_damage; //take one damage
	}
}
//------
else if(instance_place(x, y, obj_Solid))//if colliding with collision object
{
	with(instance_place(x, y, obj_Solid))
	{
		with(instance_place(x,y, obj_PlayerProjectile))
		{
			me.DeleteProjectile = true; //destroys the projectile if the collision object is not water
		}
	}
}

//death animation
if(DeleteProjectile)
{
	if(sprite_index != DestructionSprite) //if not playing the death animation
	{
		speed = 0; //do not move
		self.Damage = 0; //do not do damage
		
		sprite_index = DestructionSprite; //switch to the death animation
		image_index = 1; //play from the beginning of the animation
		image_speed = 1; //play the animation
	}
	if(image_index > DestructionEndFrame) //if at the end of the animation
	{
		instance_destroy(); //delete the projectile
	}
}