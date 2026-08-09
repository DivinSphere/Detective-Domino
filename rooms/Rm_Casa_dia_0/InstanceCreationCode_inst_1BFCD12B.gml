apenas_uma_vez = true;

if (global.historia == 3.10) { 
    
    
    
    
    var _fala_breno_1, _fala_breno_2, _fala_breno_3, _fala_breno_4;
    
    if (personagem_tem_caracteristica(2, 12)) { 
        _fala_breno_1 = [5, 0, "O Breno está cada dia mais perfeitinho, né? Sorte a sua namorar o cara descolado da turma."];
        _fala_breno_2 = [3, 0, "É, ele é maravilhoso... mas às vezes sinto que ele se importa demais com o que os outros pensam."];
        _fala_breno_3 = [5, 0, "Bobagem! O importante é que ele tem estilo e todo mundo adora ele. Você tá feita!"];
        _fala_breno_4 = [3, 0, "Eu gosto dele pelo que ele é, Tiffany, não pela popularidade... mas admito que é divertido."];
    } 
    else if (personagem_tem_caracteristica(2, 13)) { 
        _fala_breno_1 = [5, 0, "Como você aguenta o Breno reclamando e choramingando? Ele é tão sensível..."];
        _fala_breno_2 = [3, 0, "Ei, não fala assim! Ele só sente as coisas de um jeito mais profundo, é fofo."];
        _fala_breno_3 = [5, 0, "Fofo? Semana passada ele quase chorou porque deixaram ele de fora de um jogo ne basquete."];
        _fala_breno_4 = [3, 0, "Ele só gosta de se sentir incluído. Nem todo mundo tem um coração de gelo, sabe?"];
    } 
    else { 
        _fala_breno_1 = [5, 0, "Você e o Breno formam um casal bem bonitinho, admito."];
        _fala_breno_2 = [3, 0, "Obrigada, Tif. Nós temos nossos momentos..."];
        _fala_breno_3 = [5, 0, "Mesmo que às vezes ele pareça meio aéreo, o que importa é que vocês se gostam."];
        _fala_breno_4 = [3, 0, "Exatamente. Ele é um bom garoto e me faz rir bastante."];
    }

    var _fala_theo_1, _fala_theo_2, _fala_theo_3, _fala_theo_4;
    
    if (personagem_tem_caracteristica(5, 9)) { 
        _fala_theo_1 = [5, 0, "E o Theo... ai ai. Achei que podíamos dar certo, mas ele é esquisito demais pra mim."];
        _fala_theo_2 = [3, 0, "Tiffany, não liga pras aparências! Ele é um cara super gentil."];
        _fala_theo_3 = [5, 0, "Gentil não me leva a bons restaurantes nem me dá status. Eu preciso de alguém no meu nível!"];
        _fala_theo_4 = [3, 0, "Você nunca vai achar alguém que te faça feliz se ficar exigindo tanto..."];
    } 
    else { 
        _fala_theo_1 = [5, 0, "Mas me diz... você acha que o Theo reparou em mim hoje?"];
        _fala_theo_2 = [3, 0, "Tiffany, tá na cara! Você precisa parar de enrolar e ir logo falar com ele!"];
        _fala_theo_3 = [5, 0, "Você acha mesmo? E se eu for lá e ele me der um fora? Eu morro de vergonha!"];
        _fala_theo_4 = [3, 0, "Não vai saber se não tentar. Ele não parou de olhar na sua direção desde cedo."];
    }

    
    
    
    dialogos = [
        [
            "Conversar no Quarto", 
            [
                
                [3, 0, "(Nossa que estranho... eu estou na frente da pessoa que me matou...)"],
                [3, 0, "(Isso está me dando calafrios!)"],
                
                
                [5, 0, "Pensa rápido!",[], [], 0, function() {
					tocar(snd_bola_papel)
				}],
                
                
                [0, 0, "(Tiffany joga uma bola de papel na Ellie)", 
                    "precisao", 
                    [0.025, 180], 
                    
                    
                    [
                        [3, 0, "Ufa! Essa foi por pouco.", [], [], 0, function() {
                            personagem_adicionar_caracteristica(3, 14); 
                            tocar(snd_bola_papel)
                            with (obj_detetive) {
                                if (jogador == true) mudar_animacao(anim_abaixado);
                            }
                        }],
                        
                        [3, 0, "O que houve?", [], [], 0, function() {
							tocar(snd_bola_papel)
                            with (obj_detetive) {
                                if (jogador == true) mudar_animacao(anim_parado);
                            }
                        }]
                    ],
                    
                    
                    [
                        [3, 0, "Caramba, essa doeu!", [], [], 0, function() {
                            personagem_adicionar_caracteristica(3, 15); 
                        }]
                    ]
                ],
                
                
                [5, 0, "O que houve? Parece que você viu um fantasma! Está um pouco pálida e distraída."],
                [3, 0, "Desculpa, acabei me distraindo. Sobre o que estávamos falando mesmo?"],
                [5, 0, "Dãaa, do que mais estaríamos falando além dos... garotos!"],
                [3, 0, "Ah, verdade!"],
                
                
                _fala_breno_1,
                _fala_breno_2,
                _fala_breno_3,
                _fala_breno_4,
                
                _fala_theo_1,
                _fala_theo_2,
                _fala_theo_3,
                _fala_theo_4,
                
                
                [5, 0, "Enfim... a conversa tá boa, mas eu vou me divertir um pouco."],
				[5, 0, "Acho que vou assistir um pouco de TV lá na sala com o Theo."],
                [5, 0, "Até depois miga", [], [], 0, function() {
                    
                    
                    var _Tiffany = noone;
                    with (obj_detetive) {
                        if (sprite_index == spr_tiffany) _Tiffany = id;
                    }
                    
                    if (_Tiffany != noone) {
                        atribuir_comando(_Tiffany, "mover", -1, 60); 
                        _Tiffany.sumir = 3; 
                    }
                    
                    global.historia = 3.2; 
                }]
            ]
        ]
    ];
} else {
    instance_destroy();
}