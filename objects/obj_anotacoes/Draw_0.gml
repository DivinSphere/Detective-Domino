var a = clamp(alfa, 0, 1);


draw_set_alpha(a * 0.5);
draw_set_color(c_black);
draw_rectangle(camera_get_view_x(view_camera[0]),
               camera_get_view_y(view_camera[0]),
               camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),
               camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),
               false);


var cx = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) * 0.5;
var cy = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) * 0.5;


draw_set_alpha(a);
draw_set_color(c_white);
draw_sprite_ext(sprite_index, 0, cx, cy, escala, escala, 0, c_white, a);

if (escala > 0.5) {
    draw_set_font(fnt_hud);

    var esc_texto = 0.25; 


    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_color(c_black);
    draw_set_alpha(a); 

    draw_text_transformed(round(cx), round(cy - 64), "ANOTAÇÕES", esc_texto, esc_texto, 0);
    

    draw_set_halign(fa_left);
    
    var _margem_esquerda = cx - 56;
    var _topo_inicial_y = cy - 50;
    
    var limite_w_tela = ((largura_texto / esc_texto) - 20) * esc_texto;
    var avanco_espaco_tela = string_width(" ") * esc_texto;


    var avanco_y_linha = 5;  
    var avanco_y_paragrafo = 9;

    var texto_do_dia_atual = paginas_array[pagina_atual];
    var len = string_length(texto_do_dia_atual);
    
    var nomes_destaque = ["Ellie", "Sam", "Tiffany", "Breno", "Theo", "Benson"];
    var cor_destaque = make_color_rgb(211, 84, 0); 
    
    var _xx = _margem_esquerda;
    var _yy = _topo_inicial_y;
    var palavra_buffer = "";
    
    for (var i = 1; i <= len; i++) {
        var char = string_char_at(texto_do_dia_atual, i);
        
        if (char == " " || char == "\n") {
            
            if (palavra_buffer != "") {
                var largura_palavra = string_width(palavra_buffer) * esc_texto;
                
                if (_xx - _margem_esquerda + largura_palavra > limite_w_tela) {
                    _xx = _margem_esquerda;
                    _yy += avanco_y_linha; 
                }
                
                var p_limpa = string_replace_all(string_replace_all(string_replace_all(palavra_buffer, ".", ""), ",", ""), ":", "");
                var eh_nome = false;
                for (var n = 0; n < array_length(nomes_destaque); n++) {
                    if (p_limpa == nomes_destaque[n]) { eh_nome = true; break; }
                }
                
                draw_set_color(eh_nome ? cor_destaque : c_black);
                draw_set_alpha(a);
                draw_text_transformed(round(_xx), round(_yy), palavra_buffer, esc_texto, esc_texto, 0);
                
                _xx += largura_palavra;
                palavra_buffer = "";
            }
            
            if (char == " ") {
                if (_xx > _margem_esquerda) { _xx += avanco_espaco_tela; }
            } else if (char == "\n") {
                _xx = _margem_esquerda;
                _yy += avanco_y_paragrafo; 
            }
            
        } else {
            palavra_buffer += char;
        }
    }
    
    if (palavra_buffer != "") {
        var largura_palavra = string_width(palavra_buffer) * esc_texto;
        if (_xx - _margem_esquerda + largura_palavra > limite_w_tela) {
            _xx = _margem_esquerda;
            _yy += avanco_y_linha;
        }
        var p_limpa = string_replace_all(string_replace_all(string_replace_all(palavra_buffer, ".", ""), ",", ""), ":", "");
        var eh_nome = false;
        for (var n = 0; n < array_length(nomes_destaque); n++) {
            if (p_limpa == nomes_destaque[n]) { eh_nome = true; break; }
        }
        draw_set_color(eh_nome ? cor_destaque : c_black);
        draw_set_alpha(a);
        draw_text_transformed(round(_xx), round(_yy), palavra_buffer, esc_texto, esc_texto, 0);
    }
    
    var indicador = string(pagina_atual + 1) + " / " + string(array_length(paginas_array));
    draw_set_halign(fa_right);
    draw_set_color(c_black);
    draw_set_alpha(a);
    draw_text_transformed(round(cx + 60), round(cy + 56), indicador, esc_texto, esc_texto, 0);
}

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);