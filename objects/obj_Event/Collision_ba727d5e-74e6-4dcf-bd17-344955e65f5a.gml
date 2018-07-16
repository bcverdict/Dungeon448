/// @description If player collides

self.visible = true; //make the object visible (starts calling draw event)
collision = true;
alarm[0] = 3;
if((keyboard_check_pressed(ord("E"))||(gamepad_button_check_pressed(0,gp_face1))||(gamepad_button_check_pressed(1,gp_face1))) && !run)//if select is pressed and the action is not already running
{
	run = true;//run the action
}