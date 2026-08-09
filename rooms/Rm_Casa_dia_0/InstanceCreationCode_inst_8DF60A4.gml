
if (global.historia == 4.3) { 
    
    
    _entrar_na_casa = function(_sprite) {
        with (obj_detetive) {
            if (sprite_index == _sprite) {
                var _porta_x = 185; 
                var _dist = _porta_x - x;
                
                
                atribuir_comando(id, "mover", sign(_dist), abs(_dist));
                
                
                sumir = 4; 
            }
        }
    };

    dialogos = [
        [
            "Chegada na Casa", 
            [
                
                [0, 0, "15 minutos depois, eles finalmente chegam no lugar...", [], [], 0, function() {
                    
                    with (obj_detetive) {
                        if (sprite_index == spr_sam) atribuir_comando(id, "mover", 1, 50);
                        if (sprite_index == spr_ellie) atribuir_comando(id, "mover", 1, 40);
                        if (sprite_index == spr_tiffany) atribuir_comando(id, "mover", 1, 30);
                        if (sprite_index == spr_theo) atribuir_comando(id, "mover", 1, 20);
                        if (sprite_index == spr_breno) atribuir_comando(id, "mover", 1, 10);
                    }
                }],
                
                
                [6, 0, "Viu só, eu falei que era rapidinho! Vocês vão adorar o lugar, tem até piscina!"],
                [2, 0, "Que maravilha, eu vou guardar as coisas no quarto, a cama de cima é minha!"],
                [4, 0, "Pra mim pode ser qualquer uma..."],
                [5, 0, "Será que tem banheira?"],
                [3, 0, "Foi a primeira coisa que eu pensei também!"],
                
                
                [6, 0, "Vou indo na frente para destrancar a porta, venham!", [], [], 0, function() {
                    _entrar_na_casa(spr_sam);
                }],
                
                [5, 0, "Espero que não tenha muita poeira lá dentro, não quero sujar minha roupa.", [], [], 0, function() {
                    _entrar_na_casa(spr_tiffany);
                }],
                
                [4, 0, "Eu só quero encontrar uma tomada pra ligar meu notebook logo...", [], [], 0, function() {
                    _entrar_na_casa(spr_theo);
                }],
                
                [3, 0, "Ei, me esperem! Eu também quero olhar a casa!", [], [], 0, function() {
                    _entrar_na_casa(spr_ellie);
                }],
                
                
                [0, 0, "*(Barulho estranho vindo de longe na mata...)*", [], [], 0, function() {
                    
                    instance_create_layer(0, 0, "Instances", obj_tremor);
                }],
                
                [2, 0, "Opa, tem alguém ai?", [], [], 0, function() {
                    
                    with (obj_detetive) {
                        if (sprite_index == spr_breno) {
                            lado = -1;
                        }
                    }
                }],
                
                [2, 0, "..."],
				
                
                [2, 0, "Acho que deve ter sido um esquilo...", [], [], 0, function() {
                    
                    with (obj_detetive) {
                        if (sprite_index == spr_breno) {
                            lado = 1;
                        }
                    }
                    _entrar_na_casa(spr_breno);
                }],
				
				[2, 0, "Essa galera não espera ninguém!"],
                
                
                [0, 0, "", [], [], 0, function() {
                    global.historia = 4.4; 
					global.porta_id=-6
					global.lado=1
					global.deslocar=-130
                    room_goto(Rm_Casa_dia_0); 
                }]
            ]
        ]
    ];
} else {
    instance_destroy();
}