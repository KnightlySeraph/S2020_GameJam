/// @description Set up Surface Stuff
cam_height = 1080;
cam_width = 1920;
surf = surface_create(cam_width, cam_height);
intensity = 0.8;


// Set surface target to the new surface
surface_set_target(surf);

// Clear the surface
draw_clear_alpha(c_black, 0);


color = c_black;


// Fluct values
min_range = 0.2;
max_range = 0.3;
step = 0.003;
fluct = false;

// Other bools for controlling light
fade = false;
fadeStep = 0.0;
fadeTarget = 0.0;

// Reset the target
surface_reset_target();