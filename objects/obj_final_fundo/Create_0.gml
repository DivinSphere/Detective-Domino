image_speed = 0; 

alvo_x = x;
alvo_y = y;


if (x > room_width / 2) {
    x = alvo_x + 400;
    dir_fantasma = 10;
} else {
    x = alvo_x - 400;
    dir_fantasma = -10; 
}

x_final = x;
y_final = y;

alarm[0]=1