state = "IDLE"; //IDLE, WALK, ATTACK, DEAD, HOLLOW

current_sprite = sprite_index;

direct = 1;
hsp = 0;
vsp = 0;
grav = 1;

spd = 2;

maxHealth = 30;
currentHealth = maxHealth;

alert = false;
alert_timer = 0;
timer = 0;
random_num = irandom_range(60,90);

exclamation = false;

hurt = false;

ready = false;
hollow = false;

suck_x = x;
dark_alpha = 0;

grounded = false;
jumped = false;

jump_hsp = 0;

damage_box = noone;

momentum = 0;
momentum_timer = 0;
last_direct = direct;

text_alpha = 0;

// Audio
deathNoise = false;