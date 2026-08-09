if (delay > 0) exit;

draw_set_color(c_black);
draw_set_alpha(alfa * 0.3);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1.0);

var cx = 160;
var cy = 151;

var _retrato_x = 10;
var _retrato_y = 130; 
var _deslocamento_y_retrato = 2; 


var _rosto_exibido = rosto_id;


if (falar_boca) {
    if ((current_time mod 200) < 100) {
        _rosto_exibido = 1;
    }
}

if spr_retrato==spr_retratos_narrador
	_rosto_exibido=0

if (escala < 1) {
    draw_sprite_ext(sprite_index, imagem, cx, cy, escala, escala, 0, c_white, alfa);

    if (!global.luz) gpu_set_fog(true, c_black, 0, 0);
    draw_sprite_ext(spr_retrato, _rosto_exibido, _retrato_x, _retrato_y + _deslocamento_y_retrato, 2 * escala, 2 * escala, image_angle, c_white, alfa);
    if (!global.luz) gpu_set_fog(false, c_black, 0, 0);
    
    exit;
}

draw_sprite(sprite_index, imagem, cx, cy);

if (!global.luz) gpu_set_fog(true, c_black, 0, 0);
draw_sprite_ext(spr_retrato, _rosto_exibido, _retrato_x, _retrato_y + _deslocamento_y_retrato, 2, 2, image_angle, c_white, alfa);
if (!global.luz) gpu_set_fog(false, c_black, 0, 0);

draw_set_color(c_yellow);
var _nome_exibido = global.luz ? nome_atual : "Voz";
draw_text_transformed(54, 130, _nome_exibido, 0.25, 0.25, 0);

draw_set_color(c_white);
var _texto_parcial = string_copy(texto_atual, 1, pos);
draw_text_ext_transformed(54, 139, _texto_parcial, 23, 1020, 0.25, 0.25, 0);


