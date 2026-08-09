

// contador de tempo

if room!=Rm_finais and room!=Rm_menu{
	
global.frames_tempo++;

if (global.frames_tempo >= 60) {
    global.frames_tempo = 0;
    global.segundos++;
    
    if (global.segundos >= 60) {
        global.segundos = 0;
        global.minutos++;
        
        if (global.minutos >= 60) {
            global.minutos = 0;
            global.horas++;
        }
    }
}

}