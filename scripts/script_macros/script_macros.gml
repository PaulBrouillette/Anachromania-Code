// Hmmm gee wiz I wonder how useful these things are now

//For sprite drawing directions of NPCS and player movement
#macro RIGHT 0
#macro UP 1
#macro LEFT 2
#macro DOWN 3

//Macros for arrays for enemies and players during battle
#macro HEALTH 0
#macro SKILLPOINTS 1
#macro SPEED 2
#macro DEFENSE 3
#macro MAGICDEFENSE 4
#macro ATTACKPOWER 5

//Macros for states

//Wait until told to do something
#macro IDLE_STATE 0

//State where damage will be dealt after calculations based on DRAWMAGIC, PHYSICAL_ATTACK_MINIGAME and DODGE_MINIGAME are made
#macro ATTACK_STATE 1

//When an enemy is attacking the player has to dodge the attacks in this state
#macro DODGE_STATE 2

//Recieve damage, then go to DEATH state
#macro HURT_STATE 3

//If after HURT state health goes below 0, delete this instance
#macro DEATH_STATE 4

//Used when player is drawing a magical attack
#macro DRAW_SPELL_STATE 5

//Minigame state for when player attacks with a physical attack
#macro PHYSICAL_ATTACK_MINIGAME_STATE 6

//Used to distinguish between players and enemies
//enum team {
//	PlayerTeam,
//	EnemyTeam
//}

enum BattleTeams {
	PlayerTeam,
	EnemyTeam
}
