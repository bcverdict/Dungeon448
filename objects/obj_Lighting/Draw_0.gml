/// @description You can write your code in this editor

//remember alpha and color - prevents other object from going invisible
prevAlpha = draw_get_alpha();
prevColor = draw_get_color();

//creates the surface that will be drawn
if( !surface_exists(lighting_surf) )
{
	lighting_surf = surface_create(room_width>>light_scale_shift,room_height>>light_scale_shift);
}

//sets and clears the lightmap
surface_set_target(lighting_surf);
draw_clear_alpha($5c5c5c,1);

//resets the surface
surface_reset_target();

//draws the surface to "darken" the room
gpu_set_blendmode_ext(bm_dest_colour,bm_src_colour);
draw_surface_stretched_ext(lighting_surf,0,0, room_width,room_height,c_white,1);
gpu_set_blendmode(bm_normal);

//resets alpha and color
draw_set_alpha(prevAlpha);
draw_set_color(prevColor);