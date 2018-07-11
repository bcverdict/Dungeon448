if(place_meeting(x,y,obj_Deflectbox))
{
	self.target = false;
	if(gamepad_is_connected(0))
	{
		self.direction = obj_Arrow.direction;
		self.image_angle = obj_Arrow.image_angle;
	}
	else
	{
		self.direction = point_direction(x, y, mouse_x, mouse_y);
		self.image_angle = point_direction(x, y, mouse_x, mouse_y);
	}
}
if((place_meeting(x, y, obj_Monster))&&(!self.target))
{
	//take one damage
	var me = self;
	with(instance_place(x,y,obj_Monster))
	{
		self.Health -= me.Damage;
	}
	Damage = 0;
	DeleteProjectile = true;
	if(Debuff != noone) //if there is a debuff to apply
	{
		DebuffID = instance_create_depth(x, y, -10000, obj_Debuff) //create a debuff object and store its ID
		with(DebuffID) //code in the debuff object just created
		{
			Target = false;
			AppliesTo = instance_place(x,y,obj_Monster); //store the id of the player this debuff is being applied to
			CurrentDebuffType = other.Debuff; //store the type of debuff this is
			DebuffTime = other.DebuffTime; //store the amount of time the debuff will last
		}
		Debuff = noone; //do not apply the debuff again
	}
}
if((place_meeting(x, y, obj_Char_Hurtbox))&&(target)) //if colliding with the player
{
	//take one damage
	inst_78C8041E.PlayerHealth -= Damage;
	Damage = 0;
	DeleteProjectile = true;
				
	if(Debuff != noone) //if there is a debuff to apply
	{
		DebuffID = instance_create_depth(x, y, -10000, obj_Debuff) //create a debuff object and store its ID
		with(DebuffID) //code in the debuff object just created
		{
			Target = true;
			AppliesTo = inst_78C8041E; //store the id of the player this debuff is being applied to
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
		if(!isWater)
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
		Debuff = noone; //do not apply a debuff
		
		sprite_index = DestructionSprite; //switch to the death animation
		image_index = 1; //play from the beginning of the animation
		image_speed = 1; //play the animation
	}
	if(image_index > DestructionEndFrame) //if at the end of the animation
	{
		instance_destroy(); //delete the projectile
	}
}
else //if the death animation is not going
{
	sprite_index = ProjectileSprite; //make sure you are set to the right sprite
}