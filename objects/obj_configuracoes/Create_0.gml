estado = "abrindo";
escala = 0.0;
alfa = 0.0;
depth = -60;
tocar(snd_abre_menu)
opcoes = [
    "Volume Geral",
    "Música",
    "Efeitos Sonoros",
    "Tela Cheia",
    "Censurar Ketchup",
    "Idioma"
];

descricoes = [
    "Ajusta o volume principal de todo o jogo.",
    "Ajusta apenas a música de fundo.",
    "Ajusta os efeitos sonoros.",
    "Alterna entre modo Tela Cheia e Modo Janela.",
    "",
    "Idioma atual do jogo. Apenas Português disponível."
];

if (room != Rm_menu) {
    array_push(opcoes, "Voltar ao Menu Inicial");
    array_push(descricoes, "Sai do jogo atual. Todo o progresso não salvo será perdido!");
} else {
    array_push(opcoes, "Fechar");
    array_push(descricoes, "Fecha as configurações e volta ao menu principal.");
}

selecionado = 0;

var _len = array_length(opcoes);
x_offset_opcoes = array_create(_len, 0);

escala_valor = 1.0; 
cor_destaque = make_color_rgb(211, 84, 0);

confirmando_saida = false;
opcao_confirmacao = 0;