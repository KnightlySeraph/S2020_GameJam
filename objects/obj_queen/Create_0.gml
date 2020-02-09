state = "IDLE"; //IDLE, WALK, ATTACK, DEAD, HOLLOW

current_sprite = sprite_index;

direct = 1;
hsp = 0;
vsp = 0;
grav = 1;

spd = 3;

maxHealth = 5;
currentHealth = maxHealth;

alert = true;
alert_timer = 0;
timer = 0;
random_num = irandom_range(60,90);

exclamation = false;

hurt = false;

ready = false;
hollow = false;

suck_x = x;
dark_alpha = 0;

damage_box = noone;

text_alpha = 0;