NearestPlayer = instance_nearest(self.x, self.y, obj_Player); //finds the nearest player
self.direction = point_direction(x, y, NearestPlayer.x, NearestPlayer.y);
self.image_angle = point_direction(x, y, NearestPlayer.x, NearestPlayer.y);
self.speed=15;
Damage = 0;
DeleteProjectile = false;
self.depth = 0;
self.target=true;

//debuff
Debuff = noone; //the type of debuff to apply upon collision with a character (if applicable, by default there is no debuff)
DebuffTime = 0; //amount of time (in seconds) to apply the debuff for

//sprites
ProjectileSprite = noone; //the sprite for the projectile
DestructionSprite = noone; //the death sprite for the projectile
DestructionEndFrame = 0; //the last frame in the death sprite animation