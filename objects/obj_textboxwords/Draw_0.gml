/// @desc Draws the words typewriter style
draw_set_color(c_black);

// If there is no portrait to print out, start typing at (30,159) with wrapping after 228 length
if (portrait == undefined) {
	// If the typewriter text hasn't finished typing out yet
	if (lengthAlong < string_length(textArray[currentIndex]) + 1) {
		stringTotal += string_char_at(textArray[currentIndex], lengthAlong);	
		index++;
		if (index >= 228) {
			stringTotal += "\n";
			index = 0;
		}
		lengthAlong++;
		draw_text_ext(textX, textY, stringTotal, 10, 228);
	}
	else {
		doneTyping = true;	
	}

	if (doneTyping) {
		draw_text_ext(textX, textY, textArray[currentIndex], 10, 228);
		canContinueToNext = true;
		
	}
}
// If there is a portrait, start the text at (90,159) with wrapping after 198 length
else {
	// If the typewriter text hasn't finished typing out yet
	if (lengthAlong < string_length(textArray[currentIndex]) + 1) {
		stringTotal += string_char_at(textArray[currentIndex], lengthAlong);	
		index++;
		if (index >= 198) {
			stringTotal += "\n";
			index = 0;
		}
		lengthAlong++;
		draw_text_ext(textXWithPortrait, textY, stringTotal, 10, 198);
	}
	else {
		doneTyping = true;	
	}

	if (doneTyping) {
		draw_text_ext(textXWithPortrait, textY, textArray[currentIndex], 10, 198);
		canContinueToNext = true;
	}
}

// If a portrait is present, draw it beside the text
if (portrait != undefined) {
	show_debug_message(portrait);
	draw_sprite_ext(portrait, 0, portraitX, portraitY, .95, .95, 0, -1, 1);
	//show_debug_message("portrait found")
}
else {
	//show_debug_message("no bortrait!");	
}