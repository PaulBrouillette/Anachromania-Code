/// @desc Give the combatants time to return to their normal state
ableToAttack = false;
global.selectedUnit.turnFinished = true;
obj_BattleManager.unitsFinished++;
visible = false;
alarm[1] = room_speed * 3;


