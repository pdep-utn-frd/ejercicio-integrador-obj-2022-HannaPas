class Minions{
	
	var property potencia
	var property bananas // AÑADO PROPERTY PARA EN EL FUTURO OBTENER LAS BANANS CON minions.bananas()
	const property armas = []
	var property color = amarillo
	
	/*
	ESTE METODO TIENE QUE IR EN VILLANOSS
	method nuevoMinion(){
		bananas = 5
		armas.add(rayocongelante) RAYO CONGELANTE DEBERIA SER UNA INSTANCIA DE LA CLASE ARMA,
		OSEA 
		creas la clase arma...
		CLASS ARMA {
			var property nombre
			var property potencia
		}
		luego 
		armas.add(new Arma("rayo congelante", potencia=...)
		
	}*/  
	
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
	
	method alimentar(){
		bananas += 1
	}
    
}

//rayo congelante debe ser una instancia de la clase arma! ( recordar => instancia es cuando digo, rayo = new arma())

 object amarillo  {    //minion Amariillo
	// LAS ARMAS Y BANANAS NO VAN EN EL OBJETO AMARILLO ,VIENEN DE LA CLASE MINION!
	
	// le paso por parametro un minion y me dice si ESE minion pasado cumple que tiene > 2 armas.
	
	method esPeligroso(minion){
		return minion.armas().size()>2 
	}
	
	method tomarsuero(minion){  //se transforman en violetas
	// al minion que pasen por parametor le remuevo las armas
	// fijate vos que hace al tomar el suero, yo no recuerdo el algoritmo solo le cambie el color !
		   minion.armas().clear()
		   
		   // si el minion tiene como minimo 1 banana para restar, si no, no puede tener banans negativas
		   if (minion.bananas() > 0) {
		   	minion.bananas(minion.bananas() - 1)
		   } else {
		   // lanzo una excepcion que algo anda mal con su mensaje
		     throw Exception(message="Tiene 0 bananas")
		   }
		   // le cambio el color
		   minion.color(violeta)
		
	}
	method niveldeconcentracion(minion){
	// le pido sacar el arma con MAXIMA potencia del minion que pasen por parametro, luego .MAX() devuelve un OBJETO ARMA!
	// ASIQUE RECORDAR A ESE OBJETO ARMA PREGUNTARLE SU POTENCIA, POR ESO AL FINAL HAGO .POTENCIA() + bananas
	// ya que si no , estaria usmando un OBJETO + un NUMERO y tiraria error!
	 	return (minion.armas().max{(arma => arma.potencia())}).potencia() + bananas
	}
	
}

object violeta{    //minion Violeta
	// lo mismo con el amarillo
	
	method esPeligroso(){
		return true 
	}
	method niveldeconcentracion(minion){
		return minion.bananas()	
	}
	
	method tomarsuero(minion){ 
	// fijate vos que hace al tomar el suero, yo no recuerdo el algoritmo solo le cambie el color !
		bananas = bananas -1
		// le cambio el color
		minion.color(amarillo)
	}
}
