if global.historia>2.1
	instance_destroy()
	




    dialogos = [
        [
            "Assistir TV", 
            [
                [4, 0, "Ah, eu adoro esses documentários sobre física e caos!"],
                [0, 0, "Hoje vamos falar sobre o efeito borboleta..."],
                [0, 0, "Imagine que por algum motivo seu despertador não tocou hoje e, por causa disso, você se atrasou para o trabalho."],
                [0, 0, "Você sai correndo de casa atrás do seu ônibus de sempre, mas acaba perdendo ele."],
                [0, 0, "Com isso você precisa esperar o próximo. Nesses 5 minutos de espera, uma pessoa que você não vê há anos aparece e conversa com você."],
                [0, 0, "Ela era sua amiga de infância. Conversa vem, conversa vai, e semanas depois vocês acabam namorando, casando, tendo filhos..."],
                [0, 0, "Você vive uma vida completa junto a essa pessoa. Tem filhos, netos, bisnetos."],
                [0, 0, "Agora, por outro lado, imagine que o seu despertador tocou normalmente..."],
                [0, 0, "Resultado... você nunca se casou... não teve netos... sua descendência terminou aí."],
                [0, 0, "Curioso, não? Apenas uma simples mudança, como um despertador, pode definir todo o seu futuro."],
                [0, 0, "Vamos agora assistir isso na prática! Vai começar o filme 'O Efeito Borboleta'."],
                [4, 0, "Fico imaginando qual é a pequena escolha que pode mudar todo o rumo da minha vida..."],
                [5, 0, "Theo..."],
                
                
                [4, 0, "O que foi, Tiffany?", 
                
                    ["Seu nerd", [
                        [5, 0, "Seu nerd...", [], [], 0, function() {
                            personagem_adicionar_caracteristica(4, 5); 
                        }],
                        [4, 0, "Desculpa... isso apenas me fascina..."],
                        [5, 0, "Olha, você não conhece nenhum programa mais interessante para escolher?"],
                        
                        
                        [4, 0, "Tipo qual?", 
                            ["Moda", [
                                [4, 0, "Nossa, que vaidosa...", [], [], 0, function() {
                                    personagem_adicionar_caracteristica(5, 6); 
                                }]
                            ]],
                            
                            ["Beleza", [
                                [4, 0, "Nossa, que vaidosa...", [], [], 0, function() {
                                    personagem_adicionar_caracteristica(5, 6); 
                                }]
                            ]]
                        ]
                    ]],
                    
                    ["Isso é interessante", [
                        [5, 0, "Também acho essa história muito curiosa, é o meu filme favorito.", [], [], 0, function() {
                            personagem_adicionar_caracteristica(5, 7); 
                        }]
                    ]]
                ],
                
                
                [4, 0, "A propósito, faz um tempo que eu não vejo o Sam e a Ellie."],
                [4, 0, "Eles estavam juntos na cozinha conversando sobre alguma coisa, o Sam estava falando sobre os hobbies estranhos dele para ela."],
                [5, 0, "Acho que vou dar uma olhada.", [], [], 0, function() {
                    
					personagem_remover_caracteristica(5,0)
					personagem_remover_caracteristica(4,0)

                    global.historia = 2.2; 
                    
                    
                }]
            ]
        ]
    ];
