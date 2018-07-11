prevAlpha = draw_get_alpha();
prevColor = draw_get_color();

//--------------Draw Buttons--------------
//button dimensions
buttonX = argument0;//camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
buttonY = argument1;//camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/4 + buttonHeight;
buttonWidth = argument2;//155;
buttonHeight = argument3;//55;
buttonOffset = buttonHeight + 20;

//button vars
buttonIndex = argument4;
buttonPressed = argument5;
buttonText = argument6;
isButtonPressed = false;

//the colors for the normal button
darkGrey = make_color_rgb(137,137,137);
mediumGrey = make_color_rgb(183,183,183);
lightGrey = make_color_rgb(215,215,215);

//the colors for the hover button
darkGreen = make_color_rgb(0,166,81);
mediumGreen = make_color_rgb(53,181,74);
lightGreen = make_color_rgb(124,197,118);

//color offsets
mediumOffset = 1;
innerOffset = mediumOffset + 2;

//if the mouse is hobering over a button
if(mouse_x > buttonX - buttonWidth/2 && mouse_x < buttonX + buttonWidth/2 && mouse_y > buttonY - buttonHeight/2 && mouse_y < buttonY + buttonHeight/2){
	draw_roundrect_color(buttonX - buttonWidth/2, buttonY - buttonHeight/2, buttonX + buttonWidth/2, buttonY + buttonHeight/2, darkGreen, darkGreen, false);
	draw_roundrect_color(buttonX - buttonWidth/2 + mediumOffset, buttonY - buttonHeight/2 + mediumOffset, buttonX + buttonWidth/2 - mediumOffset, buttonY + buttonHeight/2 - mediumOffset, mediumGreen, mediumGreen, false);
		
	//if the mouse is pressed, draw the inside of the button a dark color
	if(mouse_check_button(1))
	{
		draw_roundrect_color(buttonX - buttonWidth/2 + innerOffset, buttonY - buttonHeight/2 + innerOffset, buttonX + buttonWidth/2- innerOffset, buttonY + buttonHeight/2- innerOffset, darkGreen, darkGreen, false);
		buttonPressed = buttonIndex;
	}
	//if the mouse isn't pressed, draw the inside of the button a light color
	else 
	{
		draw_roundrect_color(buttonX - buttonWidth/2 + innerOffset, buttonY - buttonHeight/2 + innerOffset, buttonX + buttonWidth/2- innerOffset, buttonY + buttonHeight/2- innerOffset, lightGreen, lightGreen, false);
		//run the functions for the button
		if(buttonPressed == buttonIndex)
		{
			isButtonPressed = true;
			buttonPressed = -1;
		}
	}
}
//if the mouse isn't hovered over the button
else
{
	if(buttonPressed == buttonIndex)
		buttonPressed = -1;
	draw_roundrect_color(buttonX - buttonWidth/2, buttonY - buttonHeight/2, buttonX + buttonWidth/2, buttonY + buttonHeight/2,darkGrey, darkGrey, false);
	draw_roundrect_color(buttonX - buttonWidth/2 + mediumOffset, buttonY - buttonHeight/2 + mediumOffset, buttonX + buttonWidth/2 - mediumOffset, buttonY + buttonHeight/2 - mediumOffset,mediumGrey, mediumGrey, false);
	draw_roundrect_color(buttonX - buttonWidth/2 + innerOffset, buttonY - buttonHeight/2 + innerOffset, buttonX + buttonWidth/2- innerOffset, buttonY + buttonHeight/2- innerOffset,lightGrey, lightGrey, false);
}

//draw the text for the button
draw_set_color(c_black);
draw_set_alpha(1);
draw_set_font(UIFont);
draw_text(buttonX, buttonY, buttonText);

draw_set_color(prevColor);
draw_set_alpha(prevAlpha);
//-------------End Draw Buttons--------------
return isButtonPressed;