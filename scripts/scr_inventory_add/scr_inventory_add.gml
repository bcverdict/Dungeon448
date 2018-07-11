///@arg0 item object being added
///@arg1 item object on the ground


var _item = argument0;//item being added
var _self = argument1;//item on the ground

for(var i = 0; i < array_length_1d(global.inventory); i++)
{
	current_item = global.inventory[i];
	if(current_item != noone)
	{
		if(current_item.object_index == asset_get_index("obj_spellbook"))
		{
			if(object_get_name(_item) == "obj_spellbook")//if the item is a spellbook
			{
				break;
			}
		}
		else if(current_item.object_index == asset_get_index("obj_greaterSpellbook"))
		{
			if(object_get_name(_item) == "obj_greaterSpellbook")
			{
				break;
			}
		}
	}
	else if(current_item == noone) //if inventory slot is empty
	{
		inv_item = instance_create_depth(0,0,0,_item);//create an instance of the object
		inv_item.sprite_index = _self.sprite_index;//copies the sprite from the object on the ground
		inv_item.description = _self.description;//copies the description from the object on the ground
		if(object_get_name(_item) == "obj_spellbook" || object_get_name(_item) == "obj_greaterSpellbook")//if the item is a spellbook
		{
			inv_item.damage = _self.damage;//copies the damage of the spellbook on the ground
		}
		inv_item.persistent = true; //make the item persistent so it doesn't despawn in inv between rooms
		global.inventory[i] = inv_item;//add the item to the open inventory slot
		//global.inventory[i].itemIndex = _selfSprite;
		break;//break out of loop to avoid filling all slots with duplicates
	}
}