if(run)
{
	instance_deactivate_all(true); //deactivate all objects
	
	if(keyboard_check_pressed(ord("E"))||(gamepad_button_check_pressed(0,gp_face1)))
	{
		run = false;
		instance_activate_all();
	}
}