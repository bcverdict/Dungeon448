//center x, center y, length, width, cooldownTime, maxCount
abilityX = argument0;
abilityY = argument1;
abilityBoxLength = argument2;
abilityBoxHeight = argument3;
cooldownTimeLeft = argument4;
maxCount = argument5;
prevAlpha = draw_get_alpha();
prevColor = draw_get_color();
//-----------Draw Cooldown Cycle------------
//find the cooldown for the ability
if(cooldownTimeLeft > 0 && cooldownTimeLeft < 1) 
{
		
	//draw the cooldown box
	draw_set_color(c_black);
	draw_set_alpha(.75);
	draw_primitive_begin(pr_trianglefan);
			
		//draw the center point of the cooldown box
		draw_vertex(abilityX, abilityY);
			
		//draw the top center point of the cooldown box
		draw_vertex(abilityX, abilityY - abilityBoxHeight/2);
			
		//draw the corners of the cooldown box
		if(cooldownTimeLeft > .125) {draw_vertex(abilityX - abilityBoxLength/2, abilityY - abilityBoxHeight/2);}
		if(cooldownTimeLeft > .375) {draw_vertex(abilityX - abilityBoxLength/2, abilityY + abilityBoxHeight/2);}
		if(cooldownTimeLeft > .625) {draw_vertex(abilityX + abilityBoxLength/2, abilityY + abilityBoxHeight/2);}
		if(cooldownTimeLeft > .875) {draw_vertex(abilityX + abilityBoxLength/2, abilityY - abilityBoxHeight/2);}
			
		//draw the rotating edge of the cooldown box
		degreeOfRotation = -360 * (cooldownTimeLeft)-90;
		if((degreeOfRotation + 360 + 90) % 180 > 45 && (degreeOfRotation + 360 + 90) % 180 < 135){
			edgeConst = abs(abilityBoxLength/2/(cos(degtorad(degreeOfRotation))));
		}
		else{
			edgeConst = abs(abilityBoxHeight/2/(sin(degtorad(degreeOfRotation))));
		}
		cooldownX = cos(degtorad(degreeOfRotation)) * edgeConst;
		cooldownY = sin(degtorad(degreeOfRotation)) * edgeConst;
		draw_vertex(abilityX + cooldownX, abilityY + cooldownY);
	draw_primitive_end();
		
	//draw the cooldown time
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_set_font(UIFont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(abilityX, abilityY, string(ceil(cooldownTimeLeft * maxCount)));
	draw_set_alpha(prevAlpha);
	draw_set_color(prevColor);
	//-----------End Draw Cooldown Cycle------------
}