

if room=Rm_Alem_dia_0
	y=obj_detetive.y


distancia_ativacao = 32;   
apenas_uma_vez = false;    
depth = 1;

iniciar_ao_tocar = false; 
ja_executou_touch = false;

dialogos = [
    [
        "Investigar",
        [ [1, 0, "Esta é a conversa A. O detetive está investigando o local."] ]
    ],
    [
        "Observar",
        [ [1, 0, "Esta é a conversa B. Segunda vez que você interage comigo."] ]
    ]
];

dialogo_index = 0; 
acao_atual = "";   

raio_base = 16;
alfa_circulo = 0;   
alfa_alvo = 0;
pulsar_timer = 0;  