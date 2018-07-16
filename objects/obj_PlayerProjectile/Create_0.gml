/// @description Insert description here
// You can write your code in this editor
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

if(global.equippedItem != noone)//if the equip slot is not empty
{
	self.Damage = global.Projectiledamage;//projectile damage is set to the damage of the equipped item
}
else
{
	show_message("didn't find damage even though projectile fired");
}
imageDamageScale = 3
image_xscale = self.Damage/imageDamageScale + (imageDamageScale-1)/imageDamageScale
image_yscale = self.Damage/imageDamageScale + (imageDamageScale-1)/imageDamageScale

//animation related variables
DeleteProjectile = false; //a flag signalling the beginning of the explosion animation
DestructionSprite = s_FireBall_Explosion; //the projectile's death animation
DestructionEndFrame = 6; //the last frame in the projectile's death animation