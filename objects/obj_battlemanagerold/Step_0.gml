/// @desc
switch (combatPhase) {
	
	// For every instance of a obj_EnemySpawn, replace it with an enemy object (anyone that has obj_Unit as its parent!)
	// This phase is only visited once every time the combat room is entered. 
	case phases.INIT:
		//Prepare extra layers
		layer_set_visible(buttonLayer, false);
		instance_deactivate_layer(buttonLayer);
		layer_set_visible(keyLayer, false);
		instance_deactivate_layer(keyLayer);
		layer_set_visible(spellsLayer, false);
		instance_deactivate_layer(spellsLayer);
		layer_set_visible(cancelButtonLayer, false);
		instance_deactivate_layer(cancelButtonLayer);
		
		//Find how many enemies are incoming and place them in their appropriate place, if there's
		//one then they'll be centered, if there's two they'll both be centered side by side and so on
		switch (array_length(global.incomingEnemies)) {
			//Completely centered, instance is 1.7 times larger
			case 1:
				instance_create_depth(179, 128, 200, obj_EnemySpawner);
				global.enemyBattleScale = 1.7;
				break;
				
			//1.5 times larger
			case 2:
				instance_create_depth(96, 128, 200, obj_EnemySpawner);
				instance_create_depth(288, 128, 200, obj_EnemySpawner);
				global.enemyBattleScale = 1.5;
				break;
				
			case 3:
				instance_create_depth(39, 128, 200, obj_EnemySpawner);
				instance_create_depth(205, 128, 200, obj_EnemySpawner);
				instance_create_depth(371, 128, 200, obj_EnemySpawner);
				global.enemyBattleScale = 1.3;
				break;
				
			//Just enough room to squeeze 4 together on screen
			case 4:
				instance_create_depth(6, 128, 200, obj_EnemySpawner);
				instance_create_depth(147, 128, 200, obj_EnemySpawner);
				instance_create_depth(288, 128, 200, obj_EnemySpawner);
				instance_create_depth(429, 128, 200, obj_EnemySpawner);
				global.enemyBattleScale = 1.1;
				break;
			
			//Alert if something goes wrong (most likely the enemies array is empty or something happened to it)
			default:
				show_debug_message("The global.incomingEnemies array must be empty, that's not good!");
				break;
		}
		
		//Populate enemies into battle
		for (var i = 0; i < array_length(global.incomingEnemies); i++) {
			var spawner = instance_find(obj_EnemySpawner, i);
			var unit = instance_create_depth(spawner.x, spawner.y, 0, global.incomingEnemies[@i]);
			ds_list_add(global.units, unit);
			global.enemiesAlive++;
		}
		//Populate party members into battle
		for (var i = 0; i < array_length(global.battlePartyMembers); i++) {
			var spawner = instance_find(obj_PlayerSpawner, i);
			var unit = instance_create_depth(spawner.x, spawner.y, 0, global.battlePartyMembers[@i]);
			ds_list_add(global.units, unit);
			global.partyMembersAlive++;
		}
		combatPhase = phases.BATTLESTART;
		break;
		
	//Beginning of battle, player has to click anywhere to begin
	case phases.BATTLESTART:
		break;
	
	case phases.STARTTURN:
		//Before anything happens, check to see if one team has won and go to that state and
		//end the battle, either winning or losing. 
		if (global.partyMembersAlive == 0) {
			combatPhase = phases.LOSE;
			break;
		}
		else if (global.enemiesAlive == 0) {
			combatPhase = phases.WIN;
			break;
		}
		BubbleSort(global.units);
		//If everyone has finished their turn, reset every turnFinished to false
		if (unitsFinished >= ds_list_size(global.units)) {
			for (var i = 0; i < ds_list_size(global.units); i++) {
				with (global.units[|i]) {
					turnFinished = false;	
				}
			}
			unitsFinished = 0;
		}
		//Find the next unit that has not finished their turn and set them to global.selectedUnit
		for (var i = 0; i < ds_list_size(global.units); i++) {
			var inst = global.units[|i];
			if (inst.turnFinished == false) {
				inst.selected = true;
				inst.drawTarget = true;
				global.selectedUnit = inst;
				break;
			}
		}
		
		//Fill up targets list
		//If global.selectedUnit.team is player:
		if (global.selectedUnit.team == team.PLAYERTEAM) {
			//Reset buttons if the player character is up
			layer_set_visible(buttonLayer, true);
			instance_activate_layer(buttonLayer);
			with (obj_Base_Button) {
				text = buttonText;	
			}
			
			for (var i = 0; i < ds_list_size(global.units); i++) {
				var inst = global.units[|i];	
				if (inst.team == team.ENEMYTEAM) {
					ds_list_add(global.targets, inst);	
				}
			}		
		}
		//If global.selectedUnit.team is enemy:
		else {
			layer_set_visible(buttonLayer, false);
			instance_deactivate_layer(buttonLayer);
			layer_set_visible(cancelButtonLayer, false);
			instance_deactivate_layer(cancelButtonLayer);
			
			for (var i = 0; i < ds_list_size(global.units); i++) {
				var inst = global.units[|i];	
				if (inst.team == team.PLAYERTEAM) {
					ds_list_add(global.targets, inst);	
				}
			}
		}
		
		if (!allowInput) {
			allowInput = true;
		}
		combatPhase = phases.WAIT;
		break;
		
	//Wait until a move is chosen, then move on
	case phases.WAIT:
		//If the global.selectedUnit is an enemy,
		if (global.selectedUnit.myTeam == team.EnemyTeam) {
			//Call enemy script to make them choose a move, then move on to dodging!
			EnemyChooseMove();
			combatPhase = phases.ANNOUNCEATTACK;
		}
		else {
		}
		//If the global.selectedUnit is a player, skip the first part (Global Left Released event will
		//take care of it)
		if (moveSelected) {
			unitsFinished++;
			combatPhase = phases.PROCESS;
		}
		break;
		
	//Wait until the chosen move is over, then move on 
	case phases.PROCESS:
		if (moveFinished) {
			combatPhase = phases.ENDTURN;
			global.selectedUnit.selected = false;
			global.targeting = false;
			for (var i = 0; i < ds_list_size(global.units); i++) {
				with(global.units[|i]) {
					drawTarget = false;	
				}
			}	
		}
		break;
		
	//Reset variables and move onto the next combatant
	case phases.ENDTURN:
		//Reset these global variables in order to use again. 
		global.successfulHits = 0;
		global.totalPossibleHits = 0;
		moveFinished = false;
		moveSelected = false;
		ds_list_clear(global.selectedTargets);
		ds_list_clear(global.targets);
		attackText = irandom_range(0, 1);
		combatPhase = phases.STARTTURN;
		break;
		
	//Used to announce the attack and allows the player to see who is attacking with what spell
	//and to get a breather beforehand, as the player will need to click the screen to continue.
	case phases.ANNOUNCEATTACK:
		break;
		
	case phases.WIN:
		show_debug_message("Your winner");
		with (obj_Player) {
			visible = true;	
			state = states.FREE;
		}
		room_goto(global.previousRoom);
		draw_set_color(c_white);
		instance_destroy();
		break;
		
	case phases.LOSE:
		show_debug_message("Mortis");
		break;
}