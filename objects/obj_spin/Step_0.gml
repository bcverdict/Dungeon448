instance_create_depth(x+offx*cos(image_angle*pi/180),y+offy*sin(image_angle*pi/180),-1000,obj_Particle);
instance_create_depth(x+offx*cos((image_angle+90)*pi/180),y+offy*sin((image_angle+90)*pi/180),-1000,obj_Particle);
instance_create_depth(x+offx*cos((image_angle+180)*pi/180),y+offy*sin((image_angle+180)*pi/180),-1000,obj_Particle);
instance_create_depth(x+offx*cos((image_angle+270)*pi/180),y+offy*sin((image_angle+270)*pi/180),-1000,obj_Particle);
image_angle+=5;
//show_message(string(cos(pi/2)));
