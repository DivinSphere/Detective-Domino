teclas();

logo_x = lerp(logo_x, logo_x_alvo, 0.08);

for (var i = 1; i <= 8; i++) {
    faixa_x[i] = lerp(faixa_x[i], 0, 0.03 + (i * 0.01));
}
faixa_y[9] = lerp(faixa_y[9], 0, 0.05);


if (instance_exists(obj_configuracoes) || instance_exists(obj_extras)) {
    exit; 
}

if (estado == "navegando") {
    
	
    if (keyboard_check_pressed(vk_escape)) {
		tocar(snd_menu_mexe)
		if selecionado != array_length(opcoes) - 1{
		selecionado = array_length(opcoes) - 1;
		escala_botoes[selecionado] = 0.65;
		seta_escala = 0.75;
		}else  IN_ACAO_PRESS=true

        

    }
	
	
	
    if (IN_BAIXO_PRESS) {
		tocar(snd_menu_mexe)
        selecionado++;
        if (selecionado >= array_length(opcoes)) selecionado = 0;
        
        escala_botoes[selecionado] = 0.65; 
        seta_escala = 0.75;                
    }
    
    if (IN_CIMA_PRESS) {
		tocar(snd_menu_mexe)
        selecionado--;
        if (selecionado < 0) selecionado = array_length(opcoes) - 1;
        
        escala_botoes[selecionado] = 0.65;
        seta_escala = 0.75;
    }

    if (IN_ACAO_PRESS) {
		tocar(snd_menu_confirma)
        escala_botoes[selecionado] = 0.35; 
        estado = "clicado";
        timer_acao = 30; 
    }
} 
else if (estado == "clicado") {
    timer_acao--;
    if (timer_acao <= 0) {
        switch (selecionado) {
            case 0: 
                room_goto(Rm_Detetive); 
                break;
            case 1: 
                if (!instance_exists(obj_configuracoes)) {
                    instance_create_layer(0, 0, "Instances", obj_configuracoes);
                }
                estado = "navegando"; 
                break;
            case 2: 
                if (!instance_exists(obj_extras)) {
                    instance_create_layer(0, 0, "Instances", obj_extras);
                }
                estado = "navegando"; 
                break;
            case 3: 
                game_end();
                break;
        }
    }
}

for (var i = 0; i < array_length(opcoes); i++) {
    escala_botoes[i] = lerp(escala_botoes[i], 0.5, 0.2); 
    
    var _alvo_x = (i == selecionado) ? 10 : 0; 
    x_offset_botoes[i] = lerp(x_offset_botoes[i], _alvo_x, 0.2);
}

var _alvo_seta_y = menu_y + (selecionado * espacamento);
seta_y = lerp(seta_y, _alvo_seta_y, 0.25); 
seta_escala = lerp(seta_escala, 0.5, 0.2); 
tempo_float += 0.1;