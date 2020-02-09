if(sprite_index == spr_queen_attack) state = "IDLE";
if(sprite_index == spr_queen_death) ready = true;
if(sprite_index == spr_queen_summon_start) sprite_index = spr_queen_summon_loop;