if global.historia != 1.3 {
    instance_destroy();
}



dialogos = [
    [
        "Observar", 
        [
            
            [4, 0, "Deve ter uma outra forma de fugir daqui... preciso pensar...", [], [], 0, function() {
                var _jogador = noone;
                with (obj_detetive) {
                    if (jogador == true) _jogador = id;
                }
                
                if (_jogador != noone) {
                    atribuir_comando(_jogador, "mover", 1, 2);
                }
            }],
            
            
            [4, 0, "Já sei, aquele buraco ali na frente! Talvez se eu forçar essas madeiras consiga arrebentar elas.", [], [], 0, function() {
                var _jogador = noone;
                with (obj_detetive) {
                    if (jogador == true) _jogador = id;
                }
                
                if (_jogador != noone) {
                    atribuir_comando(_jogador, "animacao", _jogador.anim_abaixado, false);
                }
            }],
            
            
            
            
            [4, 0, "Preciso fazer bastante força até quebrar!", 
                "esmagar", 
                [10, 0], 
                
                
                [
                    
                    [4, 0, "Funcionou! Consegui fazer a abertura! Agora eu só preciso passar por ela, dessa forma esse cara não vai conseguir me pegar.", [], [], 0, function() {
                        with(obj_objetos) {
                            if (image_index == 2) instance_destroy();
                        }
                    }],
                    [4, 0, "Consegui passar", [], [], 0, function() {
                        global.historia = 1.4;
                        
                        var _jogador = noone;
                        with (obj_detetive) {
                            if (jogador == true) _jogador = id;
                        }
                        
                        if (_jogador != noone) {
							
							personagem_adicionar_caracteristica(4, 3);
							
                            var _alvo_x = _jogador.x + 100; 
                            var _alvo_y = _jogador.y;
                            
                            with (obj_porta) {
                                if ((variable_instance_exists(id, "porta_id") && porta_id == 2) || 
                                    (variable_instance_exists(id, "destino_id") && destino_id == 2)) {
                                    _alvo_x = x + 40; 
                                }
                            }
                            global.luz=true
                            _jogador.x = _alvo_x;
                            _jogador.y = _alvo_y;
                            atribuir_comando(_jogador, "animacao", _jogador.anim_abaixado, false);
                        }
                    }],
                    
                    
					[4, 0, "Agora eu vou correr embora daqui!", [], [], 0],
                    [4, 0, "Até mais seu assassino otário!", [], [], 0, function() {
                        var _jogador = noone;
                        var _assassino = noone;
                        

                        
                        with (obj_detetive) {
                            if (jogador == true) {
                                _jogador = id;
                                ainda_segue = false;
                            }
                            else {
                                _assassino = id;
                            }
                        }
                        
                        
                        if (_assassino != noone) atribuir_comando(_assassino, "mover", 1, 50);
                        if (_jogador != noone) atribuir_comando(_jogador, "mover", 1, 140);
                    }],
                    
                    
					[8, 0, "...", [], [], 0],
                    [8, 0, "...", [], [], 0, function() {
                        room_goto(Rm_Alem_dia_0);
                    }]
                ],
                
                
                [
                    [4, 0, "Essas madeiras são fortes demais..."]
                ]
            ]
        ]
    ]
];