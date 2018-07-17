if(place_meeting(x, y, obj_Char_Hurtbox)) //if colliding with the player
{
	NearestPlayer = instance_nearest(x,y,obj_Player);
	//take one damage
	if(instance_number(obj_Player)>0)
		NearestPlayer.PlayerHealth -= Damage;
	Damage = 0;
	DeleteProjectile = true;
				
	if(Debuff != noone) //if there is a debuff to apply
	{
		DebuffID = instance_create_depth(x, y, -10000, obj_Debuff) //create a debuff object and store its ID
		with(DebuffID) //code in the debuff object just created
		{
			AppliesTo = NearestPlayer; //store the id of the player this debuff is being applied to
			CurrentDebuffType = other.Debuff; //store the type of debuff this is
			DebuffTime = other.DebuffTime; //store the amount of time the debuff will last
		}
		Debuff = noone; //do not apply the debuff again
	}
}
if(instance_place(x, y, obj_Solid))
{
	with(instance_place(x, y, obj_Solid))
	{
		if(isWater == false)
		{
			with(instance_place(x,y,obj_MonsterProjectile))
			{
				DeleteProjectile = true;
			}
		}
	}
}
//death animation
if(DeleteProjectile)
{
	if(sprite_index != DestructionSprite) //if not playing the death animation
	{
		speed = 0; //do not move
		Damage = 0; //do not do damage
		
		sprite_index = DestructionSprite; //switch to the death animation
		image_index = 1; //play from the beginning of the animation
		image_speed = 1; //play the animation
	}
	if(image_index > 5) //if at the end of the animation
	{
		instance_destroy(); //delete the projectile
	}
}