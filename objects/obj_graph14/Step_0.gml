instance_create_depth(x+offx*(cos(image_angle*pi/180)+cos(image_angle*pi/180)*cos(5*image_angle*pi/180)),y+offy*(sin(image_angle*pi/180)+sin(image_angle*pi/180)*sin(5*image_angle*pi/180)),-1000,obj_pen);
//instance_create_depth(x+offx*cos((image_angle+90)*pi/180),y+offy*sin((image_angle+90)*pi/180),-1000,obj_pen);
//instance_create_depth(x+offx*cos((image_angle+180)*pi/180),y+offy*sin((image_angle+180)*pi/180),-1000,obj_pen);
//instance_create_depth(x+offx*cos((image_angle+270)*pi/180),y+offy*sin((image_angle+270)*pi/180),-1000,obj_pen);
//x=x+2*cos(image_angle*pi/180)
image_angle+=1;