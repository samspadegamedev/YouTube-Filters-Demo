/// @description Effect Manager


//blur_active = false;
colorize_active = false;

var _fx_struct = fx_create("_filter_pixelate");	
fx_set_parameter(_fx_struct, "g_CellSize", 15);
fx_set_single_layer(_fx_struct, true);
layer_set_fx("Player", _fx_struct);
