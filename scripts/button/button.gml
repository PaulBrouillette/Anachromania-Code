//Button scripts
function AttackButton(){
	//If already had pressed the attack button but if the user wants to cancel, set back to attack text
	if (global.targeting) {
		if (buttonState = ButtonState.ACTIVE) {
				
		}
		global.targeting = false;
		global.selectedSkill = noone;	
		text = "Assail";
	}
	//Else, go to targeting
	else {
		global.targeting = true;
		global.selectedSkill = global.NormalAttack;
		text = "Cancel";
	}
}

function OpenSpellBookButton() {
	//Disable all other buttons and make spellbook + spells visible
	with (obj_Spell_Button) {
		clickable = true;	
	}
	layer_set_visible(spellsLayer, true);
	instance_activate_layer(spellsLayer);
	layer_set_visible(spellButtonsLayer, true);
	instance_activate_layer(spellButtonsLayer);
	layer_set_visible(buttonLayer, false);
	instance_deactivate_layer(buttonLayer);
	layer_set_visible(cancelButtonLayer, true);
	instance_activate_layer(cancelButtonLayer);
}

//If the spellbook is open, this will close it and bring the player back to the options to attack, choose
//a skill, use an item or skip a turn

//Sets the spellbook, spells, and cancel button to deactivated, and makes the main buttons activated
function SpellCancelButton() {
	global.targeting = false;
	layer_set_visible(spellsLayer, false);
	instance_deactivate_layer(spellsLayer);
	layer_set_visible(spellButtonsLayer, false);
	instance_deactivate_layer(spellButtonsLayer);
	layer_set_visible(cancelButtonLayer, false);
	instance_deactivate_layer(cancelButtonLayer);
	layer_set_visible(buttonLayer, true);
	instance_activate_layer(buttonLayer);
	with (obj_Base_Button) {
		text = buttonText;	
	}
	with (obj_Spell_Button) {
		clickable = false;	
	}
	global.selectedSkill = noone;
}

//Allows player to forfeit their turn for whatever reason, marks their turn as over, and
//moves onto the next unit in line for their turn 
function SkipTurnButton() {
	global.targeting = false;
	with (global.selectedUnit) {
		turnFinished = true;
		state = IDLE_STATE;	
	}
	with (obj_BattleManager) {
			moveSelected = true;
			moveFinished = true;	
		}
}