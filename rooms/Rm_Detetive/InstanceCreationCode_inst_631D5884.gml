if (global.historia == 4) {
    dialogos = [
        [
            "Levantar", 
            [
                [1, 0, "..."],
                [1, 0, "Argh... minha cabeça parece que vai explodir. Que desastre macabro foi esse?", [], [], 0, function() {
                    if (instance_exists(obj_detetive)) {
                        
                        atribuir_comando(obj_detetive, "animacao", obj_detetive.anim_parado, 0);
                    }
                }],
                [1, 0, "O Breno caiu da janela... e atingiu a Tiffany lá embaixo. Duas mortes terríveis de uma só vez."],
                [1, 0, "E aquele sádico do Paradoxo ainda tem a coragem de dizer que a culpa é minha!"],
                [1, 0, "Eu não empurrei ninguém! Foi o Sam quem vestiu aquela maldita fantasia e assustou o garoto!"]
            ]
        ]
    ];
} else {
    instance_destroy();
}