if global.historia==1{
	
dialogos = [
    [
        "Observar", 
        [
            
            [1, 0, "...", [], [], 0, function() {
                if (instance_exists(obj_detetive)) {
                    atribuir_comando(obj_detetive, "mover", -1, 20);
                    atribuir_comando(obj_detetive, "esperar", 30);
                    atribuir_comando(obj_detetive, "mover", 1, 40);
					atribuir_comando(obj_detetive, "esperar", 20);
                    
                    
                    
                    
                }
            }],
            
            
            [1, 0, "Que lugar é esse? onde eu estou?"],
            
            
            [1, 0, "Quem é aquele ali na frente?"]
        ]
    ]
]

}
else instance_destroy();
