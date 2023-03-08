/// @desc Get rid of ds_lists
if (ds_exists(global.units, ds_type_list)) {
	ds_list_destroy(global.units);	
}
if (ds_exists(global.selectedTargets, ds_type_list)) {
	ds_list_destroy(global.selectedTargets);	
}
if (ds_exists(global.targets, ds_type_list)) {
	ds_list_destroy(global.targets);	
}
