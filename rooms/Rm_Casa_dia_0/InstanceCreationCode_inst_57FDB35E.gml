if global.historia==1.3{


dialogos = [
    [
        "Inspecionar", 
        [

            [4, 0, "(É... esse sou eu. Ver o próprio corpo estirado no chão... É bizarro)"],
            [4, 0, "(Eu perdi essa vida, simplesmente por, estupidez)"],

        ]
    ]
];

}


else{
	
	
if global.historia!=1
	instance_destroy()
	
	

dialogos = [
    [
        "Inspecionar", 
        [
            
            [1, 0, "Isso me parece corte de facada... acho que podemos começar por aqui?", [], [], 0],
            
            
            [1, 0, "Hora de começar o meu trabalho, mais uma vez...", [], [], 0, function() {atribuir_comando(obj_detetive, "animacao", obj_detetive.anim_abaixado, 0)}],

            [1, 0, "", [], [], 0, function() {room_goto(Rm_Alem_dia_0)}]
        ]
    ]
];

}