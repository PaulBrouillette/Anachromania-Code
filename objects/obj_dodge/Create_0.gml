/// @description Dodge minigame

//For this minigame, it is created when an enemy attacks you. The totalPossibleHits is the
//amount of blocks that will be launched at you, and sucessfulHits is how many you dodge. If you 
//"Dodge" a block, successfulHits will go down. If there are 6 blocks, and you dodge all 6,
//That amount would be 0/6, so your incoming damage would be multiplied by 0/6, or 0. However, if you
//only dodge 3 of 6, your incoming damage is multiplied by 3/6. If you miss all of them, your
//incoming damage isn't reduced at all. However, if you absolutely spam the keyboard or just end up missing
//a whole lot, more damage will be coming your way. 

global.totalPossibleHits = global.selectedUnit.dodgeNumber;
global.successfulHits = global.totalPossibleHits;
previousY = -64;
i = 0;
keyLayer = layer_get_id("KeyLayer");