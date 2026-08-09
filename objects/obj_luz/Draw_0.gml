
draw_sprite(spr_objeto_luz,!global.luz,x,y)


if global.luz{
	
	
gpu_set_blendmode(bm_add);


draw_sprite_ext(
    spr_luz,            
    image_index,                  
    x, y,               
    luz_escala,         
    luz_escala,         
    0,                  
    c_white,            
    luz_alpha           
);


gpu_set_blendmode(bm_normal);


}