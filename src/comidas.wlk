import wollok.game.*
import pepita.*

object manzana {
	method image() = "manzana.png"
	method position() = game.at(5,1)
	method energia() = 80
	method teEncontraron(){
		roque.guarda(self)
	}
}

object alpiste {
	method image() = "alpiste.png"
	method position() = game.at(5,5)
	method energia() = 5
	method teEncontraron(){
		roque.guarda(self)
	}
}
