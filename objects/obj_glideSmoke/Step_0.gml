x=obj_Player.x;
y=obj_Player.y;
image_xscale = obj_Player.image_xscale;
counter--;
if(counter==0)
{
	instance_destroy(self);
}