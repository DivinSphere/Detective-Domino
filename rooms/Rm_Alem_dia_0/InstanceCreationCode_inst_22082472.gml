if global.historia!=1.4
	instance_destroy()
else
dialogos = [
        [
            "Conversar", 
            [
                
                [1, 0, "(Lá está ele de novo... preciso de respostas.)", [], [], 0, function() {
                    
                    var _jogador = noone;
                    with (obj_detetive) {
                        if (jogador) _jogador = id;
                    }
                    if (_jogador != noone) {
                        atribuir_comando(_jogador, "mover", 1, 70);
                        atribuir_comando(_jogador, "esperar", 30);
                    }
                }],
                
                
                [7, 0, "Parabéns! Você salvou sua 'primeira' testemunha!"],
                [1, 0, "Então... é isso que eu faço? Altero o passado para poder mudar o futuro e salvar vítimas?"],
                [7, 0, "Sua causa não é tão nobre assim... mas é! Na verdade, agora que o seu trabalho está realmente começando."],
                [7, 0, "Vá dormir e amanhã interrogue sua primeira testemunha."],
                [1, 0, "Isso não faz o menor sentido para mim!"],
                [7, 0, "Suas memórias..."],
                [1, 0, "Ah, verdade... então, você é tipo o quê? Um guru?"],
                
                
                [7, 0, "Você está cada vez mais chato! Vamos lá, vou deixar você me perguntar uma única coisa antes de finalizarmos por agora.",
                    
                    ["Qual o seu objetivo?", [
                        [7, 0, "Meu objetivo é claro, concluir o seu objetivo! Eu consigo alguns bônus com isso, claro. A felicidade de salvar, suas memórias, um dia da sua vida..."],
                        [1, 0, "Um dia da minha vida?"],
                        [7, 0, "Ninguém nunca lê as letras miúdas, não é mesmo? Você não sabe nem com quem fez contrato..."]
                    ]],
                    
                    
                    ["Qual o meu objetivo?", [
                        [7, 0, "Ser o maior detetive desse mundo, é claro! Mesmo que você utilize-se de métodos não muito convencionais, sua causa pode ser um tanto nobre, eu diria?"],
                        [1, 0, "Por que você acha isso?"],
                        [7, 0, "Não é todo mundo que vem atrás do meu poder com uma causa desse tipo... geralmente é sempre a mesma coisa: fama, poder, dinheiro... embora o seu desejo ainda esteja relacionado com isso, não é mesmo?"]
                    ]]
                ],
                
                
                [7, 0, "Bom, nosso tempo por hoje já acabou! Então é aqui que eu me despeço."],
                [1, 0, "Mas você falou tão pouco..."],
                
                
                [7, 0, "Você já sabe onde fica a saída...", [], [], 0, function() {
                    
                    var _porta = instance_create_layer(60, 92, "Instances", obj_porta);
                    
                    
                    _porta.destino_room = Rm_Detetive; 
                    _porta.destino_id = 1; 
                    _porta.acao_texto = "";
                    _porta.deslocar = -175; 
                    _porta.lado = 1;
                    _porta.image_alpha = 0; 
                    
                    
                    global.historia = 1.4; 
                    
                    
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