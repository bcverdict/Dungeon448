NearestPlayer = instance_nearest(self.x, self.y, obj_Player); //finds the nearest player

//the monster will only do something if there is a player
if(NearestPlayer != noone)
{
	myHurtbox.image_xscale = image_xscale;
	myHurtbox.x = x;
	myHurtbox.y = y;
	global.temp_damage = 0;
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


	//death condition
	if(Health <= 0)
	{
		room.MonsterNumber--;
		Health = 0; //sets health back to 0 in case it went below 0
		//don't let the monster move or attack
		MoveSpeed = 0;
		MeleeDamage = 0;
		ProjectileDamage = 0;
		ProjectileRange = 0;
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
		}
	}
	
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
		//movement
		scr_monster_movement();
	
		//projectile attack
		if(CanAttack && (distance_to_object(NearestPlayer) < ProjectileRange) && (DamageType == "Ranged")) //if the player is within range and cooldown is over
		{
			CanAttack = false; //reset the cooldown flag
			ProjectileID = instance_create_layer(x, y, "Player_Instance", obj_MonsterProjectile); //makes the projectile and stores its id
			with(ProjectileID)
			{
				Damage = other.ProjectileDamage; //sets the projectile's damage
				ProjectileSprite = other.ProjectileSprite; //set the projectile's sprite
				DestructionSprite = other.ProjectileDestruction; //set the projectile's death sprite
				DeathEndFrame = other.ProjectileDeathEndFrame; //set the last frame in the projectile's death animation
			}
			alarm[0] = ProjectileCooldown*game_get_speed(gamespeed_fps); //sets the cooldown until the monster can shoot again
		}
	
		//melee attack
		if(CanAttack && (DamageType == "Melee") && (distance_to_object(NearestPlayer) < MeleeRange))
		{
			CanAttack = false; //reset the cooldown flag
			MonsterHitbox = instance_create_layer(x,y,"Player_Instance",obj_Enemy_Hitbox); //create a hitbox
			var AttackingMonster = self; //store the id of the attacking monster into a variable
		
			with(MonsterHitbox) //goes into the hitbox code
			{
				image_xscale = AttackingMonster.image_xscale; //scale the hitbox to the monster
				PlayerHurtbox = instance_place(x,y,obj_Char_Hurtbox); //checks if the hitbox is colliding with a player's hurtbox and stores the id if so
			
				if(PlayerHurtbox) //if there is a collision
				{
					with(PlayerHurtbox) //goes into the code for the hurtbox being collided with
					{
						with(instance_place(x,y,obj_Player)) //goes into the code for the player being attacked
						{
							PlayerHealth -= AttackingMonster.MeleeDamage;
						}
					}
				}
			}
		
			instance_destroy(MonsterHitbox); //delete the hitbox
			alarm[0] = MeleeCooldown*game_get_speed(gamespeed_fps); //sets the cooldown until the monster can attack again
		}
	}
}