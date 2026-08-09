if (efeito_borboleta_ativo) {
    efeito_borboleta_escala = lerp(efeito_borboleta_escala, 1.2, 0.2); 
    efeito_borboleta_y = lerp(efeito_borboleta_y, -20, 0.08); 
    efeito_borboleta_alpha -= 0.02;
    
    if (efeito_borboleta_alpha <= 0) {
        efeito_borboleta_ativo = false;
    }
}

if (aparecer) {
    image_alpha += 0.05;
    if (image_alpha >= 1) {
        aparecer = false;
    }
}

if (sumir > 1) {
    sumir -= 0.05;
}

if (sumir == 1) {
    if (image_alpha > 0) {
        image_alpha -= 0.05;
    }
    if (image_alpha == 0.5 && global.historia == 3.3) {
        with (obj_objetos) {
            if (image_index == 8) visible = true;
        }
    }
}

if (jogador && ainda_segue == true) {
    var _cam_w = 320;
    var _cam_h = 180;
    
    var _novo_cam_x = floor(x / _cam_w) * _cam_w;
    var _novo_cam_y = floor(y / _cam_h) * _cam_h;
    
    camera_set_view_pos(view_camera[0], _novo_cam_x, _novo_cam_y);
}

if (instance_exists(obj_personagens) || instance_exists(obj_anotacoes)) {
    if (anim_atual != anim_menu && jogador) {
        mudar_animacao(anim_menu);
    }
    
    var _hsp = 0;
    
    var _tamanho_array = array_length(anim_atual);
    var _total_frames = _tamanho_array - 1; 
    var _modo_fim = anim_atual[_tamanho_array - 1]; 

    anim_timer += anim_speed;
    if (anim_timer >= 1) {
        anim_timer = 0;
        frame_idx++;
        if (frame_idx >= _total_frames) {
            if (_modo_fim == true || _modo_fim == 1) {
                frame_idx = 0; 
            } else { 
                frame_idx = _total_frames - 1; 
            }
        }
    }
    if (frame_idx >= _total_frames) frame_idx = _total_frames - 1;
    frame_real = anim_atual[frame_idx];
    
    x += _hsp;
    
    exit; 
}

if (anim_atual == anim_menu) {
    mudar_animacao(anim_parado);
}

if (instance_exists(obj_congela)) {
    mudar_animacao(anim_parado);
    
    var _hsp = 0;
    
    var _tamanho_array = array_length(anim_atual);
    var _total_frames = _tamanho_array - 1; 
    var _modo_fim = anim_atual[_tamanho_array - 1]; 

    anim_timer += anim_speed;
    if (anim_timer >= 1) {
        anim_timer = 0;
        frame_idx++;
        if (frame_idx >= _total_frames) {
            if (_modo_fim == true || _modo_fim == 1) {
                frame_idx = 0; 
            } else {
                frame_idx = _total_frames - 1; 
            }
        }
    }
    if (frame_idx >= _total_frames) frame_idx = _total_frames - 1;
    frame_real = anim_atual[frame_idx];
    
    exit; 
}

var _hsp = 0;
var _em_cutscene = (comando_atual != noone || array_length(fila_comandos) > 0);
var _tem_dialogo = instance_exists(obj_dialogo);

