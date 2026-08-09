image_xscale = 0.5;
image_yscale = 0.5;
image_speed = 0;
image_index = 10;

tocar(snd_menu)

opcoes = ["INICIAR", "CONFIGURAÇÕES", "EXTRAS", "SAIR"];
icones = [2, 3, 4, 5]; 
selecionado = 0;

menu_x = room_width * 0.25;  
menu_y = room_height * 0.54; 
espacamento = 23; 

escala_botoes = [0.5, 0.5, 0.5, 0.5];    
x_offset_botoes = [0, 0, 0, 0];

seta_y = menu_y;
seta_escala = 1;
tempo_float = 0; 

estado = "navegando"; 
timer_acao = 0;

logo_x_alvo = x; 
logo_y = y;
logo_x = x - 250; 

faixa_x = array_create(10, 0);
faixa_y = array_create(10, 0);

faixa_x[1] = 400;
faixa_x[2] = 400;
faixa_x[3] = -400;
faixa_x[4] = -400;
faixa_x[5] = 400;
faixa_x[6] = 400;
faixa_x[7] = -400;
faixa_x[8] = -400;

faixa_y[9] = -200;
