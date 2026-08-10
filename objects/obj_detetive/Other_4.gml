
if !jogador or room==Rm_Alem_dia_0
	exit


if (variable_global_exists("porta_id") && global.porta_id != 0) {
    
	

	if global.porta_id==11
		x=30
	else if global.porta_id==12
		x=room_width-30
	else
	
	    with (obj_porta) {
	        if (porta_id == global.porta_id) {
	                other.x = x+global.deslocar
	                other.y = y + 4;
					
					atribuir_comando(other, "limpar");

	            break;
	        }
	    }
	
	

}


if x<room_width/2
	lado=1
else
	lado=-1
	
if global.lado!=0
	lado=global.lado
	
global.porta_id = -1;
global.deslocar=0
global.lado=0

