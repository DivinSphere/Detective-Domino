if global.historia!=1.2
	instance_destroy()
	
dialogos = [
    [
        "Observar", 
        [
            
            
            [4, 0, "Agora eu posso...", [], [], 0, function() {
                var _jogador = noone;
                var _assassino = noone;
                
                
                with (obj_detetive) {
                    if (jogador == true) {
                        _jogador = id;
                    } else {
                        _assassino = id;
                    }
                }
                
                if (_jogador != noone && _assassino != noone) {
                    
                    atribuir_comando(_jogador, "mover", -1, 15);
                    
                    atribuir_comando(_assassino, "mover", 1, 15);
                    
                    
                    atribuir_comando(_jogador, "esperar", 5);
                    
                    
                    atribuir_comando(_jogador, "animacao", _jogador.anim_esfaqueado, false);
                }
                
                
                instance_create_layer(0, 0, "Instances", obj_tremor);
            }],
            

            
            [8, 0, "...?!"],
            
            
            [4, 0, "Argh... o que...", [], [], 0, function() {
                var _jogador = noone;
                
                with (obj_detetive) {
                    if (jogador == true) _jogador = id;
                }
                
                if (_jogador != noone) {
                    
                    atribuir_comando(_jogador, "animacao", _jogador.anim_morto, false);
                }
            }],
			
            
            [8, 0, "...", [], [], 0, function() {
                room_goto(Rm_Alem_dia_0);
            }]
        ]
    ]
];