class Bici {
  //Atributo
  const rodado
  const property largo
  const property marca
  const property accesorios = #{}

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

  method initialize() {
    if (not volumen.between(1,20)) {
      self.error(volumen.toString() + "No es un valor entre 1 y 20")
    }
  }

  method peso() = volumen / 10
  method carga() = volumen * 2
  method esLuminoso() = false
}

class Morral {
  const largo
  const tieneOjoDeGato

  //El initialize lo entienden las clases y sirve para, a la hora de instanciar arrojar excepciones
  method initialize() {
    if (not largo.between(1,200)) {
      self.error(largo.toString() + "No es un valor entre 1 y 200")
    }

    if (not tieneOjoDeGato || tieneOjoDeGato) {
      self.error("tieneOjoDeGato debe ser un valor Booleano")
    }
  }

  method peso() = 1.2
  method carga() = largo / 3
  method esLuminoso() = tieneOjoDeGato
}