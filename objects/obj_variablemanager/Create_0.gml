/// @desc Holds important variables to use throughout the game
//Holds variables like the array of party members, the currently selected 4 party
//members to use for battles, the inventory, etc.

//An array of every party member (will grow presumably when more story is established)
global.partyMembers = [obj_Player];

//An array of every party member (max 4) selected for battle
global.battlePartyMembers = [obj_Player_Battle];

//An array of the known spells that the party can use
global.partyKnownSkills = [];

//Array of objects that represent enemies. They are to be used in the battle room
//during the INIT phase that spawns in enemies (max 5, min 1).
global.incomingEnemies = [obj_BattleGuy, obj_BattleGuy];

//The room where the player goes from when they enter a battle. Used after a battle is won to 
//transport back to that room.
global.previousRoom = noone;

//global.playerID = obj_Player.id;

global.Inventory = array_create(INVENTORY_SLOTS, -1);

// Link to a textID that will be used to help keep track of who asked for an item
// and to then concatenate the item ID onto the end of it. 
global.ItemRecipient = "";
