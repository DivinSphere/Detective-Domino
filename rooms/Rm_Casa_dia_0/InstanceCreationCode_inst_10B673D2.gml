if global.historia==3.3
	instance_destroy()


if global.historia>5
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

else if (global.historia >= 4) {
    
    
    var _falas_banheiro = [];
    
    
    if (personagem_tem_caracteristica(5, 6)) { 
        _falas_banheiro = [
            [2, 0, "Tem alguém aí? Eu preciso usar o banheiro!"],
            [5, 0, "Espera um minutinho, Breno! Estou retocando a minha maquiagem."],
            [2, 0, "Sério? A gente tá no meio do nada, pra quem você tá se arrumando?"],
            [5, 0, "Para mim mesma, óbvio. Vai caçar o que fazer e me deixa em paz."],
            [2, 0, "Tá bom, tá bom... a vaidade não tem limites mesmo."]
        ];
    } 
    
    else { 
        _falas_banheiro = [
            [2, 0, "Tem alguém aí? Eu preciso usar o banheiro!"],
            [5, 0, "Calma, Breno! Eu já estou saindo."],
            [2, 0, "O que você tanto faz aí dentro? A viagem nem demorou tanto assim."],
            [5, 0, "Eu estava só lavando o rosto, a poeira daquela estrada de terra estava me matando."],
            [2, 0, "Tá bom, mas anda logo, por favor!"]
        ];
    }

    
    dialogos = [
        [
            "Banheiro", 
            _falas_banheiro
        ]
    ];
}else{
	
	instance_destroy()
}
