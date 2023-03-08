/// @desc
if (!alreadySelected) {
	if (array_length(rArray) != 0) {
		selected = rArray[selectedIndex];
		alreadySelected = true;
	}
}

// Choose response with W and S keys

// If player presses W and the response is not the top most one,
// move the selected response to the one above it
if (keyboard_check_pressed(ord("W"))) {
	if (selectedIndex != 0) {
		selectedIndex--;
		selected = rArray[selectedIndex];
	}
}

// If player presses S and the response is not the bottom most one,
// move the selected response to the one below it
if (keyboard_check_pressed(ord("S"))) {
	if (selectedIndex != array_length(rArray) - 1) {
		selectedIndex++;
		selected = rArray[selectedIndex];
	}
}

