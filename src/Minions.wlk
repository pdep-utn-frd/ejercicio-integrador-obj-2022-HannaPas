class Minions{
	
	var property potencia
	var property bananas
	const property armas = []
	var property color = amarillo
	
	
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
	method alimentar(cantidad){
		bananas += cantidad
    }                
    
}

class Arma {
	var property nombre 
	var property potencia
}
 object amarillo  {    //minion Amariillo
	
	
	method esPeligroso(minion){
		return minion.armas().size() >2 
	}
	
	method tomarsuero(minion){  //se transforman en violetas
		   minion.armas().clear()
		   minion.color(violeta)
		   if (minion.bananas() > 0){
		   		minion.bananas(minion.bananas()-1)
		   }
		   else{
		   		throw new Exception(message= "Tiene 0 bananas") //Excepcion para que las bananas no sean negativas
		   }
		
	}
	method niveldeconcentracion(minion){
	 	return (minion.armas().max({arma => arma.potencia()}).potencia()+ minion.banana())  
	}
	
}

object violeta{    //minion Violeta

	method esPeligroso(){
		return true 
	}
	method niveldeconcentracion(minion){
		return minion.banana()
	}
	
	method tomarsuero(minion){ 
		minion.color(amarillo)
		if (minion.bananas() > 0){
		   		minion.bananas(minion.bananas()-1)
		   }
		   else{
		   		throw new Exception(message= "Tiene 0 bananas") //Excepcion para que las bananas no sean negativas
		   }
	 }
		   
}