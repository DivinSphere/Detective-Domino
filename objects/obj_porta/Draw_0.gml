
if (destino_id != 10) {
    
    
if image_index!=1 and image_index!=2 and image_index!=4
	draw_sprite_ext(sprite_index,7,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
	
if image_index==1
	draw_sprite_ext(sprite_index,8,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)



    if (image_index != 2 and image_index != 4) {
        draw_self();
    }

    
    if (alfa > 0.1 && instance_exists(obj_detetive)) {
        if (instance_nearest(obj_detetive.x, obj_detetive.y, obj_porta) == id) {
            draw_set_halign(fa_center);
            draw_set_valign(fa_top);
            draw_set_alpha(alfa);
            
            var _tx = floor(obj_detetive.x);
            var _ty = floor(obj_detetive.y + 22);
            
            
            draw_set_color(c_yellow);
            draw_text_transformed(_tx, _ty, acao_texto, 0.25, 0.25, 0);
            
            
            draw_set_alpha(1.0);
            draw_set_color(c_white);
            draw_set_halign(fa_left);
        }
    }

    
    if (alfa > 0.05) {
        gpu_set_fog(true, c_yellow, 0, 0);
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, alfa * 0.4);
        gpu_set_fog(false, c_black, 0, 0);
    }
}

if global.debug_portas{
	draw_text(x,y-30,porta_id)
	draw_text(x,y,destino_id)
}