
cursor_sprite=spr_mouse
window_set_cursor(cr_none);

if (!variable_global_exists("vol_geral")) global.vol_geral = 1.0;
if (!variable_global_exists("vol_musica")) global.vol_musica = 1.0;
if (!variable_global_exists("vol_efeito")) global.vol_efeito = 1.0;
if (!variable_global_exists("tela_cheia")) global.tela_cheia = window_get_fullscreen();
if (!variable_global_exists("censurar_sangue")) global.censurar_sangue = false;
if (!variable_global_exists("idioma")) global.idioma = 0; 
if (!variable_global_exists("devaneio_num"))global.devaneio_num = 0;
if (!variable_global_exists("debug"))global.debug=false
if (!variable_global_exists("retorno_devaneio_continuar")) {global.retorno_devaneio_continuar = false;}







global.escolha_cor=0
global.escolha_medo=0

global.pepate=0
global.retornar=false

global.horas = 0;
global.minutos = 0;
global.segundos = 0;
global.frames_tempo = 0;
	
global.devaneio=false
global.debug_portas= false
global.dialogos_vistos = {};
global.porta_id = 0;
global.dia = 1;
global.notas_nao_lidas = false;
global.caracteristicas_nao_lidas = false;
global.anotacoes = [];
global.historia=1
global.deslocar=0
global.lado=0
global.comandos=1

window_set_size(1920, 1080);
surface_resize(application_surface, 1920, 1080);
display_set_gui_size(320, 180);

window_center();





global.mapa_caracteristicas = {
    0: { masc: "Desconhecido", fem: "Desconhecida" },
    1: { masc: "Preciso",      fem: "Precisa" },
    2: { masc: "Mentiroso",    fem: "Mentirosa" },
    3: { masc: "Covarde",      fem: "Covarde" },
    4: { masc: "Sensato",      fem: "Sensata" },
    5: { masc: "Nerd",         fem: "Nerd" },
    6: { masc: "Vaidoso",      fem: "Vaidosa" },
    7: { masc: "Curioso",      fem: "Curiosa" },
    8: { masc: "Confiável",    fem: "Confiável" },
    9: { masc: "Patricinho",   fem: "Patricinha" },
   10: { masc: "Atrapalhado",  fem: "Atrapalhada" },
   11: { masc: "Fofo",         fem: "Fofa" },
   12: { masc: "Descolado",    fem: "Descolada" },
   13: { masc: "Sensível",     fem: "Sensível" },
   14: { masc: "Atento",       fem: "Atenta" },
   15: { masc: "Desligado",    fem: "Desligada" },
   16: { masc: "Corajoso",    fem: "Corajosa" },
   17: { masc: "Medroso",    fem: "Medrosa" },
   18: { masc: "---",    fem: "---" },
   19: { masc: "Cinéfilo",    fem: "Cinéfila" },
   20: { masc: "Sombrio",    fem: "Sombria" },
   21: { masc: "Esperançoso",    fem: "Esperançosa" },
   22: { masc: "Louco",    fem: "Louco" },
   23: { masc: "Destemido",    fem: "Destemida" },
   24: { masc: "cauteloso",    fem: "cautelosa" },
   
};

global.personagens = [
    { 
        id: 0, 
        nome: "NARRADOR",   
        retrato: spr_retratos_narrador, 
        genero: "m",
        caracteristicas: [],
		imagem: 0,
    },
    { 
        id: 1, 
        nome: "DOMINÓ",   
        retrato: spr_retratos_detetive, 
        genero: "m",
        caracteristicas: [] ,
		imagem: 4,
    },
    { 
        id: 2, 
        nome: "BRENO",   
        retrato: spr_retratos_breno, 
        genero: "m",
        caracteristicas: [0] ,
		imagem: 5,
    },
    { 
        id: 3, 
        nome: "ELLIE",  
        retrato: spr_retratos_ellie, 
        genero: "f", 
        caracteristicas: [0] ,
		imagem: 6,
    },
    { 
        id: 4, 
        nome: "THEO",   
        retrato: spr_retratos_theo, 
        genero: "m",
        caracteristicas: [0] ,
		imagem: 7,
    },
    { 
        id: 5, 
        nome: "TIFFANY",   
        retrato: spr_retratos_tiffany, 
        genero: "f", 
        caracteristicas: [0] ,
		imagem: 8,
    },
    { 
        id: 6, 
        nome: "SAM",  
        retrato: spr_retratos_sam, 
        genero: "m",
        caracteristicas: [0] ,
		imagem: 9,
    },
    { 
        id: 7, 
        nome: "PARADOXO",  
        retrato: spr_retratos_paradoxo, 
        genero: "m",
        caracteristicas: [0] ,
		imagem: 10,
    },	
	{ 
        id: 8, 
        nome: "ASSASSINO",  
        retrato: spr_retratos_assassino,
        genero: "m",
        caracteristicas: [0] ,
		imagem: 11,
    }
	
	
	
];

room_goto_next()

