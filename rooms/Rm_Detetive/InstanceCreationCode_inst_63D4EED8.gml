if (global.historia == 4) {
    dialogos = [
        [
            "Olhar", 
            [
                [1, 0, "Olhando para essas anotações agora... todos os fios, todas as ligações de suspeitos..."],
                [1, 0, "Eles não apontam para o Sam, nem para a Tiffany, nem para o Theo, nem para o Breno e menos ainda para a Ellie. Todos eles convergem para mim."]
            ]
        ],
        [
            "Olhar",
            [
                [1, 0, "Eu sou o começo e o fim desse caso que está... sendo investigado pelo próprio culpado."]
            ]
        ]
    ];
} else if (global.historia == 2.5) {
    dialogos = [
        [
            "Investigar", 
            [
                [1, 0, "Isso aqui, não faz mais sentido... quantos dos fatos eu realmente alterei nesses casos?"],
                [1, 0, "Será que os criminosos que eu prendi... realmente eram culpados?"]
            ]
        ],
        [
            "Examinar",
            [
                [1, 0, "Eu não tenho mais certeza de nada do que está escrito nessas paredes."]
            ]
        ]
    ];
} else if (global.historia == 1.4) {
    dialogos = [
        [
            "Investigar", 
            [
                [1, 0, "Todas as minhas anotações... cheio de evidências e deduções dos meus casos."],
                [1, 0, "Se aquele cara mascarado e as coisas que o Paradoxo falou fossem reais, todo o meu método de investigação não faria o menor sentido."]
            ]
        ],
        [
            "Examinar",
            [
                [1, 0, "É melhor eu esquecer esse sonho bizarro e me focar nos fatos concretos. Aqui no mundo real as coisas não voltam no tempo."]
            ]
        ]
    ];
} else {
    
    dialogos = [
        [
            "Investigar", 
            [
                [1, 0, "Sou muito metódico, adoro anotar na parede sobre os meus casos recentes."]
            ]
        ],
        [
            "Examinar", 
            [
                [1, 0, "Um para cada caso que resolvi esse mês..."]
            ]
        ]
    ];
}