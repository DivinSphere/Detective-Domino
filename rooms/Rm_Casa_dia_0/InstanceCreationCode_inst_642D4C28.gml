if global.historia==3.3
	instance_destroy()

if (global.historia >= 3 && global.historia < 4) {
    dialogos = [
        [
            "Banheiro", 
            [
                [3, 0, "Tem alguém aí?"],
                [6, 0, "Ei! Está ocupado!"],
                [3, 0, "Pensei que você estava no churrasco."],
                [6, 0, "Eu desci rapidinho pra fazer uma coisa, logo logo eu volto..."],
                [3, 0, "Tudo bem, eu vou na cozinha ver se tem algo para comer."]
            ]
        ]
    ];
}