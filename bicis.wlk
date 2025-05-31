class Bici {
  //Atributo
  const property rodado
  const property largo
  const property marca
  const accesorios = #{}

  //Metodos de consulta
  method altura() = rodado * 2.5 + 15
  method velCrucero() = if (largo > 120) rodado + 6 else rodado + 2
  method carga() = accesorios.sum({accesorio => accesorio.carga()})
  method peso() = rodado / 2 +  self.pesoAccesorios()
  method tieneLuz() = accesorios.any({accesorio => accesorio.esLuminoso()})

  method pesoAccesorios() = accesorios.sum({accesorio => accesorio.peso()})

  method cantAccesoriosLivianos() = accesorios.count({acc => acc.peso < 1})

  //Metodos de indicacion
  method agregarAccesorioz(accesorio) {
    accesorios.addAll(accesorio)
  }

  method quitarAccesorio(accesorio) {
    accesorios.remove(accesorio)
  }
}

//Accesorios

class Farolito {
  method peso() = 0.5
  method carga() = 0
  method esLuminoso() = true
}

class Canasto {
  const volumen

  method peso() = volumen / 10
  method carga() = volumen * 2
  method esLuminoso() = false
}

class Morral {
  const largo
  const tieneOjoDeGato

  method peso() = 1.2
  method carga() = largo / 3
  method esLuminoso() = tieneOjoDeGato
}