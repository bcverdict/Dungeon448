if(sprite_get_name(sprite_index) != sprite_get_name(argument0))
{
	sprite_index = argument0;
}
//Turn Around
if(MoveLeft+MoveRight!=0)
{
	image_xscale = sign(MoveLeft+MoveRight);
}
if(image_index <=4)
{
	obj = instance_create_depth(x,y,10000,obj_Deflectbox);
	with(obj)
	{
		image_xscale = inst_78C8041E.image_xscale;
	}
}
else
{
	state = states.normal;
}