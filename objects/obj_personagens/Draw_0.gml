



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
draw_sprite_ext(sprite_index, 0, cx, cy, escala * 1.5, escala, 0, c_white, a);

if (escala > 0.5) {
    draw_set_font(fnt_hud);

    var esc_texto = 0.25; 

    
    
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_color(c_black);
    draw_set_alpha(a); 

    draw_text_transformed(
        round(cx),
        round(cy - 64),
        "PERSONAGENS",
        esc_texto,
        esc_texto,
        0
    );
    
    
    
    
    var _id_jogador_atual = -1;
    
    
    with (obj_detetive) {
        if (jogador) {
            
            if (sprite_index == spr_detetive) _id_jogador_atual = 1;
            else if (sprite_index == spr_breno) _id_jogador_atual = 2;
            else if (sprite_index == spr_ellie) _id_jogador_atual = 3;
            else if (sprite_index == spr_theo) _id_jogador_atual = 4;
            else if (sprite_index == spr_tiffany) _id_jogador_atual = 5;
            else if (sprite_index == spr_sam) _id_jogador_atual = 6;
            
        }
    }
    
    
    
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    var _coluna_largura = 100;  
    var _linha_altura   = 35;  
    var _inicio_x       = cx - 90; 
    var _inicio_y       = cy - 36; 

    for (var i = 0; i < 6; i++) {
        var _perso = global.personagens[i+1];
        
        var _col = i div 3; 
        var _lin = i mod 3; 
        
        var _pos_x = _inicio_x + (_col * _coluna_largura);
        var _pos_y = _inicio_y + (_lin * _linha_altura);

        
        var _eh_jogador = (_perso.id == _id_jogador_atual);

        
        
        
        var _eh_desconhecido = false;
        
        for (var c = 0; c < array_length(_perso.caracteristicas); c++) {
            if (_perso.caracteristicas[c] == 0) {
                _eh_desconhecido = true;
                break;
            }
        }
        
        var _spr_retrato = _perso.retrato;
        var _img_retrato = 0;
        var _nome_exibir = _perso.nome;
        var _texto_desc = "";

        if (_eh_desconhecido) {
            _spr_retrato = spr_retratos_narrador;
            _img_retrato = 2; 
            _nome_exibir = "DESCONHECIDO";
            _texto_desc = "Sem dados";
        } else {
            _texto_desc = personagem_obter_texto_caracteristicas(_perso.id);
        }

        
        
        
        var _cor_fundo = c_white;
        var _cor_texto_nome = c_black;

        if (_eh_jogador) {
            
            var _wave = (sin(current_time / 150) + 1) / 2;
            _cor_fundo = merge_color(c_white, c_yellow, _wave);
            
            
            _cor_texto_nome = #a33232; 
            _nome_exibir += " (Atual)";
        }

        
        
        

        
        draw_sprite_ext(spr_retratos_narrador, 1, _pos_x, _pos_y, 1.0, 1.0, 0, _cor_fundo, a);
        
        
        draw_sprite_ext(_spr_retrato, _img_retrato, _pos_x, _pos_y, 1.0, 1.0, 0, c_white, a);

        
        draw_set_color(_cor_texto_nome);
        draw_text_transformed(
            _pos_x + 22,
            _pos_y - 1,
            _nome_exibir,
            esc_texto,
            esc_texto,
            0
        );

        
        draw_set_color(c_black); 
        draw_text_ext_transformed(
            _pos_x + 22,
            _pos_y + 7,
            _texto_desc,
            22,   
            300,  
            esc_texto * 0.8,
            esc_texto * 0.8,
            0
        );
    }
}


draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);