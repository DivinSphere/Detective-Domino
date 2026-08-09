
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