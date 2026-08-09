
if (y > y_start + limit_y) {
    vspeed = -speed_y;
} else if (y < y_start - limit_y) {
    vspeed = speed_y;
}

if (x > x_start + limit_x) {
    hspeed = -speed_x;
} else if (x < x_start - limit_x) {
    hspeed = speed_x;
}


wheel_timer++;
if (wheel_timer >= wheel_speed) {
    wheel_timer = 0;
    roda_subimg = (roda_subimg == 1) ? 2 : 1;
}


image_xscale = lerp(image_xscale, escala_alvo_x, velocidade_suave);
image_yscale = lerp(image_yscale, escala_alvo_y, velocidade_suave);

if (abs(image_xscale - 1) < 0.001) image_xscale = 1;
if (abs(image_yscale - 1) < 0.001) image_yscale = 1;