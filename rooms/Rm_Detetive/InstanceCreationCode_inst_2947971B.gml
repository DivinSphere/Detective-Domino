apenas_uma_vez = true;

if (global.historia == 4) {
    dialogos = [
        [
            "Interrogar", 
            [
                
                [1, 0, "Então... você que é o Sam... o culpado por esse crime?"],
                
                [8, 0, "Eu sinto muito! Eu não quis machucar ninguém, foi um acidente!"],
                
                [1, 0, "E por que você ainda está com essa roupa e a faca na mão?"],
                [8, 0, "A roupa... estava grudada com cola! Eu mal consigo falar direito com ela, está muito abafado aqui atrás dessa máscara..."],
                [3, 0, "Não conseguiram tirar a roupa dele antes do interrogatório, devia ser uma cola muito forte!"],
                
                [1, 0, "Entendi... Me diga o motivo de estar usando essa roupa."],
                [8, 0, "Senhor detetive, eu apenas..."],
                
                
                
                
                [8, 0, "Eu... bem...", 
                    
                    
                    ["Gosto de filmes", [
                        [8, 0, "Adoro filmes de terror, é tipo um hobbie meu, sabe? Eu gosto desse tipo de coisa..."],
                        [8, 0, "Queria recriar uma cena clássica de susto, mas deu tudo errado.", [], [], 0, function() {
                            personagem_adicionar_caracteristica(6, 19); 
                            anotar("Sam usou a roupa porque é fã de filmes de terror.");
                        }],
                        [1, 0, "A vida real não tem roteiro, garoto. As consequências são definitivas."]
                    ]],
                    
                    
                    ["Adepto das sombras", [
                        [8, 0, "Sou um acólito do horror.", [], [], 0, function() {
                            personagem_adicionar_caracteristica(6, 20); 
                        }],
                        [1, 0, "O que?"],
                        [8, 0, "Gosto do sobrenatural, das coisas assustadoras, de Dia das Bruxas... esse tipo de coisa, sabe?"],
                        [3, 0, "Ele é meio sinistrinho, mas é gente boa... nunca faria algo para machucar uma mosca."],
                        [1, 0, "Para alguém que não machuca uma mosca, você causou um belo estrago."]
                    ]]
                ],
                
                
                
                
                [1, 0, "E o que você pretendia fazer com essa fantasia na casa?"],
                [8, 0, "Era só uma pegadinha! O Breno disse que ia descer quando a carne estivesse pronta e eu achei que seria engraçado dar um susto nele."],
                [8, 0, "Eu juro que não encostei nele! Ele recuou, bateu na janela e o vidro cedeu. Foi horrível!"],
                
                
                [1, 0, "(Eu sei que foi assim... porque eu estava lá.)"],
                [1, 0, "(Ele é só um garoto assustado preso em uma fantasia...)"],
                
                
                
                
                [1, 0, "Certo. Suas falas batem com o que foi relatado na cena. Mas ainda há peças faltando nesse quebra-cabeça bizarro."],
                [1, 0, "Eu preciso me retirar novamente. Vou voltar à casa onde o acidente aconteceu... tem algo lá que eu deixei passar."],
                [3, 0, "Tome cuidado, detetive. Aquele lugar parece amaldiçoado agora."],
                [8, 0, "Por favor, encontre algo que prove que foi um acidente! Minha vida acabou!"],
                
                [1, 0, "Eu vou encontrar a verdade.", [], [], 0, function() {
                    
                    
                    global.historia = 4.1; 
                    
                    
                    var _jogador = noone;
                    with (obj_detetive) {
                        if (jogador) _jogador = id;
                    }
                    if (_jogador != noone) {
                        atribuir_comando(_jogador, "mover", -1, 30);
                    }
                    
                    
                    with(obj_porta) {
                        
                        if (porta_id == 7) {
                            destino_room = Rm_Casa_dia_0; 
                            destino_id = 11; 
                            lado = 1;
                        }
                    }
                }]
            ]
        ]
    ];
} else {
    instance_destroy();
}