/// @description Insert description here

while (i < global.totalPossibleHits) {
	instance_create_depth(choose(112, 200, 288, 376), previousY, -1000, obj_Block);
	previousY -= 74;
	i++;
}

