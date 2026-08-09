
if (!variable_global_exists("contador_sono")) {
    global.contador_sono = 0;
}

apenas_uma_vez = true;

if (global.historia == 1) {
    
    gerar_dialogo_cama = function() {
        
        if (global.contador_sono >= 2) {
            return [
                [
                    0, 0, "Para as coisas começarem a mudar, escolhas precisam ser feitas...",
                    
                    ["Permanecer deitado", [
                        [0, 0, "Você dormiu... dormiu... e dormiu..."],
                        [0, 0, "Mas nada aconteceu...."],
						[0, 0, "Você simplesmente não acordou."],
                        [0, 0, "", [], [], 0, function() {
                            
						global.contador_sono = 0;
						global.historia = 109;
						room = Rm_finais; 

                        }]
                    ]],
                    
                    ["Levantar da cama", [
                        [1, 0, "Minha cabeça pesa. Talvez pela noite mal dormida, ou talvez por puro instinto de que hoje não será um dia comum."],
                        [1, 0, "Ficar encarando o teto não vai resolver os problemas que estão me esperando lá fora."],
                        [1, 0, "É hora de encarar a realidade.", [], [], 0, function() {
                            global.contador_sono = 0;
                            if (instance_exists(obj_detetive)) {
                                atribuir_comando(obj_detetive, "animacao", obj_detetive.anim_parado, 0);
                            }
                        }]
                    ]]
                ]
            ];
        }
        

        var _txt_preguica = "Você decide ficar na cama por mais um tempo...";
        
        if (global.contador_sono == 1) {
            _txt_preguica = "A cama está tão quentinha... Só mais cinco minutinhos não vai fazer mal.";
        }
        
        return [
            [
                0, 0, "Para as coisas começarem a mudar, escolhas precisam ser feitas...",
                
                ["Permanecer deitado", [
                    [0, 0, _txt_preguica, [], [], 0, function() {
                        
                        global.contador_sono++;
                        
                        var _novo_dialogo = instance_create_depth(x, y, depth, obj_dialogo);
                        _novo_dialogo.delay = 120; 
                        _novo_dialogo.textos = gerar_dialogo_cama();
                        _novo_dialogo.iniciar_dialogo();
                        
                    }]
                ]],
                
                ["Levantar da cama", [
                    [1, 0, "Minha cabeça pesa. Talvez pela noite mal dormida, ou talvez por puro instinto de que hoje não será um dia comum."],
                    [1, 0, "Ficar encarando o teto não vai resolver os problemas que estão me esperando lá fora."],
                    [1, 0, "É hora de encarar a realidade.", [], [], 0, function() {
                        global.contador_sono = 0; 
                        if (instance_exists(obj_detetive)) {
                            atribuir_comando(obj_detetive, "animacao", obj_detetive.anim_parado, 0);
                        }
                    }]
                ]]
            ]
        ];
    };
	
    dialogos = gerar_dialogo_cama();
    
} else {
    instance_destroy();
}