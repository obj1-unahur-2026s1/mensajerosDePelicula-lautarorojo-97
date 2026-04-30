import vehiculos.*

object roberto{
    var vehiculoActual = bicicleta
    var property peso = 90  
 
    method pesoTotal(){
        return vehiculoActual.peso()  +  peso
    }

    method cambiarVehiculo(nuevoVehiculo){
        vehiculoActual = nuevoVehiculo
    }

    method puedeLlamar(){
        return false
    }
}

object chuckNurris{
    method pesoTotal(){
        return 80
    }

    method puedeLlamar(){
        return true
    }
}

object neo{
    var tieneCredito = false
    method pesoTotal(){
        return 0
    }

     method cargarCredito(){
        tieneCredito = true
    }

    method consumirSaldo(){
        tieneCredito = false
    }

    method puedeLlamar(){
        return tieneCredito
    }
}

object flash {
    method pesoTotal() {
        return 75
    }
    method puedeLlamar() {
        return true
    }
}