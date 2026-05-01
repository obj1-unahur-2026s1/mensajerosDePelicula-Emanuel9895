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
  var transporte = camion
  var peso = 0
  method peso() = 80
  method puedeLlamar() {return true}
  method pesoTotal() = peso + transporte.peso()
}

object neo {
  var tieneCredito = false
  method peso()= 0
  method puedeLlamar(){return tieneCredito}
  method cargarCredito() {tieneCredito = true}
method pesoTotal() = 0
}

object camion {
    var acopladosActuales = 0

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
    method pagar() {estaPago = true}
    method estaPago(){return estaPago}
    method destino(unLugar) {destino = unLugar}
    method puedeSerEntregadPor(unMensajero){
      return destino.dejaPasar(unMensajero) and self.estaPago()
    }
}