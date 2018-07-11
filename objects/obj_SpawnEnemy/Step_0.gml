if(run)
{
	MonsterSpawned = instance_create_layer(SpawnX, SpawnY, "Player_Instance", MonsterType); //spawn the monster
	if((MonsterType == obj_Slime) || (MonsterType == obj_Frankenstein)) //if the monster uses a path
	{
		with(MonsterSpawned) //code within the monster just spawned
		{
			PatrolPath = other.PatrolPath; //set the patrol path for the monster
			path_start(PatrolPath, MoveSpeed, path_action_continue, true); //starts the monster's patrol
		}
	}
	run = false; //do not spawn again
}