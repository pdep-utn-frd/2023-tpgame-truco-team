import wollok.game.*
import pacmanEjemplo.*
object pacman {
	var property vidas = 2
    var property puntaje = 0
    var property pastilla = false 
    var property position = game.at(0,2)
    var property velocidad = 1
    const property PuntosPacman = 2
    var control = self.PuntosPacman()
    method conteo(){control = control -1}
   
    method image() ="asset/pacman.png"
    method ganarPuntos(cant) { puntaje = puntaje + cant }
    method perderVidas(){vidas= vidas-1 }
    method tomarPastilla() {pastilla = true}
    method perderPastilla(){pastilla = false}
    method nopermitidas (px,py){
    	return self.nopared(px,py)//pared exterior delimitada por el ancho y largo del juego
    }
    method nopared (px,py){
    	const cor = px.toString() + "-" + py.toString()
    	const cord = cor.toString()
    	const camino = [
    "0-2", "0-3", "0-5", "0-6", "0-7", "0-8", "1-3", "1-4", "1-5", "1-8", "1-9", "1-10", "1-11", "1-12", "2-3", "2-5", "2-6", "2-12", "3-3", "3-6", "3-7", "3-8", "3-9", "3-12", "4-3", "4-9", "4-11", "4-12", "5-0", "5-1", "5-2", "5-3", "5-4", "5-5", "5-6", "5-7", "5-9", "5-11", "6-2", "6-4", "6-7", "6-9", "6-11", "7-2", "7-4", "7-7", "7-9", "7-11", "7-12", "8-2", "8-3", "8-4", "8-7", "8-9", "8-12", "9-0", "9-1", "9-2", "9-7", "9-9", "9-12", "10-0", "10-7", "10-9", "10-11", "10-12", "11-0", "11-7", "11-9", "11-11", "12-0", "12-7", "12-9", "12-11", "13-0", "13-1", "13-2", "13-3", "13-4", "13-5", "13-6", "13-7", "13-8", "13-9", "13-10", "13-11", "13-12", "14-0", "14-7"
]




    	return camino.any({corde => corde == cord})
    }
    method moverArriba(){
    	if (self.nopermitidas(position.x(),position.y()+1)){
    		self.position(self.position().up(1))
    	}
    	return position
    	}
    
     method moverAbajo(){
 		if (self.nopermitidas(position.x(),position.y()-1)){
    		self.position(self.position().down(1))
    	}
    	return position
    	}
    	
    
     method moverder(){
    if (self.nopermitidas(position.x()+1,position.y())){
    		self.position(self.position().right(1))
    	}
    	return position
    	}
    	
    
     method moverizq(){
    	if (self.nopermitidas(position.x()-1,position.y())){
    		self.position(self.position().left(1))
    	}
    	return position
    	}
    	
    method dolor(){
    	if (vidas==0){
    		game.clear()
    		game.addVisual(finDeJuego)	
    		}
    	else {self.perderVidas()} 
    	}
    method conteofinal(){
    	if (control==1){
    		game.clear()
    		game.addVisual(victoria)	
    	}
    	
    	else(self.conteo())
    }   
}

class Puntos{
	const puntos = 3
	//var property conteo = 3 //pacman.PuntosPacman()
	var property position
	 method image() = "asset/quienSabeQueEs.png" 
    //method menosPuntos(){ conteo = conteo -1}  
	method desaparacer(){
		game.removeVisual(self)
		pacman.ganarPuntos(puntos)
		pacman.conteofinal()		
	}
 }
 
 class SuperPastilla{
    var position 
    var puntos = 1/2
 	method image() = "asset/pastilla.png"
 	method position()= position
	method desaparacer() {
			game.removeVisual(self)
	 		pacman.ganarPuntos(puntos)
			pacman.tomarPastilla()
		}
   }
//--------------------------------------.
class Fantasma {
	var property position = 1
    var property velocidad = 300.randomUpTo(700).roundUp()
	const puntos = 2
	method image()=  "asset/bolaDeAgua.png" 
	method desaparacer(){
		if (pacman.pastilla()){
		game.removeVisual(self)
		pacman.ganarPuntos(puntos)
		pacman.perderPastilla()}
		else{pacman.dolor()}	
	}
	 method moverArriba(){
    	position = position.up(1)}
    }
	
object finDeJuego{
 	method position() = game.center()
 	method image() = "asset/gameOverUltimate.png"
}
object victoria{
	method position() = game.center()
	method text()= "usted a ganado "
}

// se puede uar herencia junto con la declaracion de las nuevas variables para definir method especificos para los diferntes objetos 
