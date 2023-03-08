/// @desc

index -= .007;
y -= .7;
if (index < 0) {
	instance_destroy();	
}

if (xOffset > 5 || xOffset < -5) {
	xOffsetDirection = -xOffsetDirection;	
}
xOffset += xOffsetDirection;
