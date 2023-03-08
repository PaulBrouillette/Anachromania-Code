/// @desc Advance the dialogue 
// If the text is finished typing after the player presses space, proceed
// to typing the next text segment in the array
if (canContinueToNext) {
	currentIndex++;
	stringTotal = "";
	lengthAlong = 1;
	index = 0;
	doneTyping = false;
	canContinueToNext = false;
}
// Else, advance the dialogue, i.e. immediately draw out the rest of the dialogue
// so that the next space click will proceed the dialogue. Set the lengthAlong to
// 1000 to ensure that it will be far longer than the max length of any text
// segment (Length of 1000 would not fit, it's much too large)
else {
	lengthAlong = 1000;
	doneTyping = true;	
}