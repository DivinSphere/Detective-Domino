if (global.historia >= 2 and global.historia < 3) {
    dialogos = [
        
        [
            "Observar", 
            [
                [5, 0, "Essa madeira parece que está bem apodrecida já..."],
                [5, 0, "Acho que qualquer pessoa conseguiria empurrar e quebrar isso aqui com facilidade."],
                [5, 0, "Até o fracote do Theo..."]
            ]
        ]
    ];
} else {
    instance_destroy();
}