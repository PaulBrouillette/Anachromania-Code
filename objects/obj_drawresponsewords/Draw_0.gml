/// @desc
for (var i = 0; i < array_length(rArray); i++) {
	if (rArray[i] == selected) {
		draw_set_color(c_yellow);
		draw_text(textX, textY + offset * i, rArray[i].res);
	}
	else {
		draw_set_color(c_black);
		draw_text(textX, textY + offset * i, rArray[i].res);
	}
}