/// @desc Block falls

//Speed difficulties:
//3: Quite easy, anything under 3 would be painfully simple
//4: Still easy, though a bit faster
//5: Moderately challenging, can be hard to recover from if a player misinputs only once
//6: Starting to get really hard, although an experienced keyboard warrior can still get every one
//7: More common to miss at least one block than to miss all of them
//8: Insanely challenging, although with practice can still dodge all
//9: Very hard, anything above 9 would be for the hardest enemies in the game

y += global.selectedUnit.dodgeSpeed;

if (place_meeting(x, y, obj_Key)) {
	image_index = 1;
	breakable = true;
}
else {
	image_index = 0;
	breakable = false;
}

if (y > 450) {
	instance_destroy();	
}

