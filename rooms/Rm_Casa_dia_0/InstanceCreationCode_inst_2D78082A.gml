if (global.historia == 3.2 or global.historia == 3.3) {
    dialogos = [
        
        [
            "Observar", 
            [
                [3, 0, "(Fui eu quem causei isso...)"],
                [3, 0, "(Eu não queria... foi um acidente na confusão daquele breu, mas isso não muda o que aconteceu.)"],
            ]
        ],
        
        [
            "Observar", 
            [
                [3, 0, "(Eu não vou deixar a luz apagar daquele jeito de novo. Preciso consertar isso.)"]
            ]
        ]
    ];
} else {
    instance_destroy();
}