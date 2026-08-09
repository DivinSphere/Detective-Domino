if global.historia==111
	tocar(snd_parabuens,true)
	
	
	
x = lerp(x, alvo_x, 0.08);


var _tempo = current_time / 600;
var _hover_y = sin(_tempo) * 3;

x_final = x; 
y_final = y + _hover_y;

escala_squash_x = lerp(escala_squash_x, 1.0, 0.2);
escala_squash_y = lerp(escala_squash_y, 1.0, 0.2);