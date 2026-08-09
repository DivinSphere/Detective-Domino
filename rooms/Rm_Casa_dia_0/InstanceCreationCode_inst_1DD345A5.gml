if (global.historia == 3.2) { 
    dialogos = [
        [
            "Investigar Fumaça", 
            [
                
                [3, 0, "Está saindo uma fumaça preta do quarto dos meninos..."],
                
                
                [3, 0, "Devem estar fazendo um churrasco legal lá dentro... com a churrasqueira de controle remoto do Sam.", [], [], 0, function() {
                    
                    
                    anotar("Sam gosta de linguiça");
                    
                }]
            ]
        ]
    ];
} else {
    instance_destroy();
}