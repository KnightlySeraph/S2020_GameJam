/// @description Smooth Follow on Player
if (instance_exists(obj_player)) {
	x = obj_player.x;
	y = obj_player.y;
	show_debug_message("Follow Player");
}
else{
	show_message("Not Found");	
}

player_cam = camera_create();
zoomScale = 2.5;

width = 1920;
height = 1080;
oriHeight = height;
aspectRatio = 0.5625;
zoomSpeed = 100;
zLookRange = 1000000000000;

var vm = matrix_build_lookat(x, y, -zLookRange, x, y, zLookRange, 0, 1, 0);
var pm = matrix_build_projection_ortho(1920, 1080, -zLookRange, zLookRange);

camera_set_view_mat(player_cam, vm);
camera_set_proj_mat(player_cam, pm);

view_camera[0] = player_cam;

follow = obj_player;
xTo = x;
yTo = y;

//Shake Stuff
shake_length = 0;
shake_mag = 0;
shake_remain = 0;
buff = 32;

// Zoom Stuff
zooming = false;
stick = false;
cameraLerp = 0.01;
lerpOut = cameraLerp;
zoomOut = false;