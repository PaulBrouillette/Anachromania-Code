/// @desc
//image_angle++;
if (x > room_width || x < 0 || y > room_height || y < 0) {
	instance_destroy();
}
else {
    x += newX;
	y += newY;
	//direction += 100;
}
