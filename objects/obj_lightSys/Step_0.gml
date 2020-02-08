/// @description Insert description here
// You can write your code in this editor
if (surface_exists(surf)) {
	// Switch surface to draw to
	surface_set_target(surf);	
	
	// Select the color to draw
	draw_set_color(color);
	
	// Set the alpha to draw at
	draw_set_alpha(intensity);
	
	// Fill view with black
	// draw_rectangle(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + cam_width, camera_get_view_y(view_camera[0]) + cam_height, 0);
	draw_rectangle(0, 0, cam_width, cam_height, 0);
	
	// Reset the alpha
	draw_set_alpha(1.0);
	
	// Reset the target
	surface_reset_target();
}
else {
	// Rerun the create event
	surf = surface_create(cam_width, cam_height);
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
}

// Intensity Fluctuation
if (fluct) {
	if (intensity > max_range || intensity < min_range) {
		step = -step;	
	}
	intensity += step;
}

// Debug key for turning on fluct
if (keyboard_check_pressed(ord("T"))) {
	if (!fluct) {
		fluct = true;	
	}
	else {
		fluct = false;	
	}
}



// Intensity controlling
if (true) {
	if(keyboard_check(vk_down)) {
		intensity -= 0.01;
		intensity = clamp(intensity, 0.0, 1.0);	
	}
	else if(keyboard_check(vk_up)) {
		intensity += 0.01;
		intensity = clamp(intensity, 0.0, 1.0);	
	}
}

// Fading
if (fade) {
	if (fadeTarget < intensity) {
		// Subtract intensity till target is met
		intensity -= fadeStep;
	}
	else if (fadeTarget > intensity) {
		intensity += fadeStep;	
	}
	else {
		// Taget should now be met
		fade = false;
	}
}