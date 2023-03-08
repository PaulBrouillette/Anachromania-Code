/// @desc
moveSpeed = random_range(2, 5);

switch (irandom_range(0, 2)) {
	case 0:
		newX = choose(-1, 1) * moveSpeed;
		newY = choose(-1, 1) * moveSpeed;
	break;
	case 1:
		newX = 0;
		newY = choose(-1, 1) * moveSpeed;
	break;
	case 2:
		newX = choose(-1, 1) * moveSpeed;
		newY = 0;
	break;
}