if (global.historia == 2.5) {
    dialogos = [
        [
            "Conversar", 
            [
                [1, 0, "Espera, eu conheço você..."],
                
                [2, 0, "Senhor detetive. Meu nome é Breno, eu posso confirmar para você, essa pessoa é a assassina da minha namorada!"],
                
                
                [1, 0, "Namorada? Você fala... da Ellie?", [], [], 0, function() {
                    anotar("Ellie é a namorada do Breno");
                }],
                
                
                [2, 0, "Isso mesmo! Eu vi tudo, quer dizer, quase tudo... estava escuro, mas eu tenho certeza, ela matou minha namorada!", [], [], 0, function() {
                    with (obj_detetive) {
                        
                        if (sprite_index == spr_breno) { 
                            image_xscale = 1; 
                            lado = 1;         
                        }
                    }
                }]
            ]
        ]
    ];
} else {
    instance_destroy();
}