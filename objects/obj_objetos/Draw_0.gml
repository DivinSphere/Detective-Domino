



img=image_index

if global.censurar_sangue{
	if img==0
		img=17
	
	if img==3
		img=18
	
	if img==7
		img=19
		
	if img==8
		img=20
}



draw_sprite_ext(sprite_index,img,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)