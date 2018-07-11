NearestPlayer = instance_nearest(self.x, self.y, obj_Player); //finds the nearest player

//the monster will only do something if there is a player
if(NearestPlayer != noone)
{
	myHurtbox.image_xscale = image_xscale
	myHurtbox.x = x;
	myHurtbox.y = y;
	/*
	with(instance_place(x,y,myHurtbox))
	{
		if(place_meeting(x, y, obj_PlayerProjectile)) //if colliding with character projectile
		{
			with(instance_place(x,y,obj_PlayerProjectile))
			{
				global.temp_damage = damage; //sets the damage to the damage of the projectile
				DeleteProjectile = true; //destroy character projectile
			}
			with(instance_place(x,y,obj_Monster))
			{
				Health-=global.temp_damage; //take damage
			}
		}
	}
	*/
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
		switch(CultistMovementState)
		{
			case CultistMovement.Firing:
				CanAttack = true; //allow the cultist to fire
				alarm[0] = TeleportCooldown*game_get_speed(gamespeed_fps); //sets the cooldown until the cultist switches to teleport
				CultistMovementState = CultistMovement.Idle; //switch to idle to wait for the alarm to go off
			break;
			
			case CultistMovement.Teleporting:
				move_random(1,1); //move to a random place in the room
				while(place_meeting(self.x, self.y, all)) //while colliding with an object
				{
					move_random(1,1); //move to a different place in the room
				}
				alarm[1] = ProjectileCooldown*game_get_speed(gamespeed_fps); //sets the cooldown until the cultist switches to firing
				CultistMovementState = CultistMovement.Idle; //switch to idle to wait for the alarm to go off
			break;
			
			case CultistMovement.Idle:
				//do nothing while idle
			break;
		}
	}

	//death condition
	if(Health <= 0)
	{
		Health = 0; //sets health back to 0 in case it went below 0
		if(!self.GaveXP)
		{
			obj_Player.PlayerXp+=2;
			self.GaveXP = true;
		}
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
			if(room_get_name(room) == "room4")
			{
				if(irandom_range(0,1) == 0)
				{
					instance_create_layer(x,y,"Player_Instance",obj_greaterSpellbook);
				}
			}
			else
			{
				if(irandom_range(0,1) == 0)
				{
					instance_create_layer(x,y,"Player_Instance",obj_spellbook);
				}
			}
			global.MonsterNumber--;
			instance_destroy(myHurtbox);
			instance_destroy(); //destroy the monster
		}
	}
	
	//projectile attack
	if(CanAttack) //if the  cooldown is over
	{
		CanAttack = false; //reset the cooldown flag
		ProjectileID = instance_create_layer(x, y, "Player_Instance", obj_MonsterProjectile); //makes the projectile and stores its id
		var CurrentProjectileType = irandom_range(0,AmountProjectileTypes-1); //get a random number that will coorespond to a projectile type
		
		with(ProjectileID) //code within the projectile that was just created
		{
			switch(CurrentProjectileType) //change the projectile based on its type
			{
				case ProjectileType.Lightning:
					Damage = other.ProjectileDamage; //sets the projectile's damage
					ProjectileSprite = LightningProjectileSprite; //set the projectile's sprite
					DestructionSprite = LightningProjectileSprite_Explosion; //set the projectile's death sprite
					DestructionEndFrame = 8; //there is no death animation for the cultist's projectiles so just destroy immediately upon collision
					speed = 25; //lightning moves faster than regular projectiles
				break;
				
				case ProjectileType.SlowPlayer:
					Damage = other.ProjectileDamage; //sets the projectile's damage
					ProjectileSprite = BlueProjectileSprite; //set the projectile's sprite
					DestructionSprite = BlueProjectile_Explosion; //set the projectile's death sprite
					DestructionEndFrame = 6; //there is no death animation for the cultist's projectiles so just destroy immediately upon collision
					Debuff = DebuffType.Slow; //stores the type of debuff to apply
					DebuffTime = other.DebuffTime; //stores the amount of time the debuff will last
				break;
				
				case ProjectileType.HealPlayer:
					Damage = 0; //sets the projectile's damage
					ProjectileSprite = GreenProjectileSprite; //set the projectile's sprite
					DestructionSprite = GreenProjectileSprite_Explosion; //set the projectile's death sprite
					DestructionEndFrame = 6; //there is no death animation for the cultist's projectiles so just destroy immediately upon collision
					Debuff = DebuffType.Heal; //stores the type of debuff to apply
					DebuffTime = other.DebuffTime; //stores the amount of time the debuff will last
				break;
				
				case ProjectileType.PolymorphPlayer:
					Damage = other.ProjectileDamage; //sets the projectile's damage
					ProjectileSprite = PurpleProjectileSprite; //set the projectile's sprite
					DestructionSprite = PurpleFireball_Explosion; //set the projectile's death sprite
					DestructionEndFrame = 6; //there is no death animation for the cultist's projectiles so just destroy immediately upon collision
					Debuff = DebuffType.Polymorph; //stores the type of debuff to apply
					DebuffTime = other.DebuffTime; //stores the amount of time the debuff will last
				break;
				
				case ProjectileType.PolymorphSelf:
					instance_destroy(); //delete the projectile
				break;
				
				case ProjectileType.Default:
					Damage = 2; //sets the projectile's damage
					ProjectileSprite = other.ProjectileSprite; //set the projectile's sprite
					DestructionSprite = other.ProjectileDestruction; //set the projectile's death sprite
					DestructionEndFrame = 7; //there is no death animation for the cultist's projectiles so just destroy immediately upon collision
				break;
			}
		}
		
		if(CurrentProjectileType == ProjectileType.PolymorphSelf) //if the projectile was polymorph self
		{
			sprite_index = SlimeSprite; //look like a slime until next teleport
		}
	}
}