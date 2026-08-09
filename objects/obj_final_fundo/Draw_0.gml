var _x_draw = x_final;
var _y_draw = y_final;


gpu_set_fog(true, c_black, 0, 0);
draw_sprite_ext(sprite_index, image_index, _x_draw + 2, _y_draw + 2, image_xscale, image_yscale, 0, c_white, 0.4);
gpu_set_fog(false, c_black, 0, 0);


var _cor_fantasma = make_color_rgb(163, 20, 20); 
gpu_set_fog(true, _cor_fantasma, 0, 0);

var _tempo = current_time / 600;

var _y_f3 = (y + (sin(_tempo - 1.5) * 3));
draw_sprite_ext(sprite_index, image_index, _x_draw + (dir_fantasma * 3), _y_f3, image_xscale, image_yscale, 0, c_white, 0.15);

var _y_f2 = (y + (sin(_tempo - 1.0) * 3));
draw_sprite_ext(sprite_index, image_index, _x_draw + (dir_fantasma * 2), _y_f2, image_xscale, image_yscale, 0, c_white, 0.30);

var _y_f1 = (y + (sin(_tempo - 0.5) * 3));
draw_sprite_ext(sprite_index, image_index, _x_draw + dir_fantasma, _y_f1, image_xscale, image_yscale, 0, c_white, 0.50);

gpu_set_fog(false, c_white, 0, 0);


draw_sprite_ext(sprite_index, image_index, _x_draw, _y_draw, image_xscale, image_yscale, 0, c_white, 1);