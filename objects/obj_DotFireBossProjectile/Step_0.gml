if(alarm[0]==-1)
{
	instance_create_layer(x,y,"Player_Instance",obj_FireTrail);
	alarm[0]=1;
}
if(instance_place(x, y, obj_Player))//if colliding with collision object
{
	with(instance_place(x,y,obj_Player))
	{
		self.DotFire = true;
	}
}
if(instance_place(x, y, obj_Solid))//if colliding with collision object
{
	me = self;
	with(instance_place(x, y, obj_Solid))
	{
		with(instance_place(x,y, obj_DotFireBossProjectile))
		{
			me.DeleteProjectile = true; //destroys the projectile if the collision object is not water
		}
	}
}
if(DeleteProjectile)
{
	instance_destroy();
}