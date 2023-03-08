/// @desc Manages the flow of combat encounters
// This manager tells the combatants on screen what to do and when to do it. 
randomize();

enum phases {
	INIT,
	BATTLESTART,
	STARTTURN,
	WAIT,
	PROCESS,
	ENDTURN,
	ANNOUNCEATTACK,
	WIN,
	LOSE
}

//Current combat phase that the system is currently in.
combatPhase = phases.INIT;

//Number of units that are done with their turn to determine when to loop back and "restart" the system.
unitsFinished = 0;

//Used to determine if the screen can be clicked to perform actions. Used to prevent spam clicking.
allowInput = false;

//Used to say when the current move (attack, spell, item etc.) is done, and then move onto the next phase
//Gets set to true after the move "animation" is played.
moveFinished = false;

//Gets set to true after move is selected, false after turn is done.
moveSelected = false;

//List of every unit on the screen. When they die, they are removed from this list.
global.units = ds_list_create();

//Current unit who gets to choose an action.
global.selectedUnit = noone;

//Selected targets who get damaged by global.selectedUnit.
global.selectedTargets = ds_list_create();

//This of this as activating "targeting mode" when it is true. It gets set to true when the player selects an
//attack that would require them to select or target enemies. It is false when the have not done that yet or
//the cancel button is pressed.
global.targeting = false;

//A list of all potential targets on screen. When a party member's targets list fills up, it includes
//all units on screen as they can target enemies or other party members if they want to. 
global.targets = ds_list_create();

//The current skill that is to be performed 
global.selectedSkill = noone;

//Keeps track of how many teammates and enemies are alive in a battle
global.partyMembersAlive = 0;
global.enemiesAlive = 0;

//Used for dodging, drawing spells and physical attacks
global.successfulHits = 0;
global.totalPossibleHits = 6;

//Used for drawing enemies, the more enemies on screen there is the larger they are
global.enemyBattleScale = 1;

//Used for choosing the attack text to use
attackText = irandom_range(0, 1);

//References to the extra layers
buttonLayer = layer_get_id("ButtonLayer");
cancelButtonLayer = layer_get_id("CancelButtonLayer");
keyLayer = layer_get_id("KeyLayer");
spellsLayer = layer_get_id("SpellsLayer");

draw_set_font(font_Medieval);
