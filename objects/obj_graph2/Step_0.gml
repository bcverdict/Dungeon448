instance_create_depth(x+offx*cos(image_angle*pi/180),y+offy*sin(image_angle*pi/180),-1000,obj_pen_destroy);
instance_create_depth(x+offx*cos((image_angle+90)*pi/180),y+offy*sin((image_angle+90)*pi/180),-1000,obj_pen_destroy);
instance_create_depth(x+offx*cos((image_angle+180)*pi/180),y+offy*sin((image_angle+180)*pi/180),-1000,obj_pen_destroy);
instance_create_depth(x+offx*cos((image_angle+270)*pi/180),y+offy*sin((image_angle+270)*pi/180),-1000,obj_pen_destroy);

center.x = x;
center.y = y;
x=x+2*cos(image_angle*pi/180)
image_angle+=5;