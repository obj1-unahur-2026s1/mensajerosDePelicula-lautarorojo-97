import paquetes.*

// Segunda parte: Empresa de mensajería
object empresa{
    const mensajeros = []
    var facturacion = 0
    const paquetesPendientes = []

    method mensajeros(){
        return mensajeros
    }

    method contratarUnMensajero(unMensajero){
        mensajeros.add(unMensajero)
    }

     method despedirUnMensajero(unMensajero){
        mensajeros.remove(unMensajero)
    }

      method despedirATodos(){
        mensajeros.clear()
    }

    method agregarListaDeMensajeros(listaMensajeros){
        mensajeros.addAll(listaMensajeros)
    }

     method eliminarListaDeMensajeros(listaMensajeros){
        mensajeros.removeAll(listaMensajeros)
    }

    method esGrande(){
        return mensajeros.size() > 2
    }

    method puedeSerEntregadoPorElPrimerMensajero(unPaquete){
        return unPaquete.puedeSerEntregado(mensajeros.first())
    }

    method pesoUltimoMensajero(){
        return self.ultimoEmpleado().pesoTotal()
    }

    method ultimoEmpleado(){
        return mensajeros.last()
    }

// Tercera parte: Mensajería recargada

    method facturacion() {
        return facturacion
    }

    method paquetesPendientes() {
        return paquetesPendientes
    }

    
    method puedeEntregar(unPaquete) {
        return mensajeros.any({ mensajero => unPaquete.puedeSerEntregado(mensajero) })
    }

    method mensajerosCandidatos(unPaquete) {
        return mensajeros.filter({ mensajero => unPaquete.puedeSerEntregado(mensajero) })
    }

    method tieneSobrepeso() {
        if (mensajeros.isEmpty()) { return false } // Evitamos dividir por cero si no hay nadie
        
        const pesoTotalDeTodos = mensajeros.sum({ mensajero => mensajero.pesoTotal() })
        return (pesoTotalDeTodos / mensajeros.size()) > 500
    }

    method enviar(unPaquete) {
        if (self.puedeEntregar(unPaquete)) {
            facturacion = facturacion + unPaquete.precioTotal()
            
            // Si lo pudimos enviar y estaba en pendientes, lo sacamos
            if (paquetesPendientes.contains(unPaquete)) {
                paquetesPendientes.remove(unPaquete)
            }
        } else {
            // Si no pudimos enviarlo y no estaba en la lista, lo agregamos a pendientes
            if (!paquetesPendientes.contains(unPaquete)) {
                paquetesPendientes.add(unPaquete)
            }
        }
    }

    method enviarTodos(listaDePaquetes) {
        listaDePaquetes.forEach({ paquete => self.enviar(paquete) })
    }

    method enviarPendienteMasCaro() {
        if (!paquetesPendientes.isEmpty()) {
            const elMasCaro = paquetesPendientes.max({ paquete => paquete.precioTotal() })
            self.enviar(elMasCaro)
        }
    }  
}