NearestPlayer = instance_nearest(self.x, self.y, obj_Player); //finds the nearest player

//movement animation
if(path_speed == 0)
{
	image_speed = 0; //do not loop animations
	image_index = 1; //go to the default position
}
else
{
	image_speed = 1; //loop the animation
}
/*
//sprite direction
if(direction == 0) //if looking right
{
	image_xscale = 1; //set the sprite to look right
}
if(direction == 180) //if looking left
{
	image_xscale = -1; //set the sprite to look left
}
*/
//hitbox collision
if(instance_place(x, y, obj_Hitbox))
{
	Health -= 1; //take damage
}

switch(CurrentState)
{
	case MonsterMovementState.PatrolState:
	
		if(distance_to_object(NearestPlayer) < AggroRange) //if the player is within aggro range
		{
			CurrentState = MonsterMovementState.AggroState; //move to the aggro state
			AggroPath = path_add(); //create a new dynamic path, used to follow the player
		}
	break;
	case MonsterMovementState.SearchState:
	
		if(!SearchTimer) //if the search timer has not been set
		{
			path_delete(AggroPath); //delete the dynamic path since the monster is not following the player anymore
			alarm[2] = SearchTime*game_get_speed(gamespeed_fps); //the monster searches for the player (waits for the player to re-enter aggro range)
			SearchTimer = true; //the search timer has been set
		}
		
		if(distance_to_object(NearestPlayer) < AggroRange) //if the player reenters aggro range
		{
			CurrentState = MonsterMovementState.AggroState; //move to the aggro state
			AggroPath = path_add(); //create a new dynamic path, used to follow the player
			alarm[2] = -1; //the monster stops searching for the player
			SearchTimer = false; //the search timer is no longer set
		}
	break;
	case MonsterMovementState.ReturningState:
		
		if((x == path_get_x(PatrolPath, 0)) && (y == path_get_y(PatrolPath, 0))) //if the monster has arrived at its patrol
		{
			CurrentState = MonsterMovementState.PatrolState; //go back to patrolling
			path_delete(ReturnPath); //delete the path that returns to the patrol
			path_start(PatrolPath, MoveSpeed, path_action_continue, true); //start patrolling again
		}
		
		if(distance_to_object(NearestPlayer) < AggroRange) //if the player is within aggro range
		{
			CurrentState = MonsterMovementState.AggroState; //move to the aggro state
			AggroPath = path_add(); //create a new dynamic path, used to follow the player
		}
	break;
	case MonsterMovementState.AggroState:
	
		mp_potential_path(AggroPath, NearestPlayer.x, NearestPlayer.y, MoveSpeed, 4, 0); //set a path toward the player
		path_start(AggroPath, MoveSpeed, path_action_stop, 0); //start along that path
		
		if(distance_to_object(NearestPlayer) < StopRange) //if the player is within stop range
		{
			CurrentState = MonsterMovementState.StopState; //move to the stop state
		}
		
		if(distance_to_object(NearestPlayer) > AggroRange) //if the player leaves aggro range
		{
			CurrentState = MonsterMovementState.SearchState; //search for the player
		}
	break;
	case MonsterMovementState.StopState:
	
		path_end(); //stop moving along the path
		if((distance_to_object(NearestPlayer) < FleeRange) && (DamageType == "Ranged")) //if the player is within flee range
		{
			CurrentState = MonsterMovementState.FleeState; //move to the flee state
		}
		
		if(distance_to_object(NearestPlayer) > StopRange) //if the player leaves stop range
		{
			CurrentState = MonsterMovementState.AggroState; //move to the aggro state
		}
	break;
	case MonsterMovementState.FleeState:
	
		if(instance_number(obj_Monster) == 1) //if this is the last monster
		{
			mp_potential_path(AggroPath, irandom(room_height), irandom(room_width), MoveSpeed, 4, 0); //move to a random place, who cares where? You're the last monster and the player is coming toward you!
			path_start(AggroPath, MoveSpeed, path_action_stop, 0); //move! Move anywhere! Now!
		}
		else //if there are other monsters
		{
			Comrade = instance_find(obj_Monster, 0); //find a friend
			if(Comrade == self) //if the monster found was yourself
			{
				Comrade = instance_find(obj_Monster, 1); //find a different friend
			}
			CurrentState = MonsterMovementState.GettingHelpState; //go get some help
			mp_potential_path(AggroPath, Comrade.x, Comrade.y, MoveSpeed, 4, 0); //set a path toward your friend
			path_start(AggroPath, MoveSpeed, path_action_stop, 0); //start along that path
		}
		
		if(distance_to_object(NearestPlayer) > FleeRange) //if the player leaves flee range
		{
			CurrentState = MonsterMovementState.SearchState; //move to the search state
		}
	break;
	case MonsterMovementState.GettingHelpState:
	
		Comrade = instance_find(obj_Monster, 0); //find a friend
		if(Comrade == self) //if the monster found was yourself
		{
			if(instance_number(obj_Monster) == 1) //if this is the last monster
			{
				CurrentState = MonsterMovementState.FleeState; //there is no help for you
				Comrade = instance_find(obj_Monster, 0); //you are your only friend now...
			}
			else
			{
				Comrade = instance_find(obj_Monster, 1); //find a different friend
			}
		}
	
		if(distance_to_object(Comrade) > 100) //if the monster is still sufficently far away
		{
			mp_potential_path(AggroPath, Comrade.x, Comrade.y, MoveSpeed, 4, 0); //set a path toward your friend
			path_start(AggroPath, MoveSpeed, path_action_stop, 0); //start along that path
		}
		else //if close to the monster
		{
			CurrentState = MonsterMovementState.AggroState; //move to the flee state
		}
	break;
}