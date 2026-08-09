if (global.historia > 4.3) {
    
    dialogos = [
        [
            "Examinar",
            [
                [2, 0, "Eu não sou muito fã de janelas..."],
                [2, 0, "Sempre me dá um frio na barriga chegar muito perto do vidro."] 
            ]
        ]
    ];
} else {
    
    var _dialogo_personagem = [];
    
    
    var _detetive_atual = noone;
    with (obj_detetive) {
        if (jogador == true) {
            _detetive_atual = id;
        }
    }
    
    
    if (_detetive_atual != noone && _detetive_atual.sprite_index == spr_tiffany) {
        _dialogo_personagem = [
            [
                "Examinar",
                [
                    [5, 0, "Por que alguém colocaria uma janela logo aqui? Ela é tão..."],
                    [5, 0, "Tipo, não combina, sabe?"]
                ]
            ]
        ];
    } 
    
    else {
        _dialogo_personagem = [
            [
                "Examinar",
                [
                    [3, 0, "Uma janela extremamente mal posicionada, como se quisesse significar alguma coisa."]
                ]
            ],
            [
                "Examinar",
                [
                    [3, 0, "Acho melhor eu ficar longe dela... ela parece frágil."]
                ]
            ]
        ];
    }
    
    dialogos = _dialogo_personagem;
}