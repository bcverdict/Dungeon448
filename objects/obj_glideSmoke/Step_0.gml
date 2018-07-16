
x=instance_nearest(x,y,obj_Player).x;
y=instance_nearest(x,y,obj_Player).y;
image_xscale = NearestPlayer.image_xscale;
counter--;
if(counter==0)
{
	instance_destroy(self);
}