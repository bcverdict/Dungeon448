if((gamepad_axis_value(Playernum,gp_axisrh)<=gamepad_get_axis_deadzone(Playernum))&&(gamepad_axis_value(Playernum,gp_axisrh)>=-gamepad_get_axis_deadzone(Playernum))&&(gamepad_axis_value(Playernum,gp_axisrv)<=gamepad_get_axis_deadzone(Playernum))&&(gamepad_axis_value(Playernum,gp_axisrv)>=-gamepad_get_axis_deadzone(Playernum)))
{
	image_angle = direction;
}
else
{
	image_angle = point_direction(0, 0, gamepad_axis_value(Playernum,gp_axisrh), gamepad_axis_value(Playernum,gp_axisrv));
	direction = image_angle;
}
if(Playernum)
{
	x = inst_78C8041E.x;
	y = inst_78C8041E.y;
}
else
{
	x = inst_4F75CE06.x;
	y = inst_4F75CE06.y;
}