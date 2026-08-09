global.sam_direcao_sucesso = 0; 
    



    

var _falas_sam = [];
if (personagem_tem_caracteristica(6, 19)) { 
    _falas_sam = [
        [6, 0, "Sabe o que daria um bom jogo? Um survival horror baseado naquele filme novo de zumbis..."],
        [5, 0, "Lá vem você com esses filmes assustadores de novo."],
        [2, 0, "Eu não jogaria, prefiro jogos de puzzle calminhos."]
    ];
} else if (personagem_tem_caracteristica(6, 20)) { 
    _falas_sam = [
        [6, 0, "Uma Game Jam sobre maldições antigas seria bem mais interessante."],
        [3, 0, "Credo, Sam, que horror."],
        [6, 0, "A escuridão esconde coisas fascinantes se você souber olhar..."]
    ];
}


var _falas_theo = [];
if (personagem_tem_caracteristica(4, 5)) { 
    _falas_theo = [
        [4, 0, "Aliás, Breno, a mecânica principal do meu jogo vai usar algoritmos de geração procedural para criar labirintos de brócolis infinitos!"],
        [5, 0, "Nossa... que empolgante..."],
        [4, 0, "É super complexo! Eu passei três madrugadas otimizando o código!"]
    ];
}


var _falas_ellie = [];
if (personagem_tem_caracteristica(3, 14)) { 
    _falas_ellie = [
        [3, 0, "Sam, tem uma curva acentuada logo ali, vai devagar!"],
        [6, 0, "Relaxa, eu já vi..."]
    ];
} else if (personagem_tem_caracteristica(3, 15)) { 
    _falas_ellie = [
        [3, 0, "Nossa... as nuvens parecem algodão doce..."],
        [2, 0, "Como você consegue viajar na maionese com o carro sacudindo desse jeito?"]
    ];
}




    
var _bloco_inicial = [
    [6, 0, "Que bom que todo mundo pode participar da viagem."],
    [2, 0, "Menos a Luiza, que está no Canadá."],
    [5, 0, "Vou mandar muitas fotos para ela, hehe."],
    [2, 0, "Então... a gente já chegou?"],
    [6, 0, "Não, ainda não."],
    [2, 0, "..."],
    [2, 0, "A gente já chegou?"],
    [3, 0, "Não Breno, ainda não."],
    [2, 0, "E agora, a gente já chegou?"],
    [5, 0, "NÃO!"],
    [6, 0, "Cara... deve ter algum motivo para o nome do lugar ser 'Lá lá longe'."],
    [3, 0, "Tenta se distrair com alguma coisa... Vocês querem conversar sobre algo?"],
    [2, 0, "Esses dias eu estava vendo uma documentário sobre as fases da vida de uma borboleta."],
    [4, 0, "Ovo, lagarta, Pupa..."],
    [2, 0, "Isso isso, é assim que é feito a borboleta."],
    [0, 0, "Baduntss..."],
    [2, 0, "Quem disse isso? (o_o)"],
    [4, 0, "Quem disse o que?"],
    [2, 0, "Nada não..."],
    [4, 0, "Eu vou participar de uma Game Jam."],
    [2, 0, "AH que legal, qual vai ser o tema?"],
    [4, 0, "Brócolis!"],
    [6, 0, "..."],
    [2, 0, "Mas que tema incrível!"],
    [4, 0, "Não é?"],
    [2, 0, "Podiam fazer uma Game Jam específica para Brócolis, a BrócoJam!"],
    [2, 0, "Mudando de assunto... vocês lembraram de trazer ketchup, né?"],
    [6, 0, "Ketchup? Por que diabos a gente traria ketchup?"],
    [5, 0, "A gente nem trouxe nada que precise de ketchup, Breno!"],
    [2, 0, "Tudo bem, tudo bem, não se desesperem... eu trouxe bastante para todo mundo."]
];



