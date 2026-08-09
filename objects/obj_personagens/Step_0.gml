teclas();


if (estado == "abrindo") {
    escala = lerp(escala, 1, 0.2);
    alfa = lerp(alfa, 1, 0.2);
    if (escala >= 0.99) { escala = 1; alfa = 1; estado = "aberto"; }
} 
else if (estado == "fechando") {
    escala = lerp(escala, 0, 0.3);
    alfa = lerp(alfa, 0, 0.3);
    if (escala <= 0.01) {
        
        if (instance_exists(obj_congela)) {
            instance_destroy(obj_congela);
        }
        instance_destroy();
    }
}


if (estado == "aberto") {
    if (IN_VOLTAR_PRESS) {
        estado = "fechando";
		tocar(snd_fecha_menu)
    }
}