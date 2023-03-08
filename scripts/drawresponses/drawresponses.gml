// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DrawResponses(_response, _responseTextID){
	responseStruct = {
		res : argument[0],
		resTextID : argument[1]
	}
	if (!instance_exists(obj_DrawResponseWords)) {
		instance_create_depth(0, 0, -10000, obj_DrawResponseWords);
	}
	with (instance_nearest(0, 0, obj_DrawResponseWords)) {
		array_push(rArray, other.responseStruct);
	}	
}