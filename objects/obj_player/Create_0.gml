/// @desc


//State Machine
enum states {
	FREE,
	LOCKED
};

state = states.FREE;

//Movement Information
xSpeed = 0;
ySpeed = 0;
moveSpeed = 1;

//Sprite indexes based on direction
sprite[RIGHT] = spr_Player_Right;
sprite[UP] = spr_Player_Up;
sprite[LEFT] = spr_Player_Left;
sprite[DOWN] = spr_Player_Down;

//What direction player is facing
face = DOWN;

//Used during cutscenes to determine if sprite should be animating
animatable = false;

//Player statistics
name = "Ego";
level = 1;
magicLevel = 1;
totalExperience = 0;
maxSkillPoints = 20
currentSkillPoints = 20;
maxHealth = 100;
currentHealth = 100;
defense = 5;
magicDefense = 5;
weapon = obj_RustySword;
weaknesses = [COSMIC];
resistances = [CURSE, ICE];

previousX = x;
previousY = y;

step = 0;

walkLeft = 0;
walkRight = 0;
walkUp = 0;
walkDown = 0;
step = 0;
stepFinish = false;

image_index = 0;
