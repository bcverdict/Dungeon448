instance_create_depth(x+offx*cos(image_angle*pi/180),y+offy*sin(image_angle*pi/180),-1000,obj_pen_destroy);
instance_create_depth(x+offx*cos((image_angle+90)*pi/180),y+offy*sin((image_angle+90)*pi/180),-1000,obj_pen_destroy);
instance_create_depth(x+offx*cos((image_angle+180)*pi/180),y+offy*sin((image_angle+180)*pi/180),-1000,obj_pen_destroy);
instance_create_depth(x+offx*cos((image_angle+270)*pi/180),y+offy*sin((image_angle+270)*pi/180),-1000,obj_pen_destroy);
//x=x+2*cos(image_angle*pi/180);
offx--;
offy--;
if(offx==0)
{
	offx=34;
	offy=34;
}
image_angle+=1;