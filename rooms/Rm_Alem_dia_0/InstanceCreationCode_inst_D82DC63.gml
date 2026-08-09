if (global.historia == 1.2) {
    dialogos = [
        [
            "Conversar", 
            [
                [1, 0, "O que? Eu voltei pra cá?"],
                [7, 0, "Você aí... vem pra cá!"],
                [1, 0, "Tudo bem...", [], [], 0, function() {
                    var _jogador = noone;
                    with (obj_detetive) {
                        if (jogador) _jogador = id;
                    }
                    if (_jogador != noone) {
                        atribuir_comando(_jogador, "mover", 1, 70);
                        atribuir_comando(_jogador, "esperar", 30); 
                    }
                }],
                
                [7, 0, "Você é burro?",
                    ["Acho que não entendi", [
                        [1, 0, "Acho que não entendi o que você quer dizer..."],
                        [7, 0, "É óbvio que não entendeu."]
                    ]],
                    ["Por que você acha?", [
                        [1, 0, "Por que você acha isso? Eu segui as instruções!"],
                        [7, 0, "Seguiu muito mal, pelo visto."]
                    ]]
                ],
                
                [7, 0, "Aparece uma pessoa com uma máscara de assassino na sua frente, e você simplesmente vai em direção a ela?"],
                [7, 0, "Você esqueceu do seu objetivo? Salvar vidas... investigar o assassinato... questionar os sobreviventes..."],
                [1, 0, "Mas esse caso não teve sobreviventes!"],
                [7, 0, "Exatamente! Seu objetivo é manter eles vivos para poder interrogar depois!"],
                [1, 0, "Aquilo doeu... eu fui esfaqueado! Eu tenho feito isso esse tempo todo?"],
                [7, 0, "Arg... odeio ter que passar por isso tantas vezes. Acredite, você não foi mais inteligente nas outras."],
                [1, 0, "Isso me ofende..."],
                [7, 0, "Olha, vamos tentar de novo, tá? Dessa vez, eu vou bloquear aquela porta para você."],
                

                [7, 0, "Em vez de passar por ela, tente encontrar um novo caminho, ok?",
                    
                    ["Tudo bem", [
                        [1, 0, "Tudo bem..."],
                        [7, 0, "Pode ir, nos vemos novamente depois...", [], [], 0, function() {
                            var _porta = instance_create_layer(60, 92, "Instances", obj_porta);
                            _porta.destino_room = Rm_Casa_dia_0;
                            _porta.destino_id = 3; 
                            _porta.acao_texto = "";
                            _porta.deslocar = -100;
                            _porta.lado = 1;
                            _porta.image_alpha = 0;
                            
                            global.historia = 1.3;
                            
                            var _jogador = noone;
                            with (obj_detetive) {
                                if (jogador) _jogador = id;
                            }
                            if (_jogador != noone) {
                                atribuir_comando(_jogador, "mover", -1, 70);
                                atribuir_comando(_jogador, "esperar", 20); 
                            }
                        }],
                        [7, 0, "Parece até um estagiário..."]
                    ]],
                    
                    ["Não quero", [
                        [1, 0, "Eu me recuso."],
                        [7, 0, "O que? Mas... mas por que? Acabamos de começar!"],
                        [1, 0, "Isso dói muito!"],
                        [7, 0, "É claro que dói, você morreu!"],
                        [1, 0, "Mas eu não quero mais morrer de novo! Me manda embora daqui!"],
                        [7, 0, "Tem certeza?"],
                        [1, 0, "100%! Me manda de volta por favor!"],
                        [7, 0, "..."],
                        [7, 0, "Seu desejo é uma ordem...", [], [], 0, function() {
                            
                            global.historia = 110;
                            
                            var _porta = instance_create_layer(60, 92, "Instances", obj_porta);
                            _porta.destino_room = Rm_finais; 
                            _porta.destino_id = 1; 
                            _porta.acao_texto = "";
                            _porta.deslocar = -100;
                            _porta.lado = 1;
                            _porta.image_alpha = 0;
                            
                            var _jogador = noone;
                            with (obj_detetive) {
                                if (jogador) _jogador = id;
                            }
                            if (_jogador != noone) {
                                atribuir_comando(_jogador, "mover", -1, 70);
                                atribuir_comando(_jogador, "esperar", 20); 
                            }
                        }]
                    ]]
                ]
            ]
        ]
    ];
} 
else {
    instance_destroy();
}