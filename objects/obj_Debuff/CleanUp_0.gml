if(alarm[0] != -1)
{
	if(Target)
	{
		with(AppliesTo) //code inside the instance the debuff is applied to
		{
			player_speed = player_speed*2; //reset the instance's speed
			if(player_speed > MaxPlayerSpeed) //puts an upper limit on the player speed
			{
				player_speed = MaxPlayerSpeed;
			}
		}
	}
	else
	{
		with(AppliesTo) //code inside the instance the debuff is applied to
		{
			MoveSpeed = MoveSpeed*2; //reset the instance's speed
			if(MoveSpeed > MaxMoveSpeed) //puts an upper limit on the player speed
			{
				MoveSpeed = MaxMoveSpeed;
			}
		}
	}
}
if(alarm[1] != -1)
{
	with(AppliesTo) //code inside the instance the debuff is applied to
	{
		sprite_index = other.ResetValue; //reset the instance's speed
	}
}