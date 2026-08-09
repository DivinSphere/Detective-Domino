if (global.historia == 4.2) { 
    
    
    
    
    var _fala_sam_1, _fala_sam_2, _fala_sam_3;
    
    if (personagem_tem_caracteristica(6, 19)) { 
        _fala_sam_1 = [7, 0, "Aquele garoto acha que está vivendo num roteiro de terror barato..."];
        _fala_sam_2 = [7, 0, "Mas você sabe muito bem que o sangue no chão não é efeito especial, não é mesmo?"];
        _fala_sam_3 = [1, 0, "Ele é só um idiota que não mediu as consequências... eu não posso deixar as coisas terminarem assim."];
    } 
    else if (personagem_tem_caracteristica(6, 20)) { 
        _fala_sam_1 = [7, 0, "O garoto adora as sombras, a escuridão, o macabro..."];
        _fala_sam_2 = [7, 0, "Vocês dois não são tão diferentes. Ambos brincam com o que não compreendem no escuro."];
        _fala_sam_3 = [1, 0, "Eu busco a luz da verdade, Paradoxo. Ele só queria espalhar o medo."];
    } 
    else { 
        _fala_sam_1 = [7, 0, "O pobre Sam está apavorado, preso naquela fantasia ridícula."];
        _fala_sam_2 = [7, 0, "Um bode expiatório perfeito para a sua pequena brincadeira de detetive, você não acha?"];
        _fala_sam_3 = [1, 0, "Ele correu o risco de machucar o Breno ao fazer aquilo... a culpa primária é dele."];
    }

    
    
    
    var _transicao_esperanca = function() {
        
        var _jogador = noone;
        with (obj_detetive) { if (jogador) _jogador = id; }
        if (_jogador != noone) { 
            atribuir_comando(_jogador, "mover", -1, 70); 
        }

        
        global.historia = 4.3; 
        var _porta = instance_create_layer(60, 92, "Instances", obj_porta);
        _porta.destino_room = Rm_estrada; 
        _porta.destino_id = -1; 
        _porta.acao_texto = "";
        _porta.deslocar = -70;
        _porta.lado = 1;
    };
    
    var _transicao_loucura = function() {
        
        var _jogador = noone;
        with (obj_detetive) { if (jogador) _jogador = id; }
        if (_jogador != noone) { 
            atribuir_comando(_jogador, "mover", -1, 70); 
        }

        
        global.historia = 102; 
        var _porta = instance_create_layer(60, 92, "Instances", obj_porta);
        _porta.destino_room = Rm_finais; 
        _porta.destino_id = 1; 
        _porta.acao_texto = "";
        _porta.deslocar = -70;
        _porta.lado = 1;
    };

    
    
    
    dialogos = [
        [
            "Conversar no Limbo", 
            [
                
                [1, 0, "Isso está chegando ao fim não é mesmo?", [], [], 0, function() {
                    var _jogador = noone;
                    with (obj_detetive) {
                        if (jogador == true) _jogador = id;
                    }
                    if (_jogador != noone) {
                        atribuir_comando(_jogador, "mover", 1, 70); 
                    }
                }],
                
                [7, 0, "Sim Dominó, você está mais perto do que imagina de finalizar esse caso."],
                
                
                _fala_sam_1,
                _fala_sam_2,
                _fala_sam_3,
                
                
                [7, 0, "A grande questão é... quantas vezes mais você vai querer continuar com essa loucura?"],
                [7, 0, "Não prefere apenas terminar e deixar o Sam como o culpado? Afinal de contas... a culpa foi dele! Tudo veio dele!"],
                [1, 0, "Então ele é o culpado? Eu não sei se isso me convence..."],
                [7, 0, "Quantas mais vezes você quer tentar isso?",
                    
                    
                    
                    
                    
                    
                    ["Uma última vez", [
                        [1, 0, "Acho que dessa vez... dessa vez vai dar certo!", [], [], 0, function() {
                            personagem_adicionar_caracteristica(1, 21); 
                        }],
                        [1, 0, "Eu vou confrontar o Sam diretamente, e se for necessário... farei o que for preciso! Essa loucura acaba agora!"],
                        [7, 0, "Que curioso... então você está convicto de terminar esse caso por agora? Sem ao menos acessar as lembranças de Sam sobre o caso?"],
                        [1, 0, "Vidas não são brinquedos. Eu não posso ficar pulando de cabeça em cabeça para resolver as coisas... essa será a última vez! Agora eu vou resolver tudo!"],
                        [7, 0, "Que assim seja! É tudo ou nada!"],
                        
                        
                        [7, 0, "A sua porta já está aberta, Dominó... Nos veremos mais uma vez...", [], [], 0, _transicao_esperanca]
                    ]],
                    
                    
                    ["Para todo sempre", [
                        [1, 0, "Eu vou tentar de novo... e de novo. Quantas vezes forem necessárias!", [], [], 0, function() {
                            personagem_adicionar_caracteristica(1, 22); 
                        }],
                        [1, 0, "Eu posso desfazer, eu posso controlar, eu posso refazer a linha do tempo infinitamente até que ninguém saia machucado!"],
                        [7, 0, "Hahaha! Uma espiral infinita de controle, culpa e morte... você finalmente quebrou, não foi?"],
                        [7, 0, "A mente humana não foi feita para suportar o peso do tempo, Dominó. Você não é um salvador, é um prisioneiro da própria obsessão."],
                        [1, 0, "Eu não ligo! Volte a fita! Faça tudo de novo!"],
                        
                        
                        [7, 0, "Como desejar, detetive. Aproveite o seu labirinto sem saída para todo o sempre.", [], [], 0, _transicao_loucura]
                    ]]
                ]
            ]
        ]
    ];
} else {
    instance_destroy();
}