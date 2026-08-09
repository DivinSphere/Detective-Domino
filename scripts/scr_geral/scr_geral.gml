// Função para identificar se o audio é música ou efeito sonoro
// Se for música vai tocar com fade in, se já tiver outro tocando vai parar ela com fadeout e começar outra
// Se for efeito sonoro vai tocar automaticamente
// Utilizar variaveis de som automaticamente que eu criei

if (!variable_global_exists("musica_atual_inst")) {
    global.musica_atual_asset = noone;
    global.musica_atual_inst = noone;
    global.posicoes_musicas = {}; 
}

function tocar(_audio, _loop_efeito = false, _pitch = 1) {
    if (!audio_exists(_audio)) return; 
    
    var _duracao = audio_sound_length(_audio);
    var _nome_audio = audio_get_name(_audio); 
    
    if (_duracao > 30) {
        var _vol_final = global.vol_geral * global.vol_musica;
        
        if (global.musica_atual_asset == _audio && audio_is_playing(global.musica_atual_inst)) {
            audio_sound_gain(global.musica_atual_inst, _vol_final, 500);
            
            if (_pitch != 1) audio_sound_pitch(global.musica_atual_inst, _pitch);
            return;
        }
        
        if (global.musica_atual_inst != noone && audio_is_playing(global.musica_atual_inst)) {
            var _musica_antiga = global.musica_atual_inst;
            var _nome_antigo = audio_get_name(global.musica_atual_asset); 
            
            var _posicao = audio_sound_get_track_position(_musica_antiga);
            global.posicoes_musicas[$ _nome_antigo] = _posicao;

            audio_sound_gain(_musica_antiga, 0, 500); 
            
            var _func_parar = method({inst: _musica_antiga}, function(){
                audio_stop_sound(inst);
            });
            call_later(0.5, time_source_units_seconds, _func_parar);
        }
        
        global.musica_atual_asset = _audio;
        global.musica_atual_inst = audio_play_sound(_audio, 100, true);
        
        if (variable_struct_exists(global.posicoes_musicas, _nome_audio)) {
            var _tempo_salvo = global.posicoes_musicas[$ _nome_audio];
            audio_sound_set_track_position(global.musica_atual_inst, _tempo_salvo);
        }
        
        audio_sound_gain(global.musica_atual_inst, 0, 0); 
        audio_sound_gain(global.musica_atual_inst, _vol_final, 1000);
        
        if (_pitch != 1) audio_sound_pitch(global.musica_atual_inst, _pitch);
    }
    
    else {
        if (_loop_efeito == true) {
            if (audio_is_playing(_audio)) {
                return; 
            }
        }
        
        var _vol_final = global.vol_geral * global.vol_efeito;
        var _efeito_inst = audio_play_sound(_audio, 10, false);
        audio_sound_gain(_efeito_inst, _vol_final, 0);
        
		if _audio==snd_voz_1
			audio_sound_gain(_efeito_inst, _vol_final*1.2, 0);
		
        if (_pitch != 1) {
            audio_sound_pitch(_efeito_inst, _pitch);
        }
		
		
    }
}

function atribuir_comando(_obj, _tipo, _arg1 = 0, _arg2 = 0) {
    if (instance_exists(_obj)) {
        
        
        if (_tipo == "limpar") {
            _obj.fila_comandos = [];
            _obj.comando_atual = noone;
            
            if (variable_instance_exists(_obj, "tempo_espera")) _obj.tempo_espera = 0;
            if (variable_instance_exists(_obj, "distancia_restante")) _obj.distancia_restante = 0;
            
            _obj.estado = "normal";
            _obj.vel_h = 0;
            _obj.vel_v = 0;
            exit; 
        }
        
        
        array_push(_obj.fila_comandos, { tipo: _tipo, arg1: _arg1, arg2: _arg2 });
    }
}


function anotar(_texto) {
    var _dia_encontrado = false;
    
    
    for (var i = 0; i < array_length(global.anotacoes); i++) {
        if (global.anotacoes[i].dia == global.dia) {
            array_push(global.anotacoes[i].textos, "- " + _texto);
            _dia_encontrado = true;
            break;
        }
    }
    
    
    if (!_dia_encontrado) {
        array_push(global.anotacoes, { dia: global.dia, textos: ["- " + _texto] });
    }
	
	
	if (instance_exists(obj_detetive)) {
	    with (obj_detetive) {
	        if (jogador == true) { 
	            efeito_borboleta_ativo = true;
				tocar(snd_borboleta)
	            efeito_borboleta_y = 0;       
	            efeito_borboleta_alpha = 1.5; 
	            efeito_borboleta_escala = 0;  
				efeito_borboleta_imagem = 1
	        }
	    }
	}
    
    
    global.notas_nao_lidas = true;
}



