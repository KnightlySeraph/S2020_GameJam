state = "WALK"; //IDLE, WALK, ATTACK, DEAD, HOLLOW

current_sprite = sprite_index;

direct = 1;
hsp = 0;
vsp = 0;
grav = 1;

spd = 5;

maxHealth = 100;
currentHealth = maxHealth;

alerted = false;
timer = 0;

ready = false;
hollow = false;