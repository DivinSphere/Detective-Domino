if global.historia!=1
	instance_destroy()
	
	
dialogos = [
    [
        "Conversar", 
        [
            
            [7, 0, "Olá, seja bem-vindo novamente!", 
                
                ["Novamente?", [
                    [1, 0, "Eu já estive aqui antes? Não reconheço este lugar..."],
                    [7, 0, "Exato. Você não se lembra, mas já nos encontramos aqui diversas vezes. Mais vezes do que imagina."]
                ]],
                
                ["Que lugar é esse?", [
                    [1, 0, "Isso é real? Ou eu estou finalmente enlouquecendo?"],
                    [7, 0, "Meu caro, você está de volta ao Limbo. Eu sei que sua mente fragmentada não se recorda..."]
                ]]
            ],
            
            
            [7, 0, "Meu nome é Paradoxo. Estou aqui para... guiá-lo na solução de seus casos! Mas há um preço."],
            [7, 0, "Após cada mistério resolvido, as memórias que você cria neste lugar são apagadas da sua mente e entregues a mim."],
            
            
            [7, 0, "Quer entender como nossa parceria funciona? Diga-me... Você se lembra de quantos casos resolveu neste mês?",
                
                ["5 Casos", [
                    [1, 0, "Eu resolvi exatos 5 casos. Meu chefe prometeu que, ao fechar o sexto, serei promovido ao melhor detetive da agência.", [], [], 0, function() {
                        
                        personagem_adicionar_caracteristica(1, 1);
                    }],
                    [7, 0, "Na mosca! E em cada um desses cinco casos, você esteve aqui, e eu fui a mão invisível que te ajudou."]
                ]],
                
                ["7 Casos", [
                    [1, 0, "Com certeza já resolvi uns 7! E logo vou emendar o próximo!", [], [], 0, function() {
                        
                        personagem_adicionar_caracteristica(1, 2);
                    }],
                    [7, 0, "Ah, não precisa inflar seu ego comigo. Eu estava lá, afinal. Em cada um dos seus casos reais, havia um dedo meu te ajudando."]
                ]]
            ],
            
            
            [1, 0, "O que foi isso que eu acabei de sentir?"],
            [7, 0, "Ah, você acabou de adquirir uma característica! Suas respostas moldam quem você é neste mundo."],
            [7, 0, "Suas escolhas têm peso e consequências, podendo gerar traços positivos ou negativos. A responsabilidade é toda sua."],
            [1, 0, "Entendi... Então, o que eu devo fazer agora?"],
            [7, 0, "O tempo é curto e nós já gastamos muito dele conversando."],
            
            
            [7, 0, "Saia por aquela porta. Volte para a cena do crime, entre na pele da vítima e mude o destino dela.", [], [], 0, function() {
                
                var _porta = instance_create_layer(60, 92, "Instances", obj_porta);
                
                
                _porta.destino_room = Rm_Casa_dia_0;
                _porta.destino_id = 3;
				_porta.acao_texto=""
				_porta.deslocar=-100
				_porta.lado=1
				_porta.image_alpha=0
				global.historia=1.2
            }]
        ]
    ]
];