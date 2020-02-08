/// @desc scr_cam_zoom(zoom, length, lerpIn, lerpOut)
/// @arg zoom
/// @arg length
/// @arg lerpIn
/// @arg lerpOut

with (obj_camera) {
	cameraLerp = argument2;
	lerpOut = argument3;
	newHeight = argument0;
	zooming = true;
	stick = true;
	alarm[0] = argument1 * room_speed;
}