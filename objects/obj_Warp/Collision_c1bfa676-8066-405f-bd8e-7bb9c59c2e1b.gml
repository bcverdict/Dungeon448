/// @description Insert description here

NearestPlayer = instance_nearest(self.x, self.y, obj_Player);

if(NearestPlayer.player_speed != 0)
{
	_tempSpeed = NearestPlayer.player_speed;
}
NearestPlayer.player_speed = 0;
fadeOut = true;
if(drop)
{
	//room_goto(targetRoom);
	//NearestPlayer.x=targetX;
	//NearestPlayer.y;
}
else
{
	if(warp)
	{
		//show_message(_tempSpeed);
		
		room_goto(targetRoom);
		NearestPlayer.x=targetX;
		NearestPlayer.y=targetY;
	}
}
