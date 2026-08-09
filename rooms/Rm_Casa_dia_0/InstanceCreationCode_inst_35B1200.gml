if (global.historia == 2.1 or global.historia == 2.2) {
    dialogos = [
        
        [
            "Assistir", 
            [
                [5, 0, "O documentário que o Theo gosta de assistir"],
            ]
        ],
        
        [
            "Assistir", 
            [
                [5, 0, "Ele parece bastante concentrado"],
            ]
        ]
    ];
} else if (global.historia == 2.3) {
    dialogos = [
        
        [
            "Assistir", 
            [
                [5, 0, "A luz acabou..."],
            ]
        ],
    ];
} else if (global.historia >= 4.6) {
    dialogos = [
        [
            "Assistir TV", 
            [
                
                [0, 0, "Uma e meia da madrugada já do domingo..."],
                [0, 0, "Quando o policial registra mais uma tentativa de assassinato aqui."],
                [0, 0, "Tá ali, a vítima agonizando de dor no solo."],
                [0, 0, "O SAMU já foi chamado pra socorrer..."],
                
                
                [0, 0, "*POW! POW!*", [], [], 0, function() {
                    if (!instance_exists(obj_tremor)) {
                        instance_create_layer(0, 0, "Instances", obj_tremor);
                    }
                }],
                
                
                [0, 0, "Meu Deus do céu! Meu Deus do céu, Berg!"],
                
                
                [2, 0, "Nossa... que programa bizarro é esse que você tá assistindo, Theo?"],
                [4, 0, "É um jornal policial. Eles acompanham as ocorrências ao vivo."],
                [2, 0, "Ao vivo?! O repórter quase tomou um tiro de graça na TV!"],
                [4, 0, "Pois é... O jornalismo investigativo tem os seus riscos."]
            ]
        ]
    ];
} else {
    instance_destroy();
}


