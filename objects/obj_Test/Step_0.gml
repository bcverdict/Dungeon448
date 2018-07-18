if(alarm[1]==-1)
{
	i++;
	if(i==4)
		i=0;
	alarm[1]=50;
	ProjectileID = instance_create_layer(x, y, "Player_Instance", projTypes[i]); //makes the projectile and stores its id
}