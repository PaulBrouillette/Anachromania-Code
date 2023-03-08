/// @desc

switch (currentPhase) {
	// Enemy does nothing, but if the player is attacking, they'll have their weapon out and be able to hit
	// the enemy
	case EnemyBattlePhases.ENEMY_WAIT:
		// Weapon is inside enemy
		textBoxWait = false;
		if (dead) {
			image_index = 2;	
		}
		else {
			image_index = 0;	
		}
		if (place_meeting(x, y, obj_CursorBattle)) {
			// Able to attack
			if (!invulnerable && obj_CursorBattle.ableToAttack) {
				xOffset = .9;
				image_index = 1;
				currentlyHitting = true;
				invulnerable = true;
				randomNum = irandom_range(5, 10);
		
				// Calculate damage
				with (obj_CursorBattle) {
					//show_debug_message(point_distance(currentPosition_x, currentPosition_y, previousPosition_x, previousPosition_y));
					other.damageToSend = ceil(distanceFromPreviousPoint - other.defense);
				}
				damageToSend -= defense;
				if (damageToSend < 0) {
					damageToSend = 0;	
				}
				// If the enemy is not dead, subtract damage from health. But if they are dead, don't
				if !(dead) {
					myHealth -= damageToSend;	
				}
				
				with (instance_create_depth(x + 32, y, -2000, obj_BattleNumber)) {
					damage = other.damageToSend;	
				}
		
				// Create star effects
				for (var i = 0; i < randomNum; i++) {
					instance_create_depth(x + 32, y + 32, -1000, obj_BattleStar);	
				}
				currentPhase = EnemyBattlePhases.ENEMY_HURT;
			}
		}
		// weapon is not inside enemy
		else {
			currentlyHitting = false;	
		}
		
		break;
		
	case EnemyBattlePhases.ENEMY_ATTACK:
		if (textBoxWait && instance_number(obj_TextBox) == 0) {
			show_debug_message("gunna attack yo good brother");
			turnFinished = true;
			currentPhase = EnemyBattlePhases.ENEMY_WAIT;
			obj_BattleManager.unitsFinished++;
			obj_BattleManager.combatPhase = phase.ChooseCombatant;
		}
		break;
		
	// If enemy is attacked when they're in the WAIT state, they get sent here and do an animation
	case EnemyBattlePhases.ENEMY_HURT:
		// Make the sprite shake
		if (x + xOffset >= originalX + 2 || x + xOffset <= originalX - 2) {
			xOffset = -xOffset;	
		}
		x += xOffset;
		
		// Not being hit and player doesn't have weapon trained on enemy, reset them
		if (invulnerable && !(place_meeting(x, y, obj_CursorBattle))) {
			// Invulnerability time
			if (alarm[0] == -1) {
				alarm[0] = room_speed * invulnerableTime;		
			}
		}
		break;
		
	// If enemy dies, they don't get to do any more moves, but they're still able to be attacked
	// because mercilessly beating someone when they're down is badass  
	case EnemyBattlePhases.ENEMY_DEAD:
		if (!justKilled) {
			// Remove self from the global.units list, but don't instance_destroy();
			global.enemiesAlive--;
			justKilled = true;
			var spot = ds_list_find_index(global.units, id);
			ds_list_delete(global.units, spot);
		}
		
		invulnerable = false;
		currentlyHitting = false;
		image_index = 2;
		currentPhase = EnemyBattlePhases.ENEMY_WAIT;
		break;
}