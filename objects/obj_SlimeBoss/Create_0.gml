//health
Health = 10; //amount of health the monster has
MaxHealth = 10; //maximum amount of health the monster has
FullDamageCooldown = 20;
CurrentDamageCooldown = FullDamageCooldown;

//movement and ranges
MoveSpeed = 4; //movement speed (in pixels per step) of the monster
MovePath = path_add(); //create a new path for the boss

//projectile
ProjectileDamage = 1; //amount of damage the monster's projectiles do
ProjectileCooldown = .25; //amount of time (in seconds) between firing a projectile
CanAttack = true; //flag indicating whether the monster can fire a projectile

//sprites
DeathAnimation = SlimeBossDeath; //the sprite that the monster will use when it dies
DeathEndFrame = 7; //the last frame of the death animation
ProjectileSprite = Slimeball; //the sprite that the monster's projectile will use
ProjectileDestruction = SlimeballExplosion; //the sprite that the projectile will use upon death
ProjectileDeathEndFrame = 5; //the last frame in the projectile's death animation

//other
myHurtbox = instance_create_layer(x,y,"Player_Instance",obj_Enemy_Hurtbox);
global.BossSpawned = true; //indicate that the boss has spawned

//delete the slimes in the room
for(i = 0; i < 4; i++) //iterates 4 times
{
	instance_destroy(instance_nearest(self.x, self.y, obj_Slime)); //deletes the nearest slime
}

