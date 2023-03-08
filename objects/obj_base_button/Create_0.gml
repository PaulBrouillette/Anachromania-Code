/// @desc Button for player to press in battle
enum ButtonState {
	ACTIVE, 
	INACTIVE
};

buttonState = ButtonState.ACTIVE;
image_speed = 0;
text = buttonText;
spellsLayer = layer_get_id("SpellsLayer");
spellButtonsLayer = layer_get_id("SpellButtonsLayer");
buttonLayer = layer_get_id("ButtonLayer");
cancelButtonLayer = layer_get_id("CancelButtonLayer");