///@arg0 player number
Playernum = argument0;
MLeft = (keyboard_check(ord("A"))||(gamepad_axis_value(Playernum,gp_axislh)<0));
MRight = (keyboard_check(ord("D"))||(gamepad_axis_value(Playernum,gp_axislh)>0));
MUp = (keyboard_check(ord("W"))||(gamepad_axis_value(Playernum,gp_axislv)<0));
MDown = (keyboard_check(ord("S"))||(gamepad_axis_value(Playernum,gp_axislv)>0));
if(alarm[10]==-1)
{
	MGlide = (keyboard_check_pressed(ord("F"))||(gamepad_button_check_pressed(Playernum,gp_face3)));
}
else
{
	MGlide = 0;//input for glide
}
//11,time of glide
//10, glide cooldown
if((MGlide)&&(alarm[11]==-1))
{
	var Smoke = instance_create_depth(x,y,obj_Player.depth,obj_glideSmoke);
	Glide = 2;//speed multiplier for Glide
	alarm[10]=20;
	alarm[11]=5;
}
if(alarm[11]==-1)
{
	MoveLeft = 0;
	MoveRight = 0;
	MoveUp = 0;
	MoveDown = 0;
	Glide = 1;
}
if(MLeft)
{
	MoveLeft = -player_speed*Glide;
}
if(MRight)
{
	MoveRight = player_speed*Glide;
}
if(MUp)
{
	MoveUp = -player_speed*Glide;
}
if(MDown)
{
	MoveDown = player_speed*Glide;
}
//Horizontal Collision with solid
if(place_meeting(x+MoveLeft+MoveRight,y,obj_Solid))
{
	while(!place_meeting(x+sign(MoveLeft+MoveRight),y,obj_Solid))
	{
		x+=sign(MoveLeft+MoveRight);
	}
	MoveLeft = 0;
	MoveRight = 0;
}
//Vertical Collision with solid
if(place_meeting(x,y+MoveUp+MoveDown,obj_Solid))
{
	while(!place_meeting(x,y+sign(MoveUp+MoveDown),obj_Solid))
	{
		y+=sign(MoveUp+MoveDown);
	}
	MoveUp = 0;
	MoveDown = 0;
}
//Horizontal Collision with water
if(place_meeting(x+MoveLeft+MoveRight,y,obj_Water))
{
	while(!place_meeting(x+sign(MoveLeft+MoveRight),y,obj_Water))
	{
		x+=sign(MoveLeft+MoveRight);
	}
	MoveLeft = 0;
	MoveRight = 0;
}
//Vertical Collision with water
if(place_meeting(x,y+MoveUp+MoveDown,obj_Water))
{
	while(!place_meeting(x,y+sign(MoveUp+MoveDown),obj_Water))
	{
		y+=sign(MoveUp+MoveDown);
	}
	MoveUp = 0;
	MoveDown = 0;
}
//Turn Around
if(MoveLeft+MoveRight!=0)//flips character image to face directon character is moving
{
	image_xscale = sign(MoveLeft+MoveRight)*-1;
}
else if((MGlide)&&((MoveUp+MoveDown)==0))//if not moving and glide, glide in the direction character is facing
{
	if(sign(image_xscale))
	{
		MoveLeft = 2*player_speed;
	}
	else
	{
		MoveRight = 2*-player_speed;
	}
}
if(abs(MoveLeft+MoveRight)==abs(MoveUp+MoveDown))
{
	x+=sign(MoveLeft+MoveRight)*Glide*player_speed/sqrt(2);
	y+=sign(MoveUp+MoveDown)*Glide*player_speed/sqrt(2);
}
else
{
	x+=MoveLeft+MoveRight;
	y+=MoveUp+MoveDown;
}