class Carrera {
	const property materias = #{}
}

class Materia {
	const property carrera
}

class Aprobacion {
	const property materia
	const property nota
}

class Estudiante {
	const property carreras = #{}
	const property historialAprobadas = []
	
	method registrarMateriaAprobada(materia, nota) {
		if (self.tieneAprobada(materia)) self.error(
				"El estudiante ya tiene aprobada la materia " + materia.toString()
			)
		
		historialAprobadas.add(new Aprobacion(materia = materia, nota = nota))
	}
	
	method tieneAprobada(materia) = historialAprobadas.any(
		{ aprobacion => aprobacion.materia() == materia }
	)
	
	method cantidadMateriasAprobadas() = historialAprobadas.size()
	
	method promedio() {
		const promedioCalculado = if (historialAprobadas.isEmpty()) 0
		                          else historialAprobadas.sum(
		                          		{ aprobacion => aprobacion.nota() }
		                          	) / self.cantidadMateriasAprobadas()
		
		return promedioCalculado
	}
}