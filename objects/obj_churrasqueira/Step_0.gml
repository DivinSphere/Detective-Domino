if global.historia>=4.6 and estado==0{
	estado=1
	image_index=1
}

if (estado == 0) {
    image_index = 0; 
}   
else if (estado == 1) {
    anim_timer++;
    if (anim_timer >= 15) {
        anim_timer = 0;
        image_index = (image_index == 1) ? 2 : 1;
    }
} 
else if (estado == 2) {
    anim_timer++;
    if (anim_timer >= 8) { 
        anim_timer = 0;
        image_index = (image_index == 3) ? 4 : 3;
    }
}


var _cam = view_camera[0];
var _cx = camera_get_view_x(_cam);
var _cy = camera_get_view_y(_cam);
var _cw = camera_get_view_width(_cam);
var _ch = camera_get_view_height(_cam);

var _na_tela = (bbox_right > _cx && bbox_left < _cx + _cw && bbox_bottom > _cy && bbox_top < _cy + _ch);


if (_na_tela) {
    tocar(snd_churrasqueira, true);
}