if ((pos >= max_len && tem_escolha && mostrando_opcoes) || escolha_fazendo_fade) {
    
    var _alfa_geral = escolha_fazendo_fade ? alfa_opcoes : 1.0;
    var _exibir_barra_tempo = (tempo_maximo > 0);
    
    
    juice_escala = lerp(juice_escala, 1.0, 0.2);
    
    
    if (tipo_interacao == "escolha") {
        
        if (is_array(opcoes_dados) && array_length(opcoes_dados) > 0) {
            var _qtd_opcoes = array_length(opcoes_dados);
            
            var _max_largura_txt = 0;
            for (var i = 0; i < _qtd_opcoes; i++) {
                var _txt_temp = string_upper(opcoes_dados[i][0]);
                var _largura_temp = string_width(_txt_temp) * 0.25;
                if (_largura_temp > _max_largura_txt) {
                    _max_largura_txt = _largura_temp;
                }
            }
            
            var _largura_botao = _max_largura_txt + 20;
            var _altura_botao = 12;
            var _espacamento = 5; 
            var _y_botao = 112;
            
            var _largura_total = (_largura_botao * _qtd_opcoes) + (_espacamento * (_qtd_opcoes - 1));
            var _x_inicio = cx - (_largura_total / 2);
            
            if (_exibir_barra_tempo) {
                var _barra_w = min(100, _largura_total); 
                var _barra_h = 4;
                var _barra_x = cx - (_barra_w / 2);
                var _barra_y = _y_botao - 10; 
                var _pct = clamp(tempo_escolha / tempo_maximo, 0, 1);
                
                draw_set_alpha(_alfa_geral);
                draw_set_color(c_white); draw_rectangle(_barra_x - 2, _barra_y - 2, _barra_x + _barra_w + 2, _barra_y + _barra_h + 2, false);
                draw_set_color(c_black); draw_rectangle(_barra_x - 1, _barra_y - 1, _barra_x + _barra_w + 1, _barra_y + _barra_h + 1, false);
                draw_set_color(c_gray);  draw_rectangle(_barra_x, _barra_y, _barra_x + _barra_w, _barra_y + _barra_h, false);
                draw_set_color(c_red);   draw_rectangle(_barra_x, _barra_y, _barra_x + (_barra_w * _pct), _barra_y + _barra_h, false);
            }
            
            for (var i = 0; i < _qtd_opcoes; i++) {
                var _txt = string_upper(opcoes_dados[i][0]);
                var _largura_txt = string_width(_txt) * 0.25;
                var _x_botao = _x_inicio + (i * (_largura_botao + _espacamento));
                
                var _alfa_btn = 1.0;
                var _cor_btn = (escolha_selecionada == i) ? c_yellow : c_white;
                
                if (escolha_fazendo_fade) {
                    if (opcao_vencedora == i) {
                        _alfa_btn = alfa_opcoes;
                        _cor_btn = (tempo_destaque_escolha > 0 && (tempo_destaque_escolha mod 10 < 5)) ? c_white : c_yellow;
                    } else {
                        _alfa_btn = max(0, alfa_opcoes - 0.8);
                    }
                }
                
                var _spr_index = (escolha_selecionada == i) ? 0 : 1;
                
                draw_sprite_stretched_ext(spr_escolha, _spr_index, _x_botao, _y_botao, _largura_botao, _altura_botao, c_white, _alfa_btn);
                draw_set_alpha(_alfa_btn);
                draw_set_color(_cor_btn);
                draw_text_transformed(_x_botao + (_largura_botao - _largura_txt) / 2, _y_botao + (_altura_botao - (string_height(_txt) * 0.25)) / 2, _txt, 0.25, 0.25, 0);
            }
            
            draw_set_alpha(1.0);
            draw_set_color(c_white);
        }
    }
    
    
    else if (tipo_interacao == "esmagar") {
        var _by = 107; 
        draw_set_alpha(_alfa_geral); 
        draw_set_halign(fa_center);
        
        
        var _escala_txt = 0.25 * juice_escala;
		draw_set_valign(fa_middle);
        draw_text_transformed(cx, _by +3, "INTERAJA", _escala_txt, _escala_txt, 0);
		draw_set_valign(fa_top);
        draw_set_halign(fa_left);
        
        
        var _barra_w = 26;
        var _barra_h_base = 4;
        var _barra_h = _barra_h_base * juice_escala; 
        var _espaco = 8; 
        
        
        var _barra_y = (_by + 10) - ((_barra_h - _barra_h_base) / 2); 
        
        var _x_barra_esq = cx - (_espaco / 2) - _barra_w; 
        var _x_barra_dir = cx + (_espaco / 2);            
        
        if (!_exibir_barra_tempo) _x_barra_dir = cx - (_barra_w / 2);
        
        if (_exibir_barra_tempo) {
            var _pct_tempo = clamp(tempo_escolha / tempo_maximo, 0, 1);
            draw_set_color(c_white); draw_rectangle(_x_barra_esq - 2, _barra_y - 2, _x_barra_esq + _barra_w + 2, _barra_y + _barra_h + 2, false);
            draw_set_color(c_black); draw_rectangle(_x_barra_esq - 1, _barra_y - 1, _x_barra_esq + _barra_w + 1, _barra_y + _barra_h + 1, false);
            draw_set_color(c_gray);  draw_rectangle(_x_barra_esq, _barra_y, _x_barra_esq + _barra_w, _barra_y + _barra_h, false);
            draw_set_color(c_red);   draw_rectangle(_x_barra_esq, _barra_y, _x_barra_esq + (_barra_w * _pct_tempo), _barra_y + _barra_h, false);
        }
        
        var _pct_mash = clamp(mash_progresso / max(1, mash_alvo), 0, 1);
        var _cor_barra = c_lime;
        if (escolha_fazendo_fade) {
            var _cor_base = minigame_resultado ? c_lime : c_red;
            _cor_barra = (tempo_destaque_escolha > 0 && (tempo_destaque_escolha mod 10 < 5)) ? c_white : _cor_base;
        }
        
        draw_set_color(c_white); draw_rectangle(_x_barra_dir - 2, _barra_y - 2, _x_barra_dir + _barra_w + 2, _barra_y + _barra_h + 2, false);
        draw_set_color(c_black); draw_rectangle(_x_barra_dir - 1, _barra_y - 1, _x_barra_dir + _barra_w + 1, _barra_y + _barra_h + 1, false);
        draw_set_color(c_gray);  draw_rectangle(_x_barra_dir, _barra_y, _x_barra_dir + _barra_w, _barra_y + _barra_h, false);
        draw_set_color(_cor_barra); draw_rectangle(_x_barra_dir, _barra_y, _x_barra_dir + (_barra_w * _pct_mash), _barra_y + _barra_h, false);
        
        draw_set_alpha(1.0); draw_set_color(c_white);
    }
    
    
    else if (tipo_interacao == "sequence") {
        var _tot = array_length(seq_botoes);
        var _esp = 15; 
        var _startX = cx - ((_tot - 1) * _esp) / 2;
        var _by = 105; 
        
        draw_set_alpha(_alfa_geral); 
        
        for (var i = 0; i < _tot; i++) {
            var _kx = _startX + (i * _esp);
            var _letra = string_upper(seq_botoes[i]);
            var _angulo = 0;
            
            if (_letra == "W" || _letra == "UP") _angulo = 90;
            else if (_letra == "S" || _letra == "DOWN") _angulo = 270;
            else if (_letra == "A" || _letra == "LEFT") _angulo = 180;
            else if (_letra == "D" || _letra == "RIGHT") _angulo = 0;
            
            var _img_index = 0, _cor = c_white;
            
            if (escolha_fazendo_fade) {
                var _cor_base = minigame_resultado ? c_yellow : c_red;
                _cor = (tempo_destaque_escolha > 0 && (tempo_destaque_escolha mod 10 < 5)) ? c_white : _cor_base;
                _img_index = minigame_resultado ? 1 : 0; 
            }
            else if (i < seq_index) {
                _img_index = 0; _cor = c_dkgray; 
            } else if (i == seq_index) {
                _img_index = 1; _cor = c_white;
            } else {
                _img_index = 0; _cor = c_white;
            }
            
            
            var _escala_final = 1.0;
            
            if (i == seq_index - 1) {
                _escala_final = juice_escala;
            } else if (juice_escala < 1) {
                
                _escala_final = juice_escala;
            }
            
            draw_sprite_ext(spr_seta, _img_index, _kx, _by, _escala_final, _escala_final, _angulo, _cor, _alfa_geral);
        }
        
        if (_exibir_barra_tempo) {
            var _barra_w = 26, _barra_h = 4, _barra_x = cx - (_barra_w / 2), _barra_y = _by + 11; 
            var _pct_tempo = clamp(tempo_escolha / tempo_maximo, 0, 1);
            
            draw_set_color(c_white); draw_rectangle(_barra_x - 2, _barra_y - 2, _barra_x + _barra_w + 2, _barra_y + _barra_h + 2, false);
            draw_set_color(c_black); draw_rectangle(_barra_x - 1, _barra_y - 1, _barra_x + _barra_w + 1, _barra_y + _barra_h + 1, false);
            draw_set_color(c_gray);  draw_rectangle(_barra_x, _barra_y, _barra_x + _barra_w, _barra_y + _barra_h, false);
            draw_set_color(c_red);   draw_rectangle(_barra_x, _barra_y, _barra_x + (_barra_w * _pct_tempo), _barra_y + _barra_h, false);
        }
        draw_set_alpha(1.0); draw_set_color(c_white);
    }
    
    
    else if (tipo_interacao == "precisao") {
        var _by = 106;
        draw_set_alpha(_alfa_geral);
        
        var _barra_w = 52; 
        var _barra_h = 6; 
        var _barra_x = cx - (_barra_w / 2);
        var _barra_y = _by + 7;
        
        if (_exibir_barra_tempo) {
            var _tempo_w = 26;
            var _tempo_h = 4;
            var _tempo_x = cx - (_tempo_w / 2);
            var _tempo_y = _barra_y - 10; 
            var _pct_tempo = clamp(tempo_escolha / tempo_maximo, 0, 1);
            
            draw_set_color(c_white); draw_rectangle(_tempo_x - 2, _tempo_y - 2, _tempo_x + _tempo_w + 2, _tempo_y + _tempo_h + 2, false);
            draw_set_color(c_black); draw_rectangle(_tempo_x - 1, _tempo_y - 1, _tempo_x + _tempo_w + 1, _tempo_y + _tempo_h + 1, false);
            draw_set_color(c_gray);  draw_rectangle(_tempo_x, _tempo_y, _tempo_x + _tempo_w, _tempo_y + _tempo_h, false);
            draw_set_color(c_red);   draw_rectangle(_tempo_x, _tempo_y, _tempo_x + (_tempo_w * _pct_tempo), _tempo_y + _tempo_h, false);
        }

        draw_set_color(c_white); draw_rectangle(_barra_x - 2, _barra_y - 2, _barra_x + _barra_w + 2, _barra_y + _barra_h + 2, false);
        draw_set_color(c_black); draw_rectangle(_barra_x - 1, _barra_y - 1, _barra_x + _barra_w + 1, _barra_y + _barra_h + 1, false);
        draw_set_color(c_red);   draw_rectangle(_barra_x, _barra_y, _barra_x + _barra_w, _barra_y + _barra_h, false);
        
        var _amarelo_tamanho = 0.1;
        var _x_amarelo_inicio = _barra_x + (_barra_w * max(0, precisao_alvo_inicio - _amarelo_tamanho));
        var _x_amarelo_fim = _barra_x + (_barra_w * min(1, precisao_alvo_inicio + precisao_alvo_tamanho + _amarelo_tamanho));
        draw_set_color(c_yellow); draw_rectangle(_x_amarelo_inicio, _barra_y, _x_amarelo_fim, _barra_y + _barra_h, false);
        
        var _x_verde_inicio = _barra_x + (_barra_w * precisao_alvo_inicio);
        var _x_verde_fim = _barra_x + (_barra_w * (precisao_alvo_inicio + precisao_alvo_tamanho));
        draw_set_color(c_lime); draw_rectangle(_x_verde_inicio, _barra_y, _x_verde_fim, _barra_y + _barra_h, false);

        var _cursor_x = _barra_x + (_barra_w * precisao_cursor);
        var _cursor_w = 2;
        
        var _cor_cursor = c_white;
        if (escolha_fazendo_fade) {
            _cor_cursor = minigame_resultado ? c_lime : c_red;
            if (tempo_destaque_escolha mod 10 < 5) _cor_cursor = c_white;
        }

        
        var _cursor_h_extra = 3 * (juice_escala - 1); 
        
        draw_set_color(c_black); 
        draw_rectangle(_cursor_x - (_cursor_w/2) - 1, (_barra_y - 3) - _cursor_h_extra, _cursor_x + (_cursor_w/2) + 1, (_barra_y + _barra_h + 3) + _cursor_h_extra, false);
        draw_set_color(_cor_cursor);
        draw_rectangle(_cursor_x - (_cursor_w/2), (_barra_y - 2) - _cursor_h_extra, _cursor_x + (_cursor_w/2), (_barra_y + _barra_h + 2) + _cursor_h_extra, false);
        
        draw_set_alpha(1.0); draw_set_color(c_white);
    }
}

if (pos >= max_len && estado == "rodando" && (!tem_escolha || (tem_escolha && !mostrando_opcoes))) {
    var _cor_seta = c_white; 
    
    if (tem_escolha) {
        _cor_seta = c_red; 
    } else if (array_length(fila) == 1) {
        _cor_seta = c_yellow; 
    }
    
    var _offset = sin(seta_timer) * 1.5;
    
    
    draw_sprite_ext(sprite_index, 2, cx, cy + _offset, 1, 1, image_angle, _cor_seta, 1);
    
    
    
    
    var _txt_acao = "J"; 
    
    switch (global.comandos) {
        case 1: _txt_acao = "J"; break; 
        case 2: _txt_acao = "Z"; break; 
        case 3: _txt_acao = "A"; break; 
    }

    draw_set_font(fnt_hud); 
    draw_set_color(_cor_seta); 
    draw_set_halign(fa_right); 
    draw_set_valign(fa_middle);
    
    
    
    
    draw_text_transformed(303, 168 + _offset, _txt_acao, 0.35, 0.35, 0);
    
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

draw_set_alpha(1)