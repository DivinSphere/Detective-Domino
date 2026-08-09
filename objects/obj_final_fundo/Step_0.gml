
x = lerp(x, alvo_x, 0.08);


var _tempo = current_time / 600;
var _hover_y = sin(_tempo) * 3;

x_final = x; 
y_final = y + _hover_y;