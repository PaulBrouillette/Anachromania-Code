/// @desc Base for any weapon
//Macros for weapon types
#macro TYPE_BLADE 0
#macro TYPE_CURVED_BLADE 1
#macro TYPE_AXE 2
#macro TYPE_BLUNT 3
#macro TYPE_BOW 4
#macro TYPE_POLEARM 5

name = Name;
description = Description;
damage = Damage;
//How much extra damage (irandom_range(0, damageRange)) will be applied
damageRange = DamageRange;

//The type of the weapon
weaponType = WeaponType;