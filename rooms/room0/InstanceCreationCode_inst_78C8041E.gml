self.Player = 1;
if(gamepad_is_connected(1))
{
	gamepad_set_axis_deadzone(1,0.25);
	global.Arrow1 = instance_create_layer(x,y,"Player_Instance",obj_Arrow);
}
else
	instance_destroy();
//var Arrow1 = instance_create_depth(self.x,self.y,-1000,obj_Arrow);
self.arrowBool = true;