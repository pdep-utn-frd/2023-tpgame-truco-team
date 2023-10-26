import wollok.game.*
import objetosDeclaracion.*

object tablero {
    method position() = game.at(11, game.height() - 1)
    method text() = "puntos:"+pacman.puntaje()//&& "vidas:"+pacman.vidas()
}
object tableronew{
	method position() = game.at(11,game.height()-3)
	method text()= "vidas:"+ pacman.vidas()
}
//object tableroPuntos{
//	method position()= game.at(11,game.height()-7)
//	method text()= "puntos Restastes:"
//}

object pantalla {
	var cantPastilla = 20
	var cantFantasma = 15
	var cantPuntos = pacman.PuntosPacman()
	//var cantPuntos = 10
	method mover (){
	}
    method iniciar() {
        self.configurarInicio()
        self.agregarVisuales()
        self.colisiones()
        keyboard.w().onPressDo({pacman.moverArriba()})
        keyboard.s().onPressDo({pacman.moverAbajo()})
        keyboard.d().onPressDo({pacman.moverder()})
        keyboard.a().onPressDo({pacman.moverizq()})
        game.start()
    }
    method configurarInicio() {
        game.height(13)   
        game.width(15)    
        game.title("new Pac-Man")
        game.boardGround("asset/fondo.jpeg")
        //game.ground("asset/fondoDePantalla")
        //game.start()
    }
    method random(){
    	return 1.randomUpTo(game.height()).roundUp()}
    	           	
    	         
    method agregarPastilla(){
    	var ranx = self.random()
    	var rany = self.random()
    	if (pacman.nopared(ranx,rany)){
    			game.addVisual(new SuperPastilla(position = game.at(ranx,rany ) )   ) 
    	}else{
    		self.agregarPastilla()
    	}
       }
    method agregarFantasmas(){
    	var ranx = self.random()
    	var rany = self.random()
    	if (pacman.nopared(ranx,rany)){
    		game.addVisual(new Fantasma(position = game.at(ranx,rany))) 
    	}else{
    		self.agregarFantasmas()
    	}
    	 
    }
///------------------------------
method agregarPuntos(){
	var ranx = self.random()
    var rany = self.random()
    if (pacman.nopared(ranx,rany)){
    	game.addVisual(new Puntos(position = game.at(ranx,rany))) }
    	else
    	{self.agregarPuntos()}
}
///------------------------------	
    method agregarVisuales(){
        game.addVisual(pacman)//era addVisualCharacter (pa sacar el movimiento predeterminado lo borre)
        cantPastilla.times({
        	p => game.schedule(p*3000,{self.agregarPastilla()}) })
        cantFantasma.times({
       	q => game.schedule(q*2000,{self.agregarFantasmas()})})
       	cantPuntos.times({
       	r => game.schedule(r*1500,{self.agregarPuntos()})	
       	})
       	
        game.addVisual(tablero)
        game.addVisual(tableronew)
    }
    
    method colisiones(){
    	game.onCollideDo(pacman,{cosa => cosa.desaparacer()})
    	    }
}





