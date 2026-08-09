
if (global.historia == 4.4) { 
    
    dialogos = [
        [
            "Conversar", 
            [
                
                
                [4, 0, "Liga na tomada e gira o botão pro 1. Cuidado com a voltagem disso aí."],
                
                
                [6, 0, "Deixa comigo, eu manjo de elétrica.", "precisao", [0.035, 120], 
                    [
                        
                        [6, 0, "Viu só? Perfeito!", [], [], 0, function() {
                            if (instance_exists(obj_churrasqueira)) obj_churrasqueira.estado = 2; 
                            instance_create_layer(0, 0, "Instances", obj_tremor); 
                            tocar(snd_minigame_interagir)
                            
                            with (obj_detetive) {
                                if (sprite_index == spr_breno || sprite_index == spr_theo) {
                                    atribuir_comando(id, "mover", 1, 20); 
                                }
                            }
                        }]
                    ],
                    [
                        
                        
                        [6, 0, "Opa... acho que deu um curto na resistência!", [], [], 0, function() {
                            if (instance_exists(obj_churrasqueira)) obj_churrasqueira.estado = 2; 
							tocar(snd_minigame_interagir)
                            instance_create_layer(0, 0, "Instances", obj_tremor); 
                            
                            
                            with (obj_detetive) {
                                if (sprite_index == spr_breno || sprite_index == spr_theo) {
                                    atribuir_comando(id, "mover", 1, 20); 
                                }
                            }
                        }]
                    ]
                ],
                
                
                [2, 0, "Tá pegando fogo, bicho!"],
                [4, 0, "Chama o bombeiro lá!"],
                
                
                [4, 0, "Cara, como que uma churrasqueira elétrica faz tanta fumaça?! Vai sufocar a gente aqui!"],
                [6, 0, "Calma, o fogo tá sob controle... eu acho."],
                [2, 0, "E agora pra desligar essa merda ai meo!"],
                [4, 0, "Ligou... agora desliga! Não olha pra mim, o dedo foi seu!"],
                [6, 0, "Tranquilo, é só abaixar a potência.", [], [], 0, function() {
                    if (instance_exists(obj_churrasqueira)) obj_churrasqueira.estado = 1; 
					tocar(snd_interagir)
                }],
                
                
                [4, 0, "Vocês são doidinhos cara... Eu falei que não era pra ligar isso aqui dentro."],
				[4, 0, "Não sou capaz de opinar... "],
                [4, 0, "Vou sair daqui antes que alguma coisa dê errado e eu leve a culpa.", [], [], 0, function() {
                    
                    with (obj_detetive) {
                        if (sprite_index == spr_theo) {
                            atribuir_comando(id, "mover", 1, 150); 
                            sumir = 3;
                        }
                    }
                }],
                [6, 0, "É, parece que somos só nós dois agora Breno."],
                [2, 0, "É, acho que ele não é muito fã de churrasco."],
                
                
                [2, 0, "Mas me diz uma coisa...", 
                    ["Hobbies", [
                        [2, 0, "Então, que tipo de hobbies você tem? Além de acender churrasqueiras no quarto, claro."],
                        [6, 0, "Ha! Aquilo foi mais uma necessidade do que um hobby. Mas no meu tempo livre..."],
                        [2, 0, "Deixa eu adivinhar... colecionar insetos? Ler histórias em quadrinhos?"],
                        [6, 0, "Quase isso. Ah, você sabe... eu gosto de coisas assustadoras!"]
                    ]],
                    ["Gostos", [
                        [2, 0, "Saindo um pouco do assunto... que tipo de gostos você tem? O que você curte fazer?"],
                        [6, 0, "Bom, eu passo bastante tempo consumindo mídia. Filmes, livros, jogos... essas coisas."],
                        [2, 0, "Ah, acho que o Theo mencionou que você assiste muita coisa estranha."],
                        [6, 0, "Não é estranho, é apenas um nicho! Ah, você sabe... eu gosto de coisas assustadoras!"]
                    ]]
                ],

                [2, 0, "Tipo o que?"],
                [6, 0, "Tá vendo aquela caixa ali? Abre ela."],
                [2, 0, "Deixa eu ver...", [], [], 0, function() {
                    
                    var _jogador = noone;
                    with (obj_detetive) { if (jogador) _jogador = id; }
                    
                    if (_jogador != noone) {
                        atribuir_comando(_jogador, "mover", -1, 60);
                        
                        atribuir_comando(_jogador, "animacao", _jogador.anim_abaixado, false); 
                    }
                }],
                
                
                [2, 0, "Vou abrir ela aqui", "esmagar", [7, 0], 
                    [
                        
                        [2, 0, "Consegui!", [], [], 0, function() {
                            if (instance_exists(obj_caixa)) obj_caixa.image_index = 1; 
                            
                            
                            with (obj_detetive) { 
                                if (jogador) mudar_animacao(anim_parado); 
                            }
                        }],
                        [2, 0, "Nossa o que é isso?"],
                        [6, 0, "É uma roupa de halloween antiga minha. Eu trouxe ela para colocar no depósito, quem sabe dar um susto em alguém por diversão."]
                    ],
                    [
                        
                        [2, 0, "Consegui!", [], [], 0, function() {
                            if (instance_exists(obj_caixa)) obj_caixa.image_index = 1;
                            
                            
                            with (obj_detetive) { 
                                if (jogador) mudar_animacao(anim_parado); 
                            }
                        }],
                        [2, 0, "Nossa o que é isso?"],
                        [6, 0, "É uma roupa de halloween antiga minha. Eu trouxe ela para colocar no depósito, quem sabe dar um susto em alguém por diversão."]
                    ]
                ],
                
                
                [2, 0, "...", 
                    ["Que maneiro!", [
                        [2, 0, "Que maneiro! Eu poderia utilizar isso pra assustar minha namorada, a Ellie..."],
                        [6, 0, "Não é? Já assustei muitas pessoas utilizando ela.", [], [], 0, function() {
                            personagem_adicionar_caracteristica(2, 23); 
                        }]
                    ]],
                    ["Isso é perigoso", [
                        [2, 0, "Na verdade isso é muito perigoso..."],
                        [2, 0, "Acho que poderia até matar alguém com isso."],
                        [6, 0, "Ah, acho que você está exagerando um pouco...", [], [], 0, function() {
                            personagem_adicionar_caracteristica(2, 24); 
                        }]
                    ]]
                ],
                
                
                [6, 0, "Bom, de qualquer forma, você poderia me ajudar com isso? Eu preciso guardar ela lá no depósito."],
                [6, 0, "E como eu estou mexendo na churrasqueira agora, não posso sair daqui no momento."],
                [2, 0, "Tudo bem, eu te ajudo com isso. Vou levar lá pra você.", [], [], 0, function() {
                    
					anotar("Breno pegou a caixa com a fantasia.");
                    if (instance_exists(obj_caixa)) instance_destroy(obj_caixa);
                }],
                [6, 0, "Eu agradeço muito! Se as meninas virem isso..."],
                [2, 0, "Há Há, acho que a Ellie iria adorar, eu só não sei a Tiffany..."],
                

                [2, 0, "Antes disso eu vou pegar um pouco de água pra mim na cozinha, estou morrendo de sede.", [], [], 0, function() {
                    
                    global.historia = 4.6; 
                }]
            ]
        ]
    ];
} else {
    instance_destroy();
}