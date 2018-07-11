//health
Health = 3; //amount of health the monster has
MaxHealth = 3; //maximum amount of health the monster has
FullDamageCooldown = 20;
CurrentDamageCooldown = FullDamageCooldown;
GaveXP = false;
//movement and ranges
MoveSpeed = 4; //movement speed (in pixels per step) of the monster 
MaxMoveSpeed = 4;
AggroRange = 250; //range at which the monster will start engaging the player
StopRange = 100; //range at which the monster will stop persuing the player and just fire
FleeRange = 50; //range at which the monster will go get help (or panic)
enum MonsterMovementState
{
	PatrolState,
	SearchState,
	ReturningState,
	AggroState,
	StopState,
	FleeState,
	GettingHelpState
}
CurrentState = MonsterMovementState.PatrolState;

//attack
ProjectileDamage = 1; //amount of damage the monster's projectiles do
ProjectileRange = 250; //range at which the monster will fire projectiles
ProjectileCooldown = 2; //amount of time (in seconds) between firing a projectile

MeleeDamage = 1; //amount of damage the monster's melee attack does
MeleeRange = 50; //the range at which the monster will start attempting melee attacks
MeleeCooldown = 1; //amount of time (in seconds) between melee attacks

CanAttack = true; //flag indicating whether the monster can attack

//sprites
DeathAnimation = SlimeDeath; //the sprite that the monster will use when it dies
DeathEndFrame = 7; //the last frame of the death animation
ProjectileSprite = Slimeball; //the sprite that the monster's projectile will use
ProjectileDestruction = SlimeballExplosion; //the sprite that the projectile will use upon death
ProjectileDeathEndFrame = 5; //the last frame in the projectile's death animation

//other
SearchTime = 2; //amount of time the monster will search for the player (time between disengaging and continuing patrol)
SearchTimer = false; //a flag that indicates whether the search timer has been set or not
DamageType = "Ranged"; //the type of damage the monster does, either Ranged or Melee
myHurtbox = instance_create_depth(x,y,-1000,obj_Enemy_Hurtbox);