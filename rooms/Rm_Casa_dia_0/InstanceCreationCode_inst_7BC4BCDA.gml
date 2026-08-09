if (global.historia >= 4.6) {

    dialogos = [
        [
            "Examinar", 
            [
                [2, 0, "Que quadro interessante..."],
                [2, 0, "Essa estrada, a cerquinha e essas montanhas ao fundo me parecem familiares."],
                [2, 0, "É exatamente a mesma paisagem que a gente viu vindo pra cá de carro."],
                [2, 0, "O que me lembra daquela placa no caminho..."],
                [2, 0, "Ninguém me impede de farmar aura!", [], [], 0, function() {
                    
                    with (obj_detetive) {
                        if (jogador == true) {
                            mudar_animacao(anim_taunt);
                        }
                    }
                }]
            ]
        ]
    ];

} else {
    instance_destroy();
}