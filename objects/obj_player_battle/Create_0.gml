///// @desc Battle representation of a party member
randomize();
turnFinished = false;
mySpeed = irandom_range(1, 20);
myTeam = BattleTeams.PlayerTeam;
allotedAttackTime = 3;
dead = false;
indexInUnitsList = 0;
////weapon = instance_create_depth(0, 0, 10000, associatedObject.weapon);
//level = associatedObject.level;
//name = associatedObject.name;
//defense = associatedObject.defense;
//magicDefense = associatedObject.magicDefense;
//magicLevel = associatedObject.magicLevel;
//weaknessesList = associatedObject.weaknesses;
//resistancesList = associatedObject.resistances;
//knownSkills = global.partyKnownSkills;

////Original stats at the beginning of a battle
//base[HEALTH] = associatedObject.maxHealth;
//base[SKILLPOINTS] = associatedObject.maxSkillPoints;
//base[SPEED] = irandom_range(0, 20);
//base[DEFENSE] = associatedObject.defense;
//base[MAGICDEFENSE] = associatedObject.magicDefense;
//base[ATTACKPOWER] = associatedObject.weapon.damage;

////Stats as they progress throughout the battle, health and skillpoints may not
////start off at max, but the rest should
//current[HEALTH] = associatedObject.currentHealth;
//current[SKILLPOINTS] = associatedObject.currentSkillPoints;
//current[SPEED] = base[@SPEED];
//current[DEFENSE] = base[@DEFENSE];
//current[MAGICDEFENSE] = base[@MAGICDEFENSE];
//current[ATTACKPOWER] = base[@ATTACKPOWER];

////List of inflicted status effects. Is a ds_list rather than an array because it can change size.
////currentStatusEffects = ds_list_create();

////Current state this instance is currently in
//state = IDLE_STATE;

////When this instance is being targeting when the player selects a target, this gets set to true and the
////draw event draws an outline to reflect that.
//drawTarget = false;

////Set to true after an instance's move is performed and finished, false after everyone has taken their turn.
//turnFinished = false;

////If true, that means that this instance is the current selected target and an indicator will be drawn
////pointing to this instance to reflect that.
//selected = false;

////How much damage will be passed in during an attack.
//incomingDamage = 0;

//team = team.PLAYERTEAM;

//floaterNumberDamage = 0;

//healthColor = #d01414;
//skillColor = #7600dd;
//bgColor = #2e2e2e;

////Used during the DRAWATTACK_STATE
//timer = 0;

//image_speed = 0;