bounce = false;
damage = 1;
shouldBounce = false;
if(gamepad_is_connected(0))
{
	if((x==inst_4F75CE06.x)&&(y==inst_4F75CE06.y))
	{
		image_angle = global.Arrow0.image_angle;
		direction = global.Arrow0.direction;
	}
	else
	{
		image_angle = global.Arrow1.image_angle;
		direction = global.Arrow1.direction;
	}
}
else
{
	image_angle = point_direction(x, y, mouse_x, mouse_y);
	self.direction=point_direction(x, y, mouse_x, mouse_y);
}
self.speed=15;

//if(global.equippedItem != noone)//if the equip slot is not empty
//{
//	damage = 1;//projectile damage is set to the damage of the equipped item
//}
//imageDamageScale = 3
//image_xscale = damage/imageDamageScale + (imageDamageScale-1)/imageDamageScale
//image_yscale = damage/imageDamageScale + (imageDamageScale-1)/imageDamageScale

//animation related variables
DeleteProjectile = false; //a flag signalling the beginning of the explosion animation
DestructionSprite = s_FireBall_Explosion; //the projectile's death animation
DestructionEndFrame = 6; //the last frame in the projectile's death animation 
