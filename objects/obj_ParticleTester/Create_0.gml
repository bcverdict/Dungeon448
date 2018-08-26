first_Particle = part_type_create();
part_type_shape(first_Particle,pt_shape_square);
part_type_scale(first_Particle,1,1);
part_type_size(first_Particle,0.10,0.15,-0.001,0);

partEmitter= part_emitter_create(first_Particle);
