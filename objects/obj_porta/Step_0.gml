


if image_alpha<1
	image_alpha+=0.05

if (instance_exists(obj_congela)) {
    alfa = lerp(alfa, 0, 0.2);
    exit;
}


if (delay > 0) {
    delay--;
}




var _detetive = noone;

with (obj_detetive) {
    
    if (jogador == true && place_meeting(x, y, other.id)) {
        _detetive = id;
        break; 
    }
}

var _tem_dialogo_ativo = instance_exists(obj_dialogo);




if (destino_id == 10) {
    if (_detetive != noone) {
        var _margem = 16; 

        if (_detetive.x < x) {
            _detetive.x = bbox_right + _margem;
        } else {
            _detetive.x = bbox_left - _margem;
        }
		
		tocar(snd_interagir)
        var _cam_w = 320;
        var _cam_h = 180;
        var _novo_cam_x = floor(_detetive.x / _cam_w) * _cam_w;
        var _novo_cam_y = floor(_detetive.y / _cam_h) * _cam_h;
        camera_set_view_pos(view_camera[0], _novo_cam_x, _novo_cam_y);
    }
    
    exit; 
}




var _perto = (_detetive != noone) && !_tem_dialogo_ativo && (instance_nearest(_detetive.x, _detetive.y, obj_porta) == id);
alfa = lerp(alfa, _perto ? 1 : 0, 0.2);

teclas(); 
var _tecla_interagir = IN_ACAO_PRESS;

if (_perto) {
    if (instance_exists(obj_controle)) {
        obj_controle.alpha_1 = 1;
    }
}

var _vai_interagir = false;


if (delay <= 0) {
    if (_detetive != noone && auto_atravessar && !_tem_dialogo_ativo) {
        _vai_interagir = true;
    } else if (_perto && _tecla_interagir && !auto_atravessar) {
        _vai_interagir = true;
    }
}




if (_vai_interagir) {
    
    
    with (obj_porta) {
        delay = 15; 
    }
    
    if (destino_id !=0) {
        
        
        global.porta_id = destino_id;
        global.deslocar = deslocar;
        global.lado = lado;
        
        if (destino_room == room) {
			if image_index!=2 and image_index!=4 
				tocar(snd_porta)
			else
				tocar(snd_interagir)
            room_restart(); 
        } else {
            if image_index!=2 and image_index!=4 
				tocar(snd_porta)
			else
				tocar(snd_interagir)
            room_goto(destino_room); 
        }
    } 
    
    else {
        var _inst_dialogo = instance_create_layer(x, y, "Instances", obj_dialogo);
        
        _id_jogador_atual = 0;
        with (obj_detetive) {
            if (jogador) {
                if (sprite_index == spr_detetive) other._id_jogador_atual = 1;
                else if (sprite_index == spr_breno) other._id_jogador_atual = 2;
                else if (sprite_index == spr_ellie) other._id_jogador_atual = 3;
                else if (sprite_index == spr_theo) other._id_jogador_atual = 4;
                else if (sprite_index == spr_tiffany) other._id_jogador_atual = 5;
                else if (sprite_index == spr_sam) other._id_jogador_atual = 6;
                else if (sprite_index == spr_assassino_faca) other._id_jogador_atual = 7;
            }
        }
        
        
        if image_index!=2 and image_index!=4 tocar(snd_porta_fechada)
        
        var _texto_final = porta_texto; 
        
        
        if (req_personagem != -1 && req_caracteristica != -1) {
            if (_id_jogador_atual == req_personagem) {
                
                if (personagem_tem_caracteristica(_id_jogador_atual, req_caracteristica)) {
                    _texto_final = porta_texto_alt; 
                }
            }
        }
        
        _inst_dialogo.textos = [ [_id_jogador_atual, 0, _texto_final] ];
        _inst_dialogo.iniciar_dialogo();
    }
}