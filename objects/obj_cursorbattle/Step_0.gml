/// @desc Sword movement on mouse move

currentPosition_x = x;
currentPosition_y = y;

var _distance = point_distance(x, y, mouse_x, mouse_y);
var _direction = point_direction(x, y, mouse_x, mouse_y);

// Calculate the speed of the object based on the distance to the mouse position
var _speed = _distance / 10;


// Move the object towards the mouse position with lag
phy_position_x += lengthdir_x(_speed, _direction);
phy_position_y += lengthdir_y(_speed, _direction);

var _swordAngle = _direction + 180;
phy_rotation = -_swordAngle;

// The length from the previous (x,y) position to the current, determines how hard the player swings
// the weapon to attack someone, the harder the swing, the larger the distance
distanceFromPreviousPoint = (point_distance(currentPosition_x, currentPosition_y, previousPosition_x, previousPosition_y));
previousPosition_x = x;
previousPosition_y = y;