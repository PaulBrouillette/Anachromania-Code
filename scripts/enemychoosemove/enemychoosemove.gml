//For any enemy, this script will choose a random move, pick a random target, and attack them.
function EnemyChooseMove(){
	//First, choose a move
	global.selectedSkill = global.selectedUnit.knownSkills[irandom_range(0, array_length(global.selectedUnit.knownSkills) - 1)];
	//Then, choose a target
	//If the move hits every target, then global.selectedTargets = global.targets
	if (global.selectedSkill.hitsAllTargets) {
		for (var i = 0; i < ds_list_size(global.targets); i++) {
			ds_list_add(global.selectedTargets, ds_list_find_value(global.targets, i));	
		}
	}
	//Else, shuffle the targets list and grab the first target from it and make it the global.selectedTarget
	else {
		ds_list_shuffle(global.targets);
		ds_list_add(global.selectedTargets, ds_list_find_value(global.targets, 0));
	}
	
	//Finally, attack the target(s) with the selected move!
	with (global.selectedUnit) {
			state = IDLE_STATE;	
		}	
		
	with (obj_BattleManager) {
		global.targeting = false;	
	}
}