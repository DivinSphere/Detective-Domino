if (global.historia == 4) {
    dialogos = [
        [
            "Sair", 
            [
                [1, 0, "Hora de interrogar o Sam..."],
                [1, 0, "A fantasia era dele. A arma do crime também. Ele é o verdadeiro culpado de toda essa tragédia."],
                [1, 0, "Eu sou o detetive. Só preciso arrancar a confissão dele... de um jeito ou de outro."]
            ]
        ]
    ];
}else if (global.historia == 2.5) {
    dialogos = [
        [
            "Sair", 
            [
                [1, 0, "Finalmente essa loucura vai acabar..."],
                [1, 0, "Vou direto para a delegacia. Depois do desastre que eu causei ontem, eu preciso de algumas respostas..."]
            ]
        ]
    ];
} else if (global.historia == 1.4) {
    dialogos = [
        [
            "Investigar", 
            [
                [1, 0, "Devo ter ficado muito tempo pensando no caso... acho que vou direto para o trabalho hoje, em vez de ir para a cena do crime novamente."],
                [1, 0, "Meu chefe me ligou, falou que queria que eu interrogasse uma testemunha do caso..."]
            ]
        ]
    ];
} else if global.historia<=1{
    
    dialogos = [
        [
            "Investigar", 
            [
                [1, 0, "Espero não estar esquecendo nada, normalmente eu gosto de observar bem as coisas."],
                [1, 0, "Mas vamos lá, é hora de trabalhar... mais um caso e logo serei o melhor detetive do mundo!"]
            ]
        ]
    ];
}else{
	instance_destroy()
}