var a = clamp(alfa, 0, 1);

draw_set_alpha(a * 0.5);
draw_set_color(c_black);
draw_rectangle(camera_get_view_x(view_camera[0]),
               camera_get_view_y(view_camera[0]),
               camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),
               camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),
               false);

var cx = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) * 0.5;
var cy = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) * 0.5;

draw_set_alpha(a);
draw_set_color(c_white);
draw_sprite_ext(sprite_index, 0, cx, cy, escala * 1.2, escala, 0, c_white, a);

if (escala > 0.5) {
    draw_set_font(fnt_hud);
    var esc_texto = 0.25; 

    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_color(c_black);
    draw_set_alpha(a); 
    draw_text_transformed(cx, cy - 64, "EXTRAS", esc_texto, esc_texto, 0);
    
    draw_set_valign(fa_middle);
    var _inicio_y = cy - 45; 
    var _espacamento_y = 13;
    var _x_esq = cx - 65;  
    var _x_dir = cx + 65;  
    
    for (var i = 0; i < array_length(opcoes); i++) {
        var _yy = _inicio_y + (i * _espacamento_y);
        var _xx = _x_esq + x_offset_opcoes[i]; 
        
        var _cor_atual = (i == selecionado) ? cor_destaque : c_black;
        draw_set_color(_cor_atual);
        
        if (i == selecionado) {
            var _mostrar_seta = ((current_time mod 600) < 400); 
            if (_mostrar_seta) {
                draw_set_halign(fa_right);
                draw_text_transformed(_xx - 5, _yy, ">", esc_texto, esc_texto, 0);
            }
        }
        
        draw_set_halign(fa_left);
        draw_text_transformed(_xx, _yy, opcoes[i], esc_texto, esc_texto, 0);
        
        var _txt_valor = "";
        switch (i) {
            case 0: _txt_valor = global.debug ? "Ligado" : "Desligado"; break;
            case 1: _txt_valor = string(idx_final + 1); break;
            case 2: _txt_valor = string(idx_devaneio + 1); break;
            case 3: _txt_valor = global.retorno_devaneio_continuar ? "Continuar" : "Menu"; break;
            case 4: _txt_valor = pontos_historia[idx_ponto].nome; break; 
            case 5: _txt_valor = " "; break; 
            case 6: _txt_valor = " "; break; 
        }
        
        var _escala_v = esc_texto;
        if (i == selecionado && i != 5 && i != 6) {
            _escala_v = esc_texto * escala_valor; 
            _txt_valor = "< " + _txt_valor + " >";
        }
        
        draw_set_halign(fa_right);
        draw_text_transformed(_x_dir, _yy, _txt_valor, _escala_v, _escala_v, 0);
    }
    
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_text_ext_transformed(cx, cy + 50, descricoes[selecionado], 22, 700, esc_texto * 0.8, esc_texto * 0.8, 0);
}

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);