class Bici {
  //Atributo
  const rodado
  const property largo
  const property marca
  const property accesorios = #{}

  method initialize() {
    if (marca.kindName() != "a String") {
      self.error("el atributo marca debe ser un string con el nombre de la marca")
    }
    if (!rodado.between(1, 100)) {
      self.error("Rodado debe ser un numero valido")
    }
    if (!largo.between(1, 100)) {
      self.error("largo debe ser un numero valido")
    }
  }

  //Metodos de consulta
  method altura() = rodado * 2.5 + 15
  method velCrucero() = if (largo > 120) rodado + 6 else rodado + 2
  method carga() = accesorios.sum({accesorio => accesorio.carga()})
  method peso() = rodado / 2 +  self.pesoAccesorios()
  method tieneLuz() = accesorios.any({accesorio => accesorio.esLuminoso()})

  method pesoAccesorios() = accesorios.sum({accesorio => accesorio.peso()})

  method cantAccesoriosLivianos() = accesorios.count({acc => acc.peso() < 1})

  method esCompañeraDe(unaBici) = unaBici != self && self.mismaMarca(unaBici) && self.tieneLargoParecido(unaBici)

  method mismaMarca(unaBici) = self.marca() == unaBici.marca()
  method tieneLargoParecido(unaBici) = self.largo().between(unaBici.largo() - 10, unaBici.largo() + 10)

  //Metodos de indicacion
  method agregarAccesorios(listaAccesorio) {
    if (listaAccesorio.any({a =>a.kindName() != "a Farolito" || a.kindName() != "a Morral" || a.kindName() != "a Canasto"})) {
      throw new Exception(message="Debes agregar accesorios validos")
    }
    accesorios.addAll(listaAccesorio)
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

    if (tieneOjoDeGato.kindName() != "a Boolean") {
      self.error("tieneOjoDeGato debe ser un atributo booleano")
    }
  }

  method peso() = 1.2
  method carga() = largo / 3
  method esLuminoso() = tieneOjoDeGato
}

/*Para agregar accesorios basta con agregar la clase del mismo, con los metodos
peso(), carga(), y esLuminoso() como requiridos si o si.*/