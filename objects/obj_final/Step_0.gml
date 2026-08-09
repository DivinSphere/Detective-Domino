teclas();

if (estado == "entrando") {
    alfa_fundo = lerp(alfa_fundo, 0.65, 0.02);
    alfa_geral = lerp(alfa_geral, 1.0, 0.04);

    if (alfa_geral > 0.5) {
        tempo_linha++;
        if (tempo_linha > 45 && linha_atual < array_length(linhas)) {
            linha_atual++;
            tempo_linha = 0;
        }
    }

    var _todas_prontas = true;
    for (var i = 0; i < array_length(linhas); i++) {
        var _alvo_alfa = (i < linha_atual) ? 1.0 : 0.0;
        var _alvo_y = (i < linha_atual) ? 0 : 10;
        
        alfas_linhas[i] = lerp(alfas_linhas[i], _alvo_alfa, 0.05);
        y_offsets[i] = lerp(y_offsets[i], _alvo_y, 0.08);

        if (alfas_linhas[i] < 0.9) {
            _todas_prontas = false;
        }
    }

    if (linha_atual == array_length(linhas) && _todas_prontas) {
        estado = "esperando";
    }
} 
else if (estado == "esperando") {
    for (var i = 0; i < array_length(linhas); i++) {
        alfas_linhas[i] = lerp(alfas_linhas[i], 1.0, 0.05);
        y_offsets[i] = lerp(y_offsets[i], 0, 0.08);
    }
    
    if (IN_ACAO_PRESS or IN_START_PRESS ) {
        estado = "saindo";
    }
} 
else if (estado == "saindo") {
    alfa_fundo = lerp(alfa_fundo, 0, 0.06);
    alfa_geral = lerp(alfa_geral, 0, 0.08);
    
    for (var i = 0; i < array_length(linhas); i++) {
        alfas_linhas[i] = lerp(alfas_linhas[i], 0, 0.1);
    }

    if (alfa_fundo <= 0.4) {
        if (variable_global_exists("retornar") && global.retornar == true) {
            global.retornar = false; 
        }
        room_goto(room_destino); 
    }
}