'From Pharo11.0.0 of 25 September 2023 [Build information: Pharo-11.0.0+build.707.sha.f720787cab0b25f0a8a811d66f2a8d3633ad8ba3 (64 Bit)] on 3 October 2023 at 8:05:38.34 pm'!
Object subclass: #TorreDeHanoi
	instanceVariableNames: 'numero_de_discos lista_postes'
	classVariableNames: ''
	package: 'Ejercicio1-Practica1'!

!TorreDeHanoi methodsFor: 'as yet unclassified' stamp: 'Fernando 10/2/2023 22:05'!
moverDiscoDesdeElPoste: origen aElPoste: destino
	Transcript show: 'Mover disco desde la torre ', origen printString, ' a la torre ', destino printString; cr. ! !

!TorreDeHanoi methodsFor: 'as yet unclassified' stamp: 'Fernando 10/3/2023 19:45'!
resolverDeFormaRecursivaYMoverDiscos: cantidad desdePoste: posteOrigen aPoste: posteDestino usandoPoste: posteAuxiliar
    cantidad > 0 ifTrue: [
        self resolverDeFormaRecursivaYMoverDiscos: cantidad - 1 desdePoste: posteOrigen aPoste: posteAuxiliar usandoPoste: posteDestino.
        Transcript show: 'Mover disco ' , cantidad asString, ' desde el poste ', posteOrigen asString, ' al poste ', posteDestino asString; cr.
        self resolverDeFormaRecursivaYMoverDiscos: cantidad - 1 desdePoste: posteAuxiliar aPoste: posteDestino usandoPoste: posteOrigen.
    ].! !

!TorreDeHanoi methodsFor: 'as yet unclassified' stamp: 'Fernando 10/3/2023 14:56'!
resolverDeFormaIterativa
	|resultado_movimientos total_movimientos temp movimiento|
	
	(numero_de_discos \\ 2 = 0) ifTrue: [ 
		temp := lista_postes at: 2.
  		lista_postes at: 2 put: (lista_postes at: 3).		    	 
		lista_postes at: 3 put: temp.
	].
	resultado_movimientos := (2**numero_de_discos) - 1. 
	total_movimientos  := resultado_movimientos asInteger.
	movimiento := 1.
	[movimiento <=  total_movimientos] whileTrue: [ 
		
		(movimiento \\ 3 = 1) ifTrue: [self moverDiscoDesdeElPoste: (lista_postes at: 1) aElPoste: (lista_postes at: 3)].
		(movimiento \\ 3 = 2) ifTrue: [self moverDiscoDesdeElPoste: (lista_postes at: 1) aElPoste: (lista_postes at: 2)].
		(movimiento \\ 3 = 0) ifTrue: [self moverDiscoDesdeElPoste: (lista_postes at: 2) aElPoste: (lista_postes at: 3)].
		movimiento := movimiento + 1.
	 ].! !


!TorreDeHanoi methodsFor: 'initialization' stamp: 'Fernando 10/3/2023 15:25'!
initialize: numero_discos_ingresados
	lista_postes := OrderedCollection  new.
	numero_de_discos := numero_discos_ingresados.
	lista_postes add: 'A'.
	lista_postes add: 'B'.
	lista_postes add: 'C'.! !
