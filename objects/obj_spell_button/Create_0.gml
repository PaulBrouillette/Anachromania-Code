/// @desc Buttons used to represent spells in the spellbook
spellsLayer = layer_get_id("SpellsLayer");
spellButtonsLayer = layer_get_id("SpellButtonsLayer");
buttonLayer = layer_get_id("ButtonLayer");
cancelButtonLayer = layer_get_id("CancelButtonLayer");

associatedSkill = AssociatedSkill;
//If mouse is over the spell, draw the cost
mouseOver = false;

//Used due to a glitch where if the player accidentally clicks over a button during an 
//enemy's turn, the cancel button will appear and the global.selectedSkill will become that,
//not what the enemy selected
clickable = false;

drawIndex = 0;

width = string_width(associatedSkill.name) * .2;
height = string_height(associatedSkill.name) * .2;

index = 0;