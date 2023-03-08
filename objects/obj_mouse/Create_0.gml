/// @desc
inventoryHover = -1;
slotHover = -1;
inventoryDrag = -1;
slotDrag = -1;
itemDrag = -1;

inventoryX = camera_get_view_x(view_camera[0]) + 32;
inventoryY = camera_get_view_y(view_camera[0]) + 16;
rowLength = 4;

mouseOver = function() {
	// Empty hover results
	slotHover = -1;	
	inventoryHover = -1;
	
	// Mouse coordinates
	var mx = mouse_x;
	var my = mouse_y;
	
	with (obj_Inventory) {
		if (point_in_rectangle(mx, my, inventoryX, inventoryY, 12 + rowLength * 36, 12 + (((INVENTORY_SLOTS-1) div rowLength) + 1) * 36) + 100)
		{
			for (var i = 0; i < INVENTORY_SLOTS; i++) {
				var xx = inventoryX + (i mod rowLength) * 36 + 8;
				var yy = inventoryY + (i div rowLength) * 36 + 8;
				draw_sprite(spr_Slot, 0, xx, yy);
				if (point_in_rectangle(mx, my, xx, yy, xx + 32, yy + 32)) {
					other.slotHover = i;
					other.inventoryHover = id;
				}
			}
		}
	}
}
	
stateFree = function() {
	mouseOver();
	if (mouse_check_button(mb_left)) && (slotHover != -1) && (inventoryHover.inventory[slotHover] != -1) {
		state = stateDrag;
		itemDrag = inventoryHover.inventory[slotHover];
		inventoryDrag = inventoryHover;
		slotDrag = slotHover;
	}
}

stateDrag = function() {
	mouseOver();
	
	if (!mouse_check_button(mb_left)) {
		if (slotHover != -1) InventorySwap(inventoryDrag, slotDrag, inventoryHover, slotHover);	
				
		state = stateFree;
		itemDrag = -1;
		inventoryDrag = -1;
		slotDrag = -1;
	}	
}

state = stateFree;

with (obj_Player) {
	state = states.LOCKED;	
}