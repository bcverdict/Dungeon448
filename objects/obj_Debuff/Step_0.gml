if(!DebuffApplied) //if the debuff has not been applied yet
{
	switch(CurrentDebuffType)
	{
		case DebuffType.Slow:
			DebuffApplied = true; //the debuff is being applied
			if(Target)
			{
				with(AppliesTo) //code inside the instance the debuff is applied to
				{
					player_speed = player_speed/2; //reduce the instance's speed by 50%
				}
			}
			else
			{
				with(AppliesTo) //code inside the instance the debuff is applied to
				{
					MoveSpeed = MoveSpeed/2; //reduce the instance's speed by 50%
				}
			}
			alarm[0] = DebuffTime*game_get_speed(gamespeed_fps); //set a timer that will reset the instance's speed upon completion
		break;
	
		case DebuffType.Heal:
			DebuffApplied = true; //the debuff is being applied
			if(Target)
			{
				with(AppliesTo) //code inside the instance the debuff is applied to
				{
					if((PlayerHealth+(PlayerHealth*0.1)) <= MaxPlayerHealth) //if healing the player by 10% will not heal over their max health
					{
						PlayerHealth = PlayerHealth+(PlayerHealth*0.1); //heal the player by 10%
					}
					else //if healing by 10% would go over the max health
					{
						PlayerHealth = MaxPlayerHealth; //heal the player to max
					}
				}
			}
			else
			{
				with(AppliesTo) //code inside the instance the debuff is applied to
				{
					if((Health+(Health*0.1)) <= MaxHealth) //if healing the player by 10% will not heal over their max health
					{
						Health = Health+(Health*0.1); //heal the player by 10%
					}
					else //if healing by 10% would go over the max health
					{
						Health = MaxHealth; //heal the player to max
					}
				}
			}
			instance_destroy(); //delete the debuff
		break;
	
		case DebuffType.Polymorph:
			DebuffApplied = true; //the debuff is being applied
			if(AppliesTo.sprite_index != SlimeSprite) //only polymorph if the player isn't already polymorphed
			{
				with(AppliesTo) //code inside the instance the debuff is applied to
				{
					other.ResetValue = sprite_index; //store the current player sprite
					sprite_index = SlimeSprite; //make the player look like a slime
				}
				alarm[1] = DebuffTime*game_get_speed(gamespeed_fps); //set a timer that will reset the instance's sprite upon completion
			}
			else
			{
				instance_destroy(); //delete the debuff object
			}
		break;
	}
}