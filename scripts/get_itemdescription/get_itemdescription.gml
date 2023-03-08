// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Get_ItemDescription(itemNumber){
	switch(itemNumber) {
	
		case 0:
			return "This is a thing, with number 0";
			break;

		case 1:
			return "This is a thing, with number\n\n juan";
			break;
	
		default:
			return "What is this thing? Broken ass game. Check the script something went wrong got damb"
			break;
	}
}