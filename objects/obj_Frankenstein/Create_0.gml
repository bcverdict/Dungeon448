event_inherited();

Health = 5; //amount of health the monster has
MaxHealth = 5; //maximum amount of health the monster has

MoveSpeed = 2; //movement speed (in pixels per step) of the monster
StopRange = 10; //the range at which the monster will stop following the player
self.GaveXP = false;
MeleeDamage = 2; //amount of damage the monster's melee attack does
DamageType = "Melee"; //the type of damage the monster does, either Ranged or Melee
DefaultSprite = Frank_Movement; //the sprite that the monster will use by default
AttackAnimation = Frank_Attack; //the sprite that the monster will use when melee attacking
AttackEndFrame = 6; //the last frame of the attack animation
DeathAnimation = Frank_Death_Animation; //the sprite that the monster will use when it dies
DeathEndFrame = 8; //the last frame of the death animation