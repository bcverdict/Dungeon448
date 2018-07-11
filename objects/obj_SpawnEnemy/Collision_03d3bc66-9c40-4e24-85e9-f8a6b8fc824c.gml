/// @description If player collides

self.visible = true; //make the object visible (starts calling draw event)
collision = true;
alarm[0] = 3;
if(keyboard_check_pressed((ord("E"))) && !run)//if select is pressed and the action is not already running
{
	run = true;//run the action
	
}