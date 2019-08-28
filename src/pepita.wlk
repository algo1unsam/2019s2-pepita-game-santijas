import ciudades.*
import wollok.game.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 

	var property position = game.at(3,3)
	method image() = if (energia >100) "pepita-gorda-raw.png" else  "pepita.png"


	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method andaAComer(comida){
		self.come(comida)
		self.move(comida.position())
		game.removeVisual(comida)
	}
	
	method volaHacia(unaCiudad) {
		if (ciudad == unaCiudad )
			 game.say(self, "Ya estoy en " + self.consultaCiudad())
		else{
			if (self.puedeVolar(unaCiudad.position())){
				self.move(unaCiudad.position())
				ciudad = unaCiudad
		} else game.say(self, "Dame de comer primero!")
		}}
		

	method energiaParaVolar(distancia) = 15 + 5 * distancia
	
	method puedeVolar(nuevaPosicion){
		return  ( energia > self.energiaParaVolar(position.distance(nuevaPosicion)))
	}
	
	method move(nuevaPosicion) {
			energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
			self.position(nuevaPosicion)
	}	
	
	method consultaCiudad(){
		return ciudad.toString()
	}
	
	method teEncontraron(){
		roque.daComida()
	}
}



object roque{
	var property position = game.at(3,5)
	var property guardado 
	
	method image() = "jugador.png"
	
	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}	
	
	method soltar(cosa){
		game.addVisualIn(cosa, game.at(1.randomUpTo(10).truncate(0),1.randomUpTo(10).truncate(0)))
	}
	
	method guarda(unaComida){
		
	   if (guardado != null){
	   		self.soltar(guardado)
	   }	
	   
	   
	   game.removeVisual(unaComida)
	   guardado = unaComida
	}
	
	method daComida(){
		if (guardado != null){
	   		pepita.come(guardado)
			game.addVisualIn(guardado, game.at(1.randomUpTo(10).truncate(0),1.randomUpTo(10).truncate(0)))
			guardado = null
	   }	
	}
}
