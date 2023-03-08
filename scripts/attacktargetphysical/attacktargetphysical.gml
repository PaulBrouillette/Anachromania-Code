//With a targt, use the damage calculation to gather information and return an amount of damage to be dealt.
/*
	The first number is the global.selectedUnit's current weapon's damage minus the target's defense. Added
	to that is a random number, 0 to the global.selectedUnit's weapon damageRange variable, and then added to that
	is the global.selectedUnit's current level * 1.2. 
	
	Multiplied by all of that is the successful hits / total possible hits gathered from the dodging and
	drawing minigames. If the player had to draw a spell where there was 20 possible squares to fill in,
	and they drew 17 successfully, the first number would be multiplied by (17/20), so the overall damage
	would be worth 17/20 or 85% of its full strength. 
*/

function AttackTargetPhysical(target){
	
	//If the target's fefense is greater than the global.selectedUnit's attack, this penalty will be applied
	damageDeductor = 1;
	//If they have any weaknesses, this will become 2, if they have resistances, this will become .5. Will
	//be multiplied by the entire damage calculated before being returned. 
	damageMultiplier = 1;
	
	//Prevent this number from going into the negatives in case target's defense is higher than selectedUnit's offense
	if (global.selectedUnit.weapon.damage - target.current[@DEFENSE] < 0) {
		damagePart1 = 0;
		damageDeductor = .5;
	}
	else {
		damagePart1 = global.selectedUnit.weapon.damage - target.current[@DEFENSE];
	}
	
	dam = ((damagePart1) + irandom_range(0, global.selectedUnit.weapon.damageRange) + (global.selectedUnit.level * 1.2));
	
	//Find if they have a resistance or weakness to physical attacks
	damageMultiplier *= FindTargetResistance(target);
	damageMultiplier *= FindTargetWeakness(target);
	dam *= (global.successfulHits / global.totalPossibleHits);
	dam *= (damageMultiplier * damageDeductor);
	
	//Reset these global variables in order to use again. 
	global.successfulHits = 0;
	global.totalPossibleHits = 0;
	
	return ceil(dam);
}