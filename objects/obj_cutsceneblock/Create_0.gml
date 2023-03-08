/// @desc A cutscene occurs when player steps inside this block
//In the creation code of one of these bad boys, use:
/*
	textID = "BlockTest";
	oneTimeInteraction = true;
	destroyAfterPlayerX = 350;
	destroyAfterPlayerY = noone;

	if (obj_PrisonEventManager.cutsceneBlock1ToDestroy) {
		instance_destroy();	
	}
	
	Of course, replace with appropriate variables
*/

//TextID of dialogue
textID = "";

//Used to prevent player from getting stuck 
allow = true;
timer = 0;
timermax = 0.35;

//TextID
thisID = id;

//If this cutscene can be used more than once, this is false. If it is to be interacted with once
//then deleted, this is true
oneTimeInteraction = false;

//For special cases where if the player crosses a certain x or y position, the block destroys itself
destroyAfterPlayerX = noone;
destroyAfterPlayerY = noone;

//Used in a script to modify the associated manager's variables
managerScriptID = "";