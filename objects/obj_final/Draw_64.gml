var _gw = display_get_gui_width();
var _gh = display_get_gui_height();
var _cx = _gw * 0.5;
var _cy = _gh * 0.5;

draw_set_color(c_black);
draw_set_alpha(alfa_fundo);
draw_rectangle(0, 0, _gw, _gh, false);

draw_set_font(fnt_hud); 
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_white);
draw_set_alpha(alfa_geral);
var _escala_tit = 0.35;
draw_text_transformed(_cx, _cy - 75, titulo, _escala_tit, _escala_tit, 0);

var _escala_txt = 0.22;
var _inicio_y = _cy - 45;
var _espaco = 26;

for (var i = 0; i < array_length(linhas); i++) {
    draw_set_color(c_white);
    draw_set_alpha(alfas_linhas[i] * alfa_geral);
    draw_text_ext_transformed(_cx, _inicio_y + (i * _espaco) + y_offsets[i], linhas[i], 40, _gw * 4, _escala_txt, _escala_txt, 0);
}

if (estado == "esperando" || estado == "saindo") {
    
    if (!is_sobre) {
        var _str_min = (global.minutos < 10) ? "0" + string(global.minutos) : string(global.minutos);
        var _str_seg = (global.segundos < 10) ? "0" + string(global.segundos) : string(global.segundos);
        var _texto_tempo = "TEMPO TOTAL: ";
        
        if (global.horas > 0) {
            var _str_hor = (global.horas < 10) ? "0" + string(global.horas) : string(global.horas);
            _texto_tempo += _str_hor + ":" + _str_min + ":" + _str_seg;
        } else {
            _texto_tempo += _str_min + ":" + _str_seg;
        }
        
        var _y_tempo = _inicio_y + (array_length(linhas) * _espaco) + 5;
        
        draw_set_color(c_white);
        draw_set_alpha(alfa_geral);
        draw_text_transformed(_cx, _y_tempo, _texto_tempo, _escala_txt, _escala_txt, 0);
    }

    var _escala_acao = 0.25;
    var _cor_acao = make_color_rgb(211, 84, 0); 

    draw_set_color(_cor_acao);
    draw_set_alpha(alfa_geral);
    draw_text_transformed(_cx, _gh - 18, "APERTE AÇÃO PARA CONTINUAR", _escala_acao, _escala_acao, 0);
}

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);