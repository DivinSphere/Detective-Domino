if (global.historia == 3.3) { 
    
    
    
    
    
    
    var _fala_det_1, _fala_det_2, _fala_det_3;
    
    if (personagem_tem_caracteristica(1, 1)) { 
        _fala_det_1 = [7, 0, "Você se orgulha de ser 'Preciso', de calcular cada passo de forma cirúrgica..."];
        _fala_det_2 = [7, 0, "...mas toda essa sua precisão só serviu para orquestrar a queda exata de duas pessoas."];
        _fala_det_3 = [1, 0, "Eu não calculei a morte deles! Eu tentei evitar o pior!"];
    } 
    else if (personagem_tem_caracteristica(1, 2)) { 
        _fala_det_1 = [7, 0, "Você mentiu para mim dizendo que resolveria tudo, mas a verdade é que adora mentir para si mesmo."];
        _fala_det_2 = [7, 0, "'A culpa não foi minha'... que bela mentira para confortar sua mente frágil."];
        _fala_det_3 = [1, 0, "Não é mentira! Eu não empurrei ninguém daquela janela!"];
    } 
    else { 
        _fala_det_1 = [7, 0, "Você tenta fugir da sua responsabilidade, mas os fios do destino estão amarrados nas suas mãos."];
        _fala_det_2 = [7, 0, "Sua intromissão corrompeu o fluxo natural das coisas e guiou a todos para o caos."];
        _fala_det_3 = [1, 0, "Eu só observei! Eu não cometi crime algum!"];
    }

    
    var _fala_ellie_1, _fala_ellie_2, _fala_ellie_3;
    
    if (personagem_tem_caracteristica(3, 14)) { 
        _fala_ellie_1 = [7, 0, "E olha só a garota... tão Atenta. Ela se esquivou tão bem dos perigos menores..."];
        _fala_ellie_2 = [7, 0, "...apenas para terminar de joelhos assistindo ao horror absoluto sem poder fazer nada."];
        _fala_ellie_3 = [7, 0, "De que serviu toda essa percepção aguçada, se ela foi cega para o desastre real que você trouxe?"];
    } 
    else if (personagem_tem_caracteristica(3, 15)) { 
        _fala_ellie_1 = [7, 0, "E a pobre garota... tão Desligada do mundo. Uma mente tão avoada..."];
        _fala_ellie_2 = [7, 0, "...jamais seria capaz de prever que a tragédia quebraria literalmente a sua janela."];
        _fala_ellie_3 = [7, 0, "Ela viveu num sonho de ignorância até o último segundo, graças ao caos que você semeou."];
    } 
    else { 
        _fala_ellie_1 = [7, 0, "E a garota... ela não tinha chance contra as peças que você mesmo moveu no tabuleiro."];
        _fala_ellie_2 = [7, 0, "Um peão descartável na sua busca egoísta por respostas."];
        _fala_ellie_3 = [7, 0, "Você a manipulou da mesma forma que os assassinos manipulam suas armas."];
    }

    
    
    
    dialogos = [
        [
            "Conversar no Limbo", 
            [
                
                [7, 0, "Mais um ponto de vista interessante não é mesmo?", [], [], 0, function() {
                    var _jogador = noone;
                    with (obj_detetive) {
                        if (jogador == true) _jogador = id;
                    }
                    if (_jogador != noone) {
                        atribuir_comando(_jogador, "mover", 1, 70); 
                    }
                }],
                
                [1, 0, "Acho que eu vou enlouquecer com isso... pelo menos dessa vez a culpa não foi minha."],
                [7, 0, "Não foi sua, meu caro? A culpa é sempre sua... é você quem está influenciando esses eventos. Agora que você colocou seu dedo nisso, é tudo relacionado a você!"],
                [1, 0, "Como assim?"],
                [7, 0, "Você é o começo e o fim disso tudo..."],
                
                
                _fala_det_1,
                _fala_det_2,
                _fala_det_3,
                
                
                _fala_ellie_1,
                _fala_ellie_2,
                _fala_ellie_3,
                
                
                [1, 0, "Isso é um jogo doente. Eu só queria descobrir a verdade!"],
                
                
                [7, 0, "A verdade tem seu preço. Me diga, Dominó... em toda a sua vasta experiência lidando com a morte, o que pesa mais na alma?", 
                    
                    ["A Culpa da Ação", [
                        [1, 0, "A culpa de agir... de fazer algo que destrói as coisas. O sangue nas mãos é algo que não se lava, não te deixa dormir.", [], [], 0, function() {
                            global.escolha_filosofica = 1; 
                        }],
                        [7, 0, "Fascinante. Você sabe que agir é violento, e mesmo assim, escolhe puxar as cordas que fazem os outros despencarem no abismo."]
                    ]],
                    
                    ["O Fardo da Omissão", [
                        [1, 0, "A omissão. Ficar parado assistindo, sabendo que você poderia ter mudado as coisas se tivesse tentado. A impotência envenena a alma.", [], [], 0, function() {
                            global.escolha_filosofica = 2; 
                        }],
                        [7, 0, "Curioso. Mas ironicamente, meu caro detetive, a sua tentativa desesperada de não se omitir é exatamente o que traz a ruína para todos."]
                    ]]
                ],
                
                
                [7, 0, "Quase todos os pontos de vista foram observados não é mesmo?"],
                [1, 0, "Acho que sim..."],
                [7, 0, "Ótimo, agora só faltam 2..."],
                
                [1, 0, "Espera aí... Eu pensei que o objetivo fosse salvar eles e não... matá-los!"],
                [7, 0, "Matar é o primeiro passo para salvar uma vida."],
                [7, 0, "Nesse momento seu objetivo é um só... Matar o Sam."],
                
                [1, 0, "Mas por que o Sam?"],
                [7, 0, "Bom, como você pôde observar... a roupa de assassino era dele. Logo ele se torna o nosso maior suspeito."],
                
                [1, 0, "Nisso você tem razão, mas matar ele eu acho um exagero..."],
                [7, 0, "Bom, é você quem sabe. Nosso tempo aqui agora acabou. É hora de voltar para casa e então começar o interrogatório..."],
                
                
                [7, 0, "Não com uma vítima, e nem com o assassino, mas com o culpado de duas vidas serem ceifadas.", [], [], 0, function() {
                    
                    
                    var _jogador = noone;
                    with (obj_detetive) {
                        if (jogador == true) _jogador = id;
                    }
                    if (_jogador != noone) {
                        atribuir_comando(_jogador, "mover", -1, 70); 
                    }
                    
                    
                    var _porta = instance_create_layer(60, 92, "Instances", obj_porta);
                    
                    
                    _porta.destino_room = Rm_Detetive; 
                    _porta.destino_id = 1; 
                    _porta.acao_texto = "";
                    _porta.deslocar = -175; 
                    _porta.lado = 1;
                    _porta.image_alpha = 0; 
                    
                    
                    global.historia = 4;
                    global.dia++;
                }],
                
                [1, 0, "Tudo bem..."]
            ]
        ]
    ];
} else {
    instance_destroy();
}