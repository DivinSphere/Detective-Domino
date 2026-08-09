if (delay > 0) {
    if (instance_number(obj_dialogo) <= 1) {
        delay--;
    }
    exit; 
}

teclas(); 

if (escolha_fazendo_fade) {
    if (tempo_destaque_escolha > 0) {
        tempo_destaque_escolha--;
    } else {
        alfa_opcoes = lerp(alfa_opcoes, 0, 0.1);
        if (alfa_opcoes <= 0.05) {
            if (tipo_interacao == "escolha") {
                finalizar_processamento_escolha();
            } else {
                finalizar_minigame(minigame_resultado);
            }
        }
    }
    exit;
}

if (estado == "abrindo") {
    escala = lerp(escala, 1, 0.25);
    alfa = lerp(alfa, 1.0, 0.25);
    if (escala >= 0.99) {
        escala = 1;
        alfa = 1.0;
        estado = "rodando";
    }
} 
else if (estado == "fechando") {
    escala = lerp(escala, 0, 0.3);
    alfa = lerp(alfa, 0, 0.3);
    if (escala <= 0.01) {
        instance_destroy();
    }
    exit; 
}

var t_avancar = IN_ACAO_PRESS;
var t_completar = IN_VOLTAR_PRESS;
var t_esq = IN_ESQ_PRESS;
var t_dir = IN_DIR_PRESS;

var t_cima = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var t_baixo = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));

if (estado == "rodando") {
    
    falar_boca = false; 
    
    if (pos < max_len) {
        if (t_completar || t_avancar) {
            pos = max_len;
            pausa = 0;
        } 
        else {
            if (pausa > 0) {
                pausa--;
            } 
            else {
                var _char_atual = string_char_at(texto_atual, pos);
                var _char_inicial = string_char_at(texto_atual, 1);
                
                if (_char_inicial != "*" && _char_inicial != "~") {
                    if (_char_atual != " " && _char_atual != "." && _char_atual != "," && _char_atual != "!" && _char_atual != "?") {
                        falar_boca = true;
                    }
                }
                
                contador += vel;
                if (contador >= 1) {
                    pos += floor(contador);
                    contador = 0;
                    
                    if (pos > max_len) pos = max_len;
                    
                    var _char = string_char_at(texto_atual, pos);
                    if (_char == ",") {
                        pausa = 15;
                    } 
                    else if (_char == "." || _char == "!" || _char == "?") {
                        pausa = 30;
                    }

                    if (_char_inicial != "*" && _char_inicial != "~" && _char != " ") {
                        
                        if (array_length(fila) > 0) {
                            var _id_personagem = fila[0][0]; 
                            
                            if (_id_personagem >= 0 && _id_personagem < array_length(personagens_config)) {
                                var _cfg = personagens_config[_id_personagem];
                                
                                if (voz == noone || !audio_is_playing(voz)) {
                                    var _vol_final = global.vol_geral * global.vol_efeito;
                                    voz = audio_play_sound(_cfg[0], 1, false, _vol_final);
                                    audio_sound_pitch(voz, _cfg[1]);
                                }
                            }
                        }
                    }
					
                }
            }
        }
    } 
    else { 
		
        if (tem_escolha) {
            if (!mostrando_opcoes) {
                if (t_avancar) {
                    mostrando_opcoes = true;
                }
            } 
            else {
                if (tempo_escolha > 0) {
                    tempo_escolha--;
                    if (tempo_escolha <= 0) {
                        if (tipo_interacao == "escolha") {
                            escolha_selecionada = choose(0, array_length(opcoes_dados)-1);
                            realizar_escolha(escolha_selecionada);
                        } else {
                            processar_fim_minigame(false); 
                        }
                        exit;
                    }
                }

                if (tipo_interacao == "escolha") {
                    var _total_opcoes = array_length(opcoes_dados);
                    
                    if (t_esq || t_cima) {
                        escolha_selecionada--;
                        tocar(snd_menu_mexe)
                        if (escolha_selecionada < 0) escolha_selecionada = _total_opcoes - 1;
                    }
                    if (t_dir || t_baixo) {
                        escolha_selecionada++;
                        tocar(snd_menu_mexe)
                        if (escolha_selecionada >= _total_opcoes) escolha_selecionada = 0;
                    }
                    
                    if (t_avancar) {
                        tocar(snd_menu_confirma)
                        realizar_escolha(escolha_selecionada);
                    }
                }
                
                else if (tipo_interacao == "esmagar") {
                    if (t_avancar) {
                        mash_progresso++;
                        juice_escala = 1.5; 
                        tocar(snd_minigame_interagir)
                        if (mash_progresso >= mash_alvo) {
                            processar_fim_minigame(true); 
                        }
                    }
                }
                
                else if (tipo_interacao == "sequence") {
                    var _apertou_algo = IN_CIMA_PRESS || IN_BAIXO_PRESS || IN_ESQ_PRESS || IN_DIR_PRESS;
                    
                    if (_apertou_algo) {
                        var _tecla_esperada = string_upper(seq_botoes[seq_index]);
                        var _acertou = false;
                        
                        if ((_tecla_esperada == "W" || _tecla_esperada == "UP") && IN_CIMA_PRESS) _acertou = true;
                        else if ((_tecla_esperada == "S" || _tecla_esperada == "DOWN") && IN_BAIXO_PRESS) _acertou = true;
                        else if ((_tecla_esperada == "A" || _tecla_esperada == "LEFT") && IN_ESQ_PRESS) _acertou = true;
                        else if ((_tecla_esperada == "D" || _tecla_esperada == "RIGHT") && IN_DIR_PRESS) _acertou = true;
                        
                        if (_acertou) {
                            seq_index++;
                            tocar(snd_minigame_interagir)
                            juice_escala = 1.4; 
                            if (seq_index >= array_length(seq_botoes)) {
                                processar_fim_minigame(true); 
                            }
                        } else {
                            tocar(snd_interagir)
                            seq_index = 0;
                            juice_escala = 0.5; 
                        }
                    }
                }
                
                else if (tipo_interacao == "precisao") {
                    precisao_cursor += precisao_vel * precisao_dir;
                    if (precisao_cursor >= 1) {
                        precisao_cursor = 1;
                        precisao_dir = -1;
                    } else if (precisao_cursor <= 0) {
                        precisao_cursor = 0;
                        precisao_dir = 1;
                    }

                    if (t_avancar) {
                        juice_escala = 1.6; 
                        
                        var _margem = precisao_cursor;
                        if (_margem >= precisao_alvo_inicio && _margem <= precisao_alvo_inicio + precisao_alvo_tamanho) {
                            processar_fim_minigame(true); 
                        } else {
                            processar_fim_minigame(false); 
                        }
                    }
                }
            }
        } 
        else { 
            if (t_avancar) {
                if (array_length(fila) > 0) {
                    array_delete(fila, 0, 1);
                }
                
                if (array_length(fila) == 0) {
                    mostrando_opcoes = false;
                    tem_escolha = false;
                    opcoes_dados = [];
                    estado = "fechando";
                } else {
                    carregar_no_atual();
                }
            }
        }
    }
}


seta_timer += 0.1;