//set the patrol path for the monster
PatrolPath = Room1DoorPatrol;

//starts the monster's patrol
path_start(PatrolPath, MoveSpeed, path_action_continue, true);