/// @description Insert description here

if(run)
{
	var _warp = instance_create_depth(self.x, self.y, layer_get_depth("Collision_Instance"), obj_Warp)
	_warp.targetRoom = _room;
	_warp.targetX = _x;
	_warp.targetY = _y+1;
	
}