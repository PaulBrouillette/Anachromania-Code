//Scripts used to determine weaknesses and resistances of targets. For FindTargetWeakness, returns 2 if
//target is weak and 1 if they are not weak to an attack. For FindTargetResistance, returns .5 if they
//resist an attack, 1 if they do not resist it. 

function FindTargetWeakness(target){
	
	//If they have no weaknesses
	if (array_length(target.weaknessesList) == 0) {
		return 1;	
	}
	
	//If a target has the global.selectedSkill's element in their weaknesses array, they take more damage.
	for (var i = 0; i < array_length(target.weaknessesList); i++) {
		if (target.weaknessesList[i] == global.selectedSkill.element) {
			instance_create_depth(target.x, target.y - 25, 70, obj_FloaterNumber);
			
			with (instance_nearest(target.x, target.y - 25, obj_FloaterNumber)) {
				damage = "Weak!";	
			}
			return 2;	
		}
	}
	
	//If not weak to the element
	return 1;
}

function FindTargetResistance(target) {
	if (array_length(target.resistancesList) == 0) {
		return 1;	
	}
	
	//If a target has a resistance to the element, they take less damage. 
	for (var i = 0; i < array_length(target.resistancesList); i++) {
		if (target.resistancesList[i] == global.selectedSkill.element) {
			instance_create_depth(target.x, target.y - 25, 70, obj_FloaterNumber);
			
			with (instance_nearest(target.x, target.y - 25, obj_FloaterNumber)) {
				damage = "Resists!";	
			}
			return .5;	
		}	
	}
	//If does not resist the element. 
	return 1;
}