function personagem_adicionar_caracteristica(_id_personagem, _id_caracteristica) {
	
	personagem_remover_caracteristica(_id_personagem,0)
	
    for (var i = 0; i < array_length(global.personagens); i++) {
        if (global.personagens[i].id == _id_personagem) {
            var _lista = global.personagens[i].caracteristicas;
            
            
            var _encontrado = false;
            for (var j = 0; j < array_length(_lista); j++) {
                if (_lista[j] == _id_caracteristica) {
                    _encontrado = true;
                    break;
                }
            }
            
            if (!_encontrado) {
                array_push(_lista, _id_caracteristica);
                
                
                global.caracteristicas_nao_lidas = true; 
                
                
                if (instance_exists(obj_detetive)) {
                    with (obj_detetive) {
                        if (jogador == true) { 
                            efeito_borboleta_ativo = true;
							tocar(snd_borboleta)
                            efeito_borboleta_y = 0;       
                            efeito_borboleta_alpha = 1.5; 
                            efeito_borboleta_escala = 0;  
							efeito_borboleta_imagem = 0
                        }
                    }
                }
            }
            break;
        }
    }
}



function personagem_remover_caracteristica(_id_personagem, _id_caracteristica) {
    for (var i = 0; i < array_length(global.personagens); i++) {
        if (global.personagens[i].id == _id_personagem) {
            var _lista = global.personagens[i].caracteristicas;
            for (var j = array_length(_lista) - 1; j >= 0; j--) {
                if (_lista[j] == _id_caracteristica) {
                    array_delete(_lista, j, 1);
                }
            }
            break;
        }
    }
}


function personagem_tem_caracteristica(_id_personagem, _id_caracteristica) {
    for (var i = 0; i < array_length(global.personagens); i++) {
        if (global.personagens[i].id == _id_personagem) {
            var _lista = global.personagens[i].caracteristicas;
            
            for (var j = 0; j < array_length(_lista); j++) {
                if (_lista[j] == _id_caracteristica) {
                    return true; 
                }
            }
            break;
        }
    }
    return false; 
}


function personagem_obter_texto_caracteristicas(_id_personagem) {
    for (var i = 0; i < array_length(global.personagens); i++) {
        var _perso = global.personagens[i];
        
        if (_perso.id == _id_personagem) {
            var _lista = _perso.caracteristicas;
            var _texto_final = "";
            
            for (var j = 0; j < array_length(_lista); j++) {
                var _car_id = _lista[j];
                var _chave_str = string(_car_id);
                
                
                if (struct_exists(global.mapa_caracteristicas, _chave_str)) {
                    var _objeto_car = global.mapa_caracteristicas[$ _chave_str];
                    
                    
                    if (struct_exists(_perso, "genero") && _perso.genero == "f") {
                        _texto_final += _objeto_car.fem;
                    } else {
                        _texto_final += _objeto_car.masc;
                    }
                    
                    
                    if (j < array_length(_lista) - 1) {
                        _texto_final += ", ";
                    }
                }
            }
            return _texto_final;
        }
    }
    return "Desconhecido";
}


