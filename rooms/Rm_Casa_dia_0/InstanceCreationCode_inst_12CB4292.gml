if (global.historia == 3) { 
    dialogos = [
        [
            "Investigar Corpo", 
            [
                
                [1, 0, "Então, é assim que ela acabou morrendo... esfaqueada por acidente no escuro? ... acho que isso é realmente algo possível de acontecer, será que teria sido assim?"],
                
                
                [1, 0, "Se eu não tivesse interferido? As coisas estão começando a fazer mais sentido agora..."],
                
                
                [1, 0, "Hora de outro encontro com o paradoxo...", [], [], 0, function() {
                    var _jogador = noone;
                    with (obj_detetive) {
                        if (jogador == true) _jogador = id;
                    }
                    
                    if (_jogador != noone) {
                        
                        atribuir_comando(_jogador, "animacao", _jogador.anim_abaixado, false); 
                    }
                }],
                
                
                [1, 0, "", [], [], 0, function() {
                    
                    room_goto(Rm_Alem_dia_0); 
                }]
            ]
        ]
    ];
} else {
    instance_destroy();
}