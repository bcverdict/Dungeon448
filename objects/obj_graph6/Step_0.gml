instance_create_depth(x+offx*cos(image_angle*pi/180),y+offy*sin(image_angle*pi/180),-1000,obj_pen_perm);
instance_create_depth(x+offx*cos((image_angle+90)*pi/180),y+offy*sin((image_angle+90)*pi/180),-1000,obj_pen_perm);
instance_create_depth(x+offx*cos((image_angle+180)*pi/180),y+offy*sin((image_angle+180)*pi/180),-1000,obj_pen_perm);
instance_create_depth(x+offx*cos((image_angle+270)*pi/180),y+offy*sin((image_angle+270)*pi/180),-1000,obj_pen_perm);
x=x+2*cos((image_angle+const)*pi/180)
y=y+2*sin((image_angle+const)*pi/180)
const+=2;
//image_angle+=1;