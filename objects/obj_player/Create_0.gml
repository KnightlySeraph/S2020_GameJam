/// @description Init physics vars

movementSpeed = 5;
maxMovementSpeed = movementSpeed;
jumpForce = 15;
mass = 0.3;
termVel = 50;
vsp = 0;
grounded = false;
jumps = 1; // These are additional jumps, setting to zero removes double jump
maxJumps = jumps;

// Gun vars
is_firing = false;
fire_rate = 0.1;
projectile_speed = 15;
fire_delay = false;

// Other
moving_right = true;
moving_left = false;


// Other Gameplay Stuff
hitpoints = 3;

// IFrames
invinTime = 2;
flashSpeed = 0.15;
flashOpacity = 0.5;
flashColor = c_red;
invin = false;