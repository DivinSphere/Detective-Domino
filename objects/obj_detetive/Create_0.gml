if room==Rm_Detetive{
	tocar(snd_detetive)
}

if room==Rm_estrada{
	tocar(snd_carro)
}

if room==Rm_Alem_dia_0{
	tocar(snd_limbo)
}

if room==Rm_Casa_dia_0{
	tocar(snd_casa)
}



// Variaveis efeito borboleta
efeito_borboleta_ativo = false;
efeito_borboleta_y = 0;
efeito_borboleta_alpha = 0;
efeito_borboleta_escala = 0;
efeito_borboleta_imagem = 0



ainda_segue=true
pode_mover=3
sumir=false
aparecer=false
carro=false

// Personagens
if sprite_index=spr_personagens{
	if image_index=0{sprite_index=spr_detetive}
	if image_index=1{sprite_index=spr_breno}
	if image_index=2{sprite_index=spr_ellie}
	if image_index=3{sprite_index=spr_theo}
	if image_index=4{sprite_index=spr_tiffany}
	if image_index=5{sprite_index=spr_sam}
	if image_index=6{sprite_index=spr_assassino_faca}
	if image_index=7{sprite_index=spr_breno	carro=true}
}

lado = image_xscale
velocidade = 1.5;
image_speed = 0;
tempo_parado = 0;
depth=-1

// Imagens das animacoes
anim_parado = [0,0,0,1,1,1,true]; 
anim_andando = [2,1,true];
anim_deitado = [3,3,4,4,true];
anim_menu = [5,true];
anim_abaixado = [6,true];
olhar = false;

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

anim_atual = anim_parado;
frame_idx = 0;
anim_timer = 0;
anim_speed = 0.15;
frame_real = anim_atual[0];




function mudar_animacao(_nova_anim) {
    if (anim_atual != _nova_anim) {
        anim_atual = _nova_anim;
        frame_idx = 0;
        anim_timer = 0;
        frame_real = anim_atual[0];
    }
}


fila_comandos = [];
comando_atual = noone;






if global.historia==4.3 and room=Rm_Casa_dia_0
	x-=40