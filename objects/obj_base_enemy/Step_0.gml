/// @desc
switch state {
	//Do nothing here but wait. Enemy will be sent here multiple times for 
	//multiple reasons, and this is simply a state where they wait and do nothing 
	//until told to do so. 
	case IDLE_STATE:
		if (current[@HEALTH] <= 0) {
			ds_list_delete(global.units, ds_list_find_index(global.units, id));
			state = DEATH_STATE;
		}
		break;
	
	//Final state before going back to idling, this attacks any selected targets
	case ATTACK_STATE:
		//Sometimes, a glitch occurs where a unit gets here but has no selectedSkill,
		//so ensure that if that happens the default attack is a NormalAttack
		if (global.selectedSkill = noone) {
			global.selectedSkill = global.NormalAttack;	
		}
		layer_set_visible(keyLayer, false);
		instance_deactivate_layer(keyLayer);
		//Check if instance has enough skillpoints to perform attack, if so,
		current[@SKILLPOINTS] -= global.selectedSkill.cost;
		if (current[@SKILLPOINTS] >= 0) {
			if (global.selectedSkill.element == PHYSICAL) {
				for (var i = 0; i < ds_list_size(global.selectedTargets); i++) {
					incomingDamage = AttackTargetPhysical(ds_list_find_value(global.selectedTargets, i));
					
					with (ds_list_find_value(global.selectedTargets, i)) {
						current[@HEALTH] -= other.incomingDamage;
						floaterNumberDamage = other.incomingDamage;
						state = HURT_STATE;	
					}
				}		
			}
			else {
				//Do the same thing above, but for AttackTargetMagic!	
				for (var i = 0; i < ds_list_size(global.selectedTargets); i++) {
					incomingDamage = AttackTargetMagic(ds_list_find_value(global.selectedTargets, i));
					with (ds_list_find_value(global.selectedTargets, i)) {
						current[@HEALTH] -= other.incomingDamage;
						floaterNumberDamage = other.incomingDamage;
						state = HURT_STATE;
					}
				}
			}
		}
		//if not, skip this and give message about not enough points
		else {
			//Set skillpoints back to 0 to prevent them going into the negatives
			current[@SKILLPOINTS] = 0;	
			instance_create_depth(x, y, -1000, obj_FloaterNumber);
			with (instance_nearest(x, y, obj_FloaterNumber)) {
				damage = "Not enough SP!";	
			}
			current[@SKILLPOINTS] = 0;	
		}
		global.selectedSkill = noone;
		//Move is finished, turn for this instance is over
		with (obj_BattleManager) {
			moveFinished = true;	
		}
		turnFinished = true;
		image_index = 0;
		state = IDLE_STATE;
		talker = choose(Talker1, Talker2, Talker3);
		break;
		
	//Instance gets sent here right after the global.selectedUnit attacks. It checks if this instance's
	//health is above 0.
	case HURT_STATE:
		//Create damage indication
		instance_create_depth(x, y, 70, obj_FloaterNumber);
		//show_debug_message(string(floaterNumberDamage));
		with (instance_nearest(x, y, obj_FloaterNumber)) {
			damage = string(other.floaterNumberDamage);	
		}
		
		if (current[@HEALTH] > 0) {
			state = IDLE_STATE;	
		}
		else {
			ds_list_delete(global.units, ds_list_find_index(global.units, id));	
			state = DEATH_STATE;
		}
		talker = choose(Talker1, Talker2, Talker3);
		break;
		
	case DODGE_STATE:
		//When here, create a dodge object that the player interacts with. While there is one of those 
		//in existance, the instance remains in this phase. When the dodge object minigame is over,
		//goes to the attack phase. 
		instance_create_layer(112, 116, keyLayer, obj_Dodge);
		layer_set_visible(keyLayer, true);
		instance_activate_layer(keyLayer);
		layer_set_visible(cancelButtonLayer, false);
		instance_deactivate_layer(cancelButtonLayer);
		state = IDLE_STATE;
		break;
	
	//If in HURT_STATE health gets equal to or below 0, goes to this state and destroys the instance.
	case DEATH_STATE:
		//Destroy this object
		global.enemiesAlive--;
		instance_destroy();
		break;
}

//Highlight an enemy if mouse is over them while targeting
if (global.targeting) {
	if (global.selectedSkill.hitsAllTargets) {
		with (obj_Base_Enemy) {
			image_index = 1;	
		}
	}
	else {
		//If mouse is over target
		if (position_meeting(mouse_x, mouse_y, id)) {
			image_index = 1;	
		}
		//If mouse is not over target
		else {
			image_index = 0;	
		}
	}
}
//If not targeting
else {
	image_index = 0;	
}