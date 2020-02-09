draw_self()
//draw_text(x,y,abs(x-obj_player.x));
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, c_black, dark_alpha);
draw_set_font(font0);
draw_text_ext_transformed_color(x-128,y,"Press 'S' to Hollow", 5, 1000, 2, 2, 0, c_white, c_white, c_white, c_white,text_alpha);