function teclas() {
    
    if (!variable_global_exists("comandos")) {
        global.comandos = 1; 
    }

    var pad_id = -1;
    for (var i = 0; i < 12; i++) {
        if (gamepad_is_connected(i)) {
            pad_id = i;
            break;
        }
    }

    // Teclado A
    var _w_cima_hold   = keyboard_check(ord("W"));
    var _w_cima_press  = keyboard_check_pressed(ord("W"));
    
    var _w_baixo_hold  = keyboard_check(ord("S"));
    var _w_baixo_press = keyboard_check_pressed(ord("S"));
    
    var _w_esq_hold    = keyboard_check(ord("A"));
    var _w_esq_press   = keyboard_check_pressed(ord("A"));
    
    var _w_dir_hold    = keyboard_check(ord("D"));
    var _w_dir_press   = keyboard_check_pressed(ord("D"));

    var _w_acao_hold   = keyboard_check(ord("J"));
    var _w_acao_press  = keyboard_check_pressed(ord("J"));
    var _w_acao_rel    = keyboard_check_released(ord("J"));

    var _w_voltar_hold = keyboard_check(ord("K"));
    var _w_voltar_press= keyboard_check_pressed(ord("K"));
    var _w_voltar_rel  = keyboard_check_released(ord("K"));

    var _w_menu_hold   = keyboard_check(ord("L"));
    var _w_menu_press  = keyboard_check_pressed(ord("L"));
    var _w_menu_rel    = keyboard_check_released(ord("L"));

    var _w_taunt_hold  = keyboard_check(ord("H"));
    var _w_taunt_press = keyboard_check_pressed(ord("H"));
    var _w_taunt_rel   = keyboard_check_released(ord("H"));

    var _w_start_hold  = keyboard_check(vk_enter) || keyboard_check(vk_escape);
    var _w_start_press = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_escape);
    var _w_start_rel   = keyboard_check_released(vk_enter) || keyboard_check_released(vk_escape);

    if (_w_cima_hold || _w_baixo_hold || _w_esq_hold || _w_dir_hold || _w_acao_hold || _w_voltar_hold || _w_menu_hold || _w_taunt_hold) {
        global.comandos = 1;
    }

    // Teclado B
    var _a_cima_hold   = keyboard_check(vk_up);
    var _a_cima_press  = keyboard_check_pressed(vk_up);
    
    var _a_baixo_hold  = keyboard_check(vk_down);
    var _a_baixo_press = keyboard_check_pressed(vk_down);
    
    var _a_esq_hold    = keyboard_check(vk_left);
    var _a_esq_press   = keyboard_check_pressed(vk_left);
    
    var _a_dir_hold    = keyboard_check(vk_right);
    var _a_dir_press   = keyboard_check_pressed(vk_right);

    var _a_acao_hold   = keyboard_check(ord("Z"));
    var _a_acao_press  = keyboard_check_pressed(ord("Z"));
    var _a_acao_rel    = keyboard_check_released(ord("Z"));

    var _a_voltar_hold = keyboard_check(ord("X"));
    var _a_voltar_press= keyboard_check_pressed(ord("X"));
    var _a_voltar_rel  = keyboard_check_released(ord("X"));

    var _a_menu_hold   = keyboard_check(ord("C"));
    var _a_menu_press  = keyboard_check_pressed(ord("C"));
    var _a_menu_rel    = keyboard_check_released(ord("C"));

    var _a_taunt_hold  = keyboard_check(vk_space);
    var _a_taunt_press = keyboard_check_pressed(vk_space);
    var _a_taunt_rel   = keyboard_check_released(vk_space);

    var _a_start_hold  = keyboard_check(vk_enter) || keyboard_check(vk_escape);
    var _a_start_press = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_escape);
    var _a_start_rel   = keyboard_check_released(vk_enter) || keyboard_check_released(vk_escape);

    if (_a_cima_hold || _a_baixo_hold || _a_esq_hold || _a_dir_hold || _a_acao_hold || _a_voltar_hold || _a_menu_hold || _a_taunt_hold) {
        global.comandos = 2;
    }

    // Controle aqui
    var _gp_cima_hold = false, _gp_cima_press = false;
    var _gp_baixo_hold = false, _gp_baixo_press = false;
    var _gp_esq_hold = false, _gp_esq_press = false;
    var _gp_dir_hold = false, _gp_dir_press = false;
    
    var _gp_acao_hold = false, _gp_acao_press = false, _gp_acao_rel = false;
    var _gp_voltar_hold = false, _gp_voltar_press = false, _gp_voltar_rel = false;
    var _gp_menu_hold = false, _gp_menu_press = false, _gp_menu_rel = false;
    var _gp_taunt_hold = false, _gp_taunt_press = false, _gp_taunt_rel = false;
    var _gp_start_hold = false, _gp_start_press = false, _gp_start_rel = false;

    if (pad_id != -1) {
        var deadzone = 0.4;
        var axis_h = gamepad_axis_value(pad_id, gp_axislh);
        var axis_v = gamepad_axis_value(pad_id, gp_axislv);
        
        _gp_cima_hold  = gamepad_button_check(pad_id, gp_padu) || (axis_v < -deadzone);
        _gp_cima_press = gamepad_button_check_pressed(pad_id, gp_padu);
        
        _gp_baixo_hold  = gamepad_button_check(pad_id, gp_padd) || (axis_v > deadzone);
        _gp_baixo_press = gamepad_button_check_pressed(pad_id, gp_padd);
        
        _gp_esq_hold  = gamepad_button_check(pad_id, gp_padl) || (axis_h < -deadzone);
        _gp_esq_press = gamepad_button_check_pressed(pad_id, gp_padl);
        
        _gp_dir_hold  = gamepad_button_check(pad_id, gp_padr) || (axis_h > deadzone);
        _gp_dir_press = gamepad_button_check_pressed(pad_id, gp_padr);

        _gp_acao_hold    = gamepad_button_check(pad_id, gp_face1);
        _gp_acao_press   = gamepad_button_check_pressed(pad_id, gp_face1);
        _gp_acao_rel     = gamepad_button_check_released(pad_id, gp_face1);

        _gp_voltar_hold  = gamepad_button_check(pad_id, gp_face2);
        _gp_voltar_press = gamepad_button_check_pressed(pad_id, gp_face2);
        _gp_voltar_rel   = gamepad_button_check_released(pad_id, gp_face2);
        
        _gp_menu_hold    = gamepad_button_check(pad_id, gp_face4);
        _gp_menu_press   = gamepad_button_check_pressed(pad_id, gp_face4);
        _gp_menu_rel     = gamepad_button_check_released(pad_id, gp_face4);

        _gp_taunt_hold   = gamepad_button_check(pad_id, gp_face3);
        _gp_taunt_press  = gamepad_button_check_pressed(pad_id, gp_face3);
        _gp_taunt_rel    = gamepad_button_check_released(pad_id, gp_face3);
        
        _gp_start_hold   = gamepad_button_check(pad_id, gp_start);
        _gp_start_press  = gamepad_button_check_pressed(pad_id, gp_start);
        _gp_start_rel    = gamepad_button_check_released(pad_id, gp_start);

        if (_gp_cima_hold || _gp_baixo_hold || _gp_esq_hold || _gp_dir_hold || _gp_acao_hold || _gp_voltar_hold || _gp_menu_hold || _gp_taunt_hold) {
            global.comandos = 3;
        }
    }


    IN_CIMA_HOLD   = _w_cima_hold  || _a_cima_hold  || _gp_cima_hold;
    IN_CIMA_PRESS  = _w_cima_press || _a_cima_press || _gp_cima_press;
    
    IN_BAIXO_HOLD  = _w_baixo_hold  || _a_baixo_hold  || _gp_baixo_hold;
    IN_BAIXO_PRESS = _w_baixo_press || _a_baixo_press || _gp_baixo_press;
    
    IN_ESQ_HOLD    = _w_esq_hold  || _a_esq_hold  || _gp_esq_hold;
    IN_ESQ_PRESS   = _w_esq_press || _a_esq_press || _gp_esq_press;
    
    IN_DIR_HOLD    = _w_dir_hold  || _a_dir_hold  || _gp_dir_hold;
    IN_DIR_PRESS   = _w_dir_press || _a_dir_press || _gp_dir_press;

    IN_ACAO_HOLD    = _w_acao_hold  || _a_acao_hold  || _gp_acao_hold;
    IN_ACAO_PRESS   = _w_acao_press || _a_acao_press || _gp_acao_press;
    IN_ACAO_RELEASE = _w_acao_rel   || _a_acao_rel   || _gp_acao_rel;

    IN_VOLTAR_HOLD    = _w_voltar_hold  || _a_voltar_hold  || _gp_voltar_hold;
    IN_VOLTAR_PRESS   = _w_voltar_press || _a_voltar_press || _gp_voltar_press;
    IN_VOLTAR_RELEASE = _w_voltar_rel   || _a_voltar_rel   || _gp_voltar_rel;

    IN_MENU_HOLD    = _w_menu_hold  || _a_menu_hold  || _gp_menu_hold;
    IN_MENU_PRESS   = _w_menu_press || _a_menu_press || _gp_menu_press;
    IN_MENU_RELEASE = _w_menu_rel   || _a_menu_rel   || _gp_menu_rel;

    IN_TAUNT_HOLD    = _w_taunt_hold  || _a_taunt_hold  || _gp_taunt_hold;
    IN_TAUNT_PRESS   = _w_taunt_press || _a_taunt_press || _gp_taunt_press;
    IN_TAUNT_RELEASE = _w_taunt_rel   || _a_taunt_rel   || _gp_taunt_rel;
    
    IN_START_HOLD    = _w_start_hold  || _a_start_hold  || _gp_start_hold;
    IN_START_PRESS   = _w_start_press || _a_start_press || _gp_start_press;
    IN_START_RELEASE = _w_start_rel   || _a_start_rel   || _gp_start_rel;
}