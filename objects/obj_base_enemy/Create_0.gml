/// @desc State machine for any given enemy
randomize();
//Enemies can be customized based on their sprite, health,
//weapon, weaknesses, resistances, known skills and levels. 

weapon = instance_create_depth(0, 0, 10000, weapon);
level = enemyLevel;
magicLevel = enemyMagicLevel;
weaknessesList = weaknesses;
resistancesList = resistances;

//Original stats at the beginning of a battle
base[HEALTH] = healthPoints;
base[SKILLPOINTS] = skillPoints;
base[SPEED] = irandom_range(0, 20);
base[DEFENSE] = defense;
base[MAGICDEFENSE] = magicDefense;
base[ATTACKPOWER] = weapon.damage;

//Stats as they progress throughout the battle
current[HEALTH] = base[@HEALTH];
current[SKILLPOINTS] = base[@SKILLPOINTS];
current[SPEED] = base[@SPEED];
current[DEFENSE] = base[@DEFENSE];
current[MAGICDEFENSE] = base[@MAGICDEFENSE];
current[ATTACKPOWER] = base[@ATTACKPOWER];

//List of inflicted status effects. Is a ds_list rather than an array because it can change size.
currentStatusEffects = ds_list_create();

//Current state this instance is currently in
state = IDLE_STATE;

//When this instance is being targeting when the player selects a target, this gets set to true and the
//draw event draws an outline to reflect that.
drawTarget = false;

//Set to true after an instance's move is performed and finished, false after everyone has taken their turn.
turnFinished = false;

//If true, that means that this instance is the current selected target and an indicator will be drawn
//pointing to this instance to reflect that.
selected = false;

//How much damage will be passed in during an attack.
incomingDamage = 0;

//Used for when a target is damaged, the damage will float above their head
floaterNumberDamage = 0;

//Used for when an enemy is about to attack, text will appear above them
talker = choose(Talker1, Talker2, Talker3);

team = team.ENEMYTEAM;

draw_set_color(c_black);

image_speed = 0;

keyLayer = layer_get_id("KeyLayer");
cancelButtonLayer = layer_get_id("CancelButtonLayer");

dodgeSpeed = DodgeSpeed;
dodgeNumber = DodgeNumber;

depth = 200;