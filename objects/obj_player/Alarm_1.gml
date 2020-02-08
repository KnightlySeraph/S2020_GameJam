/// @description Flicker Opacity

if (image_alpha == 1.0 && invin) {
	image_alpha = flashOpacity;	
	image_blend = flashColor;
}
else {
	image_alpha = 1.0;	
	image_blend = c_white;
}
