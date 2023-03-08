/// @description Insert description here
// You can write your code in this editor
spellsLayer = layer_get_id("SpellsLayer");
spellButtonsLayer = layer_get_id("SpellButtonsLayer");
cancelButtonLayer = layer_get_id("CancelButtonLayer");
startX = 92;
startY = 52;
//for (var i = 0; i < array_length(global.partyKnownSkills); i++) {
//	instance_create_layer(startX, startY, spellButtonsLayer, obj_Spell_Button);
//	with (instance_nearest(startX, startY, obj_Spell_Button)) {
//		associatedSkill = global.partyKnownSkills[@i];	
//	}
//	startY += 35;
//}
instance_create_layer(10, 256, cancelButtonLayer, obj_Base_Button);
with (instance_nearest(10, 256, obj_Base_Button)) {
	text = "Abandon";
	MainFunction = SpellCancelButton;	
}