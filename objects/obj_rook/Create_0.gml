state = "IDLE"; //IDLE, WALK, ATTACK, DEAD, HOLLOW

current_sprite = sprite_index;

maxHealth = 50;
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

image_xscale = choose(-1,1);

text_alpha = 0;

// Audio from justin
deathSndPlayed = false;