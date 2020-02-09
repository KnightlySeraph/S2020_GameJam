switch(state) {
	case("THROW"):
		if(image_index > 8 && !throw) {
			instance_create_depth(x-100,y,depth,obj_dagger);
			throw = true;
		}
		break;
		
	case("DEATH"):
		break;
		
	case("HOLLOW"):
		break;
}