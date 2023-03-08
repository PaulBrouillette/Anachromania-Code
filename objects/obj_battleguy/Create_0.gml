/// @desc
randomize();
image_speed = 0;

// Individual stats
maxHealth = _myHealth;
myHealth = _myHealth;
defense = _defense;
mySpeed = irandom_range(1, 20);
// invulnerableTime of .5 = .5 seconds, 1 = 1 second, etc
invulnerableTime = _invulnerableTime;

// If player hits them, they become temporarily invulnerable
invulnerable = false;
// If player is currently hitting them, i.e. if the weapon is on their sprite
currentlyHitting = false;
//Used to determine if enemy is dead
dead = false;
// Determines if they have done a move this turn
turnFinished = false;
// Determines if it's their turn
currentlySelected = false;
// Determines team
myTeam = BattleTeams.EnemyTeam;

justKilled = false;

// The damage being dealt, subtracting it from health and sending it to obj_BattleNumber
damageToSend = 0;

enum EnemyBattlePhases {
	ENEMY_WAIT,
	ENEMY_ATTACK,
	ENEMY_HURT,
	ENEMY_DEAD
}
currentPhase = EnemyBattlePhases.ENEMY_WAIT;

xOffset = .9;
originalX = x;

textBoxWait = false;

indexInUnitsList = 0;