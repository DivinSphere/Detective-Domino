if (global.historia == 4.8) { 

    
    
    
    
    _transicao_base = function(_id_hist) {
        global.historia = _id_hist;
        var _porta = instance_create_layer(60, 92, "Instances", obj_porta);
        _porta.destino_room = Rm_finais; 
        _porta.destino_id = 1; 
        _porta.acao_texto = "";
        _porta.deslocar = -70;
        _porta.lado = 1;
        
        with (obj_detetive) {
            if (jogador) { atribuir_comando(id, "mover", -1, 70); }
        }
    };

    
    var _final_100_ciclo   = function() { _transicao_base(100); }; 
    var _final_107_quebrar = function() { _transicao_base(107); }; 
    var _final_103_theo    = function() { _transicao_base(103); }; 
    var _final_104_breno   = function() { _transicao_base(104); }; 
    var _final_105_tiff    = function() { _transicao_base(105); }; 
    var _final_106_sam     = function() { _transicao_base(106); }; 

    
    
    
    var _fala_theo = personagem_tem_caracteristica(4, 3) 
        ? [7, 0, "Temos o Theo, a primeira vítima... fugiu como um rato covarde, e mesmo assim a morte o alcançou."] 
        : [7, 0, "Temos o Theo... usou a sensatez para fugir, mas a morte tem um senso de humor peculiar, não é?"];
        
    var _fala_tiff = personagem_tem_caracteristica(5, 10) 
        ? [7, 0, "A doce Tiffany... tão desastrada que no escuro tropeçou na própria sanidade, e na faca também."] 
        : [7, 0, "A vaidosa Tiffany... preocupada com aparências, mas no escuro, o sangue tem a mesma cor para todos."];
        
    var _fala_ellie = personagem_tem_caracteristica(3, 11) 
        ? [7, 0, "Nossa querida Ellie... uma garota tão fofa, mas com uma mente criativa o suficiente para trocar uma lâmina, piorando tudo."] 
        : [7, 0, "Nossa querida Ellie... a distração em pessoa. Tão desligada que não percebeu que vestiu a própria mortalha."];

    var _fala_breno = personagem_tem_caracteristica(2, 23) 
        ? [7, 0, "Nosso amigo Breno... se achou destemido, mas foi o medo que o fez derrubar a cola e selar o destino dos amigos."] 
        : [7, 0, "Nosso amigo Breno... o cara cauteloso. Tão cauteloso que o excesso de cuidado causou o desastre da cola."];

    var _fala_sam = personagem_tem_caracteristica(6, 20) 
        ? [7, 0, "E claro, o Sam... aquele adepto das sombras. Trouxe as sombras para a vida real de forma magistral."] 
        : [7, 0, "E claro, o Sam... o pobre garoto tentando pregar uma peça cinematográfica que custou cinco vidas."];

    
    
    
    
    
    var _rota_breno = [
        [7, 0, "Por que você acha que foi ele?"],
        [1, 0, "Ele sabia da fantasia, esteve com ela nas suas mãos, mas mesmo assim a colocou no depósito."],
        [1, 0, "E com certeza... foi ele quem derrubou a cola que deixou a roupa grudada."],
        [7, 0, "Mas então quem vestiu a roupa?"],
        [1, 0, "Provavelmente o Sam ou até mesmo Breno querendo pregar uma peça nos amigos, mas eles não queriam machucar ninguém!"],
        [1, 0, "E como a roupa estava com cola, acabou dando errado, e ele não conseguiu tirar a fantasia para mostrar que não era um assassino de verdade."],
        [7, 0, "Furos e mais furos... Mas você escolheu assim. O caso está encerrado.", [], [], 0, _final_104_breno]
    ];

    
    var _rota_tiff = [
        [7, 0, "Tiffany é? Me diga o porquê."],
        [1, 0, "Ela é desastrada, possivelmente pegou a faca porque ouviu alguém gritar sobre um assassino."],
        [1, 0, "Que era apenas um susto na verdade... e quando a luz acabou, ela esfaqueou todo mundo que estava na sua frente!"],
        [1, 0, "A primeira facada pode ter sido apenas um acidente... mas logo em seguida ela enlouqueceu."],
        [7, 0, "É um ponto interessante de se pensar, afinal de contas ela não era muito resistente a estresses psicológicos."],
        [1, 0, "De fato... ao perder a sanidade ela atacou os outros e depois fez o pior..."],
        [7, 0, "Uma boa narrativa, embora incompleta. Vamos ver como a realidade aceita isso.", [], [], 0, _final_105_tiff]
    ];

    
    var _rota_sam = [
        [7, 0, "Realmente... ninguém pode te julgar por escolher essa linha de pensamento."],
        [1, 0, "Foi ele que escolheu o lugar em que estavam, premeditado talvez?"],
        [1, 0, "Uma pessoa sã nunca levaria uma fantasia de terror para tirar férias, ainda mais com uma faca."],
        [7, 0, "De fato, toda essa confusão foi causada por esse simples fato não é mesmo?"],
        [1, 0, "Ele também pediu para o Breno levar a fantasia para o depósito porque poderia assustar alguém futuramente."],
        [7, 0, "Correto, e o que mais... qual motivo ele teria para esfaquear o Theo?"],
        [1, 0, "Ele não queria esfaquear ele... isso foi culpa minha, eu corri pra cima dele."],
        [1, 0, "A faca provavelmente tinha sido trocada pela..."],
        [7, 0, "Ellie?"],
        [1, 0, "Ellie? ... Realmente! O assassino só conseguiu matar o Theo porque a faca foi trocada antes nessa realidade."],
        [1, 0, "Ele também foi encontrado usando a fantasia colada, então em algum momento ele pode ter vestido ela."],
        [7, 0, "Mas e se isso também foi consequência de suas ações?"],
        [7, 0, "Nunca saberemos... não com essa escolha... hora de você ver o resultado das suas escolhas mais uma última vez.", [], [], 0, _final_106_sam]
    ];

    
    var _fala_motivo_breno = [1, 0, "Ele não gostou tanto assim da fantasia no final das contas."]; 
    if (personagem_tem_caracteristica(2, 24)) _fala_motivo_breno = [1, 0, "Ele era um cara cauteloso, não gostaria de correr riscos com algo tão bobo assim."];
    if (personagem_tem_caracteristica(2, 13)) _fala_motivo_breno = [1, 0, "Ele sabia que esse tipo de coisa não teria graça nenhuma, e ninguém gostaria disso."];

    var _rota_ellie = [
        [7, 0, "Olha só... que escolha curiosa, me diga senhor detetive, como encontrou essa resposta?"],
        [1, 0, "Eu juntei todas as peças, todos os pequenos detalhes, tudo que considerei verdade em cada realidade que eu observava!"],
        [1, 0, "Sam trouxe a fantasia para o lugar, mas ele não tinha certeza se queria utilizar ela."],
        [1, 0, "Breno perguntou para o Sam o que ele gostava de fazer e ele revelou sobre a fantasia."],
        [1, 0, "Na verdade, Breno achou ela perigosa, aceitou guardar mas disse para o Sam não utilizar ela."],
        [7, 0, "E por que você acha isso?"],
        _fala_motivo_breno,
        [1, 0, "Ele aceitou levar para o depósito mas antes acabou mostrando a fantasia para Ellie."],
        [1, 0, "A faca já tinha sido trocada antes mesmo da viagem, mas eles não perceberam... as duas facas eram de verdade no final das contas!"],
        [7, 0, "Continue o desenvolvimento..."],
        [1, 0, "Breno então levou a fantasia para o depósito e deixou ela lá. Mas por algum acaso ele esbarrou na prateleira e derrubou a cola na caixa."],
        [7, 0, "Aquela prateleira que era super resistente?"],
        [1, 0, "Isso mesmo, eu não consegui derrubar ela na minha vez, mas tenho certeza de que foi ele quem derrubou a cola."],
        [1, 0, "Depois disso ele saiu do depósito, voltou para casa e foi ao banheiro."],
        [1, 0, "Em certo momento, Tiffany que estava na sala vendo TV com Theo foi à cozinha."],
        [7, 0, "O que ela foi fazer lá?",
            ["Procurar comida", [
                [1, 0, "Ela estava com fome então foi procurar algo para comer..."]
            ]],
            ["Procurar Ellie", [
                [1, 0, "Ela foi procurar a Ellie, achando que ela estaria por lá..."]
            ]]
        ],
        [1, 0, "Mas ao chegar na cozinha, não achou o que procurava."],
        [7, 0, "De repente a luz da casa caiu..."],
        [1, 0, "Isso, por causa da churrasqueira elétrica do Sam no quarto."],
        [7, 0, "E quem foi lá no depósito procurar luz e por que?"],
        [1, 0, "O Theo foi, ele queria impressionar a Tiffany. Ele gostava dela, mas era muito tímido para dizer."],
        [7, 0, "Então você é realmente bom lendo as entrelinhas não é mesmo?"],
        [1, 0, "Ao chegar lá, ele não encontrou algo que pudesse ajudar com o problema da luz, e então tentou correr de volta pra casa."],
        [7, 0, "E depois?..."],
        [1, 0, "Quando ele saiu de lá... ele deu de cara com a Ellie, vestindo a fantasia no escuro!"],
        [7, 0, "A Ellie?"],
        [1, 0, "Isso mesmo! Ela queria assustar o seu namorado como uma brincadeira, sem saber que a faca era real."],
        [1, 0, "Dessa forma, o Theo que estava correndo acabou esbarrando na Ellie e acabou se esfaqueando sozinho!"],
        [1, 0, "A Ellie, que estava com a fantasia colada por causa do Breno, não conseguia remover a roupa."],
        [1, 0, "Nesse meio tempo... Tiffany tinha saído de casa com uma faca de verdade que ela pegou da cozinha, morrendo de medo."],
        [7, 0, "Que reviravolta emocionante..."],
        [1, 0, "Tiffany viu uma pessoa mascarada com uma faca e viu o Theo sangrando. Ela entrou praticamente em choque."],
        [7, 0, "É aí que ela tropeçou na piscina e morreu?"],
        [1, 0, "Quase isso. Ela deve ter tropeçado e se machucado, mas não morreu lá na primeira vez. Ela correu de volta pra casa com a faca na mão."],
        [1, 0, "E então... outro acidente trágico. Ela tropeçou em alguém dentro de casa no escuro."],
        [7, 0, "E quem era?"],
        [1, 0, "Quem mais poderia ser? O Breno! Sam estava no quarto."],
        [1, 0, "Ela acabou esfaqueando o Breno e enlouquecendo de vez."],
        [7, 0, "E o que houve com o Breno?"],
        [1, 0, "Ele sabia da fantasia, mas não imaginou que Sam usaria ela para matar ele. Sangrando, tentou subir as escadas."],
        [7, 0, "E o que o Sam estava fazendo nessa confusão toda?"],
        [1, 0, "Provavelmente estava... pensando sobre as linguiças que queimaram..."],
        [7, 0, "Que coisa..."],
        [1, 0, "Quando Breno subiu, o Sam ouviu o barulho estranho, saiu do quarto no escuro e apenas viu uma pessoa gritando e correndo em sua direção."],
        [7, 0, "Ele ficou com medo."],
        [1, 0, "Foi andando para trás... até que tropeçou na janela e caiu..."],
        [7, 0, "Então... a única que ficou viva foi a Ellie e a Tiffany?"],
        [1, 0, "Não exatamente... Tiffany que ainda estava lá embaixo, perto da porta..."],
        [7, 0, "O que houve?"],
        [1, 0, "Acabou sendo esmagada pelo Sam que caía do segundo andar."],
        [7, 0, "Mas que piada do destino, não é mesmo?..."],
        [7, 0, "Parabéns pela resposta! Você chegou na melhor solução possível com os fatos que lhe foram entregues."],
        [7, 0, "Você tem 1 ou 2 pequenos furos na sua teoria, mas nada que atrapalhe a verdade real."],
        [7, 0, "E o que houve com a Ellie?"],
        [1, 0, "Não deve ter sobrevivido... ela ficou muito tempo com aquela fantasia colada... Só consigo imaginar o pior para ela."],
        [1, 0, "O que acontece agora?"],
        [7, 0, "Como você escolheu a resposta certa, eu vou lhe dar duas escolhas! Contar para todos o acontecido ou Reverter tudo."],
        [1, 0, "Como assim reverter tudo?"],
        [7, 0, "Voltar no tempo mais uma vez, salvar todos... esse tipo de coisa."],
        [1, 0, "A que custo?"],
        [7, 0, "Bom, você não terá resolvido esse caso, já que... não haverá um caso. Todos ficarão vivos, mas você deixará de ser um detetive tão bom assim."],
        [7, 0, "Se for para reverter tudo... todos os culpados que você encontrou antes... tudo será desfeito."],
        [1, 0, "E a outra escolha?"],
        [7, 0, "Você será o maioral! Vai denunciar a Ellie como assassina, explicar os fatos e será promovido. Continuaremos juntos e você será o maior do mundo!"],
        [1, 0, "Isso... me parece algo incrível! A culpa ainda foi da Ellie, independentemente de eu ter mexido na realidade."],
        [7, 0, "Então, o que me diz meu caro Dominó? Você quer se manter no ciclo, ou quebrar ele?",
            ["Manter o Ciclo", [
                [1, 0, "A verdade está lançada. Eu sou o melhor detetive do mundo.", [], [], 0, _final_100_ciclo]
            ]],
            ["Quebrar o ciclo", [
                [1, 0, "A fama não vale essas vidas. Acabe com isso, Paradoxo. Desfaça tudo.", [], [], 0, _final_107_quebrar]
            ]]
        ]
    ];

    
    
    var _rota_theo_segunda = [
        [1, 0, "Bom, ele viu o assassino pela janela e mesmo assim... foi morto não é mesmo?"],
        [7, 0, "Mas isso foi praticamente culpa sua."],
        [1, 0, "E se não fosse?"],
        [7, 0, "Bom, ele fugiu..."],
        [1, 0, "E então?"],
        [7, 0, "Morreu do mesmo jeito..."],
        [1, 0, "Como?"],
        [7, 0, "Caiu e tropeçou enquanto fazia qualquer outra coisa..."],
        [1, 0, "Que droga! Então eu fiz a única escolha errada mesmo?"],
        [7, 0, "Eu tentei te avisar... agora, atravesse aquela porta atrás de você, e veja a escolha horrível que você fez."],
        [7, 0, "Não nos veremos mais nessa realidade... Não sentirei saudades... Seu idiota..."],
        [1, 0, "Isso me ofende cara! De graça... tudo bem, eu vou voltar agora.", [], [], 0, _final_103_theo]
    ];

    var _rota_theo_primeira = [
        [7, 0, "... Você tá de sacanagem?"],
        [7, 0, "Parece que estamos em um jogo aqui?"],
        [7, 0, "O Theo foi literalmente a primeira vítima do caso, aquele que você teve que salvar antes disso tudo acontecer."],
        [7, 0, "Pra que que serviu ver todos os pontos de vista, se você vai fazer a pior acusação possível primeiro?"],
        [7, 0, "Isso chega a beirar o ridículo até pra mim!"],
        [7, 0, "Isso está começando a me irritar... olha eu vou facilitar para você."],
        [7, 0, "(Melhor detetive do mundo uma ova)"],
        
        
        [7, 0, "Quem foi o verdadeiro assassino? (Menos o Theo)",
            ["Theo", _rota_theo_segunda],
            ["Tiffany", _rota_tiff],
            ["Ellie", _rota_ellie],
            ["Breno", _rota_breno],
            ["Sam", _rota_sam]
        ]
    ];


    
    
    
    dialogos = [
        [
            "Conversar com o Paradoxo", 
            [
                [7, 0, "Ora ora ora... parece que temos um Sherlock Holmes."],
                [1, 0, "Você...", [], [], 0, function() {
                    var _jogador = noone;
                    with (obj_detetive) { if (jogador) _jogador = id; }
                    if (_jogador != noone) { atribuir_comando(_jogador, "mover", 1, 70); }
                }],
                [1, 0, "Chega de brincadeiras, isso finalmente chega ao fim!"],
                [7, 0, "Cada realidade que você testemunhou... Distorceu um pouco dos fatos acontecidos..."],
                [7, 0, "Todas elas tinham algo errado, e algo certo, nenhuma delas estava 100% correta, nenhuma!"],
                [7, 0, "Porque em todas elas, você esteve lá, alterando os fatos, distorcendo a realidade."],
                [7, 0, "Quebrando o ciclo das coisas..."],
                [1, 0, "Eu estava lá para resolver as coisas!"],
                [7, 0, "Você estava lá para quebrar as coisas! E fez isso muito bem..."],
                [7, 0, "Meus parabéns, caro Dominó! Agora você... está pronto para enfrentar as consequências dos seus atos?",
                    ["Estou pronto", [
                        [1, 0, "Eu nasci pronto para isso."]
                    ]],
                    ["Acho que sim...", [
                        [1, 0, "Eu... eu acho que sim."]
                    ]]
                ],
                [7, 0, "Então... você finalmente desvendou o caso?",
                    ["Com certeza!", [
                        [1, 0, "Sem a menor sombra de dúvidas!"]
                    ]],
                    ["Fiz o meu melhor!", [
                        [1, 0, "Reuni todas as peças que pude..."]
                    ]]
                ],
                [7, 0, "Nesse caso... me diga então... diga então... o que aconteceu no incidente original?"],
                [1, 0, "5 Amigos foram tirar férias em um local, um tanto longe de onde eles moravam."],
                [7, 0, "Certo... continue."],
                [1, 0, "Chegando lá, organizaram tudo que precisavam... Selecionaram seus quartos, se alocaram, se divertiram por uns dias..."],
                [7, 0, "Isso mesmo..."],
                [1, 0, "Mas um certo dia, um tiro saiu pela culatra."],
                [7, 0, "Sim... isso mesmo!"],
                [7, 0, "Agora, tudo termina, agora tudo acaba, sua jornada inteira te levou até aqui, escolha com sabedoria."],
                
                _fala_theo,
                _fala_tiff,
                _fala_ellie,
                _fala_breno,
                _fala_sam,

                [7, 0, "Nenhuma escolha é a errada, então me diga... Quem foi o verdadeiro assassino?",
                    ["Theo", _rota_theo_primeira],
                    ["Tiffany", _rota_tiff],
                    ["Ellie", _rota_ellie],
                    ["Breno", _rota_breno],
                    ["Sam", _rota_sam]
                ]
            ]
        ]
    ];
} else {
    instance_destroy();
}