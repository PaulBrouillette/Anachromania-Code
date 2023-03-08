/// @desc
var text = "";
var _cur_halign = draw_get_halign();
var _cur_valign = draw_get_valign();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Choose a text to display before an attack
if (combatPhase == phases.ANNOUNCEATTACK) {
	switch (attackText) {
		case 0:
			text = string(global.selectedUnit.name) + " attacks!";
			break
		case 1:
			text = "Here comes " + string(global.selectedUnit.name) + "!";
			break;
	}
	draw_text_transformed(576 / 2, 60, text, .4, .4, image_angle);
	draw_text_transformed(576 / 2, 80, "(Click anywhere to proceed)", .2, .2, image_angle);
	
}

if (combatPhase == phases.BATTLESTART) {
	draw_text_transformed(576 / 2, 100, "(Click anywhere to begin the battle)", .3, .3, image_angle);	
}

draw_text_transformed(room_width / 2, 20, "Ego and company combat the foes", .4, .4, image_angle);
draw_set_halign(_cur_halign);
draw_set_valign(_cur_valign);