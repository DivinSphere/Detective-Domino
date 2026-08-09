draw_sprite_ext(sprite_index, 0, 0, 0, image_xscale, image_yscale, 0, c_white, 1);

var _escala_faixa = 0.55;
var _comp_x = -16;
var _comp_y = -9;

draw_sprite_ext(sprite_index, 9, 0, faixa_y[9], image_xscale, image_yscale, 0, c_white, 1);

for (var i = 8; i >= 1; i--) {
    var _wave_x = sin((current_time / 1500) + i) * 3;
    var _wave_y = cos((current_time / 1200) + i) * 3;
    
    var _fx = faixa_x[i] + _comp_x + _wave_x;
    var _fy = _comp_y + _wave_y;

	if i==1 or i==2 or i==5 or i==6
		multi=-1
	else
		multi=1
	
	
	
	
    gpu_set_fog(true, c_black, 0, 0);
    draw_sprite_ext(sprite_index, i, _fx + 2*multi, _fy - 2, _escala_faixa, _escala_faixa, 0, c_white, 0.1);
    gpu_set_fog(false, c_black, 0, 0);
    
    draw_sprite_ext(sprite_index, i, _fx, _fy, _escala_faixa, _escala_faixa, 0, c_white, 1);
}


var _logo_hover_x = sin(current_time / 800) * 3; 
var _logo_x_final = logo_x + _logo_hover_x;

gpu_set_fog(true, c_black, 0, 0);
draw_sprite_ext(sprite_index, 10, _logo_x_final + 1, logo_y + 1, image_xscale, image_yscale, 0, c_white, 0.5); 
gpu_set_fog(false, c_black, 0, 0);

draw_sprite_ext(sprite_index, 10, _logo_x_final, logo_y, image_xscale, image_yscale, 0, c_white, 1);

draw_set_font(fnt_hud); 
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

for (var i = 0; i < array_length(opcoes); i++) {
    
    var _cx = menu_x + x_offset_botoes[i];
    var _cy = menu_y + (i * espacamento);
    var _escala = escala_botoes[i]; 
    
    var _frame_fundo = (i == selecionado) ? 0 : 1;
    var _frame_icone = icones[i];
    
    var _alfa = (i == selecionado) ? 1.0 : 0.6;
    
    var _piscar_branco = false;
    if (estado == "clicado" && i == selecionado) {
        if ((timer_acao mod 10) < 5) {
            _piscar_branco = true;
        }
    }
    
    if (_piscar_branco) {
        gpu_set_fog(true, c_white, 0, 0);
    }
    
    draw_sprite_ext(spr_botoes, _frame_fundo, _cx, _cy, _escala, _escala, 0, c_white, _alfa);
    draw_sprite_ext(spr_botoes, _frame_icone, _cx, _cy, _escala, _escala, 0, c_white, _alfa);
    
    if (_piscar_branco) {
        gpu_set_fog(false, c_white, 0, 0);
    }
    
    var _escala_texto = _escala * 0.70; 
    var _margem_texto_x = 90; 
    
    draw_set_color(c_white);
    draw_set_alpha(_alfa);
    draw_text_transformed(_cx - _margem_texto_x * _escala, _cy - 1, opcoes[i], _escala_texto, _escala_texto, 0);
}

var _float_x = sin(tempo_float) * 1.5; 

var _largura_botao = (sprite_get_width(spr_botoes) * 0.5) / 2;
var _seta_x = (menu_x + x_offset_botoes[selecionado]) - _largura_botao - 5 + _float_x; 

gpu_set_fog(true, c_black, 0, 0);
draw_sprite_ext(spr_botoes_seta, 0, _seta_x + 1, seta_y + 1, seta_escala, seta_escala, 0, c_white, 0.5);
gpu_set_fog(false, c_black, 0, 0);

draw_sprite_ext(spr_botoes_seta, 0, _seta_x, seta_y, seta_escala, seta_escala, 0, c_white, 1.0);

draw_set_alpha(1.0); 
draw_set_color(c_white);
draw_set_valign(fa_top);