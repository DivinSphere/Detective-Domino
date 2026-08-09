teclas();

if (estado == "abrindo") {
    escala = lerp(escala, 1, 0.2);
    alfa = lerp(alfa, 1, 0.2);
    if (escala >= 0.99) { escala = 1; alfa = 1; estado = "aberto"; }
} 
else if (estado == "fechando") {
    escala = lerp(escala, 0, 0.3);
    alfa = lerp(alfa, 0, 0.3);
    if (escala <= 0.01) {
        if (instance_exists(obj_congela)) instance_destroy(obj_congela);
        instance_destroy();
    }
}

if (estado == "aberto") {
    
    if (confirmando_saida) {
        if (IN_ESQ_PRESS || IN_DIR_PRESS || IN_CIMA_PRESS || IN_BAIXO_PRESS) {
            opcao_confirmacao = !opcao_confirmacao;
            escala_valor = 1.5; 
        }
        
        if (IN_ACAO_PRESS) {
            if (opcao_confirmacao == 1) {
                room = Rm_variaveis;
            } else {
                confirmando_saida = false;
            }
        }
        
        if (IN_VOLTAR_PRESS) {
            confirmando_saida = false;
        }
    } 
    else {
        if (IN_VOLTAR_PRESS) {
			tocar(snd_fecha_menu)
            estado = "fechando";
        }

        if (IN_BAIXO_PRESS) {
            selecionado++;
            if (selecionado >= array_length(opcoes)) selecionado = 0;
            escala_valor = 1.0; 
			tocar(snd_menu_mexe)
        }
        if (IN_CIMA_PRESS) {
            selecionado--;
            if (selecionado < 0) selecionado = array_length(opcoes) - 1;
            escala_valor = 1.0;
			tocar(snd_menu_mexe)
        }

        var _dir = 0;
        var _acao = IN_ACAO_PRESS;
        if (IN_DIR_PRESS) _dir = 1; 
        if (IN_ESQ_PRESS) _dir = -1; 
        
        if (_dir != 0 || _acao) {
			tocar(snd_menu_mexe)
			
			
            var _alterou = false;
            
            switch (selecionado) {
                case 0: 
                    if (_dir != 0) { global.vol_geral = clamp(global.vol_geral + (_dir * 0.1), 0, 2); _alterou = true; }
                    break;
                case 1: 
                    if (_dir != 0) { global.vol_musica = clamp(global.vol_musica + (_dir * 0.1), 0, 2); _alterou = true; }
                    break;
                case 2: 
                    if (_dir != 0) { global.vol_efeito = clamp(global.vol_efeito + (_dir * 0.1), 0, 2); _alterou = true; }
                    break;
                case 3: 
                    if (_dir != 0 || _acao) { 
                        global.tela_cheia = !global.tela_cheia;
                        window_set_fullscreen(global.tela_cheia);
                        _alterou = true;
                    }
                    break;
                case 4: 
                    if (_dir != 0 || _acao) { 
                        global.censurar_sangue = !global.censurar_sangue;
                        _alterou = true;
                    }
                    break;
                case 5: 
                    escala_valor = 0.8; 
                    break;
                case 6: 
                    if (_acao) { 
                        if (room != Rm_menu) {
                            confirmando_saida = true;
                            opcao_confirmacao = 0; 
                        } else {
                            estado = "fechando";
							tocar(snd_fecha_menu)
                        }
                    }
                    break;
            }
            
            if (_alterou) {
                escala_valor = 1.5;
                if (selecionado == 0 || selecionado == 1) {
                    if (variable_global_exists("musica_atual_inst") && audio_is_playing(global.musica_atual_inst)) {
                        var _vol_final = global.vol_geral * global.vol_musica;
                        audio_sound_gain(global.musica_atual_inst, _vol_final, 0); 
                    }
                }
            }
        }
    }
}

escala_valor = lerp(escala_valor, 1.0, 0.2); 

for (var i = 0; i < array_length(opcoes); i++) {
    var _alvo_x = (!confirmando_saida && i == selecionado) ? 8 : 0;
    x_offset_opcoes[i] = lerp(x_offset_opcoes[i], _alvo_x, 0.2);
}