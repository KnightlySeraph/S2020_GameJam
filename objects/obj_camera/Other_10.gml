/// @description Insert description here
// You can write your code in this editor
width = (height / aspectRatio);
pm = matrix_build_projection_ortho(width, height, -zLookRange, zLookRange);
camera_set_proj_mat(player_cam, pm);