move_bounce_solid(true);
if(!self.bounce)
{
	image_angle = direction;
	self.bounce=true;
	self.damage=2;
}
else
{
	self.DeleteProjectile = true; //destroys the projectile if the collision object is not water
}
