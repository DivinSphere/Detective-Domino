if (global.historia != 2.5) {
    instance_destroy();
}

dialogos = [
    [
        "Levantar", 
        [
		
			[1, 0, "..."],
                [1, 0, "Minhas mãos... ainda estão suando. Aquilo com certeza não foi um pesadelo.", [], [], 0, function() {
                    if (instance_exists(obj_detetive)) {
                        atribuir_comando(obj_detetive, "animacao", obj_detetive.anim_parado, 0);
                    }
                }],
            [1, 0, "A energia tinha acabado... eu estava controlando a Tiffany... e eu segurava aquela faca da cozinha."],
            [1, 0, "Foi um acidente! Eu não enxergava nada no escuro e acabei esbarrando na Ellie..."],
            [1, 0, "Meu Deus, eu esfaqueei ela. Uma inocente morreu por causa de um tropeço meu..."],
            [1, 0, "Isso é perigoso demais. As coisas saem do controle em um segundo."],
            [1, 0, "Isso está completamente errado... mas independente desse desastre, eu ainda tenho que ir questionar o assassino."]
        ]
    ]
];