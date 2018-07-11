if((global.MonsterNumber==0)&&(!self.healthSpawn))
{
	self.healthSpawn = true;
	instance_create_depth(x+50,y,-1000,obj_Health);
}