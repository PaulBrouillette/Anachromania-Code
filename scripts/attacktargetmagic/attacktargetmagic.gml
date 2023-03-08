// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AttackTargetMagic(target){
	
	//If the target's magicDefense is greater than the global.selectedUnit's attack, this penalty will be applied
	damageDeductor = 1;
	//If they have any weaknesses, this will become 2, if they have resistances, this will become .5. Will
	//be multiplied by the entire damage calculated before being returned. 
	damageMultiplier = 1;
	
	if (global.selectedSkill.damage - target.magicDefense <= 0) {
		damagePart1 = 0;
		damageDeductor = .5;
	}
	else {
		damagePart1 = global.selectedSkill.damage - target.current[@MAGICDEFENSE];
	}
	
	dam = damagePart1 + irandom_range(global.selectedSkill.damageRangeMin, global.selectedSkill.damageRangeMax) + (global.selectedUnit.magicLevel * 1.5);
	//Find if they have a weakness or resistance to current skill's element
	damageMultiplier *= FindTargetResistance(target);
	damageMultiplier *= FindTargetWeakness(target);
	dam *= (damageMultiplier * damageDeductor);
	dam *= (global.successfulHits / global.totalPossibleHits)
	
	
	//show_debug_message(string(global.selectedUnit.id) + " attacks " + string(ds_list_find_value(global.selectedTargets, 0).id) + " for " + string(dam));
	return ceil(dam);
}