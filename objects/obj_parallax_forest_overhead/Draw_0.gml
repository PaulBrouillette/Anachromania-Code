/// @desc
var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
var p1 = .1;

draw_sprite_tiled(spr_ForestTop, 0, camx, camy * p1);