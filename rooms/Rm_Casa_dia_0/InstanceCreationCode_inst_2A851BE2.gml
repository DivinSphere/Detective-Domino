if (global.historia > 2.2) {
    instance_destroy();
}

dialogos = [
    [
        "Encontro na Cozinha", 
        [
            
            [5, 0, "cadê a Ellie? O Theo disse que vocês estavam aqui na cozinha.", [], [], 0, function() {
                var _jogador = noone;
                var _sam = noone;
                
                
                with (obj_detetive) {
                    if (jogador == true) _jogador = id;
                    if (sprite_index == spr_sam) _sam = id;
                }
                
                
                if (_jogador != noone) {
                    atribuir_comando(_jogador, "mover", -1, 30); 
                }
                if (_sam != noone) {
                    atribuir_comando(_sam, "mover", 1, 30); 
                }
            }],
            
            [6, 0, "Ah... depois que eu comecei a falar um pouco das coisas que eu gostava, ela saiu correndo."],
            
            [6, 0, "Ela disse que ia verificar alguma coisa, então eu fiquei esperando aqui.", [], [], 0, function() {
                anotar("Ellie deve ter ouvido algo interessante do Sam.");
            }],
            
            
            [6, 0, "Mas me diga, Tiffany... Como está indo com a sua paquera?"],
            [5, 0, "O que? Paquera? Eu não sei do que está falando..."],
            
            [6, 0, "Não precisa mentir, eu conheço você há muito tempo já.", [], [], 0, function() {
                anotar("Sam e Tiffany são conhecidos de longa data.");
            }],
            
            
            [5, 0, "Tudo bem...", 
            
                ["Eu gosto dele", [
                    [5, 0, "Ele é um fofo... mas não leva muito jeito com garotas, ele parece muito recluso e só fala de coisas de nerd."],
                    [6, 0, "Ha ha, você definiu o Theo muito bem, quem sabe vocês encontrem algo em comum?", [], [], 0, function() {
                        personagem_adicionar_caracteristica(6, 8); 
                    }]
                ]],
                
                ["Ele é estranho", [
                    [5, 0, "Achei que podíamos nos entender, mas ele é estranho demais para mim, vou apenas esquecer ele..."],
                    [6, 0, "Que pena, ele é um cara bacana, mas talvez não faça mesmo o seu estilo.", [], [], 0, function() {
                        personagem_adicionar_caracteristica(5, 9); 
                    }]
                ]]
                
            ], 
            
            
            [5, 0, "Nossa, eu realmente sou péssima com namorados..."],
            [6, 0, "Você também não sabe procurar, né?"],
            [5, 0, "O que você quer dizer com isso?"],
            
            [6, 0, "Pedro... Tiago... João..."],
            [5, 0, "Já entendi..."],
            [6, 0, "Leonardo... Michelangelo... Rafael..."],
            [5, 0, "...."],
            
            [5, 0, "Você não tem nada melhor para fazer não?"],
            
            
            [6, 0, "Tudo bem, eu já vou indo....", [], [], 0, function() {
                var _sam = noone;
                
                with (obj_detetive) {
                    if (sprite_index == spr_sam) _sam = id;
                }
                
                if (_sam != noone) {
                    
                    atribuir_comando(_sam, "mover", 1, 100); 
                    _sam.sumir = 3; 
                }
            }],
            
            [5, 0, "Droga, esse cara..."],
            [6, 0, "Aquele encanador... O que gostava de ouriços... O redondo que se entupia de pastilhas..."],
            [5, 0, "Sam!"],
            [5, 0, "Acho que vou morrer solteira..."]
        ]
    ]
];