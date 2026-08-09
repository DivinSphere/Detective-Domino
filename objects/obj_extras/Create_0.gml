estado = "abrindo";
escala = 0.0;
alfa = 0.0;
depth = -60;
tocar(snd_abre_menu)

opcoes = [
    "Modo Desenvolvedor",
    "Ver Final",
    "Ver Devaneio",
    "Retorno do Devaneio",
    "Começar em",
    "Sobre",
    "Fechar"
];

descricoes = [
    "Esse modo é útil para o desenvolvedor testar as funções do jogo, e não pra você jogador! Bom ... mas se quiser testar, por sua conta e risco!",
    "Relembre os finais que você já conquistou.\n(Confirme)",
    "Revisite as linhas do tempo distorcidas.\n(Confirme)",
    "Define para onde o jogo deve ir após assistir a um devaneio pelos extras.",
    "Atalhos temporais para pular direto para um ponto específico da história.\n(Confirme)",
    "Saiba mais sobre o desenvolvimento do jogo.\n(Confirme)",
    "Fecha os extras e volta ao menu principal."
];

selecionado = 0;

var _len = array_length(opcoes);
x_offset_opcoes = array_create(_len, 0);

escala_valor = 1.0; 
cor_destaque = make_color_rgb(211, 84, 0);

finais_ids = [100, 107, 106, 104, 105, 103, 109,111];
idx_final = 0;

devaneios_ids = [101, 102, 108, 110];
idx_devaneio = 0;


pontos_historia = [
    { nome: "Na cama",                id: 1,   rm: Rm_Detetive },
    { nome: "Sob Interrogatório",id: 1.4, rm: Rm_Detetive },
    { nome: "Pós Acidente",                 id: 2.5, rm: Rm_Detetive },
    { nome: "Último ato",             id: 4,   rm: Rm_Detetive },
    { nome: "A viagem",               id: 4.2, rm: Rm_estrada }
];
idx_ponto = 0;