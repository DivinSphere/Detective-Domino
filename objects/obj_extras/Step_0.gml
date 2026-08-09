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
        instance_destroy();
    }
}

if (estado == "aberto") {
    
    if (IN_VOLTAR_PRESS) {
        estado = "fechando";
		tocar(snd_fecha_menu)
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
    if (IN_DIR_PRESS){_dir = 1; tocar(snd_menu_mexe)}
    if (IN_ESQ_PRESS){_dir = -1;  tocar(snd_menu_mexe)}
	if (IN_ACAO_PRESS){tocar(snd_menu_mexe)}
    
    if (_dir != 0 || _acao) {
        var _alterou = false;
        
        switch (selecionado) {
            case 0: 
                if (_dir != 0 || _acao) { 
                    global.debug = !global.debug;
                    _alterou = true;
                }
                break;
            case 1: 
                if (_dir != 0) { 
                    idx_final += _dir;
                    if (idx_final >= array_length(finais_ids)) idx_final = 0;
                    if (idx_final < 0) idx_final = array_length(finais_ids) - 1;
                    _alterou = true; 
                }
                if (_acao) {
                    global.historia = finais_ids[idx_final];
                    global.retornar = true;
					tocar(snd_menu_confirma)
                    room_goto(Rm_finais);
                }
                break;
            case 2: 
                if (_dir != 0) { 
                    idx_devaneio += _dir;
                    if (idx_devaneio >= array_length(devaneios_ids)) idx_devaneio = 0;
                    if (idx_devaneio < 0) idx_devaneio = array_length(devaneios_ids) - 1;
                    _alterou = true; 
                }
                if (_acao) {
					tocar(snd_menu_confirma)
                    global.historia = devaneios_ids[idx_devaneio];
                    global.retornar = true;
                    room_goto(Rm_finais);
                }
                break;
            case 3:
                if (_dir != 0 || _acao) { 
                    global.retorno_devaneio_continuar = !global.retorno_devaneio_continuar;
                    _alterou = true;
                }
                break;
			case 4:
                if (_dir != 0) { 
                    idx_ponto += _dir;
                    if (idx_ponto >= array_length(pontos_historia)) idx_ponto = 0;
                    if (idx_ponto < 0) idx_ponto = array_length(pontos_historia) - 1;
                    _alterou = true; 
                }
                if (_acao) {
                    tocar(snd_menu_confirma);
                    var _ponto_escolhido = pontos_historia[idx_ponto];
                    global.historia = _ponto_escolhido.id;
                    room_goto(_ponto_escolhido.rm);
                }
                break;
            case 5:
                if (_acao) {
					tocar(snd_menu_confirma)
                    global.historia = -100;
                    global.retornar = true;
                    room_goto(Rm_finais);
                }
                break;
            case 6:
                if (_acao) {
                    estado = "fechando";
					tocar(snd_fecha_menu)
                }
                break;
        }
        
        if (_alterou) escala_valor = 1.5;
    }
}

escala_valor = lerp(escala_valor, 1.0, 0.2); 

for (var i = 0; i < array_length(opcoes); i++) {
    var _alvo_x = (i == selecionado) ? 8 : 0;
    x_offset_opcoes[i] = lerp(x_offset_opcoes[i], _alvo_x, 0.2);
}