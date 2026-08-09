if (global.historia == 3.0) { 
    
    
    
    
    var _transicao_encerrar = function() {
        global.historia = 101; 
        var _porta = instance_create_layer(60, 92, "Instances", obj_porta);
        _porta.destino_room = Rm_finais; 
        _porta.destino_id = 1; 
        _porta.acao_texto = "";
        _porta.lado = 1;
    };
    
    var _transicao_continuar = function() {
        global.historia = 3.1;
        var _porta = instance_create_layer(60, 92, "Instances", obj_porta);
        _porta.destino_room = Rm_Casa_dia_0; 
        _porta.destino_id = -5; 
        _porta.acao_texto = "";
        _porta.deslocar = -70;
        _porta.lado = 1;
    };

    
    
    
    dialogos = [
        [
            "Conversar no Limbo", 
            [
                [7, 0, "Então meu caro, eu acho que é isso... mais um caso resolvido, não é mesmo?"],
                
                [7, 0, "Não é isso que você queria?", [], [], 0, function() {
                    var _jogador = noone;
                    with (obj_detetive) { if (jogador) _jogador = id; }
                    if (_jogador != noone) {
                        atribuir_comando(_jogador, "mover", 1, 70);
                        atribuir_comando(_jogador, "esperar", 20); 
                    }
                }],
                
                [1, 0, "Do que está falando?"],
                [7, 0, "Exatamente como nos outros casos... você se envolveu com eles, e como o melhor detetive de todos... estragou tudo."],
                [1, 0, "Eu não estou te entendendo."],
                [7, 0, "Não se preocupe com isso, isso não é tão relevante agora. Na verdade, já estamos para terminar todo o nosso trabalho!"],
                [1, 0, "Mas eu ainda não sei quem foi o verdadeiro assassino!"],
                [7, 0, "E isso importa? Na verdade, em algum momento isso importou? Os seus outros casos..."],
                [1, 0, "O que tem eles?"],
                [7, 0, "Na verdade... tudo isso depende de você."],
                [7, 0, "Acho que já acabou a brincadeira, não é mesmo?",
                    
                    
                    ["Encerrar por agora", [
                        [7, 0, "Você tem certeza do que quer?", 
                            
                            
                            ["Sim, eu quero encerrar.", [
                                [7, 0, "Maravilha então! Meu caro detetive, você acaba de ser promovido!"],
                                [7, 0, "Sabe, é fascinante observar como a história sempre se repete com você."],
                                [1, 0, "O que você quer dizer com isso?"],
                                [7, 0, "Em todos os seus outros casos, a dinâmica foi exatamente a mesma. Você se intromete, fuça onde não é chamado e altera os fatos irremediavelmente."],
                                [7, 0, "Você muda a vida das pessoas ao seu redor e, quase sempre, acaba sendo o responsável direto pelo assassinato que estava tentando impedir."],
                                [1, 0, "Isso é loucura! Eu sou um detetive, eu busco a verdade para salvar essas pessoas!"],
                                [7, 0, "A verdade? Hahaha! Você cria a sua própria verdade, Dominó. E então, quando o corpo cai e você é o único que sobrou na cena do crime..."],
                                [7, 0, "...você junta as peças do quebra-cabeça que você mesmo quebrou, e consegue 'desvendar' todo o crime perfeitamente."],
                                [1, 0, "Eu não sou um monstro... as coisas saíram do controle!"],
                                [7, 0, "Você é o melhor detetive que existe, justamente porque ninguém conhece a mente do assassino melhor do que aquele que cometeu o crime."],
                                
                                [7, 0, "Aproveite o seu final feliz ilusório. O caso está encerrado.", [], [], 0, _transicao_encerrar] 
                            ]],
                            
                            
                            ["Não, eu mudei de ideia.", [
                                [1, 0, "Mas é claro que eu não posso deixar as coisas assim!"],
                                [7, 0, "Eu estava apenas brincando meu caro! Afinal de contas... ninguém acreditaria em um assassinato simples assim não é mesmo?"],
                                [7, 0, "Uma facada por acidente no escuro? Isso é tão clichê... olha, você fez a escolha correta, precisamos de uma história melhor!"],
                                [7, 0, "Precisamos de todos os fatos!"],
                                [1, 0, "Eu acho que você precisa se tratar... tem alguma coisa de errado com você."],
                                [7, 0, "Hahaha, que engraçado! Sendo julgado por quem me procurou..."],
                                [7, 0, "Ora, nosso tempo novamente se encerrou por aqui, esse caso está sendo extenso, vamos, vá logo descobrir mais do nosso maior caso!", [], [], 0],
                                [7, 0, "Vamos ver qual vai ser o resultado dessa vez...", [], [], 0, function() {
                                    var _jogador = noone;
                                    with (obj_detetive) { if (jogador) _jogador = id; }
                                    if (_jogador != noone) { atribuir_comando(_jogador, "mover", -1, 70); atribuir_comando(_jogador, "esperar", 20); }
                                }],
                                [1, 0, "Eu sinto que não posso confiar nesse cara..."],
                                
                                [7, 0, "Você não pode!", [], [], 0, _transicao_continuar]
                            ]]
                        ]
                    ]],
                    
                    
                    ["Continuar o caso", [
                        [7, 0, "Você tem certeza do que quer?", 
                            
                            
                            ["Sim, vou continuar.", [
                                [1, 0, "Mas é claro que eu não posso deixar as coisas assim!"],
                                [7, 0, "Eu estava apenas brincando meu caro! Afinal de contas... ninguém acreditaria em um assassinato simples assim não é mesmo?"],
                                [7, 0, "Uma facada por acidente no escuro? Isso é tão clichê... olha, você fez a escolha correta, precisamos de uma história melhor!"],
                                [7, 0, "Precisamos de todos os fatos!"],
                                [1, 0, "Eu acho que você precisa se tratar... tem alguma coisa de errado com você."],
                                [7, 0, "Hahaha, que engraçado! Sendo julgado por quem me procurou..."],
                                [7, 0, "Ora, nosso tempo novamente se encerrou por aqui, esse caso está sendo extenso, vamos, vá logo descobrir mais do nosso maior caso!", [], [], 0, function() {
                                    var _jogador = noone;
                                    with (obj_detetive) { if (jogador) _jogador = id; }
                                    if (_jogador != noone) { atribuir_comando(_jogador, "mover", -1, 70); atribuir_comando(_jogador, "esperar", 20); }
                                }],
                                [1, 0, "Eu sinto que não posso confiar nesse cara..."],
                                
                                [7, 0, "Você não pode!", [], [], 0, _transicao_continuar]
                            ]],
                            
                            
                            ["Não, eu quero parar.", [
                                [7, 0, "Maravilha então! Meu caro detetive, você acaba de ser promovido!"],
                                [7, 0, "Sabe, é fascinante observar como a história sempre se repete com você."],
                                [1, 0, "O que você quer dizer com isso?"],
                                [7, 0, "Em todos os seus outros casos, a dinâmica foi exatamente a mesma. Você se intromete, fuça onde não é chamado e altera os fatos irremediavelmente."],
                                [7, 0, "Você muda a vida das pessoas ao seu redor e, quase sempre, acaba sendo o responsável direto pelo assassinato que estava tentando impedir."],
                                [1, 0, "Isso é loucura! Eu sou um detetive, eu busco a verdade para salvar essas pessoas!"],
                                [7, 0, "A verdade? Hahaha! Você cria a sua própria verdade, Dominó. E então, quando o corpo cai e você é o único que sobrou na cena do crime..."],
                                [7, 0, "...você junta as peças do quebra-cabeça que você mesmo quebrou, e consegue 'desvendar' todo o crime perfeitamente."],
                                [1, 0, "Eu não sou um monstro... as coisas saíram do controle!"],
                                [7, 0, "Você é o melhor detetive que existe, justamente porque ninguém conhece a mente do assassino melhor do que aquele que cometeu o crime."],
                                
                                [7, 0, "Aproveite o seu final feliz ilusório. O caso está encerrado.", [], [], 0, _transicao_encerrar]
                            ]]
                        ]
                    ]]
                ]
            ]
        ]
    ];
} else {
    instance_destroy();
}