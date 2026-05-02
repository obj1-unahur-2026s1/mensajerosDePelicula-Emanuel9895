import destinos.*


object roberto {
  var transporte = camion
  var peso = 0
  var paquetesEnviados = 0
  method peso() = peso
  method puedeLlamar() = false
  method peso(unPeso) {peso = unPeso}
  method transporte(vehiculo) {transporte = vehiculo}
  method pesoTotal() = peso + transporte.peso()
  method enviarPaquete(unPaquete) {paquetesEnviados += 1 }


}
object chuckNorris {
  var transporte = camion 
  var paquetesEnviados = 0
  method transporte(unTransporte) {transporte = unTransporte}
  method peso() = 80
  method puedeLlamar() = true
  method pesoTotal() = self.peso() + transporte.peso()
  method enviarPaquete(unPaquete) {paquetesEnviados += 1 }
}

object neo {
  var tieneCredito = false
  var paquetesEnviados = 0
  method peso()= 0
  method puedeLlamar() = tieneCredito
  method cargarCredito() {tieneCredito = true}
  method pesoTotal() = 0
  method enviarPaquete(unPaquete) {paquetesEnviados += 1 }
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
    method precio() = 0
    method pagar() {estaPago = true}
    method estaPago(){return estaPago}
    method destino(unLugar) {destino = unLugar}
    method puedeSerEntregadoPor(unMensajero){
      return destino.dejaPasar(unMensajero) and self.estaPago()
    }
}

object paquetito{
  var precio = 0
  method estaPago() = true
  method precio() = precio
  method puedeSerEntregadoPor(unMensajero) = true
  method cambiarPrecio(unPrecio) {precio = unPrecio}
}

object paquetonViajero{
    var montoAbonado = 0
    const destinos = []
    method precio() = 50 + destinos.size() * 100
    method pagar(unMonto) {montoAbonado += unMonto}
    method estaPago(){return montoAbonado >= self.precio()}
    method destino(unLugar) {destinos.add(unLugar)}
    method puedeSerEntregadoPor(unMensajero){
      return destinos.all({d => d.dejaPasar(unMensajero)}) and self.estaPago()
    }
}

object empresa{
  const mensajeros = [roberto,chuckNorris,neo]
  const paquetesPendientes = []
  var totalGanado = 0
  var paquetesEnviados = 0

  method facturacionDeLaEmpresa() = totalGanado 
  method totalEnvios() = paquetesEnviados
  method ponerEnPendientes(paquetes) {paquetesPendientes.addAll(paquetes)}

  method puedePaqueteSerEntregado(unPaquete){
    return mensajeros.any({m => unPaquete.puedeSerEntregadoPor(m)})
  }

  method mensajerosQuePuedenLlevarElPaquete(unPaquete){
    return mensajeros.filter({m =>  unPaquete.puedeSerEntregadoPor(m) })
  }

  method tieneSobrePeso(){
    return mensajeros.sum( {m => m.pesoTotal()}) / mensajeros.size() > 500 
  }

  method enviarPaquete(unPaquete){
    if(self.puedePaqueteSerEntregado(unPaquete)){
      const mensajero = self.mensajerosQuePuedenLlevarElPaquete(unPaquete).first()
      mensajero.enviarPaquete(unPaquete)
      totalGanado += unPaquete.precio()
      paquetesEnviados += 1
    }
    else{
      paquetesPendientes.add(unPaquete)
    }
  }

  method enviarTodosLosPaquetes(conjuntoDePaquetes){
    conjuntoDePaquetes.forEach({p => self.enviarPaquete(p)})
  }

  method enviarElPaqueteMasCaro(){
    const paqueteMasCaro = paquetesPendientes.max({p => p.precio()})
    if(self.puedePaqueteSerEntregado(paqueteMasCaro)){
      self.enviarPaquete(paqueteMasCaro)
      paquetesPendientes.remove(paqueteMasCaro)
    }
  }


}