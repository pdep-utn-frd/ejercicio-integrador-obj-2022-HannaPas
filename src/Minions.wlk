class Minions{
	var nombre
	var  bananas = 0   //se debe inicializar para cambiar el valor en villano
	const property armas = []
	var property color = amarillo
	var property maldades=0
	
	
	method esPeligroso(){  //determina si es peligroso
		 color.esPeligroso(self)
	}
	
	method agregarArmas(_nombre,_potencia){  //agrego armas
		 armas.add (new Arma(nombre= _nombre, potencia= _potencia) )
	}

	method consumirSueroMutante(){ 
		color.tomarsuero() 
	}
	
	method niveldeconcentracion(){
		color.niveldeconcentracion()
	}
	method comerBanana(cantidad){  //come bananas
		if (bananas > 0){
		   		bananas -=1
		   }
		   else{
		   		throw new Exception(message= "No tiene bananas") //Excepcion para que las bananas no sean negativas
		   }
		
    }              
    method alimentar(cantidad){  // sumo cantidad de bananas
    	return bananas + cantidad
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
	 	return (minion.armas().max({arma => arma.potencia()}).potencia() + minion.banana())  
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