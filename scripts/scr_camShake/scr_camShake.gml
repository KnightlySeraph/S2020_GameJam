/// @desc ScreenShake(mag, frames)
/// @arg Magnitude sets strength of the shake (radius in pixels)
/// @arg Frames sets the length of the shake in frames 60 = 1 second

with (obj_camera){
	if(argument0 > shake_remain) { //Overwrite smaller shake
		shake_mag = argument0;
		shake_remain = argument0;
		shake_length = argument1;
	}
}