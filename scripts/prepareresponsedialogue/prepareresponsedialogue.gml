// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PrepareResponseDialogue(_response, _linkToTextID){
	resArray = {
		response : argument[0],	
		responseTextID : argument[1], 
				
		toString : function() {
			return string("Responses");	
			}
		};
			
	with (instance_nearest(0, 0, obj_TextBoxQueue)) {
		ds_queue_enqueue(textQueue, other.resArray);
	}
}