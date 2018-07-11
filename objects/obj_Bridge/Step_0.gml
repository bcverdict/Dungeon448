/// @description Insert description here

if(run)
{
	//draws the bridge (1 row per second)
	counter++;
	if(counter >= 30) 
	{
	    scr_bridge();
	    counter = 0;
	}
	
	
	if(layer_get_visible("Bridge3_tiles"))//if the bridge is built
	{
		run = false;//stop running
	}
}