
voz = noone; 
falar_boca = false;


personagens_config = array_create(10, [snd_voz_1, 1.0]); 
personagens_config[0] = [snd_voz_1, 1.0];  //Narrador
personagens_config[1] = [snd_voz_1, 1.2];  //Dominó
personagens_config[2] = [snd_voz_1, 1.2];  //Breno
personagens_config[3] = [snd_voz_1, 1.0];  //Ellie
personagens_config[4] = [snd_voz_1, 1.3];  //Theo
personagens_config[5] = [snd_voz_1, 0.9];  //Tiffany
personagens_config[6] = [snd_voz_1, 1.4];  //Sam
personagens_config[7] = [snd_voz_1, 1];  //Paradoxo



personagem = 1;
expressao = 0;
depth = -10;
image_speed = 0;

delay = 0; 
if room=Rm_estrada
	delay=100


escolha_fazendo_fade = false;
alfa_opcoes = 1.0;
opcao_vencedora = -1;
tempo_destaque_escolha = 0;


textos = [
    [1, 0, "Fim dos dialogos."]
];

pos = 1;
vel = 0.5;
contador = 0;
pausa = 0;
escala = 0.0;
alfa = 0.0;
estado = "abrindo";
seta_timer = 0;


tipo_interacao = "nenhum"; 
mostrando_opcoes = false;
tem_escolha = false;
opcoes_dados = [];
tempo_escolha = 0;
tempo_maximo = 0;
escolha_selecionada = 0;



mash_progresso = 0;
mash_alvo = 0;


seq_botoes = []; 
seq_index = 0;   


precisao_cursor = 0;
precisao_dir = 1;
precisao_vel = 0.02;
precisao_alvo_inicio = 0;
precisao_alvo_tamanho = 0.15; 


juice_escala = 1.0; 


minigame_resultado = false;
tempo_pos_minigame = 0;


minigame_resultado = false;
tempo_pos_minigame = 0;


sub_dialogo_sucesso = [];
sub_dialogo_falha = [];
func_minigame_sucesso = noone;



function iniciar_dialogo() {
    fila = [];
    for (var i = 0; i < array_length(textos); i++) {
        array_push(fila, textos[i]);
    }
    carregar_no_atual();
}

function carregar_no_atual() {
    
    mostrando_opcoes = false;
    tem_escolha = false;
    tipo_interacao = "nenhum";
    opcoes_dados = [];
    tempo_escolha = 0;
    tempo_maximo = 0;
    escolha_selecionada = 0;
    escolha_fazendo_fade = false;
    opcao_vencedora = -1;
    tempo_destaque_escolha = 0;
    
    mash_progresso = 0;
    mash_alvo = 0;
    seq_botoes = [];
    seq_index = 0;
    
    
    minigame_resultado = false;
    tempo_pos_minigame = 0;
    
    sub_dialogo_sucesso = [];
    sub_dialogo_falha = [];
    func_minigame_sucesso = noone;

    if (array_length(fila) == 0) {
        estado = "fechando";
        return;
    }
    
    var _no = fila[0];
    pid = _no[0];
    rosto_id = _no[1];
    texto_atual = _no[2];
    
    
    if (array_length(_no) >= 4) {
        var _tipo = _no[3];
        
        if (is_string(_tipo) && _tipo == "esmagar") {
            tem_escolha = true;
            tipo_interacao = "esmagar";
            var _params = _no[4]; 
            mash_alvo = _params[0];
            tempo_escolha = (array_length(_params) > 1) ? _params[1] : 0;
            tempo_maximo = tempo_escolha;
            sub_dialogo_sucesso = (array_length(_no) >= 6) ? _no[5] : [];
            sub_dialogo_falha = (array_length(_no) >= 7) ? _no[6] : [];
            func_minigame_sucesso = (array_length(_no) >= 8) ? _no[7] : noone;
        }
        else if (is_string(_tipo) && _tipo == "sequence") {
            tem_escolha = true;
            tipo_interacao = "sequence";
            var _params = _no[4]; 
            seq_botoes = _params[0];
            tempo_escolha = (array_length(_params) > 1) ? _params[1] : 0;
            tempo_maximo = tempo_escolha;
            sub_dialogo_sucesso = (array_length(_no) >= 6) ? _no[5] : [];
            sub_dialogo_falha = (array_length(_no) >= 7) ? _no[6] : [];
            func_minigame_sucesso = (array_length(_no) >= 8) ? _no[7] : noone;
        }
        else if (is_string(_tipo) && _tipo == "precisao") {
            tem_escolha = true;
            tipo_interacao = "precisao";
            var _params = _no[4]; 
            precisao_vel = _params[0];
            tempo_escolha = (array_length(_params) > 1) ? _params[1] : 0;
            tempo_maximo = tempo_escolha;
            sub_dialogo_sucesso = (array_length(_no) >= 6) ? _no[5] : [];
            sub_dialogo_falha = (array_length(_no) >= 7) ? _no[6] : [];
            func_minigame_sucesso = (array_length(_no) >= 8) ? _no[7] : noone;
            
            
            precisao_alvo_tamanho = 0.15; 
            precisao_alvo_inicio = random_range(0.1, 0.85 - precisao_alvo_tamanho);
            precisao_cursor = 0;
            precisao_dir = 1;
        }
        
        else if (is_array(_no[3]) && array_length(_no[3]) > 0) { 
            tem_escolha = true;
            tipo_interacao = "escolha";
            opcoes_dados = [];
            var _idx = 3;
            
            
            while (_idx < array_length(_no) && is_array(_no[_idx]) && array_length(_no[_idx]) > 0) {
                array_push(opcoes_dados, _no[_idx]);
                _idx++;
            }
            
            
            if (_idx < array_length(_no) && is_numeric(_no[_idx])) {
                tempo_escolha = _no[_idx];
                tempo_maximo = tempo_escolha;
            }
        }
    }
    
    var _func = noone;
    if (tipo_interacao == "nenhum") {
        if (array_length(_no) >= 7) {
            _func = _no[6];
        } else if (array_length(_no) == 4 && (script_exists(_no[3]) || is_method(_no[3]))) {
            _func = _no[3];
        }
    }

    if (_func != noone && (script_exists(_func) || is_method(_func))) {
        _func();
    }
    
    var _u = string_char_at(texto_atual, string_length(texto_atual));
    if (_u != "." && _u != "!" && _u != "?") {
        texto_atual += ".";
    }
    
    nome_atual = "DESCONHECIDO";
    spr_retrato = spr_retratos_narrador;
    
    for (var i = 0; i < array_length(global.personagens); i++) {
        if (global.personagens[i].id == pid) {
            nome_atual = global.personagens[i].nome;
            spr_retrato = global.personagens[i].retrato;
            imagem = global.personagens[i].imagem;
            break;
        }
    }
    
    max_len = string_length(texto_atual);
    pos = 1;
    pausa = 0;
}

