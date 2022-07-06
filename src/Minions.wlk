class Minions{
	
	var property potencia
	var bananas
	const property armas = []
	var property color = amarillo
	
	method nuevoMinion(){
		bananas = 5
		armas.add(rayocongelante)
	}
	method esPeligroso(){  //determina si es peligroso
		 color.esPeligroso(self)
	}
	
	method agregarArmas(arma){  //agrego armas
		 armas.add(arma)
	}
	method tomarsueromutante(){
		color.tomarsuero(self)
	}
	
	method niveldeconcentracion(){
		color.niveldeconcentracion(self)
	}
/*	method alimentar(){
		bananas =+
    } */               //(ERROR)
    
}

object rayocongelante {
	const potencia = 10
	
	method potencia(){
		return potencia
	}
}

 object amarillo  {    //minion Amariillo
	const property armas = []
	var bananas
	
	method esPeligroso(){
		return armas.size()>2 
	}
	
	method tomarsuero(){  //se transforman en violetas
		   armas.clear()
		   bananas= bananas -1
		
	}
	method niveldeconcentracion(){
	 	//return armas.filter{()} + bananas //(FALTARIA LO DE MAXIMA POTENCIA)
	}
	
}

object violeta{    //minion Violeta
	var concentracion
	var bananas
	const property armas = []
	method esPeligroso(){
		return true 
	}
	method niveldeconcentracion(){
		concentracion= bananas
	}
	
	method tomarsuero(){ 
		bananas = bananas -1
	}
}