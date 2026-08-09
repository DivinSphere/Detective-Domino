
var _offset_x = 5;
var _offset_y = 2;
var _shadow_color = c_black;
var _shadow_alpha = 0.4;



draw_sprite_tiled_ext(sprite_index, 4, x_layer4 + _offset_x, _offset_y, 1, 1, _shadow_color, _shadow_alpha);
draw_sprite_tiled(sprite_index, 4, x_layer4, 0);



draw_sprite_tiled_ext(sprite_index, 3, x_layer3 + _offset_x, _offset_y, 1, 1, _shadow_color, _shadow_alpha);
draw_sprite_tiled(sprite_index, 3, x_layer3, 0);



draw_sprite_tiled_ext(sprite_index, 2, x_layer2 + _offset_x, _offset_y, 1, 1, _shadow_color, _shadow_alpha);
draw_sprite_tiled(sprite_index, 2, x_layer2, 0);





with (obj_faixa) {
    
    draw_self();

    
    draw_set_font(fnt_hud);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var _centro_x = x;
    var _centro_y = y;

    
    draw_set_color(c_black);
    draw_text_transformed(_centro_x, _centro_y - 10, "PROIBIDO FARMAR AURA EM ALAGOINHA", 0.5, 0.5, image_angle);

    
    draw_set_color(c_red);
    draw_text_transformed(_centro_x, _centro_y + 1, "SUJEITO A PAULADA", 0.4, 0.4, image_angle);

    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}




draw_sprite_tiled(sprite_index, 1, x_layer1, 0);