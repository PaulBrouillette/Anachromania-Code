/// @desc Creates all skills and spells

/*
struct = {
	name : The name of the spell
	damage : How much damage it will do
	damageRangeMin : Lower bound of extra damage
	damageRangeMax : Upper bound of extra damage
	cost: How many Spellbook pages it will cost
	element : The element of the spell
	statusChance : The chance of inflicting an element related status effect. 2 = 100% chance, 1.5 = 75% chance, 1 = 50% chance etc.
	hitsAllTargets : boolean to see if the skill hits all targets, true if yes, false if it only hits one target
	pattern : The drawable pattern associated with the skill
	patternSize : The width (and height since they're all square) of the pattern sprite
	mouseOverSprite : When in the spellbook, the associated sprite when mousing over a spell
	
	Probably will need:
	The sprite associated with the attack animation
	How long each status effect will last (in turns)
}
*/

#macro PHYSICAL 0
#macro FIRE 1
#macro ICE 2
#macro WATER 3
#macro LIGHTNING 4
#macro CURSE 5
#macro COSMIC 6
#macro GROUND 7
#macro WIND 8
#macro BLESS 9

//Physical skills
global.NormalAttack = {
	name : "Attack",
	damage : 1,
	cost : 0,
	element : PHYSICAL,
	statusChance : 0,
	hitsAllTargets : false
};

//Fire skills
global.Heat = {
	name : "Heat",
	damage : 7,
	damageRangeMin : 1,
	damageRangeMax : 7,
	cost : 1,
	element : FIRE,
	statusChance : .3,
	hitsAllTargets : false,
	pattern : spr_Heat,
	patternSize : 9,
	mouseOverSprite : spr_FireMouseOver
};
global.Blaze  = {
	name : "Blaze",
	damage : 30,
	damageRangeMin : 5,
	damageRangeMax : 15,
	cost : 4, 
	element : FIRE,
	statusChance : .5,
	hitsAllTargets : false,
	pattern : spr_Blaze,
	patternSize : 11,
	mouseOverSprite : spr_FireMouseOver
};
global.Char = {
	name : "Char",
	damage : 75,
	damageRangeMin : 15,
	damageRangeMax : 35,
	cost : 12,
	element : FIRE,
	statusChance : .7,
	hitsAllTargets : true,
	pattern : spr_Char,
	patternSize : 11,
	mouseOverSprite : spr_FireMouseOver
};
global.Inferno = {
	name : "Inferno",
	damage : 225,
	damageRangeMin : 35,
	damageRangeMax : 85,
	cost : 32,
	element : FIRE,
	statusChance : 1.2,
	hitsAllTargets : true,
	pattern : spr_Inferno,
	patternSize : 15,
	mouseOverSprite : spr_FireMouseOver
}
global.hamMolek = {
	name : "ham-Molek",
	damage : 615,
	damageRangeMin : 130,
	damageRangeMax : 225,
	cost : 55,
	element : FIRE,
	statusChance : 2,
	hitsAllTargets : true,
	pattern : spr_hamMolek,
	patternSize : 17,
	mouseOverSprite : spr_FireMouseOver
}

//Ice skills
global.Chill = {
	name : "Chill",
	damage : 6,
	damageRangeMin : 1,
	damageRangeMax : 4,
	cost : 1,
	element : ICE,
	statusChance : .3,
	hitsAllTargets : false
};
global.Nip = {
	name : "Nip",
	cost : 3,
	element : ICE,
	statusChance : .4
};
global.Shiver = {
	name : "Shiver",
	cost : 10,
	element : ICE,
	statusChance : .6
};
global.Numb = {
	name : "Numb",
	cost : 25,
	element : ICE,
	statusChance : 1
};
global.Frostbite = {
	name : "Frostbite",
	cost : 46,
	element : ICE,
	statusChance : 2
}
	
//Curse skills
global.Curse = {
	name : "Curse",
	cost : 2,
	element : CURSE,
	statusChance : .6
};
global.Hex = {
	name : "Hex",
	cost : 6,
	element : CURSE,
	statusChance : 1.1
};
global.Bewitch = {
	name : "Bewitch",
	cost : 18,
	element : CURSE,
	statusChance : 1.5
};
global.Doom = {
	name : "Doom",
	cost : 47,
	element : CURSE,
	statusChance : 2
};