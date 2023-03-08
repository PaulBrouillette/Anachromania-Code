/// @desc Does the actual moving
if (allow) {
	if (xMove) {
	
		// If actor is to the right of the target x, move to the left
		if (actor.x > targetX) {
			with (actor) {
				move_towards_point(other.targetX, y, other.walkSpeed);	
			}
		}	
		// If actor is to the left of the target x, move to the right
		else if (actor.x < targetX) {
			with (actor) {
				move_towards_point(other.targetX, y, other.walkSpeed);		
			}
		}
	
		// Once the actor's x is where it is supposed to be, move on the y
		if (actor.x >= targetX - 1 && actor.x <= targetX + 1) {
			xMove = false;
			yMove = true;
		}
	}

	if (yMove) {
		// If actor is above the target y, move them down
		if (actor.y > targetY) {
			with (actor) {
				move_towards_point(x, other.targetY, other.walkSpeed);
			}
		}
		// If actor is below the target y, move them up
		else if (actor.y < targetY) {
			with (actor) {
				move_towards_point(x, other.targetY, other.walkSpeed);
			}
		}
	
		// Once the actor's y is where it is supposed to be, stop moving
		if (actor.y >= targetY - 1 && actor.y <= targetY + 1) {
			yMove = false;
			stopMove = true;
			
		}
	}
	if (stopMove) {
		with (actor) {
			state = states.FREE;	
			xSpeed = 0;
			ySpeed = 0;
			speed = 0;
			animatable = false;
			sprite_index = sprite[other.endFace]
			}
		with (obj_Player) {
			state = states.FREE;	
		}
		instance_destroy();
	}
}