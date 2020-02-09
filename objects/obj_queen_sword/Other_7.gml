if(sprite_index == spr_sword_app) sprite_index = spr_sword_still;
if(sprite_index == spr_sword_dissappear) {
	with(damage_box) instance_destroy();
	instance_destroy();
}