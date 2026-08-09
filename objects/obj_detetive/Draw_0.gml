if (!global.luz) {

    gpu_set_fog(true, c_black, 0, 0);
}

if carro==false
	draw_sprite_ext(sprite_index, frame_real, x, y, lado, image_yscale, image_angle, c_white, image_alpha);

if (!global.luz) {

    gpu_set_fog(false, c_black, 0, 0);
}


if (efeito_borboleta_ativo and jogador) {
    var _alfa_real = clamp(efeito_borboleta_alpha, 0, 1);
    
	if room==Rm_estrada{
	xx=obj_carro.x 
	yy=obj_carro.y
	}else{
		
	xx=x 
	yy=y
	
	}
	
	
	
    draw_sprite_ext(spr_nova_caracteristica, efeito_borboleta_imagem, 
                    xx, yy - 20 + efeito_borboleta_y, 
                    efeito_borboleta_escala, efeito_borboleta_escala, 
                    0, c_white, _alfa_real);
}