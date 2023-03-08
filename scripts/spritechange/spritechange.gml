
function SpriteChange(_actor, _newSprite){
	change = {
		actor : argument[0],
		newSprite : argument[1],
		
		toString : function() {
			return string("SpriteChange");	
		}
	}
	
	with (instance_nearest(0, 0, obj_TextBoxQueue)) {
		ds_queue_enqueue(textQueue, other.change);
	}
}