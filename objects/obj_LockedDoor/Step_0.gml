if(Message != UnlockedMessage)
{
	for(i = 0; i < array_length_1d(global.inventory); i++) //iterate through the inventory
	{
		if(global.inventory[i] != noone) //if there is an object in the inventory slot
		{
			if(global.inventory[i].object_index == asset_get_index("obj_key")) //if the key is in the player's inventory
			{
				Message = UnlockedMessage;
				break;
			}
		}
	}
}