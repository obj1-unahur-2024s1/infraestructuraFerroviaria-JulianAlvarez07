
class VagonPasajeros {
	const ancho
	const largo
	var tieneBanios
	var estaOrdenado
	
	method cantPasajeros(){
		return if (ancho <= 3) 8 * largo else 10 * largo - if (estaOrdenado) 0 else 15
	}
	
	method carga() = if(tieneBanios) 300 else 800  //expresion ternaria
	
	method tieneBanios() = tieneBanios
	
	method pesoMaximo() = 2000 + 80 * self.cantPasajeros() + self.carga()
	
	method recibirMantenimiento(){
		estaOrdenado = true
	}
}

class VagonCarga {
	const cargaMaximaIdeal 
	var cantMaderasSueltas
	
	method cantPasajeros() = 0
	
	method carga() = cargaMaximaIdeal - 400 * cantMaderasSueltas
	
	method tieneBanios() = false
	
	method pesoMaximo() = 1500 + self.carga()
	
	method recibirMantenimiento(){
		cantMaderasSueltas = 0.max(cantMaderasSueltas - 2) // no queda nunca negativo, si cantMaderas es 1, queda en 0 porque elije el max 0.
	}
}

class VagonDormitorio {
	const cantCompartimientos
	var camasCompartimientos
	
	method cantPasajeros(){
		return cantCompartimientos * camasCompartimientos
	}
	
	method tieneBanios() = true
	
	method carga() = 1200
	
	method pesoMaximo() = 4000 + 80 * self.cantPasajeros() + self.carga()
	
	method recibirMantenimiento() {}
}




