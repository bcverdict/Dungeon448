
if(layer_get_visible("Bridge2_Tiles"))//if the second bridge layer is visible
{
	layer_set_visible("Bridge3_Tiles", true);//make the third bridge layer visible
}

if(layer_get_visible("Bridge1_Tiles"))//if the first bridge layer is visible
{
	layer_set_visible("Bridge2_Tiles", true);//make the second bridge layer visible
	layer_destroy("Bridge2_Collision");//destroy the second bridge collision layer
}

if(!layer_get_visible("Bridge1_Tiles"))//if the first bridge layer is not visible
{
	layer_set_visible("Bridge1_Tiles", true);//draw the first bridge layer
	layer_destroy("Bridge1_Collision");//destroy the first bridge collision layer
}
