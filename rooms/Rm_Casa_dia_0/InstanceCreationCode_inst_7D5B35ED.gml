if (global.historia == 4.1) { 
    dialogos = [
        [
            "Investigar Corpos", 
            [
                
                [1, 0, "Ele caiu bem aqui... a janela quebrada logo acima.", [], [], 0, function() {
                    var _jogador = noone;
                    with (obj_detetive) {
                        if (jogador == true) _jogador = id;
                    }
                    
                    if (_jogador != noone) {
                        
                        atribuir_comando(_jogador, "mover", -1, 60); 
                    }
                }],
                
                
                [1, 0, "Pelo menos cobriram os corpos dessa vez...", [], [], 0, function() {
                    var _jogador = noone;
                    with (obj_detetive) {
                        if (jogador == true) _jogador = id;
                    }
                    
                    if (_jogador != noone) {
                        
                        atribuir_comando(_jogador, "animacao", _jogador.anim_abaixado, false); 
                    }
                }],
                
                
                [1, 0, "Deve ter sido algo horrível de ver... espero que eu consiga reverter tudo isso no final."],
                [1, 0, "Uma queda brusca do segundo andar. O peso do Breno esmagando a Tiffany..."],
                [1, 0, "Tudo por causa de uma brincadeira idiota..."],
                
                
                [1, 0, "Paradoxo... me puxe de volta. Eu preciso consertar o que eu quebrei."],
                
                
                [1, 0, "", [], [], 0, function() {
					global.historia=4.2
                    
                    room_goto(Rm_Alem_dia_0); 
                }]
            ]
        ]
    ];
} else {
    instance_destroy();
}