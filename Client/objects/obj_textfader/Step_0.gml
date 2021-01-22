/// @description Fade text away
if(text_alpha > 0) {
    text_alpha -= 0.005;
} else {
	instance_destroy();
}