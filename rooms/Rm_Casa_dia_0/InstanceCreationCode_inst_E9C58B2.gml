apenas_uma_vez = true;

if (global.historia == 3.2) { 
    
    
    
    
    var _falas_sam_extra_1, _falas_sam_extra_2;
    
    if (personagem_tem_caracteristica(6, 8)) { 
        _falas_sam_extra_1 = [3, 0, "Sam! Você me assustou de verdade! E eu confiava em você... achei que fosse um cara bonzinho!"];
        _falas_sam_extra_2 = [6, 0, "Ah, qual é, até os mais confiáveis têm seus momentos de vilão, né?"];
    } else { 
        _falas_sam_extra_1 = [3, 0, "Sam! Você é doente, sabia? Quase me matou do coração!"];
        _falas_sam_extra_2 = [6, 0, "Qual é, um sustinho não faz mal a ninguém! Você precisava ver a sua cara!"];
    }


    
    
    
    dialogos = [
        [
            "Abrir a Geladeira", 
            [
                
                [3, 0, "Nossa... estou tão fraca que mal consigo abrir a geladeira!", 
                    "esmagar", 
                    [7, 0], 
                    [
                        
                        [3, 0, "Tá emperrada...", [], [], 0, function() {
                            var _sam = noone;
                            with (obj_detetive) {
                                if (sprite_index == spr_assassino_faca) _sam = id;
                            }
                            if (_sam != noone){
								_sam.aparecer=true
								atribuir_comando(_sam, "mover", -1, 46);
							}
                        }]
                    ]
                ],
                
                
                [3, 0, "Preciso fazer mais força...", 
                    "esmagar", 
                    [7, 0], 
                    [
                        
                        [3, 0, "Só mais um pouquinho!", [], [], 0, function() {
                            var _sam = noone;
                            with (obj_detetive) {
                                if (sprite_index == spr_assassino_faca) _sam = id;
                            }
                            if (_sam != noone) atribuir_comando(_sam, "mover", -1, 46);
                        }]
                    ]
                ],
                
                
                [3, 0, "Quase abrindo...", 
                    "esmagar", 
                    [7, 0], 
                    [
                        
                        [3, 0, "Consegui!", [], [], 0, function() {
                            var _sam = noone;
                            with (obj_detetive) {
                                if (sprite_index == spr_assassino_faca) _sam = id;
                            }
                            if (_sam != noone) atribuir_comando(_sam, "mover", -1, 46);
                        }]
                    ]
                ],
                
                
                
                [8, 0, "BUUUH!", [], [], 0, function() {
                    instance_create_layer(0, 0, "Instances", obj_tremor); 
                    with (obj_detetive) {
                        if (jogador == true) {
                            lado = 1; 
                        }
                    }
                }],
                
                [3, 0, "Ahhh, socorro!!"],
                
                
                [6, 0, "Hahahahahaha, calma Ellie, sou eu."],
                [3, 0, "Eu?..."],
                [6, 0, "Sou eu! O bom e velho Sam, há há. Desculpa te assustar assim, é o meu hobbie, eu gosto de filmes de terror."],
                
                
                _falas_sam_extra_1,
                _falas_sam_extra_2,
                
                
                [6, 0, "Bom, agora eu vou lá em cima assustar o Breno que está fazendo churrasco no quarto."],
                [6, 0, "Até mais, medrosa!", [], [], 0, function() {
                    
                    var _sam = noone;
                    with (obj_detetive) {
                        if (sprite_index == spr_assassino_faca) _sam = id; 
                    }
                    
                    if (_sam != noone) {
                        
                        atribuir_comando(_sam, "mover", 1, 150);
                        _sam.sumir = 4; 
                    }
                }],
                
                
                [3, 0, "Perdi até a vontade de olhar a geladeira... acho que vou subir e ver se o Breno tem algo para me dar... quem sabe uma picanha ou algo do tipo.", [], [], 0, function() {
                    
                    global.historia = 3.3; 
                }]
            ]
        ]
    ];
} else {
    instance_destroy();
}