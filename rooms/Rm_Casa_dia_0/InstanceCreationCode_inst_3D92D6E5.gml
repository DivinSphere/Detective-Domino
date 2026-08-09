if (global.historia != 4.7) {
    instance_destroy();
} else {


dialogos = [
    [
        "Depositar Caixa", 
        [
            
            [2, 0, "Bom, acho que aqui é um bom lugar para deixar essa caixa.", [], [], 0, function() {
                var _jogador = noone;
                with (obj_detetive) {
                    if (jogador == true) _jogador = id;
                }
                if (_jogador != noone) {
                    atribuir_comando(_jogador, "mover", -1, 43);
                    atribuir_comando(_jogador, "animacao", _jogador.anim_abaixado, false);
                }
            }],
            
            
            [2, 0, "Prontinho, agora é só colocar ela aqui embaixo da prateleira...", [], [], 0, function() {
                var _jogador = noone;
                with (obj_detetive) {
                    if (jogador == true) _jogador = id;
                }
                if (_jogador != noone) {
                    
                    var _cx = _jogador.x - 20; 
                    var _cy = _jogador.y;
                    var _inst_caixa = instance_create_layer(_cx-17, _cy-14, "Instances", obj_objetos);
                    _inst_caixa.sprite_index = spr_caixa;
                }
            }],
            
            
            [2, 0, "Hora de levantar...", "sequence", [["S", "W", "D", "A"], 150],
                
                [
                    [2, 0, "Ufa, quase bati a cabeça nessa prateleira com... cola?", [], [], 0, function() {
                        anotar("A prateleira não foi tocada");
                    }]
                ],
                
                [
                    [2, 0, "Ah droga, bati a cabeça nessa prateleira!", [], [], 0, function() {
                        anotar("A prateleira é bem firme");
                    }]
                ]
            ],
            
            
            [2, 0, "Hora de voltar...", [], [], 0, function() {
                var _jogador = noone;
                with (obj_detetive) {
                    if (jogador == true)
                    mudar_animacao(anim_parado);
                }
            }],
            
            
            [6, 0, "Opa, tudo certo por aqui?", [], [], 0, function() {
                var _sam = noone;
                with (obj_detetive) {
                    if (sprite_index == spr_sam) {
                        aparecer = true;
                        atribuir_comando(id, "mover", -1, 30);
                    }
                }
            }],
            
            
            [2, 0, "Ah, tudo sim... por quê?", [], [], 0, function() {
                var _sam = noone;
                with (obj_detetive) {
                    if (jogador == true)
                    lado = 1; 
                }
            }],
            
			
            [6, 0, "É que você estava demorando muito, então eu vim dar uma olhada no que estava havendo."],
            [2, 0, "Por acaso você... queimou a linguiça?"],
            [6, 0, "O quê? Não, claro que não... a luz acabou antes!"],
            [2, 0, "Por isso que esse depósito está um breu!"],
            
            
            [6, 0, "Acho que a energia não aguentou a churrasqueira na potência máxima...", [], [], 0, function() {
                with (obj_detetive) {
                    if (sprite_index == spr_sam)
                    lado = 1; 
                }
            }],
            
            
            [2, 0, "(O Sam está de costas... o que eu faço?)", 
                ["Ignorar", [
                    [2, 0, "É, acho que pode não ter sido uma boa ideia ligar aquela churrasqueira super potente em uma casa antiga dessas..."],
                    [6, 0, "Pois é, vivendo e aprendendo."]
                ]],
                ["Esfaquear", [
                    
                    [2, 0, "(Vou aproveitar que ele tá distraido...)", "esmagar", [20, 120],
                        
                        [
                            [2, 0, "(Se eu fizer isso... poderei acessar o último ponto de vista)"],
                            [2, 0, "(Mas... mas... mas... eu não consigo)"]
                        ],
                        
                        [
                            [2, 0, "(Droga, não tenho força de vontade suficiente para isso...)"],
                            [2, 0, "(Bom, pelo menos consegui evitar que a cola seja derramada na roupa, acho que com isso o problema deve ser resolvido)"]
                        ]
                    ]
                ]]
            ],
            
            
            [6, 0, "Bom... que tal a gente ir no mercado?"],
            [2, 0, "Mercado?"],
            [6, 0, "Sim... tem um aqui perto, podemos chamar a galera toda para ir."],
            [2, 0, "Mas por quê?"],
            [6, 0, "Bom... Eu queimei as linguiças..."],
            [2, 0, "O_O"],
            [6, 0, "Vamos, vamos, eu pago!"],
            [2, 0, "Hu hu! Nesse caso eu vou querer aquelas salsichas premium de luxo!"],

            
            [6, 0, "Tudo bem, eu vou falar com o Benson para ver se ele resolve dar um desconto amigável...", [], [], 0, function() {
                global.historia = 4.8;
                
                with(obj_porta){
                    destino_id = 0;
                    destino_room = Rm_Alem_dia_0;
                }
                
                var _sam = noone;
                with (obj_detetive) {
                    if (sprite_index == spr_sam){
                    lado = 1;
                    atribuir_comando(id, "mover", 1, 35); 
                    sumir = 2;
					}
                }
				
        obj_porta.destino_room = Rm_Alem_dia_0; 
        obj_porta.destino_id = 1; 
        obj_porta.acao_texto = "Finalizar";
        obj_porta.deslocar = 0;
        obj_porta.lado = 1;
				
				
				
            }],
            
            
            [2, 0, "Então eu acho que é isso... problema resolvido."]
        ]
    ]
];

}