// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_text(_string){
	// Destroy all other instances of textfader
	instance_destroy(obj_textfader);
	
	// Create new instance
	var _fader = instance_create_layer(0, 0, "Instances", obj_textfader);
	
	with (_fader) {
		message_string = _string
	}
}