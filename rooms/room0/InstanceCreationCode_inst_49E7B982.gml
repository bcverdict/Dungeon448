//set the patrol path for the monster
PatrolPath = Room0DoorPatrol;

//starts the monster's patrol
path_start(PatrolPath, MoveSpeed, path_action_continue, true);