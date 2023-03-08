/// @desc
var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
var p1 = .6;
var p2 = .3;
var p3 = .1;


//Sky
draw_sprite_tiled(spr_ForestSky, 0, camx, camy);

//Clouds
draw_sprite_tiled(spr_ForestSky, 1, camx * p3, camy * p3);

//Back hills
draw_sprite_tiled(spr_ForestSky, 2, camx * p1, camy * p1);

//Front hills
draw_sprite_tiled(spr_ForestSky, 3, camx * p2, camy * p2);