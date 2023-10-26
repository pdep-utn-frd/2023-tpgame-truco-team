import wollok.game.*

object wollok {
  var property position = game.origin()
  method howAreYou() = "I am Wolloktastik!"
  method image() = "wollok.png"
}

object caja {
  var property position = game.center()
  method image() = "caja.png"
  method subir(){
    position = position.up(1)
  }
}

program ejemplo {
  game.addVisualCharacter(wollok)  //Para que se pueda mover con las flechas
  game.addVisual(caja)
  // Apenas el personaje wollok colisione con la caja, el personaje habla y la caja se desplaza
  game.whenCollideDo(wollok, { elemento => 
    elemento.subir()
    game.say(wollok,wollok.howAreYou())
  })
  game.start()
}