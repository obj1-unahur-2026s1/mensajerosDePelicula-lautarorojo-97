import destinos.*
import mensajeros.*

object paquetes{
    var estaPago = false
    var destino = brooklyn

    method cambiarDestino(nuevoDestino){
        destino = nuevoDestino
    }

    method registrarPago(){
        estaPago = true
    }

    method cancelarPago(){
        return false
    }

    method puedeSerEntregado(unMensajero){
        return estaPago && destino.dejaPasar(unMensajero)
    }

    method precioTotal() = 50
}

object paquetito{

    method estaPago(){
        return true
    }

    method puedeSerEntregado(unMensajero){
        return true
    }

    method precioTotal() = 0
}


object paqueton{
    
    const property destinos = []
    var importePagado = 0

    method estaPago(){
        return self.precioTotal() == importePagado
    }

    method pagoParcial(unValor){

        importePagado = (importePagado + unValor).min(self.precioTotal())
    }

    method precioTotal(){
        return destinos.size() * 100
    }

    method puedeSerEntregado(unMensajero){
        return self.estaPago() && destinos.all({d => d.dejaPasar(unMensajero)})
    }
}

object cajaMisteriosa {
    method estaPago() {
        return true
    }
    method precioTotal() {
        return 200
    }
    method puedeSerEntregado(unMensajero) {
        return laMatrix.dejaPasar(unMensajero)
    }
}