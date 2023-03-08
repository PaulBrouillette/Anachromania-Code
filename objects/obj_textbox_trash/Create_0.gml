/// @desc
textBoxX = camera_get_view_x(view_camera[0]) - 15;
textBoxY = camera_get_view_y(view_camera[0]) + 138;


textboxWidth = 230;
textboxHeight = 73;
extraWidth = 5;

textBoxSprite[0] = spr_Textbox;
textBoxImage = 0;
textBoxSpeed = 30 / 60;

//Distance of text from the edge of the textbox
border = 8;

//Vertical separation of lines of text
lineSeparation = 12;

//How long a line can be before wrapping to the next line
lineWidth = textboxWidth - border * 2;

//What page of dialogue it currently is
page = 0;
text[0] = "";
pageNumber = 0;
textLength[0] = string_length(text[0]);
char[0, 0] = "";
charX[0, 0] = 0;
charY[0, 0] = 0;
drawCharacter = 0;
textSpeed = .7;

//Responses
option[0] = "";
optionLinkID[0] = -1;
optionPosition = 0;
optionNumber = 0;

setup = false;
draw_set_font(global.textboxFont);

//Effects
SetDefaultsForText();
lastFreeSpace = 0;