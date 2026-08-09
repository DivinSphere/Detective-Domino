if (global.historia == 3.2) { 
    dialogos = [
        [
            "Olhar armários", 
            [
                
                [3, 0, "Aqui embaixo parece que não tem nada também...", [], [], 0, function() {
                    with (obj_detetive) {
                        if (jogador == true) {
                            
                            atribuir_comando(id, "animacao", anim_abaixado, false);
                        }
                    }
                }],
                
                
                [3, 0, "É, acho que o jeito é procurar algo congelado.", [], [], 0, function() {
                    with (obj_detetive) {
                        if (jogador == true) {
                            
                            atribuir_comando(id, "animacao", anim_parado, false);
                        }
                    }
                }]
            ]
        ]
    ];
} else {
    instance_destroy();
}