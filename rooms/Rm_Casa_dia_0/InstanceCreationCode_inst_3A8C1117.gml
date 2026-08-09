if (global.historia == 2.3) { 
    dialogos = [
        [
            "Conversar no escuro", 
            [
                
                
                
                [5, 0, "O que aconteceu? Por que está tudo escuro?"],
                [3, 0, "A energia caiu do nada. Já faz uns minutos."],
                [2, 0, "O Theo bancou o herói e foi lá no depósito... Disse que ia procurar uma lanterna, ou velas, ou qualquer coisa do tipo."],
                [3, 0, "O problema é que já faz um tempo. Ele já deveria ter voltado."],
                
                [5, 0, "O Theo? Sozinho lá fora? Que droga... Eu vou atrás dele."], 
                
                [6, 0, "Espera, Tiffany! Pode ser perigoso ficar andando por aí sem enxergar nada."],
                [5, 0, "Fiquem calmos. Eu peguei uma faca na cozinha mais cedo, sei me cuidar."],
                [2, 0, "Você tá andando com uma faca no escuro?! Ai meu deus, isso me dá mais medo ainda...", [], [], 0, function() {
                    
                    
                    with (obj_detetive) {
                        if (jogador == true) {
                            atribuir_comando(id, "mover", 1, 60); 
                        }
                    }
                    
                }],
                
                
                
                
                [5, 0, "Estou tomando cuidado...", [], [], 0, function() {
                    with (obj_detetive) {
                        if (jogador == true) {
                            atribuir_comando(id, "mover", 1, 60);
                        }
                    }
                }],
                
                [5, 0, "Estou quase na porta...", [], [], 0, function() {
                    with (obj_detetive) {
                        if (jogador == true) {
                            atribuir_comando(id, "mover", 1, 70);
                        }
                    }
                }],
                
                
                
                
                [0, 0, "Você esbarra em algo no escuro", 
                    "sequence", 
                    [["W", "A", "S", "D"], 120], 
                    
                    
                    [
                        [5, 0, "Opa! Quem está aí?!"]
                    ],
                    
                    
                    [
                        [5, 0, "Ah! Eu tropecei!", [], [], 0, function() {
                            
                            personagem_adicionar_caracteristica(5, 10); 
                            
                            
                            with (obj_detetive) {
                                if (jogador == true) {
                                    mudar_animacao(anim_abaixado);
                                }
                            }
                        }]
                    ]
                ],
                
                
                
                
                
                [0, 0, "*Som de algo perfurando profundamente...*", [], [], 0, function() {
                    instance_create_layer(0, 0, "Instances", obj_tremor); 
                    with (obj_detetive) {
                        if (sprite_index == spr_ellie) { 
                            image_xscale = -1; 
                            lado = -1;         
                            atribuir_comando(id, "animacao", anim_esfaqueado, false);
                        }
                    }
                }],
                
                
                [3, 0, "T-Tiffany...? Por quê...?", [], [], 0, function() {
                    with (obj_detetive) {
                        if (sprite_index == spr_ellie) {
                            atribuir_comando(id, "animacao", anim_morto, false);
                        }
                    }
                }],
                
                [5, 0, "Ellie?! Ai meu Deus! O que eu fiz?!"],
                
                
                [2, 0, "Ellie! Você... você esfaqueou ela, Tiffany!", [], [], 0, function() {
                    with (obj_detetive) {
                        if (sprite_index == spr_breno) { 
                            atribuir_comando(id, "mover", 1, 70);
                        }
                    }
                }],
                
                [5, 0, "Foi um acidente! Eu juro, eu não vi nada no escuro!"],
                
                
                [2, 0, "Isso não foi um acidente... com certeza! Você não gostava dela! Vocês eram inimigas!", [], [], 0, function() {
                    anotar("Ellie e Tiffany tinham algum tipo de rixa");
                }],
                
                [5, 0, "Não é verdade! Nós podíamos ter nossas diferenças, mas foi realmente um acidente!"],
                
                
                
                
                [5, 0, "O que eu fiz... isso não está certo..."],
                [5, 0, "O que está acontecendo? Minha cabeça..."],
                [5, 0, "Eu estou me sentindo tonta..."],
                
                
                [1, 0, "", [], [], 0, function() {global.historia=2.4 room_goto(Rm_Alem_dia_0); }]
            ]
        ]
    ];
} else {
    instance_destroy();
}