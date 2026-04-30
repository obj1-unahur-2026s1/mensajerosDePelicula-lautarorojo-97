import mensajeros.*

object brooklyn{

    method dejaPasar(unMensajero){
        return unMensajero.pesoTotal() <= 1000
    }
}

object laMatrix{

    method dejaPasar(unMensajero){
        return unMensajero.puedeLlamar()
    }
}