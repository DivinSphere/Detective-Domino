apenas_uma_vez = true;

if (global.historia == 2.2) {

    dialogos = [
        [
            "Pegar a faca", 
            [
                
                [5, 0, "Uma faca de chef... Melhor levar comigo, só por precaução."],
                [5, 0, "Mas eu definitivamente não deveria ficar zanzando com isso na mão."],
                
                
                [5, 0, "Prontinho, agora ela está comigo.", [], [], 0, function() {
                    anotar("Tiffany pegou a faca.");
                    
                    with (obj_porta) {
                        if (porta_id == 9) {
                            destino_id = 8; 
                        } 
                    }
                    
                    with (obj_objetos) {
                        if (image_index == 4) {
                            instance_destroy();
                        }
                    }
                }],
                
                
                [5, 0, "Agora sim, as coisas vão dar certo."],
                
                
                [5, 0, "Ué, o que foi isso?", [], [], 0, function() {
                    global.historia = 2.3;
                    global.luz = false;
					tocar(snd_minigame_interagir)
                }],
                
                
                [5, 0, "Espera... O que houve? A luz acabou?"]
            ]
        ]
    ];

} else {
    instance_destroy();
}