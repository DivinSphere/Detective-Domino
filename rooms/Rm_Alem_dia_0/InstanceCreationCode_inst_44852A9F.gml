global.dialogos_vistos={}

if (global.historia > 90) {

    personagem_remover_caracteristica(1, 22);
    
    global.devaneio_num++;
    
    
    _criar_porta_devaneio = function() {
        _porta = instance_create_layer(60, 92, "Instances", obj_porta);
        _porta.acao_texto = "";
        _porta.deslocar = -70;
        _porta.lado = 1;
        
		global.devaneio = false;
		
        if (global.historia == 101) {
            global.historia = 3.1;
            _porta.destino_room = Rm_Casa_dia_0;
            _porta.destino_id = -5;
        } 
        else if (global.historia == 102) {
            global.historia = 4.3; 
            _porta.destino_room = Rm_estrada;
            _porta.destino_id = -1;
        } 
        else if (global.historia == 108) {
            global.historia = 4.3; 
            _porta.destino_room = Rm_Casa_dia_0;
            _porta.destino_id = -1;
			_porta.deslocar = -70;
			
			
        }
		

        else if (global.historia == 111) {
            _porta.destino_room = Rm_finais;
            _porta.destino_id = 1; 
        }
		else if (global.historia == 110) {
			
            _porta.destino_room = Rm_Casa_dia_0;
            _porta.destino_id = 3; 
            _porta.acao_texto = "";
            _porta.deslocar = -100;
            _porta.lado = 1;
            _porta.image_alpha = 0;
                            
            global.historia = 1.3;
			
        }
        else {
            _porta.destino_room = Rm_Casa_dia_0;
            _porta.destino_id = 1;
        }
        
        with (obj_detetive) {
            if (jogador) { atribuir_comando(id, "mover", -1, 70); }
        }
    };

    var _mover_frente = function() {
        var _jogador = noone;
        with (obj_detetive) { if (jogador) _jogador = id; }
        if (_jogador != noone) { atribuir_comando(_jogador, "mover", 1, 70); }
    };

    if (global.devaneio_num == 1) {
        dialogos = [
            [
                "Conversar com o Paradoxo", 
                [
                    [1, 0, "Hã? o que? como eu vim parar aqui?"],
                    [7, 0, "Meu caro! Venha, se aproxime", [], [], 0, _mover_frente],
                    [1, 0, "Eu pensei que..."],
                    [7, 0, "Calma calma... deixa eu te explicar, você apenas teve um devaneio"],
                    [1, 0, "Um devaneio?"],
                    [7, 0, "Isso mesmo! um devaneio"],
                    [1, 0, "O que seria isso?"],
                    [7, 0, "Basicamente, você teve um tipo de dejavu dimensional! Você se perdeu no nosso espaço tempo e acabou parando em um mundo de outro dominó"],
                    [1, 0, "Então aquilo tudo era mentira?"],
                    [7, 0, "Não não, não entenda errado! aquilo era tudo 100% verdade! e um outro dominó com certeza está vivendo aquilo"],
                    [7, 0, "Mas não você! Você ainda tem um caminho muito longo pela frente"],
                    [1, 0, "Então... por onde eu continuo agora?"],
                    [7, 0, "Do mesmo lugar é claro... você não lembra onde parou?",
                        ["Claro que lembro!", [
                            [7, 0, "Então é só seguir por aquela porta"]
                        ]],
                        ["Esqueci completamente", [
                            [7, 0, "Atravesse aquela porta... já configurei ela para retornar de onde você parou"]
                        ]]
                    ],
                    [1, 0, "Eu agradeço então!"],
                    [7, 0, "(É claro que eu não faria você jogar tudo de novo do zero não é mesmo...)"],
                    [7, 0, "(Ou será que faria?)", [], [], 0, _criar_porta_devaneio]
                ]
            ]
        ];
    } else if (global.devaneio_num == 2) {
        dialogos = [
            [
                "Conversar com o Paradoxo", 
                [
                    [1, 0, "Caramba, de novo?"],
                    [7, 0, "Exatamente, meu caro! Parece que sua mente se perdeu em mais um devaneio.", [], [], 0, _mover_frente],
                    [1, 0, "Eu podia jurar que aquilo era real..."],
                    [7, 0, "Sua mente de detetive não consegue evitar explorar todas as linhas do tempo possíveis."],
                    [7, 0, "Mas a porta já está configurada novamente. Atravesse e continue sua verdadeira investigação."],
                    [1, 0, "Certo, certo... estou indo.", [], [], 0, _criar_porta_devaneio]
                ]
            ]
        ];
    } else {

        dialogos = [
            [
                "Conversar com o Paradoxo", 
                [
                    [1, 0, "Tá tá tá, já sei... outro devaneio?"],
                    [7, 0, "Outro devaneio...", [], [], 0, _mover_frente],
                    [1, 0, "Aquela porta lá?"],
                    [7, 0, "Aquela porta..."],
                    [7, 0, "A proposito... você viu alguma borboleta por ai?", 
                        ["Não", [
                            [7, 0, "Ah tudo bem então.. mas caso veja, me avise tá bem?", [], [], 0, _criar_porta_devaneio]
                        ]],
                        ["Sim", [
                            [7, 0, "Poderia me dizer quantas são?",
                                ["13", [[7, 0, "poxa, acho que não é isso.. mas voce pode continuar contando!", [], [], 0, _criar_porta_devaneio]]],
								["14", [[7, 0, "poxa, acho que não é isso.. mas voce pode continuar contando!", [], [], 0, _criar_porta_devaneio]]],
                                ["15", [[7, 0, "poxa, acho que não é isso.. mas voce pode continuar contando!", [], [], 0, _criar_porta_devaneio]]],
                                ["16", [
                                    [7, 0, "Caramba! Você é realmente muito observador, meus parabéns! aqui, vou deixar você ver uma coisa muito legal!", [], [], 0, function() {
                                        global.historia = 111;
                                        _criar_porta_devaneio();
                                    }]
                                ]],
                                ["17", [[7, 0, "poxa, acho que não é isso.. mas voce pode continuar contando!", [], [], 0, _criar_porta_devaneio]]],
                                ["18", [[7, 0, "poxa, acho que não é isso.. mas voce pode continuar contando!", [], [], 0, _criar_porta_devaneio]]],
                                ["19", [[7, 0, "poxa, acho que não é isso.. mas voce pode continuar contando!", [], [], 0, _criar_porta_devaneio]]],
                                ["20", [[7, 0, "poxa, acho que não é isso.. mas voce pode continuar contando!", [], [], 0, _criar_porta_devaneio]]],
								["21", [[7, 0, "poxa, acho que não é isso.. mas voce pode continuar contando!", [], [], 0, _criar_porta_devaneio]]]
                            ]
                        ]]
                    ]
                ]
            ]
        ];
    }
} else {
    instance_destroy();
}