var _bloco_minigames = [
    [6, 0, "Opa, buraco na pista! Segurem firme!"],
    [6, 0, "(Sam tenta desviar)", "esmagar", [8, 160], 
        [ [6, 0, "Moleza!", [], [], 0, function() { 
            global.sam_direcao_sucesso++; 
        }] ],
        [ [2, 0, "Ai minha cabeça!", [], [], 0, function() { 
            instance_create_layer(0, 0, "Instances", obj_tremor); 
        }] ]
    ],
    [6, 0, "Eita, outro! Essa estrada tá horrível!"],
	[6, 0, "(Sam gira o volante)", "sequence", [["D", "A", "D", "A", "W", "S"], 150], 
        [ [6, 0, "Tudo sob controle!", [], [], 0, function() { 
            global.sam_direcao_sucesso++; 
        }] ],
        [ [5, 0, "Você vai estragar a suspensão do carro!", [], [], 0, function() { 
            instance_create_layer(0, 0, "Instances", obj_tremor); 
        }] ]
    ],
    [6, 0, "Cuidado, mais um!"],
    
    
    [6, 0, "(Última manobra)", "precisao", [0.04, 120], 
        [ [6, 0, "Eu sou um piloto profissional!", [], [], 0, function() { 
            global.sam_direcao_sucesso++; 
            
            
            if (global.sam_direcao_sucesso == 3) {
                anotar("O Sam é muito bom dirigindo.");
            } else if (global.sam_direcao_sucesso == 2) {
                anotar("O Sam ainda tá aprendendo a dirigir.");
            } else if (global.sam_direcao_sucesso == 1) {
                anotar("O Sam é ruim dirigindo.");
            } else {
                anotar("O Sam é péssimo dirigindo.");
            }
        }] ],
        [ 
            [3, 0, "Sam, olha pra frente, pelo amor de Deus!", [], [], 0, function() {
                instance_create_layer(0, 0, "Instances", obj_tremor);
                
                
                if (global.sam_direcao_sucesso == 0) {
                    
                    global.historia = 108; 
                    room_goto(Rm_finais);
                } else {
                    
                    if (global.sam_direcao_sucesso == 2) {
                        anotar("O Sam ainda tá aprendendo a dirigir.");
                    } else if (global.sam_direcao_sucesso == 1) {
                        anotar("O Sam é ruim dirigindo.");
                    }
                }
            }] 
        ]
    ]
];

var _bloco_final = [
    [3, 0, "Esperem... que placa estranha é essa?", [], [], 0, function() {
        if (instance_exists(obj_faixa)) obj_faixa.hspeed = -1.8;
    }],
    [2, 0, "Ninguém vai me impedir de farmar aura!"],
    [5, 0, "Nossa, eu não estou aguentando mais."],
    [2, 0, "A gente já chegou?"],
    [6, 0, "Já!"],
    [2, 0, "Sério?"],
    [6, 0, "Não..."],
    [2, 0, "Ai cê me quebra."],
    [3, 0, "Breno, vai mais um pouco pro lado, você está me apertando muito aqui."],
    [6, 0, "Cada um no seu quadrado."],
    [2, 0, "Desculpa mas esse carro não foi feito para 5 pessoas, ele claramente foi desenhado de uma forma muito pequena."],
    [2, 0, "Como que couberam 5 pessoas aqui?"],
    [6, 0, "Aguentem mais um pouco, já dá pra ver a casa daqui!"],
    [2, 0, "Finalmente! Não aguentava mais esse forno!"],
    [2, 0, "Férias merecidas, ai vou eu!"],
    [0, 0, "", [], [], 0, function() {
        
        global.historia = 4.3; 
        room_goto(Rm_Casa_dia_0); 
    }]
];




var _dialogo_completo = [];
    

var _juntar_falas = function(_destino, _fonte) {
    var _tamanho = array_length(_fonte);
    for (var i = 0; i < _tamanho; i++) {
        array_push(_destino, _fonte[i]);
    }
};


_juntar_falas(_dialogo_completo, _bloco_inicial);
_juntar_falas(_dialogo_completo, _falas_sam);      
_juntar_falas(_dialogo_completo, _falas_theo);     
_juntar_falas(_dialogo_completo, _bloco_minigames);
_juntar_falas(_dialogo_completo, _falas_ellie);    
_juntar_falas(_dialogo_completo, _bloco_final);




dialogos = [
    ["Viagem de Carro", _dialogo_completo]
];