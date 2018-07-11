/// @description Insert description here

var size = (random(1)*0.15)-0.1; //adds "flicker" to torch glow

//brightens lights when they overlap
var old_blend =gpu_get_blendmode();
gpu_set_blendmode(bm_add);


var old_filter = gpu_get_texfilter();//remember old filter (helps blur)
gpu_set_texfilter(true); //adds blur

//draws the torch glow
draw_sprite_ext(sprite20,0, x+34,y+34, 2.6+size,2.6+size,0,$4C7BFF,0.13);
draw_sprite_ext(sprite21,0, x-34,y-34, 5.6+size,5.6+size,0,$4C7BFF,0.13);

//resets everything
gpu_set_blendmode(old_blend);
gpu_set_texfilter(old_filter);