/// @desc
var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
var p1 = .8;
var p2 = .2

//Cobwebs back
draw_sprite_tiled(spr_Cobwebs, 1, camx * p2, camy * p2);

//Cobwebs front
draw_sprite_tiled(spr_Cobwebs, 0, (camx * p1) + 50, (camy * p1) + 50);