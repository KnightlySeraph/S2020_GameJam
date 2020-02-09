if(sprite_index = spr_queen_reveal) {
	instance_create_depth(x,y-1,depth,obj_queen);
	obj_queen.image_xscale = -1;
	instance_destroy();
}