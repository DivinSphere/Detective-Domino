var _x_draw = x_final;
var _y_draw = y_final;

var _escala_final_x = image_xscale * escala_squash_x;
var _escala_final_y = image_yscale * escala_squash_y;

var _img = image_index;
if (_img == 3) {
    _img = 3 + ((current_time div 300) mod 2);
}

gpu_set_fog(true, c_black, 0, 0);
draw_sprite_ext(sprite_index, _img, _x_draw + 2, _y_draw + 2, _escala_final_x, _escala_final_y, 0, c_white, 0.4);
gpu_set_fog(false, c_black, 0, 0);

var _cor_fantasma = make_color_rgb(163, 20, 20); 
gpu_set_fog(true, _cor_fantasma, 0, 0);

var _dist_x = 10;
var _tempo = current_time / 600;

var _y_f3 = (y + (sin(_tempo - 1.5) * 3));
draw_sprite_ext(sprite_index, _img, _x_draw + (_dist_x * 3), _y_f3, _escala_final_x, _escala_final_y, 0, c_white, 0.15);

var _y_f2 = (y + (sin(_tempo - 1.0) * 3));
draw_sprite_ext(sprite_index, _img, _x_draw + (_dist_x * 2), _y_f2, _escala_final_x, _escala_final_y, 0, c_white, 0.30);

var _y_f1 = (y + (sin(_tempo - 0.5) * 3));
draw_sprite_ext(sprite_index, _img, _x_draw + _dist_x, _y_f1, _escala_final_x, _escala_final_y, 0, c_white, 0.50);

gpu_set_fog(false, c_white, 0, 0);

draw_sprite_ext(sprite_index, _img, _x_draw, _y_draw, _escala_final_x, _escala_final_y, 0, c_white, 1);