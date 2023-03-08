/// @desc An interactable dialogue starting block

//In the creation code of one, do:  textID = "NameOfCase"; 

//The ID that each SpeakBlock will have, when interacted with this ID will be used as a reference for
//the relevant dialogue, found in a script
textID = "";

//Used to prevent players from getting stuck inside a SpeakBlock, if the player is near one and 
//activates it, then they will have to leave that space and return to it to interact again
alreadyInside = false;

timer = 0;
timermax = 0.25;
thisID = id;