//Changes NPC's direction (sprite) based on how they are moving
function NPCAnimate(){
	//Moving right!
	if (x > previousX) {
		face = RIGHT;	
	}
	//Moving left!
	if (previousX > x) {
		face = LEFT;	
	}
	//Moving up!
	if (y < previousY) {
		face = UP;
	}
	//Moving down!
	if (y > previousY) {
		face = DOWN;	
	}
	sprite_index = sprite[face];
	
	//Make speak block follow NPC
	mySpeakBlock.x = x;
	mySpeakBlock.y = y;
}