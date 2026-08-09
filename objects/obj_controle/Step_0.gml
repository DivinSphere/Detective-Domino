// Todas as funcionalidades de debug vão ficar aqui

if global.debug{
	
if (keyboard_check_pressed(ord("1"))) {
    if (room_exists(room_previous(room))) room_goto_previous();
    else room_goto(room_last);
}

if (keyboard_check_pressed(ord("2"))) {
    if (room_exists(room_next(room))) room_goto_next();
    else room_goto(room_first);
}

if (keyboard_check_pressed(ord("3"))) {
	global.historia-=0.1
}

if (keyboard_check_pressed(ord("4"))) {
	global.historia+=0.1
}

if (keyboard_check_pressed(ord("5"))) {
	global.luz = !global.luz
}

if (keyboard_check_pressed(ord("R"))){
    global.dialogos_vistos = {};
    game_restart();
}


if (keyboard_check_pressed(ord("T"))){
    global.dialogos_vistos = {};
    room_restart()
}



var _mudou_de_tela = false;

with(obj_detetive){
	
if !jogador
	exit
	
if (keyboard_check_pressed(ord("Q"))) {
    x -= 320;
    _mudou_de_tela = true;
}

if (keyboard_check_pressed(ord("E"))) {
    x += 320;
    _mudou_de_tela = true;
}

if (keyboard_check_pressed(ord("F"))) {
    y -= 180;
    _mudou_de_tela = true;
}

if (keyboard_check_pressed(ord("G"))) {
    y += 180;
    _mudou_de_tela = true;
}


if (_mudou_de_tela) {
    var _cam_w = 320;
    var _cam_h = 180;
    
    var _novo_cam_x = floor(x / _cam_w) * _cam_w;
    var _novo_cam_y = floor(y / _cam_h) * _cam_h;
    
    camera_set_view_pos(view_camera[0], _novo_cam_x, _novo_cam_y);
}

}
	
}