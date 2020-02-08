state = "WALK"; //IDLE, WALK, ATTACK, DEAD, HOLLOW

current_sprite = sprite_index;

direct = 1;
hsp = 0;
vsp = 0;
grav = 1;

spd = 3;

maxHealth = 100;
currentHealth = maxHealth;

alert = false;
timer = 0;
random_num = irandom_range(60,90);

ready = false;
hollow = false;