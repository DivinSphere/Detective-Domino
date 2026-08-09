

if (alfa_circulo > 0.01) {
	
    var _alfa_final = alfa_circulo + (sin(pulsar_timer) * 0.08);
    _alfa_final = clamp(_alfa_final, 0, 1);

    
    draw_set_color(c_yellow);
    draw_set_alpha(_alfa_final);
    
    var _raio_real = raio_base * image_xscale;
    draw_circle(x, y, _raio_real, false);

    var _detetive = instance_find(obj_detetive, 0);
    if (_detetive != noone && acao_atual != "") {
        
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        
        var _texto_x = _detetive.x;
        var _texto_y = _detetive.y + 22;
        var _escala = 0.25;     
        
        draw_set_alpha(_alfa_final*4);
        

        draw_set_color(c_yellow);
        draw_text_transformed(_texto_x, _texto_y, acao_atual, _escala, _escala, 0);
    }


    draw_set_alpha(1.0);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}