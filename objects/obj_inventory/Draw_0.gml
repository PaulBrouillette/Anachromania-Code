/// @desc

// Inventory space
draw_sprite_stretched(spr_Inventory, 0, inventoryX, inventoryY, 12 + rowLength * 36, 12 + (((slotSize-1) div rowLength) + 1) * 36);

// Item Description space
draw_sprite_stretched(spr_Inventory, 0, 194, 8, 85, 156);

// Slots
for (var i = 0; i < slotSize; i++) {
	var xx = inventoryX + (i mod rowLength) * 36 + 8;
	var yy = inventoryY + (i div rowLength) * 36 + 8;
	var hover = (obj_Mouse.inventoryHover == id) && (obj_Mouse.slotHover == i);
	draw_sprite(spr_Slot, hover, xx, yy);
	if (inventory[i] != -1) {
		var alpha = 1.0;
		if (obj_Mouse.inventoryDrag == id) && (obj_Mouse.slotDrag == i) {
			alpha = 0.5;	
		}
		draw_set_alpha(alpha);
		draw_sprite(spr_Potion, inventory[i], xx, yy);
		draw_set_alpha(1.0);
	}
}

// Draw item description text
if (obj_Mouse.itemDrag != -1) {
	text = Get_ItemDescription(obj_Mouse.itemDrag);
	draw_text_ext(202, 16, text, 10, 70);
}