if (jogador && !_em_cutscene) {
    if (!_tem_dialogo && !carro) {
        teclas(); 
        
        if (pode_mover > 0) {
            pode_mover--;
        }
            
        var _move = IN_DIR_HOLD - IN_ESQ_HOLD;
        
        if (IN_TAUNT_PRESS && anim_atual[0] != anim_taunt[0]) {
            mudar_animacao(anim_taunt);
            tempo_parado = 0;
            _move = 0;
        }

        if (anim_atual[0] == anim_taunt[0]) {
            if (IN_DIR_PRESS || IN_ESQ_PRESS || IN_ACAO_PRESS || IN_VOLTAR_PRESS || IN_MENU_PRESS) {
                mudar_animacao(anim_parado);
            } else {
                _move = 0;
            }
        }

        if (pode_mover <= 0) {
            _hsp = _move * velocidade;
        }
        
        if (_move != 0 && pode_mover <= 0) {
            lado = _move;
            tempo_parado = 0;
        } else {
            if (anim_atual[0] != anim_taunt[0]) {
                tempo_parado++;
            }
        }

        var _tempo_maximo = game_get_speed(gamespeed_fps) * 7;
        
        if (_move == 0 && tempo_parado >= _tempo_maximo && anim_atual[0] != anim_taunt[0]) {
            mudar_animacao(anim_taunt);
            tempo_parado = 0;
        }

    } else {
        tempo_parado = 0; 
    }
} else {
    tempo_parado = 0; 
    
    if (!jogador && !_em_cutscene && olhar) {
        var _player_alvo = noone;
        
        with (obj_detetive) {
            if (jogador == true) {
                _player_alvo = id;
            }
        }
        
        if (_player_alvo != noone) {
            if (_player_alvo.x > x) {
                lado = 1;  
            } else if (_player_alvo.x < x) {
                lado = -1; 
            }
        }
    }
}

if (_em_cutscene) {
    if (comando_atual == noone && array_length(fila_comandos) > 0) {
        comando_atual = fila_comandos[0];
        array_delete(fila_comandos, 0, 1);
        
        if (comando_atual.tipo == "mover") {
            comando_atual.alvo_x = x + (comando_atual.arg1 * comando_atual.arg2);
        } else if (comando_atual.tipo == "animacao") {
            mudar_animacao(comando_atual.arg1);
        }
    }
    
    if (comando_atual != noone) {
        if (comando_atual.tipo == "mover") {
            var _dir = sign(comando_atual.alvo_x - x);
            lado = _dir;
            _hsp = _dir * velocidade;
            
            if (abs(x - comando_atual.alvo_x) <= velocidade) {
                x = comando_atual.alvo_x;
                _hsp = 0;
                comando_atual = noone; 
            }
        }
        else if (comando_atual.tipo == "animacao") {
            if (comando_atual.arg2 == true) {
                if (anim_atual == anim_parado) { 
                    comando_atual = noone;
                }
            } else {
                comando_atual = noone; 
            }
        }
        else if (comando_atual.tipo == "esperar") {
            comando_atual.arg1--; 
            if (comando_atual.arg1 <= 0) {
                comando_atual = noone;
            }
        }
    }
}

var _tamanho_array = array_length(anim_atual);
var _total_frames = _tamanho_array - 1; 
var _modo_fim = anim_atual[_tamanho_array - 1]; 

if (_modo_fim == true || _modo_fim == 1) {
    if (_hsp != 0) {
        mudar_animacao(anim_andando);
        
		if image_alpha>0.5
        tocar(snd_passo, true,random_range(0.8,1.2)); 
        
    } else {
        if (anim_atual == anim_andando || anim_atual == anim_parado) {
            mudar_animacao(anim_parado);
        }
    }
}

anim_timer += anim_speed;
if (anim_timer >= 1) {
    anim_timer = 0;
    frame_idx++;
    
    if (frame_idx >= _total_frames) {
        if (_modo_fim == true || _modo_fim == 1) {
            frame_idx = 0; 
        } 
        else if (_modo_fim == 2) {
            frame_idx = _total_frames - 1; 
        } 
        else {
            mudar_animacao(anim_parado); 
        }
    }
}

if (frame_idx >= _total_frames) {
    if (_modo_fim == 2) {
        frame_idx = _total_frames - 1;
    } else {
        frame_idx = 0;
    }
}

frame_real = anim_atual[frame_idx]; 

var _em_animacao_especial = (anim_atual != anim_parado && anim_atual != anim_andando);

if (!_em_cutscene && !_em_animacao_especial) {
    if (place_meeting(x + _hsp, y, obj_parede)) {
        while (!place_meeting(x + sign(_hsp), y, obj_parede)) {
            x += sign(_hsp);
        }
        _hsp = 0;
    }
}

x += _hsp;

var _margem = 7;
x = clamp(x, _margem, room_width - _margem);