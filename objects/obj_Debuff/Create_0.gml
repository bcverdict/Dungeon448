CurrentDebuffType = noone; //the type of debuff this is
AppliesTo = noone; //the instance this debuff is being applied to
Target = true;
DebuffApplied = false; //a flag that indicates whether the debuff has been applied or not
DebuffTime = 1; //amount of time (in seconds) before the debuff wears off
ResetValue = noone; //the original value of the variable being changed in the AppliesTo instance
enum DebuffType
{
	Slow,
	Heal,
	Polymorph
}