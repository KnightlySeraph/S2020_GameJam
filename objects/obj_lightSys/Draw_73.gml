/// @description Lighting Draws
if (surface_exists(surf)) {
	// Get X pos of the view
	var _x = camera_get_view_x(view_camera[0]);
	
	// Get Y pos of the view
	var _y = camera_get_view_y(view_camera[0]);
	
	// Check the view and draw the surface at x,y
	if (view_current == 0) {
		//draw_surface(surf, obj_camera.x - (cam_width / 2), obj_camera.y - (cam_height / 2));	
		draw_surface(surf, 0, 0);	
	}
}

else {
	// Run the create again if the surface isn't detected
	surf = surface_create(8192, 8192);
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();	
}