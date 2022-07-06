import Minions.*



class Villano{
	const minion = []
	method nuevoMinions(_nombre){
		minion.add (new Minions(bananas= 5, nombre= _nombre))
		minion.last().agregarArmas("RayoCongelante",10)
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
	
	method realizar(maldad){
		maldad.maldadRealizada()
		
		
	}
	
	method obtenerminionMasUtil(){
		return minion.max({minion1 => minion1.maldades()})
	}
	method obtenerminionMasInutil(){
		return minion.filter({minion1 => minion1.maldades()==0})
		}

}


class Congelar  {
	
	var nivel
	var minionscapaz=[] 
	method cambiarConcentracion(valor){  //porque se puede modificar la concentracion
		nivel= valor
	}
	method minionscapacitados(minion){ // (nivel) porque el enunciado dice que se puede modificar los 500
		minionscapaz= minion.filter({minion1=> minion.armas().contains("RayoCongelante") and minion.niveldeConcentracion()== nivel})
	}
	
		method maldadRealizada(ciudad){
		    if (minionscapaz.size() !=0){
				minionscapaz.forEach({minion => minion.banana() +10 })
				ciudad.temperatura()-30
				minionscapaz.forEach({minion => minion.maldades()+1})
			}
			else{
				throw new Exception( message= "NO HAY MINIONS CAPACES")
		 	}
		 	
		}
}		
class Robar{
	 var minionscapaz=[]
	 var property objetivoderobo =0
	 
	 method minionscapacitados(minion){
	 	minionscapaz = minion.filter({minion1=> minion1.esPeligroso()})
	 }
	 
	 method maldadrealizada(objeto){
	 	if (minionscapaz.size() !=0){
	 		 objetivoderobo.premio(minionscapaz)
	 		 objeto.objetorobado()
	 		 minionscapaz.forEach({minion => minion.maldades()+1})
	 		}
	 		else
	 		{
			throw new Exception( message= "NO HAY MINIONS CAPACES")
		 }
	 } 
}
	
class Ciudad {
	var property temperatura = 36
	const elementos = [new Piramides(altura=0),sueromutante,luna]
		method objetorobado(objeto){
			elementos.remove(objeto)
		}
}
class Piramides inherits Robar {			//clases porque son varias piramides con distintas alturas
		var property altura 
		method premio(){
			minionscapaz.forEach({minion => minion.banana()+10})
		}
		method requerimientos(){
			return minionscapaz.filter({minion => minion.niveldeConcetracion()} >= altura/2)
		}
}     

object sueromutante inherits Robar {
		method premio(){
			minionscapaz.forEach({minion => minion.consumirSueroMutante()})
		}
		method requerimientos(){
			return minionscapaz.filter({minion=>minion.banana()>100 and minion.niveldeConcetracion()>23})
	}
}

object luna inherits  Robar{
	method premio(){
		minionscapaz.forEach({minion => minion.agregarArmas("RayoCongelante",10)})
	}
	method requerimientos(){
		return minionscapaz.filter({minion=>minion.armas().contains("RayoEncogedor")})
	}
}




