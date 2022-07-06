import Minions.*

class Villano{
	const minion = []
	var property ciudad 
	var property temperatura = 25
	

	method nuevoMinions(_nombre){
		minion.add (new Minions(bananas= 5, nombreMinion= _nombre))
		minion.last().agregarArmas("RayoCongelante",10)
	}
	
	method agregarMinion(){
		minion.add(1)
	}
	
	method otorgarArma(_nombre,nombrearma,potencia){
		_nombre.agregarArmas(nombrearma,potencia)
	}
	
	method alimentarMinions(_nombre,cantidadAdicional){
		  _nombre.alimentar(cantidadAdicional) 
	}
	method planificar(maldad){                            //      MALDAD= --- CONGELAR/ROBAR ----  
		maldad.minionscapacitados(minion)
	}
	
	method DondeRealizarMaldad(maldad){
		maldad.maldadARealizar(ciudad)
	}
	

}


class Congelar  {
	
	var nivel
	var minionscapaz=[] 
	method cambiarConcentracion(valor){  //porque se puede modificar la concentracion
		nivel= valor
	}
	method minionscapacitados(minion){ // (nivel) porque el enunciado dice que se puede modificar los 500
		minionscapaz= minion.filter({minion1=>minion1.armas().contains("RayoCongelante") and minion.niveldeConcentracion()== nivel})
	}
	
		method maldadRealizada(){
		minionscapaz.forEach(({minion => minion.banana() +10 }))
			if (minionscapaz.size() ==0){
				throw new Exception( message= "NO HAY MINIONS CAPACES")
		 	}
		}
		
		method maldadArealizar(ciudad){
			ciudad.temperaturaciudad(-30)
		
		
	}
		
		
	}
	


class Robar{
	
}





