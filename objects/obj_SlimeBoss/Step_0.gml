NearestPlayer = instance_nearest(self.x, self.y, obj_Player); //finds the nearest player
move_bounce_solid(false); //bounce off all solid objects upon collision

//the monster will only do something if there is a player
if(NearestPlayer != noone)
{

	//projectile attack
	myHurtbox.image_xscale = image_xscale
	myHurtbox.x = x;
	myHurtbox.y = y;
	if(CanAttack) //if the cooldown is over
	{
		CanAttack = false; //reset the cooldown flag
		
		ProjectileAngle = irandom_range(0,45); //the angle that the projectile will fire, starts at a random angle between 0 and 45
		for(i = 0; i < 8; i++) //shoot 8 projectiles
		{
			ProjectileID = instance_create_layer(x, y, "Player_Instance", obj_SlimeBossProjectile); //makes the projectile and stores its id
			ProjectileID.Damage = ProjectileDamage; //sets the projectile's damage
			ProjectileID.ProjectileSprite = ProjectileSprite; //set the projectile's sprite
			ProjectileID.DestructionSprite = ProjectileDestruction; //set the projectile's death sprite
			ProjectileID.DeathEndFrame = ProjectileDeathEndFrame; //set the last frame in the projectile's death animation
			ProjectileID.direction = ProjectileAngle; //point the projectile in the right direction
			ProjectileID.image_angle = ProjectileAngle*-32; //make sure the image also points in the correct direction
			
			ProjectileAngle += 45; //increase the angle by 45 degrees
		}
		
		alarm[0] = ProjectileCooldown*game_get_speed(gamespeed_fps); //sets the cooldown until the monster can shoot again
	}

	if(CurrentDamageCooldown!=FullDamageCooldown)
	{
		CurrentDamageCooldown++;
	}

/*
	//layer monster and character correctly
	if(NearestPlayer.y < self.y)
	{
		depth=-10;
	}
	else if(NearestPlayer.y > self.y)
	{
		depth=0;
	}
*/


	//movement
	if(Health > 0)
	{
		if(NearestPlayer.x < self.x)
		{
			image_xscale=-1;
		}
		else if(NearestPlayer.x > self.x)
		{
			image_xscale=1;
		}

		mp_potential_path(MovePath, NearestPlayer.x, NearestPlayer.y, MoveSpeed, 4, 0); //move toward the player
		path_start(MovePath, MoveSpeed, path_action_stop, 0); //move along the path
		
		//movement animation
		if(path_speed == 0)
		{
			image_speed = 0; //do not loop animations
			image_index = 1; //go to the default position
		}
		else
		{
			image_speed = 1; //loop the animation
		}

		//sprite direction
		if(direction == 0) //if looking right
		{
			image_xscale = 1; //set the sprite to look right
		}
		if(direction == 180) //if looking left
		{
			image_xscale = -1; //set the sprite to look left
		}
	}

	//death condition
	if(Health <= 0)
	{
		Health = 0; //sets health back to 0 in case it went below 0
		
		//don't let the monster move or attack
		MoveSpeed = 0;
		MeleeDamage = 0;
		ProjectileDamage = 0;
		CanAttack = false;
		path_end();
	
		if(sprite_index != DeathAnimation) //if the death animation is not playing
		{
			sprite_index = DeathAnimation; //switch to the death animation
			image_index = 0; //start at the beginning of the animation
		}
		image_speed = 1; //play the animation
	
		if(image_index > DeathEndFrame) //if the animation is done playing
		{
			instance_destroy(myHurtbox);
			instance_destroy(); //destroy the monster
			instance_create_layer(x, y, "Player_Instance", obj_key); //drop the key
		}
	}

}