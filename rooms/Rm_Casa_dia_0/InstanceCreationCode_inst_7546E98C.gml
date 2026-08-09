if (global.historia == 2) { 
    dialogos = [
        [
            "Investigar Piscina", 
            [
                [1, 0, "O que?"],
				[1, 0, "Um corpo na piscina?"],
                [1, 0, "Como...", [], [], 0, function() {
                    var _jogador = noone;
                    with (obj_detetive) {
                        if (jogador == true) _jogador = id;
                    }
                    
                    if (_jogador != noone) {
                        atribuir_comando(_jogador, "mover", 1, 50); 
                    }
                }],
                
                
				[1, 0, "Isso... isso não estava aqui antes... "],
                [1, 0, "Isso significa que eu realmente consegui alterar o caso....", [], [], 0, function() {
                    var _jogador = noone;
                    with (obj_detetive) {
                        if (jogador == true) _jogador = id;
                    }
                    
                    if (_jogador != noone) {
                        atribuir_comando(_jogador, "mover", 1, 40); 
                    }
                }],
                
                
                [1, 0, "Mas eu não consigo imaginar o que pode ter acontecido com essa garota...", [], [], 0, function() {
                    var _jogador = noone;
                    with (obj_detetive) {
                        if (jogador == true) _jogador = id;
                    }
                    
                    if (_jogador != noone) {
                        atribuir_comando(_jogador, "animacao", _jogador.anim_abaixado, false); 
                    }
                }],
                
                
                [1, 0, "Acho que vou precisar investigar novamente."],
				[1, 0, "Mas droga, eu não gosto da sensação de morrer..."],
				[1, 0, "espero que não aconteça de novo."],
                [1, 0, "", [], [], 0, function() {

                    
                    
                    room_goto(Rm_Alem_dia_0); 
                }]
            ]
        ]
    ];
}
else
	instance_destroy()