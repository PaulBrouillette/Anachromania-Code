/// @desc
var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
var p1 = .5;
var p2 = .2

//Multiplying only the y will cause the x position to move but the y to remain locked

//Sky
draw_sprite_tiled(spr_Sky, 0, camx, camy);

//Clouds layer 1
draw_sprite_tiled(spr_Sky, 1, camx * p1, camy * p1);

//Clouds layer 2
draw_sprite_tiled(spr_Sky, 2, camx * p2, camy * p2);