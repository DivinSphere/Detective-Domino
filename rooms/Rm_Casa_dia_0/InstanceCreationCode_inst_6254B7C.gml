if (global.historia == 3.3) { 
    dialogos = [
        [
            "O Acidente", 
            [
                
                [2, 0, "Quem quer uma carninha no ponto? Acabou de sair da grelha!", [], [], 0, function() {
                    with(obj_detetive) { aparecer = true; }
                }],
                
                
                [8, 0, "BUUUUH!", [], [], 0, function() {
                    
                    instance_create_layer(0, 0, "Instances", obj_tremor); 
                }],
                
                
                [2, 0, "Ahhh socorro!", 
                    "precisao", 
                    [0.025, 180], 
                    [
                        
                        [2, 0, "Toma essa, seu maluco!", [], [], 0, function() {
                            personagem_adicionar_caracteristica(2, 16); 
                        }]
                    ],
                    [
                        
                        [2, 0, "N-não me machuque!", [], [], 0, function() {
                            personagem_adicionar_caracteristica(2, 17); 
                        }]
                    ]
                ],
                
                
                [2, 0, "Sai de pe-- WAAAAH!", [], [], 0, function() {
                    var _breno = noone;
                    with (obj_detetive) {
                        
                        if (sprite_index == spr_breno) _breno = id; 
                    }
                    
                    if (_breno != noone) {
                        
                        atribuir_comando(_breno, "mover", 1, 40); 
                        
                        
                        instance_create_layer(0, 0, "Instances", obj_tremor); 
                        
                        
                        _breno.sumir = 3.7; 
                    }
                }],
                
                [8, 0, "... ?!"],
                
                
                [3, 0, "Sam! O que foi que você fez?!", [], [], 0, function() {
                    var _ellie = noone;
                    with (obj_detetive) {
                        if (jogador == true) _ellie = id;
                    }
                    
                    if (_ellie != noone) {
                        
                        atribuir_comando(_ellie, "mover", 1, 70); 
                    }
                }],
                
                
                
                [6, 0, "Eu... eu... eu não queria! Ele sabia que era uma fantasia... não era para isso ter acontecido!"],
                
                [3, 0, "Você o matou!", [], [], 0, function() {
                    
                    anotar("Breno sabia da fantasia de assassino.");
                }],
                
                
                [6, 0, "Não! Foi um acidente! Eu juro que não encostei nele, Ellie! Ele só tropeçou!"],
                
                
                [3, 0, "Sangue... Tem tanto sangue lá embaixo...", [], [], 0, function() {
                    var _ellie = noone;
                    with (obj_detetive) {
                        if (jogador == true) _ellie = id;
                    }
                    
                    if (_ellie != noone) {
                        
                        atribuir_comando(_ellie, "animacao", _ellie.anim_abaixado, false);
                    }
                }],
                
                
                [3, 0, "Espera... Eu estou vendo mais uma pessoa lá embaixo..."],
                [3, 0, "Meu Deus... é a Tiffany! O Breno caiu em cima dela!"],
				[3, 0, "Oh meu Deus, meu Deus do céu, não sobrou nada!"],
                [6, 0, "Tiffany?! Não! Não pode ser!", [], [], 0, function() {
                    
                    instance_create_layer(0, 0, "Instances", obj_tremor);
                }],
                
                
                [6, 0, "O que?! A roupa parece estar colada em mim, eu não consigo tirar ela do meu corpo!", [], [], 0, function() {
                    var _sam = noone;
                    with (obj_detetive) {
                        if (jogador == false) _sam = id;
                    }
                    if (_sam != noone) {
                        
                        atribuir_comando(_sam, "mover", -1, 5); 
                        atribuir_comando(_sam, "mover", 1, 5);
                    }
                }],
                
                [6, 0, "A faca também! Por algum motivo eu não consigo me livrar dessa roupa!"],
                
                
                [6, 0, "Meu Deus... o que a gente vai fazer?! Acabou... minha vida acabou!"],
                [3, 0, "(Droga... outra vez que as coisas dão errado... Mais mortes. Tudo de novo...)"],
                
                
                [3, 0, "", [], [], 0, function() {
                    
                    room_goto(Rm_Alem_dia_0); 
                }]
            ]
        ]
    ];
} else {
    instance_destroy();
}