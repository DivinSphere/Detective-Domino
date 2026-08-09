
if (instance_exists(obj_congela)) {
    alfa_alvo = 0;
    alfa_circulo = lerp(alfa_circulo, alfa_alvo, 0.2);
    exit;
}


var _detetive = instance_find(obj_detetive, 0);
var _tem_dialogo_ativo = instance_exists(obj_dialogo);
var _tocando_porta = false;


if (_detetive != noone) {
    with (_detetive) {
        if (place_meeting(x, y, obj_porta) and !place_meeting(x, y, obj_dialogar_automatico)) {
            _tocando_porta = true;
        }
    }
}

alfa_alvo = 0;


var _meu_id_str = string(id);
var _ja_visto = variable_struct_exists(global.dialogos_vistos, _meu_id_str);

if (_ja_visto && (iniciar_ao_tocar || apenas_uma_vez)) {
    
    instance_destroy();
    exit;
}


if (_detetive != noone && !_tem_dialogo_ativo && !_tocando_porta) {
    
    
    
    
    if (iniciar_ao_tocar) {
        if (!ja_executou_touch && place_meeting(x, y, _detetive)) {
            
            var _qtd_dialogos = array_length(dialogos);
            if (_qtd_dialogos > 0) {
                var _dados_conversa = dialogos[dialogo_index];
                var _falas = is_string(_dados_conversa[0]) ? _dados_conversa[1] : _dados_conversa;
                
                
                if (array_length(_falas) > 0 && !is_array(_falas[0])) {
                    _falas = [_falas];
                }
                
                var _inst_dialogo = instance_create_layer(x, y, "Instances", obj_dialogo);
                _inst_dialogo.textos = _falas;
                _inst_dialogo.iniciar_dialogo();
                
                ja_executou_touch = true; 
                
                
                struct_set(global.dialogos_vistos, _meu_id_str, true);
                
                instance_destroy(); 
            }
        }
    } 
    
    
    
    else {
        var _mais_proximo = instance_nearest(_detetive.x, _detetive.y, obj_dialogar);
        
        if (id == _mais_proximo) {
            var _dist = point_distance(x, y, _detetive.x, _detetive.y);
            
            if (_dist <= distancia_ativacao) {
                
                if (instance_exists(obj_controle)) {
                    obj_controle.alpha_1 = 1;
                }
                
                alfa_alvo = 0.25; 
                
                var _dados_conversa = dialogos[dialogo_index];
                if (is_array(_dados_conversa) && array_length(_dados_conversa) > 0) {
                    acao_atual = is_string(_dados_conversa[0]) ? _dados_conversa[0] : "Interagir";
                }
                
                teclas(); 
                var _tecla_interagir = IN_ACAO_PRESS;
                
                if (_tecla_interagir) {
                    var _qtd_dialogos = array_length(dialogos);
                    
                    if (_qtd_dialogos > 0) {
						
						tocar(snd_interagir)
						
                        var _falas = is_string(_dados_conversa[0]) ? _dados_conversa[1] : _dados_conversa;
                        
                        
                        if (array_length(_falas) > 0 && !is_array(_falas[0])) {
                            _falas = [_falas];
                        }
                        
                        var _inst_dialogo = instance_create_layer(x, y, "Instances", obj_dialogo);
                        _inst_dialogo.textos = _falas;
                        _inst_dialogo.iniciar_dialogo();
                        
                        
                        struct_set(global.dialogos_vistos, _meu_id_str, true);
                        
                        if (apenas_uma_vez) {
                            instance_destroy();
                        } else if (_qtd_dialogos > 1) {
                            dialogo_index = (dialogo_index + 1) % _qtd_dialogos;
                        }
                    }
                }
            }
        }
    }
}


alfa_circulo = lerp(alfa_circulo, alfa_alvo, 0.2);
pulsar_timer += 0.05;