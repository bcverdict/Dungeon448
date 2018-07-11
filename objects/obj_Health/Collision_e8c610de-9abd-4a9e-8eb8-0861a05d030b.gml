if((inst_78C8041E.PlayerHealth+5)<inst_78C8041E.MaxPlayerHealth)
{
	inst_78C8041E.PlayerHealth+=5;
}
else
{
	inst_78C8041E.PlayerHealth=inst_78C8041E.MaxPlayerHealth;
}

instance_destroy();	