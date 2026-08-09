if global.dia == 3 and sprite_index == spr_detetive
	anim_taunt = [11,11,12,12,15,15,14,14,false];
else
	anim_taunt = [11,11,12,12,13,13,14,14,false];
	
	
if !global.censurar_sangue {
    anim_esfaqueado = [7,7,7,7,7,7,7,7,7,7,8,2];
    anim_morto = [9,true];
} else {
    anim_esfaqueado = [16,16,16,16,16,16,16,16,16,16,17,2];
    anim_morto = [18,true];
}