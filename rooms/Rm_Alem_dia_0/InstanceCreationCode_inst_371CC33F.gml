if (global.historia == 2.0) { 
    dialogos = [
        [
            "Conversar", 
            [
                
                [7, 0, "Uma vida por uma vida não é mesmo?",[],[],0,function() {
                    var _jogador = noone;
                    with (obj_detetive) {
                        if (jogador == true) _jogador = id;
                    }
                    
                    if (_jogador != noone) {
                        atribuir_comando(_jogador, "mover", 1, 70); 
                    }}],
                [1, 0, "Aquele corpo... é uma nova vítima?"],
                [7, 0, "Não exatamente, mas próximo disso."],
                [1, 0, "Eu não entendo o que você quer dizer com isso."],
                [7, 0, "Ao salvar uma vida, você mudou o curso da história. Um pequeno fato não ocorreu como deveria e um corpo foi encontrado em um lugar diferente."],
                [1, 0, "Isso é muito confuso..."],
                [7, 0, "Da última vez eu respondi uma pergunta sua... agora você precisa responder duas minhas."],
                [1, 0, "Isso não me parece muito justo."],
                
                
                [7, 0, "Ah, são apenas pequenos detalhes. Me diga, qual dessas cores é a que você mais gosta?",
                    
                    ["Azul", [
                        [1, 0, "Eu gosto bastante de azul, acalma meus pensamentos.", [], [], 0, function() {
                            global.escolha_cor = 1; 
                        }],
                        [7, 0, "Ah, calmaria, tranquilidade, é uma ótima escolha. Muitas pessoas gostam do mar, da chuva..."]
                    ]],
                    
                    ["Vermelho", [
                        [1, 0, "O vermelho me define melhor.", [], [], 0, function() {
                            global.escolha_cor = 2; 
                        }],
                        [7, 0, "Entendo... tensão, raiva, paixão. Uma cor mais intensa."]
                    ]]
                ],
                
                
                [7, 0, "O que te deixa mais desconfortável?",
                
                    ["Aranhas", [
                        [1, 0, "Não diria que sou aracnofóbico, mas tenho uma certa aversão a aranhas.", [], [], 0, function() {
                            global.escolha_medo = 1; 
                        }],
                        [7, 0, "Isso é interessante... muitos diriam que as aranhas simbolizam a criatividade."],
                        [7, 0, "A capacidade de construir sua própria realidade."],
                        [7, 0, "Você é alguém apegado ao destino?"],
                        [1, 0, "Acho que um pouco... não costumo gostar muito de mudanças."]
                    ]],
                    
                    ["Palhaços", [
                        [1, 0, "Não gosto de como os palhaços se submetem ao ridículo.", [], [], 0, function() {
                            global.escolha_medo = 2; 
                        }],
                        [7, 0, "Então você é um cara muito reprimido, certo? Acha que toda essa liberdade de expressão faz mal?"],
                        [7, 0, "Não gosta de como palhaços são livres das amarras da sociedade?"],
                        [1, 0, "Amarras nos mantêm na linha..."]
                    ]]
                ],
                
                
                [7, 0, "Tudo bem, era só isso que eu queria saber mesmo... acho que conheço um pouco mais do que te levou a mim agora."],
                [1, 0, "Mas eu ainda não sei muito sobre você ou esse lugar."],
                [7, 0, "Nosso tempo por agora acabou, você já pode ir investigar os fatos."],
                [1, 0, "Quanto mais eu falo com ele, menos parece que eu sei das coisas e mais parece que ele me conhece...", [], [], 0, function() {
                   
				   
				   
                var _porta = instance_create_layer(60, 92, "Instances", obj_porta);
                
                
                _porta.destino_room = Rm_Casa_dia_0;
                _porta.destino_id = 6;
				_porta.acao_texto=""
				_porta.deslocar=116
				_porta.lado=1
				_porta.image_alpha=0
				global.historia=2.1
				   
                    
                    var _jogador = noone;
                    with (obj_detetive) {
                        if (jogador) _jogador = id;
                    }
                    if (_jogador != noone) {
                        atribuir_comando(_jogador, "mover", -1, 70);
                        atribuir_comando(_jogador, "esperar", 20); 
                    }
				   

                }]
            ]
        ]
    ];
}else
	instance_destroy()