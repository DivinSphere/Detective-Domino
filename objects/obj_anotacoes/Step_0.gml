teclas();


if (estado == "abrindo") {
    escala = lerp(escala, 1, 0.2);
    alfa = lerp(alfa, 1, 0.2);
    if (escala >= 0.99) { escala = 1; alfa = 1; estado = "aberto"; }
} 
else if (estado == "fechando") {
    escala = lerp(escala, 0, 0.3);
    alfa = lerp(alfa, 0, 0.3);
    if (escala <= 0.01) instance_destroy();
}


if (estado == "aberto") {
    if (IN_BAIXO_PRESS || IN_DIR_PRESS) {
        if (pagina_atual < array_length(paginas_array) - 1) {
            pagina_atual++;
        }
    }
    
    if (IN_CIMA_PRESS || IN_ESQ_PRESS) {
        if (pagina_atual > 0) {
            pagina_atual--;
        }
    }
    
if (IN_VOLTAR_PRESS) {
    estado = "fechando";
    tocar(snd_fecha_menu);
}

}