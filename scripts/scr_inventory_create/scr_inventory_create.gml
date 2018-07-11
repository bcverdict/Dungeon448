///@arg size
var inventory_size = argument0;
global.inventory = [];//initializes inventory array

//creates array of desired size
for(var i = 0; i < inventory_size; i++)
{
	global.inventory[i] = noone;//initializes all slots to noone
}