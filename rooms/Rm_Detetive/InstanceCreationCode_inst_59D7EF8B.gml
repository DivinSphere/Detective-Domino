apenas_uma_vez = true;

if (global.historia == 1.4) {
    dialogos = [
        [
            "Interrogar", 
            [
                
                [4, 0, "Olá, senhor detetive, você está por aí? Meu nome é Theo, eu não sei se posso te ajudar muito com informações sobre o caso..."],
                [1, 0, "Pode me falar mais detalhes do acontecido?"],
                [4, 0, "Eu e meus amigos estávamos tirando uns dias de férias naquela casa, tínhamos alugado alguns dias para ficar por lá."],
                
                
                [4, 0, "Estava tudo correndo bem, eu não sei como isso foi acontecer!", 
                    
                    
                    ["Quem escolheu o lugar?", [
                        [4, 0, "Meu amigo Sam... ele já conhecia o lugar, disse que era ótimo para tirar o peso dos ombros e se divertir! Um lugar isolado, ele é meio estranho mas é gente boa.", [], [], 0, function() {
                            anotar("Foi o Sam que escolheu o lugar");
                        }]
                    ]],
                    
                    
                    ["Quantos amigos foram?", [
                        [4, 0, "Nessas férias estava eu e mais 4 amigos, 5 no total."],
                        [1, 0, "Isso significa que... o assassino pode ter escapado, já que não foram encontrados 5 corpos no incidente original...", [], [], 0, function() {
                            anotar("Era um total de 5 adolescentes no incidente");
                        }]
                    ]]
                ], 
                
                
                
                
                [1, 0, "Você poderia me falar como sobreviveu?"],
                
                
                [4, 0, "Eu apenas tive sorte... na verdade sorte não... eu fui covarde! Eu vi o assassino pela janela e então, saí correndo por uma passagem no depósito...", 
                    
                    
                    ["Ele não parece útil", [
                        [1, 0, "Então você é um covarde? Droga, isso não ajuda muito....", [], [], 0, function() {
                            anotar("Theo provavelmente não teve muito a ver com o caso");
                        }]
                    ]],
                    
                    
                    ["Você não é covarde", [
                        [1, 0, "Você não é covarde... Você é apenas sensato! Qualquer pessoa normal no seu lugar se preocuparia com a própria vida.", [], [], 0, function() {
                            personagem_remover_caracteristica(4, 3);
                            personagem_adicionar_caracteristica(4, 4);
                        }]
                    ]]
                ],
                
                
                
                
                [1, 0, "E em relação ao assassino? O que você pode me falar sobre ele?"],
                [4, 0, "Não muita coisa, eu o vi apenas de relance pela janela, e então saí correndo o mais rápido que pude!"],
                [4, 0, "Eu acho que se não tivesse feito isso eu não teria sobrevivido."],
                [1, 0, "Você não faz ideia..."],
                [4, 0, "Como disse?"],
                [1, 0, "Nada não... então eu acho que por agora é só isso."],
                [4, 0, "Ah, mais uma coisa, eu consegui ver que o assassino estava utilizando uma faca da cozinha.", [], [], 0, function() {
                    anotar("A arma do assassinato veio da cozinha");
                }],
                [1, 0, "Agora sim você me ajudou! Então, é daí que provavelmente veio a arma do crime."],
                
                
                [1, 0, "Muito obrigado pelas respostas! Vou encerrar o interrogatório por hoje, eu agradeço a ajuda!", [], [], 0, function() {
                    global.historia = 2;
                    global.dia++;
                    with(obj_porta) {
                        if (porta_id == 5) {
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