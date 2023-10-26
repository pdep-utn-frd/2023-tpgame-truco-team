import wollok.game.*

object juego { 
	method onKeyPress(key) {
        if (key == "ArrowRight") {
            pacMan.moverDerecha()
        } else if (key == "ArrowLeft") {
            pacMan.moverIzquierda()
        } else if (key == "ArrowUp") {
            pacMan.moverArriba()
        } else if (key == "ArrowDown") {
            pacMan.moverAbajo()
        }
    }
}
object pacMan {
	var property puntaje = 0 
    const property imagen = "pacman.png" // Ruta de la imagen de Pac-Man
    const property ancho = 32 // Ancho del sprite en píxeles
    const property alto = 32 // Alto del sprite en píxeles
    const property velocidad = 5 // Velocidad de movimiento de Pac-Man

    var property x = 0 // Coordenada X de la posición de Pac-Man
    var property y = 0 // Coordenada Y de la posición de Pac-Man
    method position() = game.center()

    method moverDerecha() {
        x += velocidad
    }
    method moverIzquierda() {
        x -= velocidad
    }
    method moverArriba() {
        y -= velocidad
    }
    method moverAbajo() {
        y += velocidad
    }
    method ganarPuntos(cantidad){
    	puntaje = puntaje + cantidad
    }
}

object tablero{
	method position() = game.at(10,game.height()-1)
	method text() = " puntos : " // + pacMan.puntaje()
}

object pantalla{
    method iniciar() {
		self.configurarInicio()
		self.agregarVisuales()
		self.programarTeclas()
	}
	method configurarInicio() {
		game.height(12)
		game.width(20)
		game.title("pacMan")
	}
	method agregarVisuales() {
		game.addVisualCharacter(pacMan)
		//cantAutos.times({
		//	i => game.addVisual(new fantasma (position = game.at(i+3,10)))
		//})
		game.addVisual(tablero)
		}
	method programarTeclas() {
		//TODO: Código autogenerado 
	}
}

