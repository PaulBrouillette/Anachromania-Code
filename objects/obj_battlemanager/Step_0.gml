/// @desc
switch (combatPhase) {
	// Sets up players and enemies, this phase is only done once per battle
	case phase.INIT:
		switch (array_length(global.incomingEnemies)) {
			// Center enemies on screen depending on how many there are
			// Completely centered, instance is 1.7 times larger
			case 1:
				instance_create_depth(112, 44, 200, obj_EnemySpawner);
				global.enemyBattleScale = 1.7;
				break;
				
			// 1.5 times larger
			case 2:
				instance_create_depth(54, 44, 200, obj_EnemySpawner);
				instance_create_depth(170, 44, 200, obj_EnemySpawner);
				global.enemyBattleScale = 1.5;
				break;
			// 1.3 times larger
			case 3:
				instance_create_depth(24, 44, 200, obj_EnemySpawner);
				instance_create_depth(112, 44, 200, obj_EnemySpawner);
				instance_create_depth(200, 44, 200, obj_EnemySpawner);
				global.enemyBattleScale = 1.3;
				break;
				
			// Just enough room to squeeze 4 together on screen
			case 4:
				instance_create_depth(6, 44, 200, obj_EnemySpawner);
				instance_create_depth(76, 44, 200, obj_EnemySpawner);
				instance_create_depth(146, 44, 200, obj_EnemySpawner);
				instance_create_depth(216, 44, 200, obj_EnemySpawner);
				global.enemyBattleScale = 1.1;
				break;
		}
	
		// Populate enemies into battle, put them into global.units
		for (var i = 0; i < array_length(global.incomingEnemies); i++) {
			var spawner = instance_find(obj_EnemySpawner, i);
			var unit = instance_create_depth(spawner.x, spawner.y, 0, global.incomingEnemies[@i]);
			ds_list_add(global.units, unit);
			unit.indexInUnitsList = index;
			index++;
			global.enemiesAlive++;
		}
		
		// Populate party members into battle, put them into global.units
		for (var i = 0; i < array_length(global.battlePartyMembers); i++) {
			var spawner = instance_find(obj_PlayerSpawner, i);
			var unit = instance_create_depth(spawner.x, spawner.y, 0, global.battlePartyMembers[@i]);
			ds_list_add(global.units, unit);
			unit.indexInUnitsList = index;
			index++;
			global.partyMembersAlive++;
		}
		FindDialogueOrAction("BattleStart1", id);
		alarm[0] = room_speed * .5;
		
		combatPhase = phase.ChooseCombatant;
	break;
	
	// Check if there is a side that has no more alive combatants. If both sides still
	// have everyone, then global.selectedUnit becomes the next person in line
	case phase.ChooseCombatant:
		if (global.partyMembersAlive == 0) {
			combatPhase = phase.LoseBattle;
			break;
		}
		else if (global.enemiesAlive == 0) {
			combatPhase = phase.WinBattle;
			break;
		}
		BubbleSort(global.units);
		// If everyone has finished their turn, reset every turnFinished to false
		if (unitsFinished >= ds_list_size(global.units)) {
			for (var i = 0; i < ds_list_size(global.units); i++) {
				with (global.units[|i]) {
					turnFinished = false;	
				}
			}
			unitsFinished = 0;
		}
		
		// Find the next unit that has not finished their turn and is not dead and
		// set them to global.selectedUnit
		for (var i = 0; i < ds_list_size(global.units); i++) {
			var inst = global.units[|i];
			if (inst.turnFinished == false) {
				inst.currentlySelected = true;
				global.selectedUnit = inst;	
				//inst.selected = true;
				//inst.drawTarget = true;
				show_debug_message(global.selectedUnit);
				break;
			}
		}
		
		combatPhase = phase.ChooseMove;
		
		break;
		
		// Whatever combatant gets chosen will be able to act
		case phase.ChooseMove:
			// If the beginning TextBox is gone
			if (beginningWait && instance_number(obj_TextBox) == 0) {
				// If selected Unit is an enemy
				if (global.selectedUnit.myTeam == BattleTeams.EnemyTeam) {
					//show_debug_message("Eenemy is up");
					FindDialogueOrAction("BattleGuy1", id);
					global.selectedUnit.alarm[1] = room_speed * .5;
					global.selectedUnit.image_index = 3;
					global.selectedUnit.currentPhase = EnemyBattlePhases.ENEMY_ATTACK;
				}
				// If selected Unit is a party member
				else {
					instance_create_depth(150, 150, -1000, obj_AttackButton);	
				}	
				combatPhase = phase.BattleWait;
			}
			
		break;
		
		// Do nothing here but wait
		case phase.BattleWait:
			
		break;
		
		case phase.WinBattle:
			show_debug_message("GRANDULAR");
		break;
		
		case phase.LoseBattle:
			show_debug_message("YOU'RE SUCK");
		break;
}