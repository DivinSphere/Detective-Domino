if (global.historia >= 3) {
    dialogos = [
        [
            "Examinar", 
            [
                [3, 0, "Um retrato em formato de coração..."],
                [3, 0, "Eu guardo ele com tanto carinho aqui no meu quarto."],
                [3, 0, "Olhar para isso me faz lembrar do Breno... e de o quanto eu sou apaixonada por ele.", [], [], 0, function() {
                    
                    if (!personagem_tem_caracteristica(3, 11)) {
                        personagem_adicionar_caracteristica(3, 11);
                    }
                }]
            ]
        ]
    ];
} else {
    instance_destroy();
}