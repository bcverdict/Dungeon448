instance_create_depth(x+offx*image_xscale*cos(image_angle*pi/180),y+offy*image_yscale*sin(image_angle*pi/180),-1000,obj_pen);
instance_create_depth(x+offx*image_xscale*cos((image_angle+90)*pi/180),y+offy*image_yscale*sin((image_angle+90)*pi/180),-1000,obj_pen);
instance_create_depth(x+offx*image_xscale*cos((image_angle+180)*pi/180),y+offy*image_yscale*sin((image_angle+180)*pi/180),-1000,obj_pen);
instance_create_depth(x+offx*image_xscale*cos((image_angle+270)*pi/180),y+offy*image_yscale*sin((image_angle+270)*pi/180),-1000,obj_pen);
image_xscale = 2+sin(2*pi*image_angle*pi/180);
image_yscale = 2+sin(2*pi*image_angle*pi/180);
image_angle+=1;