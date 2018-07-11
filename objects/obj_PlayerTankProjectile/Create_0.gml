/// @description Insert description here
// You can write your code in this editor
damage = obj_Player.PreviousHealth-obj_Player.PlayerHealth;
if(gamepad_is_connected(0))
{
	image_angle = obj_Arrow.image_angle;
	direction = obj_Arrow.direction;
}
else
{
	image_angle = point_direction(x, y, mouse_x, mouse_y);
	self.direction=point_direction(x, y, mouse_x, mouse_y);
}
self.speed=15;
imageDamageScale = 3
image_xscale = damage/imageDamageScale + (imageDamageScale-1)/imageDamageScale
image_yscale = damage/imageDamageScale + (imageDamageScale-1)/imageDamageScale

//animation related variables
DeleteProjectile = false; //a flag signalling the beginning of the explosion animation
DestructionSprite = s_FireBall_Explosion; //the projectile's death animation
DestructionEndFrame = 6; //the last frame in the projectile's death animation