with(AppliesTo) //code inside the instance the debuff is applied to
{
	sprite_index = other.ResetValue; //reset the instance's speed
}

instance_destroy(); //delete the debuff object