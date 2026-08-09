
if (global.historia == 1.3) {

dialogos = [
    [
        "Observar", 
        [
            [4, 0, "Melhor eu desviar dessa cola derrubada..."],
        ]
    ]
];




}
else if (global.historia == 1.2) {

dialogos = [
    [
        "Observar", 
        [
            [4, 0, "Olha só para isso... a cola que estava na prateleira caiu."],
            [4, 0, "Fez uma bagunça tremenda no chão. Quem será que derrubou isso aqui?"],
            [4, 0, "É melhor eu não pisar nisso, ou vou acabar ficando com o sapato grudado."]
        ]
    ]
];




} else {
    instance_destroy();
}