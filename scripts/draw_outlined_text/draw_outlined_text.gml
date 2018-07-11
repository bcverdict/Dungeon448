x = argument[0];
y = argument[1];
text = argument[2];
textColor = draw_get_color();
outlineColor = c_black;
if(argument_count > 3)
	textColor = argument[3];
if(argument_count > 4)
	outlineColor = argument[4];

prevColor = draw_get_color();
draw_set_color(outlineColor);
for( i = -1; i <= 1; i++){
	for( j = -1; j <= 1; j++){
		draw_text(x + i, y + j, text);
	}
}
draw_set_color(textColor)
draw_text(x,y,text);
draw_set_color(prevColor)