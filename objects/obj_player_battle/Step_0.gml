///// @desc

//switch state {
//	case IDLE_STATE:
//		break;
	
//	case ATTACK_STATE:
//		//Check if instance has enough skillpoints to perform attack, if so,
//		with (obj_Spell_Button) {
//			clickable = false;	
//		}
//		//FOR NOW, THIS IS HERE TO PREVENT NaN NUMBERS, DELETE AFTER IMPLEMENTING DRAWING
//		global.totalPossibleHits = 1;
//		global.successfulHits = 1;
		
//		current[@SKILLPOINTS] -= global.selectedSkill.cost;
//		if (current[@SKILLPOINTS] >= 0) {
//			if (global.selectedSkill.element == PHYSICAL) {
//				for (var i = 0; i < ds_list_size(global.selectedTargets); i++) {
//					incomingDamage = AttackTargetPhysical(ds_list_find_value(global.selectedTargets, i));
				
//					with (ds_list_find_value(global.selectedTargets, i)) {
//						current[@HEALTH] -= other.incomingDamage;
//						floaterNumberDamage = other.incomingDamage;
//						state = HURT_STATE;	
//					}
//				}		
//			}
//			else {
//				//Do the same thing above, but for AttackTargetMagic!
//				for (var i = 0; i < ds_list_size(global.selectedTargets); i++) {
//					incomingDamage = AttackTargetMagic(ds_list_find_value(global.selectedTargets, i));
				
//					with (ds_list_find_value(global.selectedTargets, i)) {
//						current[@HEALTH] -= other.incomingDamage;
//						floaterNumberDamage = other.incomingDamage;
//						state = HURT_STATE;	
//					}
//				}	
//			}
//		}
//		//if not, skip this and give message about not enough points
//		else {
//			//Set skillpoints back to 0 to prevent them going into the negatives
//			current[@SKILLPOINTS] = 0;	
//			instance_create_depth(x, y, -1000, obj_FloaterNumber);
//			with (instance_nearest(x, y, obj_FloaterNumber)) {
//				damage = "Not enough SP!";	
//			}
//			current[@SKILLPOINTS] = 0;	
//		}
		
//		//Move is finished, turn for this instance is over
//		with (obj_BattleManager) {
//			moveFinished = true;	
//		}
//		global.selectedSkill = noone;
//		turnFinished = true;
//		state = IDLE_STATE;
//		break;
		
//	case DRAW_SPELL_STATE:
//		//Create the draw spell minigame, then change to ATTACK
//		break;
		
//	case PHYSICAL_ATTACK_MINIGAME_STATE:
//		//Create the physical attack minigame, then change to ATTACK
//		break;
		
//	case HURT_STATE:
//		instance_create_depth(x, y, -1000, obj_FloaterNumber);
//		with (instance_nearest(x, y, obj_FloaterNumber)) {
//			damage = string(other.floaterNumberDamage);	
//		}
		
//		if (current[@HEALTH] > 0) {
//			state = IDLE_STATE;	
//		}
//		else {
//			ds_list_delete(global.units, ds_list_find_index(global.units, id));	
//			state = DEATH_STATE;
//		}
//		break;
		
//	case DEATH_STATE:
//		//destroy object
//		global.partyMembersAlive--;
//		instance_destroy();
//		break;
//}

//if (global.targeting) {
//	if (position_meeting(mouse_x, mouse_y, id)) {
//		image_index = 1;	
//	}
//	else {
//		image_index = 0;	
//	}
//}
//else {
//	image_index = 0;	
//}

//if (selected) {
//	image_index = 1;
//}
//else {
//	image_index = 0;
//}