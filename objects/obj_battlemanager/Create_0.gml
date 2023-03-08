/// @desc
enum phase {
	INIT,
	StartTurn, // Maybe a textbox saying "a fight is imminent" or something and then continue
	ChooseCombatant, // Check if there is a side that has no more alive combatants. If both sides still
					 // have everyone, then global.selectedUnit becomes the next person in line
	ChooseMove,
	LoseBattle,
	WinBattle,
	BattleWait
}

combatPhase = phase.INIT;

// List of every unit on the screen. When they die, they are removed from this list.
global.units = ds_list_create();

// Current unit who gets to choose an action.
global.selectedUnit = noone;

// Keeps track of how many teammates and enemies are alive in a battle
global.partyMembersAlive = 0;
global.enemiesAlive = 0;

unitsFinished = 0;

beginningWait = false;

index = 0;