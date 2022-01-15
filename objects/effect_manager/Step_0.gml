/// @description Effect Manager

/*

Notes on Creating a FX
- Must exist in at least one room. For this project, it exists in rm_include_fx
- Name is a string
- Name may not match the effect name - note _filter_greyscale instead of Desaturate
- You can get the name of a filter with fx_get_name
- You must actually apply the struct that is created to a layer for it to do anything

*/


if (keyboard_check_pressed(ord("1"))) {

	if (layer_get_fx("EffectLayer") != -1) {
		
		layer_clear_fx("EffectLayer");
		
	} else {
	
		var _fx_struct = fx_create("_filter_greyscale");	
		fx_set_parameter(_fx_struct, "g_Intensity", 1);
		layer_set_fx("EffectLayer", _fx_struct);
	
	}
	
}


/*

Notes on Modifying an Existing FX
- Get the effect struct with layer_get_fx and the layer name as a string
- If you don't know the parameter name and type use fx_get_parameters and fx_get_parameter_names and check in the debugger
- Look up the actual shader code. On windows it is (C, ProgramData, GameMakerStudio2, Cache, runtimes, [the runtime], bin, FiltersAndEffects) 
- set a parameter directly with fx_set_parameter
- you can also modify the parameters directly as you normally would a struct
- if you've modified values in the struct returned by fx_get_parameters, then use fx_set_parameters with that struct
- don't use layer_set_fx to change part of an existing effect struct

*/


//Blur
if (keyboard_check_pressed(ord("2"))) {

	blur_active = !blur_active;

	var _fx_struct, _value;
	_fx_struct = layer_get_fx("BlurEffect");
	_value = blur_active ? 10 : 0;
	fx_set_parameter(_fx_struct, "g_Radius", _value);

	
}


//Heat Haze
if (keyboard_check_pressed(ord("3"))) {

	colorize_active = !colorize_active;

	var _fx_struct, _fx_params, _fx_param_nams;
	_fx_struct = layer_get_fx("ColorizeEffect");
	_fx_params = fx_get_parameters(_fx_struct);
	_fx_param_nams = fx_get_parameter_names(_fx_struct);
	
	_fx_params.g_Intensity = colorize_active ? 1 : 0;
	_fx_params.g_TintCol = [random(1), random(1), random(1), 1];
	
	fx_set_parameters(_fx_struct, _fx_params);

}


