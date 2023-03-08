/// @desc Draws words on top of a textbox

// The array from the script FindTextboxDialogue that contains the words to print onto the 
// textbox.
textArray = [""];

// The array of responses to choose from when replying to dialogue.
responses = [""];

// The portrait to draw with the text, if there is one
portrait = noone;

// The current screen the textArray is currently on, 0 being the first
currentIndex = 0;

// Out of every letter in the textArray, this is the current one being indexed
lengthAlong = 1;

// Checks to see if the length of the string is too far and adds a new line if necessary
index = 0;

// The string from textArray[currentIndex] as it is slowly built up and typed out
stringTotal = "";

// If the typewriter text is done, this is set to true.
doneTyping = false;

// After doneTyping is set to true, this is set to true as well. Used to advance dialogue if
// all the text isn't typed out yet
canContinueToNext = false;

// Appropriate x and y based on viewport to draw text
textX = camera_get_view_x(view_camera[0]) + 30;
textY = camera_get_view_y(view_camera[0]) + 159;
textXWithPortrait = camera_get_view_x(view_camera[0]) + 90;

// Portrait x and y, offset slightly to the right compared to regular text location
portraitX = camera_get_view_x(view_camera[0]) + 10;
portraitY = camera_get_view_y(view_camera[0]) + 153;