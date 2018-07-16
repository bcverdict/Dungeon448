for(i = 0; i<instance_number(obj_Player); i++)
{
	Player[i] = instance_find(obj_Player,i);
	if((Player[i].PlayerHealth+5)<Player[i].MaxPlayerHealth)
	{
		Player[i].PlayerHealth+=5;
	}
	else
	{
		Player[i].PlayerHealth=Player[i].MaxPlayerHealth;
	}
}
instance_destroy();	