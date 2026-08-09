if (global.historia == 4.6) {

    dialogos = [
        [
            "Conversar com a Ellie", 
            [
                
                [2, 0, "Olá xuxu, pode me dar um pouco de água?", [], [], 0, function() {
                    
                    var _jogador = noone;
					global.historia=4.7
                    with (obj_detetive) { if (jogador) _jogador = id; }
                    if (_jogador != noone) {
                        atribuir_comando(_jogador, "mover", -1, 70);
                    }
                }],
                
                [3, 0, "Claro, pega ali no filtro... Mas o que é isso que você está carregando, Breno?"],
                [2, 0, "Não conta pra ninguém, hein."],
                [3, 0, "Oh, eu juro pela minha morte!"],
                [2, 0, "Tudo bem, olha que sinistro!"],
                [3, 0, "Caramba! Uma fantasia novinha de assustar de verdade!"],
                [2, 0, "Sim, sim, e ela vem até com uma faca de brinquedo, quem sabe se eu vestir ela mais tarde..."],
				
                
                [3, 0, "Mas essa faca é muito visível que é falsa, não assustaria alguém de verdade...", 
                    ["Substituir faca", [
                        [3, 0, "Aqui, troca essa faca por essa da cozinha, se é para assustar, tem que ser de verdade!", [], [], 0, function() {
                            anotar("A faca de brinquedo foi substituída.");
                        }]
                    ]],
                    ["Ignorar", [
                        [2, 0, "Ah, isso não é problema, talvez ela nem seja usada mesmo."],
                        [3, 0, "Bom, se é o que você está dizendo...", [], [], 0, function() {
                            anotar("A faca continuou de brinquedo.");
                        }]
                    ]]
                ],
                
                
                [3, 0, "E o que você vai fazer com isso?"],
                [2, 0, "Vou colocar lá no depósito da casa, pra que ninguém veja antes da hora. A gente pode acabar pregando uma boa peça com ela depois!"],
                [3, 0, "Hehe, isso pode ser divertido. Tudo bem, eu quero ver no que isso vai dar."]
            ]
        ]
    ];

} else {
    instance_destroy();
}