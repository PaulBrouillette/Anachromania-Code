/// @desc
image_index = 0;
invulnerable = false;
currentlyHitting = false;
x = originalX;
// If enemy runs out of health, they die
if (myHealth <= 0) {
	dead = true;
	currentPhase = 	EnemyBattlePhases.ENEMY_DEAD;
}
// Else, wait 
else {
	currentPhase = EnemyBattlePhases.ENEMY_WAIT;
}


