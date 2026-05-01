import destinos.*


object roberto {
  var transporte = camion
  var peso = 0
  method puedeLlamar() = false
  method peso(unPeso) {peso = unPeso}
  method transporte(vehiculo) {transporte = vehiculo}
  method pesoTotal() = peso + transporte.peso()


}
object chuckNorris {
  
  method peso() = 80
  method puedeLlamar() {return true}
}

object neo {
  var tieneCredito = false
  method peso()= 0
  method puedeLLamar(){return tieneCredito}
  method cargarCredito() {tieneCredito = true}
}

object camion {
    var acopladosActuales = 1

  method acoplados(cantidadAcoplados) {
    acopladosActuales = cantidadAcoplados
  }

  method peso() {return acopladosActuales * 500}
}

object bicicleta {

  method peso () = 5
}

object paquete{
    var estaPago = false
    var destino = puenteDeBrooklyn
    method puedeEntregarse(unMensajero){
      if()
    }
}