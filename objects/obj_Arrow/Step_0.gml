if((gamepad_axis_value(0,gp_axisrh)<=gamepad_get_axis_deadzone(0))&&(gamepad_axis_value(0,gp_axisrh)>=-gamepad_get_axis_deadzone(0))&&(gamepad_axis_value(0,gp_axisrv)<=gamepad_get_axis_deadzone(0))&&(gamepad_axis_value(0,gp_axisrv)>=-gamepad_get_axis_deadzone(0)))
{
	image_angle = direction;
}
else
{
	image_angle = point_direction(0, 0, gamepad_axis_value(0,gp_axisrh), gamepad_axis_value(0,gp_axisrv));
	direction = image_angle;
}
x = inst_78C8041E.x;
y = inst_78C8041E.y;