function avancar_dialogo() {
    if (array_length(fila) > 0) {
        array_delete(fila, 0, 1);
    }
    carregar_no_atual();
}

function realizar_escolha(_opcao_escolhida) {
    if (!is_array(opcoes_dados) || array_length(opcoes_dados) <= _opcao_escolhida) {
        avancar_dialogo();
        return;
    }

    escolha_selecionada = _opcao_escolhida;
    opcao_vencedora = _opcao_escolhida;
    escolha_fazendo_fade = true;
    alfa_opcoes = 1.0;
    tempo_destaque_escolha = 45; 
    tem_escolha = false; 
}

function finalizar_processamento_escolha() {
    var _dados_opcao = opcoes_dados[opcao_vencedora];
    var _sub_dialogos = _dados_opcao[1];
    var _func = (array_length(_dados_opcao) > 2) ? _dados_opcao[2] : noone;
    
    escolha_fazendo_fade = false;
    opcao_vencedora = -1;
    opcoes_dados = [];
    
    if (_func != noone && (script_exists(_func) || is_method(_func))) {
        _func();
    }
    
    if (array_length(fila) > 0) {
        array_delete(fila, 0, 1);
    }
    
    if (is_array(_sub_dialogos)) {
        for (var i = array_length(_sub_dialogos) - 1; i >= 0; i--) {
            array_insert(fila, 0, _sub_dialogos[i]);
        }
    }
    
    carregar_no_atual();
}

function processar_fim_minigame(_vitoria) {
	if _vitoria
		tocar(snd_sucesso)
	else
		tocar(snd_fracasso)
    minigame_resultado = _vitoria;
    tempo_destaque_escolha = 45; 
    escolha_fazendo_fade = true; 
    alfa_opcoes = 1.0;
    tem_escolha = false;
}

function finalizar_minigame(_vitoria) {
    var _sub_dialogos = _vitoria ? sub_dialogo_sucesso : sub_dialogo_falha;
    
    if (_vitoria && func_minigame_sucesso != noone && (script_exists(func_minigame_sucesso) || is_method(func_minigame_sucesso))) {
        func_minigame_sucesso();
    }
    
    if (array_length(fila) > 0) {
        array_delete(fila, 0, 1);
    }
    
    if (is_array(_sub_dialogos)) {
        for (var i = array_length(_sub_dialogos) - 1; i >= 0; i--) {
            array_insert(fila, 0, _sub_dialogos[i]);
        }
    }
    
    carregar_no_atual();
}

function obter_vk_code(_key) {
    if (is_string(_key)) {
        var _upper = string_upper(_key);
        return ord(_upper);
    }
    return _key;
}

iniciar_dialogo();