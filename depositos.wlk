import bicis.*

class Deposito {
    const bicis = []

    //Metodos de consulta
    method bicisRapidas() = bicis.filter({bici => bici.velCrucero() > 25})
    method conjuntoDeMarcas() = bicis.map({bici => bici.marca()}).asSet()
    method esNocturno() = bicis.all({bici => bici.tieneLuz()})
    method algunaBiciPuedeLLevar(cargaEnKG) = bicis.any({bici => bici.carga() > cargaEnKG})

    //Mas sobre el deposito
    method marcaDeBiciMasRapido() = bicis.max({bici => bici.velCrucero()}).marca()
    method bicisLargas() = bicis.filter({bici => bici.largo() > 170})
    method cargaDeBicisLargas() = self.bicisLargas().sum({bici => bici.carga()})
    method cantBicisSinAccesorios() = bicis.count({bici => bici.accesorios().isEmpty()})

    //Bici companera
    method companerasDe(unaBici) = bicis.filter({b => b.esCompañeraDe(unaBici)})

    //Desafios extra
    method hayAlgunParDeCompaneras() = bicis.any({bici => not self.companerasDe(bici).isEmpty()})

    method paresDeCompañeras() {
        const pares = #{}
        bicis.forEach({bici =>
            bicis.forEach({bici1 => 
                if(bici.esCompañeraDe(bici1)) {
                    pares.add(#{bici, bici1})
                }
            })
        })
        return pares
    }
 
    method seHizoLaLuz() {
        const aux = []
        var primeroConLuz = false
        bicis.forEach({bici => aux.add(bici)})
        aux.forEach({bici => 
            if (not bici.tieneLuz() && !primeroConLuz) {
                aux.remove(bici)
            } 
            if (bici.tieneLuz()) {
                primeroConLuz = true
            }
        })
        return aux.all({bici => bici.tieneLuz()})
    }


    //Metodos de indicacion
    method agregarBicis(listaBicis) {
        if (listaBicis.any({bici => bici.kindName() != "a Bici"})) {
            self.error("Solo puedes agregar objetos de clase Bici")
        }

        if (listaBicis.any({bici => bicis.contains(bici)})) {
            //Lanzamos una excepcion, el self error por detras crea una instancia de excepcion, igual al que hay abajo
            //self.error("No se puede agregar dos veces una misma bici al deposito")

            throw new Exception(message= "No se puede agregar dos veces una misma bici al deposito")
        }

        if(listaBicis.any({bici => listaBicis.occurrencesOf(bici) > 1})) {
            self.error("No puedes agregar una bicicleta dos veces")
        }
        
        bicis.addAll(listaBicis)
    }

    method quitarBici(bici) {
        if (not bicis.contains(bici)) {
            self.error("LA bicicleta a eliminar no se encuentra en el deposito")
        }

        bicis.remove(bici)
    }
}
/*
 
*/