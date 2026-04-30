import mensajeros.*
object camion {
    var property acoplados = 1
    
    method peso() {
        return acoplados * 500
    }
}

object bicicleta {
    method peso() {
        return 5 
    }
}