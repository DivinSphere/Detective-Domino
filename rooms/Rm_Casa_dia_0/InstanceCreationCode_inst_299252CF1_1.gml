if global.historia==2{
	
	porta_texto="Antes de entrar, preciso dar mais uma olhada no Depósito. Quero confirmar se as mudanças que fiz realmente surtiram efeito."

}

if global.historia==1{
	
	porta_texto="Depois eu inspeciono a casa, primeiro eu vou dar uma olhada em volta"

}

if global.historia==2.4{
	
	porta_texto="Melhor eu correr atrás do Theo, ele está demorando muito para voltar"

}


if global.historia==3 or (global.historia>2 and global.historia<3){
	
destino_id=4

}

if global.historia>=4.7{
	
	porta_texto="Preciso guardar a caixa no depósito"

}