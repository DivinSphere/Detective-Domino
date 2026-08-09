apenas_uma_vez = true;

if (global.historia == 2.5) {
    
    
    
    
    
    
    var _falas_extras = [];
    
    
    if (personagem_tem_caracteristica(5, 10)) { 
        _falas_extras = [
            [5, 0, "Detetive... eu sou completamente atrapalhada!"],
            [5, 0, "No meio de toda aquela escuridão, eu perdi o equilíbrio e tropecei no meu próprio pé!"],
            [1, 0, "(Ela tem razão... quando eu estava controlando o corpo dela, o equilíbrio era péssimo.)"]
        ];
    } 
    
    else if (personagem_tem_caracteristica(5, 9)) { 
        _falas_extras = [
            [5, 0, "Acha mesmo que eu faria uma ciosa dessas? Isso acabaria com toda minha reputação!"],
            [5, 0, "Eu só queria achar a saída, me desesperei e acabei esbarrando nela no escuro!"],
            [1, 0, "(Ela parece fútil, mas uma assassina a sangue frio? Dificilmente...)"]
        ];
    } 
    
    else { 
        _falas_extras = [
            [5, 0, "Foi um erro terrível... o escuro, o pânico. Tudo deu errado de uma vez só."],
            [5, 0, "Eu daria tudo para voltar no tempo e não ter saído daquela sala."],
            [1, 0, "(Voltar no tempo... ironicamente, foi exatamente isso que causou essa tragédia.)"]
        ];
    }

    
    
    
    dialogos = [
        [
            "Interrogar", 
            [
                
                [1, 0, "Tiffany. Precisamos repassar os eventos que aconteceram na casa logo após a queda de energia."],
                [5, 0, "Senhor detetive, por favor, você tem que acreditar em mim! Eu já disse que foi um..."],
                
                
                [2, 0, "Um acidente?! Conta outra! Não caia no teatrinho dela, detetive!"],
                [1, 0, "Breno, por favor. O interrogatório precisa seguir os procedimentos legais. Deixe-me conduzir as perguntas."],
                [2, 0, "Desculpe, senhor... mas eu vi com meus próprios olhos! Ela estava segurando a faca da cozinha!"],
                
                
                [1, 0, "Breno mencionou que vocês duas tinham uma desavença antiga."],
                [1, 0, "Por que você não gosta da Ellie?"],
                
			
                [5, 0, "Isso...", 
                    
                    
                    ["Isso não é verdade", [
                        [5, 0, "Isso é mentira do Breno, ele é muito sensível!", [], [], 0, function() {
                            personagem_adicionar_caracteristica(2, 13); 
                        }],
                        [5, 0, "Amizade de garotas é assim mesmo, a gente se ofende às vezes, mas nos amamos!", [], [], 0, function() {
                            anotar("Tiffany acha que breno é muito sensível.");
                        }],
                        [2, 0, "Sensível?! Você tirou a vida dela e acha que eu estou sendo dramático?!"]
                    ]],
                    
                    
                    ["Desde o namoro", [
                        [5, 0, "Ela mudou... Desde que começou a namorar o garoto mais descolado da nossa escola, ela se afastou.", [], [], 0, function() {
                            personagem_adicionar_caracteristica(2, 12); 
                        }],
                        [5, 0, "Eu e ela éramos super amigas antes dele aparecer!", [], [], 0, function() {
                            anotar("Tiffany acha que sua amizade foi prejudicada por Breno.");
                        }],
                        [2, 0, "Não tente colocar a culpa em mim! O problema de vocês sempre foi a sua inveja!"]
                    ]]
                    
                ],
                
                
                [1, 0, "Chega os dois. Breno, independentemente das desavenças, a lei exige fatos."],
                [1, 0, "Tiffany, a arma do crime estava nas suas mãos. Como você explica o momento exato?"],
                
                
                _falas_extras[0],
                _falas_extras[1],
                _falas_extras[2],

				
                [1, 0, "Certo... Suas declarações finais foram registradas."],
                [2, 0, "Registradas? E agora? Você vai assinar o mandado de prisão dela, não vai, detetive?!"],
                
                
                [1, 0, "(Minhas mãos estão tremendo... Eu sou o verdadeiro responsável por isso.)"],
                [1, 0, "(Fui eu que tropecei no escuro. Fui eu que segurei a faca enquanto ocupava o corpo dela.)"],
                [1, 0, "(Se eu condená-la agora, uma garota inocente vai apodrecer na prisão pelo meu erro cósmico.)"],
                [1, 0, "(Mas se eu não prendê-la, o Breno vai fazer um escândalo. E se eu voltar à cena do crime... o que mais eu posso acabar estragando?)"],
                
                
                [1, 0, "Breno, Tiffany. O interrogatório de hoje está encerrado. Eu vou avaliar tudo o que foi dito aqui e decidir o que vai acontecer a partir de agora."],
                
                
                [2, 0, "Isso é um absurdo! Eu espero que ela apodreça na cadeia!", [], [], 0, function() {
                    anotar("Estou dividido entre a finalização e a continuação do caso...");
                    
                    
                    global.historia = 2.6; 
                    
                    
                    with (obj_detetive) {
                        if (sprite_index == spr_breno) {
                            atribuir_comando(id, "mover", -1, 150); 
                            sumir = 2; 
                        }
                    }
					
					global.historia=3
					
                    with(obj_porta) {
                        if (porta_id == 6) {
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