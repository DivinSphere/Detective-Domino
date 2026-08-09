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
    draw_text_transformed(cx, cy - 64, "CONFIGURAÇÕES", esc_texto, esc_texto, 0);
    
    draw_set_valign(fa_middle);
    var _inicio_y = cy - 45; 
    var _espacamento_y = 13;
    var _x_esq = cx - 65;  
    var _x_dir = cx + 65;  
    
    for (var i = 0; i < array_length(opcoes); i++) {
        var _yy = _inicio_y + (i * _espacamento_y);
        var _xx = _x_esq + x_offset_opcoes[i]; 
        
        var _cor_atual = (!confirmando_saida && i == selecionado) ? cor_destaque : c_black;
        draw_set_color(_cor_atual);
        
        if (!confirmando_saida && i == selecionado) {
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
            case 0: _txt_valor = string(round(global.vol_geral * 100)) + "%"; break;
            case 1: _txt_valor = string(round(global.vol_musica * 100)) + "%"; break;
            case 2: _txt_valor = string(round(global.vol_efeito * 100)) + "%"; break;
            case 3: _txt_valor = global.tela_cheia ? "Sim" : "Não"; break;
            case 4: _txt_valor = global.censurar_sangue ? "Sim" : "Não"; break;
            case 5: _txt_valor = "PT-BR"; break;
            case 6: _txt_valor = " "; break; 
        }
        
        var _escala_v = esc_texto;
        if (!confirmando_saida && i == selecionado && i != 6) {
            _escala_v = esc_texto * escala_valor; 
            _txt_valor = "< " + _txt_valor + " >";
        }
        
        draw_set_halign(fa_right);
        draw_text_transformed(_x_dir, _yy, _txt_valor, _escala_v, _escala_v, 0);
    }
    

	if (selecionado == 4) {
        var _frame_sangue = global.censurar_sangue ? 1 : 0; 
        

        gpu_set_fog(true, c_black, 0, 0);
        draw_sprite_ext(spr_sangue_exemplo, _frame_sangue, cx + 1, (cy + 55) + 1, escala, escala, 0, c_white, a * 0.2);
        gpu_set_fog(false, c_black, 0, 0);
        

        draw_set_alpha(a);
        draw_set_color(c_white);
        draw_sprite_ext(spr_sangue_exemplo, _frame_sangue, cx, cy + 55, escala, escala, 0, c_white, a);
		draw_set_halign(fa_center);
		draw_set_color(c_black);
		draw_set_valign(fa_top);
		draw_text_ext_transformed(cx, cy + 40, "Oculta detalhes de Ketchup (Prefere Maionese?)", 22, 700, esc_texto * 0.8, esc_texto * 0.8, 0);
		
		
    } else {
        draw_set_color(c_black);
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        draw_text_ext_transformed(cx, cy + 50, descricoes[selecionado], 22, 700, esc_texto * 0.8, esc_texto * 0.8, 0);
    }

    if (confirmando_saida) {
        
        draw_set_alpha(a * 0.85);
        draw_sprite_ext(sprite_index, 0, cx, cy, escala * 1.2, escala, 0, c_white, a * 0.85);
        
        draw_set_alpha(a * 0.4);
        draw_sprite_ext(sprite_index, 0, cx, cy, escala * 1.2, escala, 0, c_black, a * 0.4);
        
        var _pop_esc_x = escala * 0.85;
        var _pop_esc_y = escala * 0.40;
        
        draw_set_alpha(a * 0.5);
        draw_sprite_ext(sprite_index, 1, cx + 2, cy + 2, _pop_esc_x, _pop_esc_y, 0, c_black, a * 0.5);
        
        draw_set_alpha(a);
        draw_sprite_ext(sprite_index, 1, cx, cy, _pop_esc_x, _pop_esc_y, 0, c_white, a);
        
        draw_set_color(c_black);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        
        draw_text_transformed(cx, cy - 5, "Deseja voltar ao menu?\nTodo progresso será perdido!\n\nTODO MESMO (Ò_Ó)", esc_texto, esc_texto, 0);
        
        var _y_botoes = cy + 18;
        
        var _cor_nao = (opcao_confirmacao == 0) ? cor_destaque : c_black;
        var _esc_nao = (opcao_confirmacao == 0) ? esc_texto * escala_valor : esc_texto * 0.9;
        var _txt_nao = (opcao_confirmacao == 0) ? "> NÃO <" : "NÃO";
        
        draw_set_color(_cor_nao);
        draw_text_transformed(cx - 35, _y_botoes, _txt_nao, _esc_nao, _esc_nao, 0);

        var _cor_sim = (opcao_confirmacao == 1) ? cor_destaque : c_black;
        var _esc_sim = (opcao_confirmacao == 1) ? esc_texto * escala_valor : esc_texto * 0.9;
        var _txt_sim = (opcao_confirmacao == 1) ? "> SIM <" : "SIM";
        
        draw_set_color(_cor_sim);
        draw_text_transformed(cx + 35, _y_botoes, _txt_sim, _esc_sim, _esc_sim, 0);
    }
}

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);