teclas();



// Menu de configurações
if (IN_START_PRESS) {
    if (instance_exists(obj_configuracoes)) {
        if (obj_configuracoes.estado == "aberto") {
            obj_configuracoes.estado = "fechando";
        }
    } else {
        if (room != Rm_menu && room != Rm_finais) {
            if (!instance_exists(obj_anotacoes) && !instance_exists(obj_personagens) && !instance_exists(obj_dialogo)) {
                instance_create_layer(x, y, "Instances", obj_configuracoes);
                if (!instance_exists(obj_congela)) instance_create_layer(x, y, "Instances", obj_congela);
            }
        }
    }
}

// Menu de personagens
if (IN_VOLTAR_PRESS && !instance_exists(obj_configuracoes)) {
    if (instance_exists(obj_personagens)) {
        if (obj_personagens.estado == "aberto") {
            obj_personagens.estado = "fechando";
        }
    } else {
        if (room != Rm_menu && room != Rm_finais) {
            if (!instance_exists(obj_anotacoes) && !instance_exists(obj_dialogo)) {
                instance_create_layer(x, y, "Instances", obj_personagens);
                global.caracteristicas_nao_lidas = false; 
                if (!instance_exists(obj_congela)) instance_create_layer(x, y, "Instances", obj_congela);
            }
        }
    }
}

// Menu de anotar
if (IN_MENU_PRESS && !instance_exists(obj_configuracoes)) {
    if (instance_exists(obj_anotacoes)) {
        if (obj_anotacoes.estado == "aberto") {
            obj_anotacoes.estado = "fechando";
			tocar(snd_fecha_menu);
        }
    } else {
        if (room != Rm_menu && room != Rm_finais) {
            if (!instance_exists(obj_personagens) && !instance_exists(obj_dialogo)) {
                instance_create_layer(x, y, "Instances", obj_anotacoes);
                global.notas_nao_lidas = false;
                if (!instance_exists(obj_congela)) instance_create_layer(x, y, "Instances", obj_congela);
            }
        }
    }
}

// Menu de extras
if (IN_START_PRESS) {
    if (instance_exists(obj_extras)) {
        if (obj_extras.estado == "aberto") {
            obj_extras.estado = "fechando";
        }
    }
}


if (room == Rm_menu || room == Rm_finais) {
    exit; 
}

var alpha_1 = 1; 
var alpha_2 = 1; 
var alpha_3 = 1;

if (instance_exists(obj_dialogo)) {
    alpha_1 = 1; alpha_2 = 0.5; alpha_3 = 0.5;
} else if (instance_exists(obj_personagens)) {
    alpha_1 = 0.5; alpha_2 = 1; alpha_3 = 0.5;
} else if (instance_exists(obj_anotacoes)) {
    alpha_1 = 0.5; alpha_2 = 0.5; alpha_3 = 1;
} else if (instance_exists(obj_configuracoes)) {
    alpha_1 = 0.5; alpha_2 = 0.5; alpha_3 = 0.5;
}

var _id_jogador_atual = 1; 

if (instance_exists(obj_detetive)) {
    with (obj_detetive) {
        if (jogador) {
            if (sprite_index == spr_detetive) _id_jogador_atual = 1;
            else if (sprite_index == spr_breno) _id_jogador_atual = 2;
            else if (sprite_index == spr_ellie) _id_jogador_atual = 3;
            else if (sprite_index == spr_theo) _id_jogador_atual = 4;
            else if (sprite_index == spr_tiffany) _id_jogador_atual = 5;
            else if (sprite_index == spr_sam) _id_jogador_atual = 6;
        }
    }
}

var _nome_atual = "DESCONHECIDO";
var _retrato_atual = spr_retratos_narrador;

for (var i = 0; i < array_length(global.personagens); i++) {
    if (global.personagens[i].id == _id_jogador_atual) {
        _nome_atual = global.personagens[i].nome;
        _retrato_atual = global.personagens[i].retrato;
        break;
    }
}

var _txt_acao, _txt_personagens, _txt_anotacoes;

switch (global.comandos) {
    case 1: 
        _txt_acao = "J";
        _txt_personagens = "K";
        _txt_anotacoes = "L";
        break;
    case 2:
        _txt_acao = "Z";
        _txt_personagens = "X";
        _txt_anotacoes = "C";
        break;
    case 3:
        _txt_acao = "A";
        _txt_personagens = "B";
        _txt_anotacoes = "Y";
        break;
    default:
        _txt_acao = "J";
        _txt_personagens = "K";
        _txt_anotacoes = "L";
        break;
}

draw_set_alpha(1);
draw_sprite(spr_hud_topo, 0, 0, 0);

draw_sprite_part(_retrato_atual, 0, 0, 0, 22, 18, 0, -2);

draw_set_font(fnt_hud);
draw_set_halign(fa_left);
draw_set_colour(c_white);
draw_text_transformed(23, 0, _nome_atual, 0.5, 0.5, 0);

draw_set_alpha(alpha_1);
draw_sprite(spr_hud_topo, 1, 0, 0);
draw_text_transformed(257, 0, _txt_acao, 0.5, 0.5, 0);

var _cor_k = c_white;
var _y_k = 0; 

if (global.caracteristicas_nao_lidas && alpha_2 == 1) {
    _cor_k = ((current_time % 500) < 250) ? c_yellow : c_white;
    _y_k = -abs(sin(current_time / 300)) * 2; 
}

draw_set_color(_cor_k);
draw_set_alpha(alpha_2);
draw_sprite_ext(spr_hud_topo, 2, 0, _y_k, 1, 1, 0, _cor_k, alpha_2);
draw_text_transformed(285, _y_k, _txt_personagens, 0.5, 0.5, 0);

var _cor_l = c_white;
var _y_l = 0;

if (global.notas_nao_lidas && alpha_3 == 1) {
    _cor_l = ((current_time % 500) < 250) ? c_yellow : c_white;
    _y_l = -abs(sin(current_time / 300)) * 2;
}

draw_set_color(_cor_l);
draw_set_alpha(alpha_3);
draw_sprite_ext(spr_hud_topo, 3, 0, _y_l, 1, 1, 0, _cor_l, alpha_3);
draw_text_transformed(310, _y_l, _txt_anotacoes, 0.5, 0.5, 0);

draw_set_colour(c_white);




dias_ids = [1, 1.4, 2.5, 4];



var ato=1
if global.historia>=1.4 ato=2
if global.historia>=2.4 ato=3
if global.historia>=4 ato=4


draw_set_alpha(1);

draw_set_halign(fa_center)

if room==Rm_Alem_dia_0
    draw_text_transformed(160, 0, "Limbo", 0.5, 0.5, 0);
else
	draw_text_transformed(160, 0, "Ato "+string(ato)+"/4", 0.5, 0.5, 0);

if global.debug
	draw_text_transformed(160, 20, string(global.historia), 0.5, 0.5, 0);
	
	
	
draw_set_halign(fa_left)



