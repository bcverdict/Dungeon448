enum states
{
	normal,
	deflect,
	attack
}
if(gamepad_is_connected(1))
	inst_78C8041E.depth = layer_get_depth("Player_Instance");
inst_4F75CE06.depth = layer_get_depth("Player_Instance");
room.BossSpawned = false;