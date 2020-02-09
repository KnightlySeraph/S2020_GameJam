if(sprite_index == spr_queen_attack) state = "IDLE";
if(sprite_index == spr_queen_death) ready = true;
if(sprite_index == spr_queen_summon_start) sprite_index = spr_queen_summon_loop;
if(sprite_index = spr_queen_summon_end) {
	swords = 0;
	attacks = 0;
	timer = 0;
	attack_num = random_range(2,4);
	state = "IDLE";
}