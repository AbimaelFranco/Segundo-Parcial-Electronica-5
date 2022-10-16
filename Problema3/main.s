;PROBLEMA #3 SEGUNDO EXAMEN PARCIAL DE ELECTRONICA 5 FACULTAD DE INGENIERIA SEGUNDO SEMESTRE 2022 UNIVERSIDAD DE SAN CARLOS DE GUATEMALA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Realice un programa en el que se ingresen 2 opciones:
;	a. 2 catetos y 1 angulo de un triangulo rectangulo
;	b. 2 angulos y 1 cateto de un triangulo rectangulo
;y luego con esa informacion dada, encontrar los valores desconocidos para completar los datos del triangulo.

;para el caso a:
    ; S19: A
    ; S20: B
    ; S23: C
    ; S0: theta
    ; S22: phi
;para el caso b:
    ; S19: A
    ; S23: B
    ; S22: C
    ; S0: theta
    ; S20: phi
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	AREA codigo, CODE, READONLY, ALIGN=2
	THUMB
	EXPORT Start

;DECLARACION DE REGISTROS		
Start
    LDR R1, =2          ;Selecciona el tipo de triangulo a resolver, R1=1 para triangulo a y R1=2 para triangulo b

    ; Si su eleccion fue a)
    ;   ingresar el valor del cateto A en S19
    ;   ingresar el valor del cateto B en S20
    ;   ingresar el valor de theta en radianes en S0
    ;
    ; Si su eleccion fue b)
    ;   ingresar el valor del cateto A en S19
    ;   ingresar el valor de phi en radianes S20
    ;   ingresar el valor del theta en radianes en S0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S19, = 120    		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S20, = 0.330297    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S0,  = 1.240499	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	VLDR.F32 S21, = 1.57079    ; Valor de pi/2
	B principal

trianguloa
    VMUL.F32 S19, S19   ;determina el valor de A^2
    VMUL.F32 S20, S20   ;determina el valor de B^2
	VSUB.F32 S22, S21, S0 ; calcula el valor de phi
    VADD.F32 S24, S19, S20 ; calcula el valor de A^2+B^2
    VSQRT.F32 S23, S24  ;calcula el valor de la hipotenusa
	VSQRT.F32 S19, S19   ;Recupera el valor A
    VSQRT.F32 S20, S20   ;Recupera el valor B
	ADD R1, #2
	B principal

triangulob
    VLDR.F32 S2, = 1
    VLDR.F32 S3, = 2	;Constante
	VLDR.F32 S4, = 0	;Numero de iteracion actual (n)
	VLDR.F32 S5, = -1	;Constante
	VLDR.F32 S6, = 50	;Cantidad de iteraciones a realizar
	VLDR.F32 S7, = 1	;Constante
	VLDR.F32 S9, = 0	;Almacena la sumatoria, es decir el total
	VLDR.F32 S11, = 1
	VLDR.F32 S13, = 0	;Constante
	VLDR.F32 S16, = 1
    BL sumatoria

sumatoria
	VADD.F32 S4, S7		;Aumentamos el numero de la iteracion
	VMUL.F32 S8, S4, S3 ;Obtenemos el valor de 2n para el denominador y lo almacenamos en S8
	VADD.F32 S8, S13	;
	VADD.F32 S15, S8, S13 ;Se almacena nuevamente el valor del denominador (2n+1) ahora en S15
	BL factorial		;Salta a la funcion de factorial
	VADD.F32 S12, S4, S13	;Se asigna el valor de n a S12 para la funcion potenciaa
	BL potenciaa
	VADD.F32 S14, S11, S13	;Se asigna a S14 la potencia del numerador
	BL potenciab
	VADD.F32 S17, S16, S13	;Se asigna a S17 la segunda potencia del numerador
	VDIV.F32 S18, S14, S2	;Se divide el numerador (-1)^n de S14 entre el factorial (2n+1)! en S2
	VMUL.F32 S18, S17	;Se multiplica la division actual por la segunda potencia
	VADD.F32 S9, S18	;Se suma el resultado actual al resultado de la iteracion actual
	VLDR.F32 S2, =1		;Se reinicia el valor de S2 a 1
	VLDR.F32 S16, =1	;Se reinicia el valor de S16 a 1
	VLDR.F32 S11, =1	;Se reinicia el valor de S11 a 1
	VCMP.F32 S4, S6		;Se compara si S4(n)=S6(iteraciones)
	VMRS APSR_nzcv, FPSCR	;Realizamos un traslado de banderas
	BNE sumatoria	;Se reinicia la funcion si no se ha cumplido la condicion de iteraciones
	VADD.F32 S9, S16 ;
	VDIV.F32 S22, S19, S9	; calcula C
	VMUL.F32 S22, S22   ;determina el valor de C^2
	VMUL.F32 S19, S19   ;determina el valor de A^2
    VSUB.F32 S24, S22, S19 ; calcula el valor de C^2-A^2
    VSQRT.F32 S23, S24  ;calcula el valor del cateto B
	VSQRT.F32 S19, S19   ;Recupera el valor A
    VSQRT.F32 S22, S22   ;Recupera el valor C
	ADD R1, #2
	B principal
	
factorial		;Determina el factorial del denominador, S2 almacena el producto, S8 decrece hasta llegar a 
	VMUL.F32 S2, S8	;Multiplicamos S2 por el factorial
	VSUB.F32 S8, S7	;Decrecemos el registro S8 en 1
	VCMP.F32 S8, S7	;Comparamos si el registro S8 ya ha llegado a 1
	VMRS APSR_nzcv, FPSCR	;Realizamos un traslado de banderas
	BNE factorial	;Si la condicion de S8=S7 no se cumple se repite la funcion factorial
	BX LR	;Se retorna a la funcion principal sumatoria
	
potenciaa	;Representa la potencia del numerador (-1)^n
	VMUL.F32 S11, S5	;Se multiplica S11(1) por S5(-1)
	VSUB.F32 S12, S7	;Se decrece S12 en 1
	VCMP.F32 S12, S13	;Se compara S12 con S13(0)
	VMRS APSR_nzcv, FPSCR	;Realizamos un traslado de banderas
	BNE potenciaa	;Si la condicion S12=13 no se cumple se repite la funcion
	BX LR	;Se retorna a la funcion principal
	
potenciab	;Representa la potencia (x)^(2n+1)
	VMUL.F32 S16, S0	;Se multiplica el valor de x por su anterior valor
	VSUB.F32 S15, S7	;Se decrece el valor de S15(2n+1) en 1
	VCMP.F32 S15, S13	;Se compara si S15 ya ha llegado a S13(0)
	VMRS APSR_nzcv, FPSCR	;Realizamos un traslado de banderas
	BNE potenciab	;Si la condicion S15=S13 no se cumple se repite la funcion
	BX LR
	
principal
    CMP R1, #1
    BEQ trianguloa

    CMP R1, #2
    BEQ triangulob

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; esta subrutina se añade para que el simulador no tire error al terminar la ejecucion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Loop
	B Loop
	
	ALIGN
	END