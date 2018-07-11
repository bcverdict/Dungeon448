//when searching is done (the monster has waited for the player to re-enter aggro range)
ReturnPath = path_add(); //create a new path that takes the monster back to the start of their patrol
mp_potential_path(ReturnPath, path_get_x(PatrolPath, 0), path_get_y(PatrolPath, 0), MoveSpeed, 4, 0); //set a path to the beginning of the patrol
path_start(ReturnPath, MoveSpeed, path_action_stop, true); //return to the beginning of the patrol

SearchTimer = false; //the search timer is no longer set
CurrentState = MonsterMovementState.ReturningState; //move to the returning state