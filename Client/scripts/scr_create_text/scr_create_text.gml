// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_text(_string){
	var _fader = instance_create_layer(0, 0, "Instances", obj_textfader);
	
	with (_fader) {
		message_string = _string
	}
}