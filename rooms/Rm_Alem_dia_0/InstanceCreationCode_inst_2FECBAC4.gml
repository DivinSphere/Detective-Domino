if (global.historia == 2.4) {
    dialogos = [
        [
            "Conversar no Limbo", 
            [
                
                
                
                [1, 0, "O QUE FOI QUE EU FIZ?!"],
                [1, 0, "EU... EU... EU... SOU O ASSASSINO?"],
                [7, 0, "Olha só o que aconteceu... que trágico, não é mesmo?"],
                [1, 0, "Paradoxo..."],
                
                [1, 0, "...", [], [], 0, function() {
                    
                    var _jogador = noone;
                    with (obj_detetive) {
                        if (jogador) _jogador = id;
                    }
                    if (_jogador != noone) {
                        atribuir_comando(_jogador, "mover", 1, 70);
                        atribuir_comando(_jogador, "esperar", 30); 
                    }
                }],
                
                [7, 0, "Que desfecho incrível para essa história!"],
                [1, 0, "O que você quer dizer com isso?"],
                [7, 0, "É bem simples... você, tentando descobrir quem era o assassino desse crime... acabou se tornando o próprio, não é mesmo?"],
                [1, 0, "Mas que belo de um paradoxo..."],
                [7, 0, "Touché."],
                [1, 0, "E então... o que eu preciso fazer agora?"],
                [7, 0, "Não é óbvio? O mesmo que você fez nos outros casos: interrogar a vít... quer dizer, o Assassino!"],
                [1, 0, "Tiffany?"],
                [7, 0, "Exatamente! Agora sim você está pegando o jeito da coisa! Como nos velhos tempos."],
                [1, 0, "Eu não entendo..."],
                
                
                
                
                [7, 0, "Mas antes... vamos jogar um jogo."],
                [1, 0, "Cara, eu não estou me sentindo nada bem..."],
                [7, 0, "Eu não ligo."],
                [1, 0, "Que frio... eu sei que eu posso voltar lá e apenas desfazer as coisas, mas..."],
                [7, 0, "Pedra, Papel e Tesoura!"],
                [1, 0, "O que?"],
                [7, 0, "Mas eu serei justo com você... minha escolha já está decidida, independente do que você escolher."],
                [1, 0, "Isso não me parece muito confiável..."],
                [7, 0, "Vamos lá, escolha.",
                    
                    
                    ["Pedra", [
                        [1, 0, "Eu escolho Pedra."],
                        [7, 0, "Sólido, impenetrável e bruto.", [], [], 0, function() { global.pepate = 1; }],
                        [7, 0, "Você se esconde atrás de muros emocionais para não lidar com a dor das suas próprias ações, não é?"],
                        [7, 0, "Uma mente fechada que esmaga os problemas em vez de resolvê-los."],
                        [7, 0, "E para a sua sorte... eu escolhi Tesoura. Você ganhou."],
                        [1, 0, "Isso deveria me fazer sentir melhor?"]
                    ]],
                    
                    
                    ["Papel", [
                        [1, 0, "Eu escolho Papel."],
                        [7, 0, "Flexível, pacífico... e facilmente rasgado.", [], [], 0, function() { global.pepate = 2; }],
                        [7, 0, "Você tenta envolver os problemas, tenta manter a neutralidade e a paz fingindo que tem as coisas sob controle."],
                        [7, 0, "Mas no fundo você sabe que qualquer pressão a mais vai te despedaçar."],
                        [7, 0, "E falando em despedaçar... eu escolhi Tesoura. Você perdeu."],
                        [1, 0, "Droga... por que eu ainda jogo isso com você?"]
                    ]],
                    
                    
                    ["Tesoura", [
                        [1, 0, "Eu escolho Tesoura."],
                        [7, 0, "Afiado, cirúrgico... e perigoso.", [], [], 0, function() { global.pepate = 3; }],
                        [7, 0, "Você gosta de cortar o mal pela raiz, age com agressividade quando se sente encurralado."],
                        [7, 0, "Exatamente como a Tiffany com a faca no escuro... fascinante."],
                        [7, 0, "Eu também escolhi Tesoura. Nós empatamos."],
                        [1, 0, "Claro que você escolheria o mesmo que eu..."]
                    ]]
                ],
                
                
                
                
                [7, 0, "Enfim... o nosso tempo aqui terminou mais uma vez."],
                [7, 0, "Vá para casa e depois interrogue o assassino para terminar finalmente esse caso!", [], [], 0, function() {
                    
                    
                    var _jogador = noone;
                    with (obj_detetive) {
                        if (jogador) _jogador = id;
                    }
                    if (_jogador != noone) {
                        atribuir_comando(_jogador, "mover", -1, 70);
                        atribuir_comando(_jogador, "esperar", 20); 
                    }
                    
                    
                    var _porta = instance_create_layer(60, 92, "Instances", obj_porta);
                    
                    _porta.destino_room = Rm_Detetive; 
                    _porta.destino_id = 1; 
                    _porta.acao_texto = "";
                    _porta.deslocar = -175; 
                    _porta.lado = 1;
                    _porta.image_alpha = 0; 
                    
                    
                    global.historia = 2.5;
					global.dia++
                }],
                
                [1, 0, "Não acho que isso esteja certo..."],
                [7, 0, "Você quer ou não quer ser promovido?"]
            ]
        ]
    ];
} else {
    instance_destroy();
}