//x, y, borderWidth, length, height, slider percent, border color, background color, slider color
sliderX = argument0;
sliderY = argument1;
borderWidth = argument2;
length = argument3;
height = argument4;
sliderPercent = argument5;
borderColor = argument6;
backgroundColor = argument7;
sliderColor = argument8;

//border rect
draw_rectangle_color(sliderX - borderWidth, sliderY - borderWidth, sliderX + length + borderWidth, sliderY + height + borderWidth, borderColor, borderColor, borderColor, borderColor, false);
//background rect
draw_rectangle_color(sliderX, sliderY, sliderX + length, sliderY + height, backgroundColor, backgroundColor, backgroundColor, backgroundColor, false);
//slider rect
draw_rectangle_color(sliderX, sliderY, sliderX + sliderPercent * length, sliderY + height, sliderColor, sliderColor, sliderColor, sliderColor, false);