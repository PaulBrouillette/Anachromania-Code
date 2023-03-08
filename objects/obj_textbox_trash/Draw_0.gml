/// @desc
acceptKey = keyboard_check_pressed(vk_space);
if (!setup) {
	setup = true;
	draw_set_font(global.textboxFont);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//Loop through the pages
	
	//Find how many characters are on each page and store that number in the textLength array
	for (var i = 0; i < pageNumber; i++) {
		textLength[i] = string_length(text[i]);	
		
		//no character (center textbox on screen)
		if (speakerSprite[i] == noone) {
			textXOffset[i] = 44;
			extraWidth = 0;
		}
		else {
			textXOffset[i] = 80;
			portraitXOffset[i] = 8;
			extraWidth = 5;	
		}
		
		//Setting individual characters and finding out where linebreaks occur
		for (var c = 0; c < textLength[i]; c++) {
			var charPos = c + 1;
			//Store individual characters in char array
			char[c, i] = string_char_at(text[i], charPos);
			
			//Get current width of line
			var textUpToChar = string_copy(text[i], 1, charPos);
			var currentTextW = string_width(textUpToChar) - string_width(char[c, i]) + border;
			
			//Get last free space
			if (char[c, i] == " ") {
				lastFreeSpace = charPos + 1;	
			}
			
			//Get the line breaks
			if (currentTextW  - lineBreakOffset[i] > lineWidth) {
				lineBreakPosition[lineBreakNumber[i], i] = lastFreeSpace;
				lineBreakNumber[i]++;
				var textUpToLastSpace = string_copy(text[i], 1, lastFreeSpace);
				var lastFreeSpaceString = string_char_at(text[i], lastFreeSpace);
				lineBreakOffset[i] = string_width(textUpToLastSpace) - string_width(lastFreeSpaceString);
			}
		}
		//Getting each character coordinates
		for (var c = 0; c < textLength[i]; c++) {
			var charPos = c + 1;
			var textX = textBoxX + textXOffset[i] + border;
			var textY = textBoxY + border;
			
			//Get current width of line
			var textUpToChar = string_copy(text[i], 1, charPos);
			var currentTextW = string_width(textUpToChar) - string_width(char[c, i]);
			var textLine = 0;
			
			//Compensate for manual breaks
			for (var lb = 0; lb < lineBreakNumber[i]; lb++) {
				//If the current looping character is after a linebreak
				if (charPos >= lineBreakPosition[lb, i]) {
					var stringCopy = string_copy(text[i], lineBreakPosition[lb, i], charPos - lineBreakPosition[lb, i]);	
					currentTextW = string_width(stringCopy);
					
					//Record the line this character should be on
					textLine = lb + 1;
				}
			}
			//Add to x and y coordinates
			charX[c, i] = textX + currentTextW;
			charY[c, i] = textY + textLine * lineSeparation;
		}
	}
}

//Type the text
if (drawCharacter < textLength[page]) {
	drawCharacter += textSpeed;
	drawCharacter = clamp(drawCharacter, 0, textLength[page]);
}

//Flip through pages 
if (acceptKey) {
	//If the typing is done
	if (drawCharacter == textLength[page]) {
		//next page
		if (page < pageNumber - 1) {
			page++;
			drawCharacter = 0;
		}
		//Destory textbox
		else {
			//Link text for options
			if (optionNumber > 0) {
				CreateTextbox(optionLinkID[optionPosition])	
			}
			instance_destroy();
		}
	}	
	//If not done typing
	else {
		drawCharacter = textLength[page];	
	}
}

//Draw the texbox
var textBox_x = textBoxX + textXOffset[page];
textBoxImage += textBoxSpeed;
textBoxSpriteW = sprite_get_width(textBoxSprite[page]);
textBoxSpriteH = sprite_get_height(textBoxSprite[page]);

//Draw speaker
if (speakerSprite[page] != noone) {
	
	sprite_index = speakerSprite[page];
	var speakerX = textBoxX + portraitXOffset[page];
	if (speakerSide[page] == -1) {
		speakerX += sprite_width;	
	}
	//Draw box, remove later
	//draw_sprite_ext(textBoxSprite[page], textBoxImage, textBoxX + portraitXOffset[page], textBoxY, sprite_width / textBoxSpriteW, sprite_height / textBoxSpriteH, 0, c_white, 1);
	//Draw actual portrait
	draw_sprite_ext(sprite_index, image_index, speakerX + 7.3, textBoxY + 5, .93, .93, 0, c_white, 1);
}


//Back of the textbox
draw_sprite_ext(textBoxSprite[page], textBoxImage, textBox_x - 5, textBoxY, textboxWidth / textBoxSpriteW - .2, textboxHeight / textBoxSpriteH, 0, c_white, 1);

//Draw option popups
if ((drawCharacter == textLength[page]) && (page == pageNumber - 1)) {
	
	//Option selection
	optionPosition += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	optionPosition = clamp(optionPosition, 0, optionNumber - 1);
	
	
	//Vertical distance between options
	var optionSpace = 15;
	//Space between text and border of box
	var optionBorder = 4;
	
	for (var op = 0; op < optionNumber; op++) {
		
		//Box that option will reside in
		var optionWidth = string_width(option[op]) + optionBorder * 2;
		draw_sprite_ext(textBoxSprite[page], textBoxImage, textBox_x + 16 - extraWidth, textBoxY - optionSpace * optionNumber + optionSpace * op, optionWidth / textBoxSpriteW, (optionSpace -1) /textBoxSpriteH, 0, c_white, 1);
		
		//Draw arrow
		if (optionPosition == op) {
			draw_sprite(spr_TextboxArrow, 0, textBox_x - extraWidth, textBoxY - optionSpace * optionNumber + optionSpace * op);
		}
		
		//Draw option text
		draw_text(textBox_x + 16 + optionBorder - extraWidth, textBoxY - optionSpace * optionNumber + optionSpace * op + 2, option[op]);
	}
}

//Draw the text
for (var c = 0; c < drawCharacter; c++) {
	draw_text(charX[c, page] - extraWidth, charY[c, page], char[c, page]);	
}