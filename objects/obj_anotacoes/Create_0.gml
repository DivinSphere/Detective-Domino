estado = "abrindo";
escala = 0.0;
alfa = 0.0;
tocar(snd_abre_menu)

depth = -50;

largura_texto = 120; 
pagina_atual = 0;
paginas_array = [];


for (var i = 0; i < array_length(global.anotacoes); i++) {
    var _bloco = global.anotacoes[i];
    var texto_do_dia = "Dia " + string(_bloco.dia) + "\n";
    

    for (var j = 0; j < array_length(_bloco.textos); j++) {
        texto_do_dia += _bloco.textos[j] + "\n";
    }
    
    array_push(paginas_array, texto_do_dia);
}


if (array_length(paginas_array) == 0) {
    array_push(paginas_array, "Nenhuma anotação registrada.");
}


pagina_atual = array_length(paginas_array) - 1;