import vagones.*

class Formaciones {
	const property vagones = []
	const locomotoras = []
	
	method agregarVagones(unVagon){
		vagones.add(unVagon)
	}
	
	method quitarVagones(unVagon){
		vagones.remove(unVagon)
	}
	
	method desarmarFormacion(){
		vagones.clear()
		locomotoras.clear()
	}
	
	method cuantosPasajerosPuedeLLevar() = vagones.sum({v=>v.cantPasajeros()}) 
	//transforma la lista de vagones en numeros, y despues los suma
	
	method cuantosVagonesPopularesTiene() = vagones.count({v=>v.cantPasajeros() > 50})
										//	vagones.filter({v=>v.cantPasajeros() > 50}).size()
	
	method esFormacionCarguera() = vagones.All({v=>v.carga() > 1000})
	
	method vagonMasPesado() = vagones.max({v=>v.pesoMaximo()})
	method vagonMasLiviano() = vagones.min({v=>v.pesoMaximo()})
	method dispercionDePesos() = return self.vagonMasPesado().pesoMaximo() - self.vagonMasLiviano().pesoMaximo() //porque el max devuelve un objeto
	
	method cantBanios() = vagones.count({v=>v.tieneBanios()})
	
	method hacerMantenimientos(){
		vagones.forEach({v=>v.recibirMantenimiento()})  // el forEach recorre la coleccion pero no retorna nada 
	}
	
	method vagonesConPasajeros() = vagones.filter({v=>v.cantPasajeros()>0})
	method vagonesConMasPasajeros() = self.vagonesConPasajeros().max({v=>v.cantPasajeros()}) // el self para que no agarre un vagon de carga
	method vagonesConMenosPasajeros() = self.vagonesConPasajeros().min({v=>v.cantPasajeros()})
	method estaEquilibriada() = 
		self.vagonesConMasPasajeros().cantPasajeros() - self.vagonesConMenosPasajeros().cantPasajeros() <= 20

	
}









