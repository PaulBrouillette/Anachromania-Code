/// @desc Attacks targets with global.selectedSkill

//This is for when a player selects the attack button and selects a target.
if (global.targeting) {
	if (position_meeting(mouse_x, mouse_y, obj_Base_Enemy)) {
		//First check if a multi hit skill is selected:
		if (global.selectedSkill.hitsAllTargets) {
			for (var i = 0; i < ds_list_size(global.targets); i++) {
				ds_list_add(global.selectedTargets, ds_list_find_value(global.targets, i));	
			}
			with (global.selectedUnit) {
				state = ATTACK_STATE;	
			}
		}
		else {
			var unit = instance_position(mouse_x, mouse_y, obj_Base_Enemy);
			ds_list_add(global.selectedTargets, unit);
			with (global.selectedUnit) {
				state = ATTACK_STATE;	
			}		
		}
			
		//After a move is chosen, get rid of any buttons on screen until another player is up
		layer_set_visible(buttonLayer, false);
		instance_deactivate_layer(buttonLayer);
		layer_set_visible(cancelButtonLayer, false);
		instance_deactivate_layer(cancelButtonLayer);
		moveSelected = true;
		global.targeting = false;
	}		

}

//If an enemy is up, announce their name and move and when clicked, make a dodge minigame
if (combatPhase = phases.ANNOUNCEATTACK) {
	moveSelected = true;
	with (global.selectedUnit) {
		state = DODGE_STATE;	
	}
	unitsFinished++;
	combatPhase = phases.PROCESS;
}

if (combatPhase = phases.BATTLESTART) {
	combatPhase = phases.STARTTURN;	
}
