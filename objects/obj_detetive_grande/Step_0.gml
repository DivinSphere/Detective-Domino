x = lerp(x, alvo_x, 0.08);

var _tempo = current_time / 600;
var _hover_y = sin(_tempo) * 3;

x_final = x; 
y_final = y + _hover_y;

if (instance_exists(obj_logo)) {
    var _opcao_atual = obj_logo.selecionado;
    
    if (_opcao_atual != opcao_anterior) {
        escala_squash_x = 1.3;
        escala_squash_y = 0.75;
        opcao_anterior = _opcao_atual;
    }
    
    image_index = _opcao_atual;
}

escala_squash_x = lerp(escala_squash_x, 1.0, 0.2);
escala_squash_y = lerp(escala_squash_y, 1.0, 0.2);