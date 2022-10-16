;PROBLEMA #6 SEGUNDO EXAMEN PARCIAL DE ELECTRONICA 5 FACULTAD DE INGENIERIA SEGUNDO SEMESTRE 2022 UNIVERSIDAD DE SAN CARLOS DE GUATEMALA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Escriba un programa que pueda ingresar N datos (minimo 20), y con estos datos,
; dar el resultado de la suma y su promedio
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; La sumatoria se dara en el registro S30 y el promedio en S31

	AREA codigo, CODE, READONLY, ALIGN=2
	THUMB
	EXPORT Start

;DECLARACION DE REGISTROS		
Start
    VLDR.F32 S0,  = 21          ;Especificar la cantidad de numeros a ingresar, este debera ser entre 20 y 23
	VLDR.F32 S25, = 20
	VLDR.F32 S26, = 21
	VLDR.F32 S27, = 22
	

    ; Asigne el valor para cada uno de los numeros, estos deberan ir el registro S1 hasta S20 o S23
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S1, = 50        	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S2, = 3    		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S3, = 3.8    		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S4, = 9        	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S5, = 4.98    		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S6, = 6.74    		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S7, = 4.986        	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S8, = 5.843    		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S9, = 21   		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S10, = 369        	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S11, = 45.2    		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S12, = 3.46    		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S13, = 0.689        	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S14, = 4.563    		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S15, = 19.9661        	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S16, = 47.5    		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S17, = 3.2    		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S18, = 1.4521        	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S19, = 9.463    		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S20, = 28.463        	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S21, = 4.596    		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S22, = 22    		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    VLDR.F32 S30, = 0
	B principal
	
primero
    VADD.F32 S30, S1        ;+S1
    VADD.F32 S30, S2        ;+S2
    VADD.F32 S30, S3        ;+S3
    VADD.F32 S30, S4        ;+S4
    VADD.F32 S30, S5        ;+S5
    VADD.F32 S30, S6        ;+S6
    VADD.F32 S30, S7        ;+S7
    VADD.F32 S30, S8        ;+S8
    VADD.F32 S30, S9        ;+S9
    VADD.F32 S30, S10       ;+S10
    VADD.F32 S30, S11       ;+S11
    VADD.F32 S30, S12       ;+S12
    VADD.F32 S30, S13       ;+S13
    VADD.F32 S30, S14       ;+S14
    VADD.F32 S30, S15       ;+S15
    VADD.F32 S30, S16       ;+S16
    VADD.F32 S30, S17       ;+S17
    VADD.F32 S30, S18       ;+S18
    VADD.F32 S30, S19       ;+S19
    VADD.F32 S30, S20       ;+S20
    VDIV.F32 S31, S30, S0   ;Determina el promedio
	VADD.F32 S0, S30
    B principal

segundo
    VADD.F32 S30, S1        ;+S1
    VADD.F32 S30, S2        ;+S2
    VADD.F32 S30, S3        ;+S3
    VADD.F32 S30, S4        ;+S4
    VADD.F32 S30, S5        ;+S5
    VADD.F32 S30, S6        ;+S6
    VADD.F32 S30, S7        ;+S7
    VADD.F32 S30, S8        ;+S8
    VADD.F32 S30, S9        ;+S9
    VADD.F32 S30, S10       ;+S10
    VADD.F32 S30, S11       ;+S11
    VADD.F32 S30, S12       ;+S12
    VADD.F32 S30, S13       ;+S13
    VADD.F32 S30, S14       ;+S14
    VADD.F32 S30, S15       ;+S15
    VADD.F32 S30, S16       ;+S16
    VADD.F32 S30, S17       ;+S17
    VADD.F32 S30, S18       ;+S18
    VADD.F32 S30, S19       ;+S19
    VADD.F32 S30, S20       ;+S20
    VADD.F32 S30, S21       ;+S21
    VDIV.F32 S31, S30, S0   ;Determina el promedio
	VADD.F32 S0, S30
    B principal

tercero
    VADD.F32 S30, S1        ;+S1
    VADD.F32 S30, S2        ;+S2
    VADD.F32 S30, S3        ;+S3
    VADD.F32 S30, S4        ;+S4
    VADD.F32 S30, S5        ;+S5
    VADD.F32 S30, S6        ;+S6
    VADD.F32 S30, S7        ;+S7
    VADD.F32 S30, S8        ;+S8
    VADD.F32 S30, S9        ;+S9
    VADD.F32 S30, S10       ;+S10
    VADD.F32 S30, S11       ;+S11
    VADD.F32 S30, S12       ;+S12
    VADD.F32 S30, S13       ;+S13
    VADD.F32 S30, S14       ;+S14
    VADD.F32 S30, S15       ;+S15
    VADD.F32 S30, S16       ;+S16
    VADD.F32 S30, S17       ;+S17
    VADD.F32 S30, S18       ;+S18
    VADD.F32 S30, S19       ;+S19
    VADD.F32 S30, S20       ;+S20
    VADD.F32 S30, S21       ;+S21
    VADD.F32 S30, S22       ;+S22
    VDIV.F32 S31, S30, S0   ;Determina el promedio
	VADD.F32 S0, S30
    B principal

principal

    VCMP.F32 S0, S25
	VMRS APSR_nzcv, FPSCR	;Realizamos un traslado de banderas
    BEQ primero

    VCMP.F32 S0, S26
	VMRS APSR_nzcv, FPSCR	;Realizamos un traslado de banderas
    BEQ segundo

    VCMP.F32 S0, S27
	VMRS APSR_nzcv, FPSCR	;Realizamos un traslado de banderas
    BEQ tercero

Loop
	B Loop

	ALIGN
	END