opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 7503"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 2 "G:\PIC ass\LCD Display\diano\demo_dino.c"
	psect config,class=CONFIG,delta=2 ;#
# 2 "G:\PIC ass\LCD Display\diano\demo_dino.c"
	dw 0X1F7A ;#
	FNCALL	_main,_character
	FNCALL	_main,_lcd_command
	FNCALL	_main,_start_game
	FNCALL	_main,_lcd_data
	FNCALL	_main,_dino_jump
	FNCALL	_main,_score
	FNCALL	_main,_game_over
	FNCALL	_game_over,_lcd_command
	FNCALL	_game_over,_lcd_data
	FNCALL	_game_over,_reset_game
	FNCALL	_reset_game,_lcd_command
	FNCALL	_reset_game,_lcd_data
	FNCALL	_reset_game,_main
	FNCALL	_score,_lcd_command
	FNCALL	_score,_lcd_data
	FNCALL	_dino_jump,_lcd_command
	FNCALL	_dino_jump,_lcd_data
	FNCALL	_start_game,_lcd_command
	FNCALL	_start_game,_lcd_data
	FNCALL	_character,_lcd_command
	FNCALL	_character,_lcd_data
	FNROOT	_main
	global	main@F1105
	global	main@F1107
	global	main@F1109
	global	_i
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"G:\PIC ass\LCD Display\diano\demo_dino.c"
	line	48

;initializer for main@F1105
	retlw	03h
	retlw	02h
	retlw	013h
	retlw	016h
	retlw	01Eh
	retlw	0Eh
	retlw	0Ah
	retlw	0Ah
	line	50

;initializer for main@F1107
	retlw	0Eh
	retlw	0Eh
	retlw	04h
	retlw	01Eh
	retlw	04h
	retlw	04h
	retlw	01Eh
	retlw	0
	line	52

;initializer for main@F1109
	retlw	014h
	retlw	014h
	retlw	015h
	retlw	015h
	retlw	01Dh
	retlw	06h
	retlw	04h
	retlw	01Fh
psect	idataCOMMON,class=CODE,space=0,delta=2
global __pidataCOMMON
__pidataCOMMON:
	line	13

;initializer for _i
	retlw	0FFh
	retlw	0FFh

	global	main@F1111
	global	_c
	global	_j
	global	_PORTD
_PORTD	set	8
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_RC4
_RC4	set	60
	global	_T1CKPS0
_T1CKPS0	set	132
	global	_T1CKPS1
_T1CKPS1	set	133
	global	_TMR1CS
_TMR1CS	set	129
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR1ON
_TMR1ON	set	128
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_5:	
	retlw	32	;' '
	retlw	32	;' '
	retlw	82	;'R'
	retlw	69	;'E'
	retlw	83	;'S'
	retlw	84	;'T'
	retlw	65	;'A'
	retlw	82	;'R'
	retlw	84	;'T'
	retlw	32	;' '
	retlw	71	;'G'
	retlw	65	;'A'
	retlw	77	;'M'
	retlw	69	;'E'
	retlw	32	;' '
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_4:	
	retlw	32	;' '
	retlw	32	;' '
	retlw	83	;'S'
	retlw	84	;'T'
	retlw	65	;'A'
	retlw	82	;'R'
	retlw	84	;'T'
	retlw	32	;' '
	retlw	71	;'G'
	retlw	65	;'A'
	retlw	77	;'M'
	retlw	69	;'E'
	retlw	32	;' '
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_3:	
	retlw	32	;' '
	retlw	32	;' '
	retlw	71	;'G'
	retlw	65	;'A'
	retlw	77	;'M'
	retlw	69	;'E'
	retlw	32	;' '
	retlw	79	;'O'
	retlw	86	;'V'
	retlw	69	;'E'
	retlw	82	;'R'
	retlw	32	;' '
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_1:	
	retlw	48	;'0'
	retlw	49	;'1'
	retlw	50	;'2'
	retlw	51	;'3'
	retlw	52	;'4'
	retlw	53	;'5'
	retlw	54	;'6'
	retlw	55	;'7'
	retlw	56	;'8'
	retlw	57	;'9'
	retlw	0
psect	strings
	
STR_2:	
	retlw	115	;'s'
	retlw	99	;'c'
	retlw	111	;'o'
	retlw	114	;'r'
	retlw	101	;'e'
	retlw	32	;' '
	retlw	58	;':'
	retlw	32	;' '
	retlw	0
psect	strings
	file	"demo_dino.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataCOMMON,class=COMMON,space=1
global __pdataCOMMON
__pdataCOMMON:
	file	"G:\PIC ass\LCD Display\diano\demo_dino.c"
_i:
       ds      2

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
main@F1111:
       ds      8

_c:
       ds      2

_j:
       ds      2

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"G:\PIC ass\LCD Display\diano\demo_dino.c"
	line	48
main@F1105:
       ds      8

psect	dataBANK0
	file	"G:\PIC ass\LCD Display\diano\demo_dino.c"
	line	50
main@F1107:
       ds      8

psect	dataBANK0
	file	"G:\PIC ass\LCD Display\diano\demo_dino.c"
	line	52
main@F1109:
       ds      8

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
	clrf	((__pbssBANK0)+8)&07Fh
	clrf	((__pbssBANK0)+9)&07Fh
	clrf	((__pbssBANK0)+10)&07Fh
	clrf	((__pbssBANK0)+11)&07Fh
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+24)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
; Initialize objects allocated to COMMON
	global __pidataCOMMON
psect cinit,class=CODE,delta=2
	fcall	__pidataCOMMON+0		;fetch initializer
	movwf	__pdataCOMMON+0&07fh		
	fcall	__pidataCOMMON+1		;fetch initializer
	movwf	__pdataCOMMON+1&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_start_game
?_start_game:	; 0 bytes @ 0x0
	global	?_score
?_score:	; 0 bytes @ 0x0
	global	?_game_over
?_game_over:	; 0 bytes @ 0x0
	global	?_reset_game
?_reset_game:	; 0 bytes @ 0x0
	global	?_lcd_command
?_lcd_command:	; 0 bytes @ 0x0
	global	??_lcd_command
??_lcd_command:	; 0 bytes @ 0x0
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x0
	global	?_dino_jump
?_dino_jump:	; 2 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	ds	2
	global	lcd_command@data
lcd_command@data:	; 1 bytes @ 0x2
	global	lcd_data@data1
lcd_data@data1:	; 1 bytes @ 0x2
	ds	1
	global	??_start_game
??_start_game:	; 0 bytes @ 0x3
	global	??_dino_jump
??_dino_jump:	; 0 bytes @ 0x3
	global	??_score
??_score:	; 0 bytes @ 0x3
	global	??_reset_game
??_reset_game:	; 0 bytes @ 0x3
	global	?_character
?_character:	; 0 bytes @ 0x3
	global	character@location
character@location:	; 1 bytes @ 0x3
	ds	1
	global	??_character
??_character:	; 0 bytes @ 0x4
	ds	2
	global	character@obj
character@obj:	; 1 bytes @ 0x6
	global	score@name
score@name:	; 1 bytes @ 0x6
	global	start_game@start
start_game@start:	; 1 bytes @ 0x6
	global	reset_game@reset
reset_game@reset:	; 1 bytes @ 0x6
	ds	1
	global	score@num
score@num:	; 1 bytes @ 0x7
	global	character@i
character@i:	; 2 bytes @ 0x7
	global	start_game@i
start_game@i:	; 2 bytes @ 0x7
	global	reset_game@i
reset_game@i:	; 2 bytes @ 0x7
	ds	1
	global	score@j
score@j:	; 2 bytes @ 0x8
	ds	1
	global	??_game_over
??_game_over:	; 0 bytes @ 0x9
	ds	3
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	game_over@stop
game_over@stop:	; 1 bytes @ 0x0
	ds	1
	global	game_over@i
game_over@i:	; 2 bytes @ 0x1
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x3
	ds	4
	global	main@arr
main@arr:	; 8 bytes @ 0x7
	ds	8
	global	main@arr1
main@arr1:	; 8 bytes @ 0xF
	ds	8
	global	main@arr2
main@arr2:	; 8 bytes @ 0x17
	ds	8
	global	main@arr3
main@arr3:	; 8 bytes @ 0x1F
	ds	8
	global	main@i
main@i:	; 2 bytes @ 0x27
	ds	2
;;Data sizes: Strings 66, constant 0, data 26, bss 12, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      14
;; BANK0           80     41      77
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_dino_jump	int  size(1) Largest target is 0
;;
;; reset_game@reset	PTR unsigned char  size(1) Largest target is 17
;;		 -> STR_5(CODE[17]), 
;;
;; start_game@start	PTR unsigned char  size(1) Largest target is 15
;;		 -> STR_4(CODE[15]), 
;;
;; game_over@stop	PTR unsigned char  size(1) Largest target is 14
;;		 -> STR_3(CODE[14]), 
;;
;; score@name	PTR unsigned char  size(1) Largest target is 9
;;		 -> STR_2(CODE[9]), 
;;
;; score@num	PTR unsigned char  size(1) Largest target is 11
;;		 -> STR_1(CODE[11]), 
;;
;; character@obj	PTR unsigned char  size(1) Largest target is 8
;;		 -> main@arr3(BANK0[8]), main@arr2(BANK0[8]), main@arr1(BANK0[8]), main@arr(BANK0[8]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_game_over
;;   _game_over->_reset_game
;;   _reset_game->_lcd_command
;;   _reset_game->_lcd_data
;;   _score->_lcd_command
;;   _score->_lcd_data
;;   _dino_jump->_lcd_command
;;   _dino_jump->_lcd_data
;;   _start_game->_lcd_command
;;   _start_game->_lcd_data
;;   _character->_lcd_command
;;   _character->_lcd_data
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_game_over
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 4, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                38    38      0    1023
;;                                              3 BANK0     38    38      0
;;                          _character
;;                        _lcd_command
;;                         _start_game
;;                           _lcd_data
;;                          _dino_jump
;;                              _score
;;                          _game_over
;; ---------------------------------------------------------------------------------
;; (1) _game_over                                            6     6      0     367
;;                                              9 COMMON     3     3      0
;;                                              0 BANK0      3     3      0
;;                        _lcd_command
;;                           _lcd_data
;;                         _reset_game
;; ---------------------------------------------------------------------------------
;; (2) _reset_game                                           6     6      0     232
;;                                              3 COMMON     6     6      0
;;                        _lcd_command
;;                           _lcd_data
;;                               _main
;; ---------------------------------------------------------------------------------
;; (1) _score                                                7     7      0     180
;;                                              3 COMMON     7     7      0
;;                        _lcd_command
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _dino_jump                                            0     0      0      44
;;                        _lcd_command
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _start_game                                           6     6      0     135
;;                                              3 COMMON     6     6      0
;;                        _lcd_command
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _character                                            6     5      1     156
;;                                              3 COMMON     6     5      1
;;                        _lcd_command
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (3) _lcd_data                                             3     3      0      22
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (3) _lcd_command                                          3     3      0      22
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _character
;;     _lcd_command
;;     _lcd_data
;;   _lcd_command
;;   _start_game
;;     _lcd_command
;;     _lcd_data
;;   _lcd_data
;;   _dino_jump
;;     _lcd_command
;;     _lcd_data
;;   _score
;;     _lcd_command
;;     _lcd_data
;;   _game_over
;;     _lcd_command
;;     _lcd_data
;;     _reset_game
;;       _lcd_command
;;       _lcd_data
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      5E      12        0.0%
;;ABS                  0      0      5B       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               50     29      4D       5       96.3%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      C       E       1      100.0%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 43 in file "G:\PIC ass\LCD Display\diano\demo_dino.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  arr3            8   31[BANK0 ] unsigned char [8]
;;  arr2            8   23[BANK0 ] unsigned char [8]
;;  arr1            8   15[BANK0 ] unsigned char [8]
;;  arr             8    7[BANK0 ] unsigned char [8]
;;  i               2   39[BANK0 ] int 
;; Return value:  Size  Location     Type
;;                  2  713[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0      34       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      38       0       0       0
;;Total ram usage:       38 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_character
;;		_lcd_command
;;		_start_game
;;		_lcd_data
;;		_dino_jump
;;		_score
;;		_game_over
;; This function is called by:
;;		_reset_game
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"G:\PIC ass\LCD Display\diano\demo_dino.c"
	line	43
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [allreg]
	line	44
	
l2261:	
;demo_dino.c: 44: TRISC = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	45
;demo_dino.c: 45: TRISD = 0;
	clrf	(136)^080h	;volatile
	line	46
	
l2263:	
;demo_dino.c: 46: TRISC3 = 1;
	bsf	(1083/8)^080h,(1083)&7
	line	47
	
l2265:	
;demo_dino.c: 47: TRISC4 =1;
	bsf	(1084/8)^080h,(1084)&7
	line	48
	
l2267:	
;demo_dino.c: 48: char arr[8]={0x03,0x02,0x13,0x16,0x1E,0x0E,0x0A,0x0A};
	movlw	(main@arr)&0ffh
	movwf	fsr0
	movlw	low(main@F1105)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	8
	movwf	((??_main+0)+0+2)
u2520:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u2520
	line	49
	
l2269:	
;demo_dino.c: 49: character(arr,0);
	clrf	(?_character)
	movlw	(main@arr)&0ffh
	fcall	_character
	line	50
	
l2271:	
;demo_dino.c: 50: char arr1[8]={0x0E,0x0E,0x04,0x1E,0x04,0x04,0x1E,0x00};
	movlw	(main@arr1)&0ffh
	movwf	fsr0
	movlw	low(main@F1107)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	8
	movwf	((??_main+0)+0+2)
u2530:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u2530
	line	51
	
l2273:	
;demo_dino.c: 51: character(arr1,1);
	clrf	(?_character)
	bsf	status,0
	rlf	(?_character),f
	movlw	(main@arr1)&0ffh
	fcall	_character
	line	52
	
l2275:	
;demo_dino.c: 52: char arr2[8]={0x14,0x14,0x15,0x15,0x1D,0x06,0X04,0x1F};
	movlw	(main@arr2)&0ffh
	movwf	fsr0
	movlw	low(main@F1109)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	8
	movwf	((??_main+0)+0+2)
u2540:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u2540
	line	53
	
l2277:	
;demo_dino.c: 53: character(arr2,2);
	movlw	(02h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_character)
	movlw	(main@arr2)&0ffh
	fcall	_character
	line	54
	
l2279:	
;demo_dino.c: 54: char arr3[8]={0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
	movlw	(main@arr3)&0ffh
	movwf	fsr0
	movlw	low(main@F1111)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	8
	movwf	((??_main+0)+0+2)
u2550:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u2550
	line	55
	
l2281:	
;demo_dino.c: 55: character(arr3,3);
	movlw	(03h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_character)
	movlw	(main@arr3)&0ffh
	fcall	_character
	line	56
	
l2283:	
;demo_dino.c: 56: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	57
	
l2285:	
;demo_dino.c: 57: lcd_command(0x0C);
	movlw	(0Ch)
	fcall	_lcd_command
	line	58
	
l2287:	
;demo_dino.c: 58: lcd_command(0x38);
	movlw	(038h)
	fcall	_lcd_command
	line	59
	
l2289:	
;demo_dino.c: 59: start_game();
	fcall	_start_game
	line	60
	
l2291:	
;demo_dino.c: 60: lcd_command(0xc0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	61
	
l2293:	
;demo_dino.c: 61: lcd_data(0);
	movlw	(0)
	fcall	_lcd_data
	line	62
	
l2295:	
;demo_dino.c: 62: lcd_command(0xcf);
	movlw	(0CFh)
	fcall	_lcd_command
	line	63
	
l2297:	
;demo_dino.c: 63: lcd_data(2);
	movlw	(02h)
	fcall	_lcd_data
	line	64
	
l2299:	
;demo_dino.c: 64: int i=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@i)
	clrf	(main@i+1)
	line	65
	
l2301:	
;demo_dino.c: 65: _delay((unsigned long)((200)*(20000000/4000.0)));
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	14
movwf	((??_main+0)+0+1),f
	movlw	176
movwf	((??_main+0)+0),f
u2617:
	decfsz	((??_main+0)+0),f
	goto	u2617
	decfsz	((??_main+0)+0+1),f
	goto	u2617
	decfsz	((??_main+0)+0+2),f
	goto	u2617
opt asmopt_on

	line	66
	
l2303:	
;demo_dino.c: 66: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	goto	l2305
	line	67
;demo_dino.c: 67: while(1)
	
l722:	
	line	70
	
l2305:	
;demo_dino.c: 68: {
;demo_dino.c: 70: if(RC3 == 1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(59/8),(59)&7
	goto	u2561
	goto	u2560
u2561:
	goto	l2309
u2560:
	line	72
	
l2307:	
;demo_dino.c: 71: {
;demo_dino.c: 72: dino_jump();
	fcall	_dino_jump
	goto	l2309
	line	73
	
l723:	
	line	74
	
l2309:	
;demo_dino.c: 73: }
;demo_dino.c: 74: score();
	fcall	_score
	line	75
	
l2311:	
;demo_dino.c: 75: lcd_data(3);
	movlw	(03h)
	fcall	_lcd_data
	line	76
	
l2313:	
;demo_dino.c: 76: lcd_command(0xcf - c);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	decf	(_c),w
	xorlw	0ffh
	addlw	0CFh
	fcall	_lcd_command
	line	77
	
l2315:	
;demo_dino.c: 77: lcd_data(3);
	movlw	(03h)
	fcall	_lcd_data
	line	78
	
l2317:	
;demo_dino.c: 78: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	136
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u2627:
	decfsz	((??_main+0)+0),f
	goto	u2627
	decfsz	((??_main+0)+0+1),f
	goto	u2627
	decfsz	((??_main+0)+0+2),f
	goto	u2627
opt asmopt_on

	line	79
	
l2319:	
;demo_dino.c: 79: lcd_data(3);
	movlw	(03h)
	fcall	_lcd_data
	line	80
	
l2321:	
;demo_dino.c: 80: lcd_command(0xcf - c);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	decf	(_c),w
	xorlw	0ffh
	addlw	0CFh
	fcall	_lcd_command
	line	81
	
l2323:	
;demo_dino.c: 81: lcd_data(2);
	movlw	(02h)
	fcall	_lcd_data
	line	82
	
l2325:	
;demo_dino.c: 82: c++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_c),f
	skipnc
	incf	(_c+1),f
	movlw	high(01h)
	addwf	(_c+1),f
	line	83
	
l2327:	
;demo_dino.c: 83: if(RC3 == 1)
	btfss	(59/8),(59)&7
	goto	u2571
	goto	u2570
u2571:
	goto	l2331
u2570:
	line	84
	
l2329:	
;demo_dino.c: 84: dino_jump();
	fcall	_dino_jump
	goto	l2331
	
l724:	
	line	85
	
l2331:	
;demo_dino.c: 85: if(c>15 && RC3 == 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_c+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(010h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2585
	movlw	low(010h)
	subwf	(_c),w
u2585:

	skipc
	goto	u2581
	goto	u2580
u2581:
	goto	l2337
u2580:
	
l2333:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(59/8),(59)&7
	goto	u2591
	goto	u2590
u2591:
	goto	l2337
u2590:
	line	87
	
l2335:	
;demo_dino.c: 86: {
;demo_dino.c: 87: game_over();
	fcall	_game_over
	goto	l2337
	line	88
	
l725:	
	line	89
	
l2337:	
;demo_dino.c: 88: }
;demo_dino.c: 89: if(c>15)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_c+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(010h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2605
	movlw	low(010h)
	subwf	(_c),w
u2605:

	skipc
	goto	u2601
	goto	u2600
u2601:
	goto	l2305
u2600:
	line	91
	
l2339:	
;demo_dino.c: 90: {
;demo_dino.c: 91: lcd_command(0xc0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	92
;demo_dino.c: 92: lcd_data(3);
	movlw	(03h)
	fcall	_lcd_data
	line	93
	
l2341:	
;demo_dino.c: 93: c=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_c)
	clrf	(_c+1)
	line	94
	
l2343:	
;demo_dino.c: 94: lcd_command(0xc0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	95
	
l2345:	
;demo_dino.c: 95: lcd_data(0);
	movlw	(0)
	fcall	_lcd_data
	goto	l2305
	line	96
	
l726:	
	goto	l2305
	line	99
	
l727:	
	line	67
	goto	l2305
	
l728:	
	line	100
	
l729:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_game_over
psect	text207,local,class=CODE,delta=2
global __ptext207
__ptext207:

;; *************** function _game_over *****************
;; Defined at:
;;		line 135 in file "G:\PIC ass\LCD Display\diano\demo_dino.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    1[BANK0 ] int 
;;  stop            1    0[BANK0 ] PTR unsigned char 
;;		 -> STR_3(14), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       3       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_command
;;		_lcd_data
;;		_reset_game
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text207
	file	"G:\PIC ass\LCD Display\diano\demo_dino.c"
	line	135
	global	__size_of_game_over
	__size_of_game_over	equ	__end_of_game_over-_game_over
	
_game_over:	
	opt	stack 5
; Regs used in _game_over: [allreg]
	line	136
	
l2241:	
;demo_dino.c: 136: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	137
;demo_dino.c: 137: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	138
	
l2243:	
;demo_dino.c: 138: char *stop="  GAME OVER  ";
	movlw	((STR_3-__stringbase))&0ffh
	movwf	(??_game_over+0)+0
	movf	(??_game_over+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(game_over@stop)
	line	139
	
l2245:	
;demo_dino.c: 139: for(int i=0;i<14;i++)
	clrf	(game_over@i)
	clrf	(game_over@i+1)
	
l2247:	
	movf	(game_over@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Eh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2505
	movlw	low(0Eh)
	subwf	(game_over@i),w
u2505:

	skipc
	goto	u2501
	goto	u2500
u2501:
	goto	l2251
u2500:
	goto	l2259
	
l2249:	
	goto	l2259
	line	140
	
l742:	
	line	141
	
l2251:	
;demo_dino.c: 140: {
;demo_dino.c: 141: lcd_data(stop[i]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(game_over@i),w
	addwf	(game_over@stop),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	142
	
l2253:	
;demo_dino.c: 142: _delay((unsigned long)((300)*(20000000/4000.0)));
	opt asmopt_off
movlw  8
movwf	((??_game_over+0)+0+2),f
movlw	150
movwf	((??_game_over+0)+0+1),f
	movlw	9
movwf	((??_game_over+0)+0),f
u2637:
	decfsz	((??_game_over+0)+0),f
	goto	u2637
	decfsz	((??_game_over+0)+0+1),f
	goto	u2637
	decfsz	((??_game_over+0)+0+2),f
	goto	u2637
	clrwdt
opt asmopt_on

	line	139
	
l2255:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(game_over@i),f
	skipnc
	incf	(game_over@i+1),f
	movlw	high(01h)
	addwf	(game_over@i+1),f
	
l2257:	
	movf	(game_over@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Eh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2515
	movlw	low(0Eh)
	subwf	(game_over@i),w
u2515:

	skipc
	goto	u2511
	goto	u2510
u2511:
	goto	l2251
u2510:
	goto	l2259
	
l743:	
	line	144
	
l2259:	
;demo_dino.c: 143: }
;demo_dino.c: 144: reset_game();
	fcall	_reset_game
	line	145
	
l744:	
	return
	opt stack 0
GLOBAL	__end_of_game_over
	__end_of_game_over:
;; =============== function _game_over ends ============

	signat	_game_over,88
	global	_reset_game
psect	text208,local,class=CODE,delta=2
global __ptext208
__ptext208:

;; *************** function _reset_game *****************
;; Defined at:
;;		line 158 in file "G:\PIC ass\LCD Display\diano\demo_dino.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    7[COMMON] int 
;;  reset           1    6[COMMON] PTR unsigned char 
;;		 -> STR_5(17), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_command
;;		_lcd_data
;;		_main
;; This function is called by:
;;		_game_over
;; This function uses a non-reentrant model
;;
psect	text208
	file	"G:\PIC ass\LCD Display\diano\demo_dino.c"
	line	158
	global	__size_of_reset_game
	__size_of_reset_game	equ	__end_of_reset_game-_reset_game
	
_reset_game:	
	opt	stack 5
; Regs used in _reset_game: [allreg]
	line	160
	
l2215:	
;demo_dino.c: 160: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	161
;demo_dino.c: 161: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	162
	
l2217:	
;demo_dino.c: 162: char *reset="  RESTART GAME  ";
	movlw	((STR_5-__stringbase))&0ffh
	movwf	(??_reset_game+0)+0
	movf	(??_reset_game+0)+0,w
	movwf	(reset_game@reset)
	line	163
	
l2219:	
;demo_dino.c: 163: for(int i=0;i<16;i++)
	clrf	(reset_game@i)
	clrf	(reset_game@i+1)
	
l2221:	
	movf	(reset_game@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(010h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2475
	movlw	low(010h)
	subwf	(reset_game@i),w
u2475:

	skipc
	goto	u2471
	goto	u2470
u2471:
	goto	l2225
u2470:
	goto	l754
	
l2223:	
	goto	l754
	line	164
	
l752:	
	line	165
	
l2225:	
;demo_dino.c: 164: {
;demo_dino.c: 165: lcd_data(reset[i]);
	movf	(reset_game@i),w
	addwf	(reset_game@reset),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	166
	
l2227:	
;demo_dino.c: 166: _delay((unsigned long)((300)*(20000000/4000.0)));
	opt asmopt_off
movlw  8
movwf	((??_reset_game+0)+0+2),f
movlw	150
movwf	((??_reset_game+0)+0+1),f
	movlw	9
movwf	((??_reset_game+0)+0),f
u2647:
	decfsz	((??_reset_game+0)+0),f
	goto	u2647
	decfsz	((??_reset_game+0)+0+1),f
	goto	u2647
	decfsz	((??_reset_game+0)+0+2),f
	goto	u2647
	clrwdt
opt asmopt_on

	line	163
	
l2229:	
	movlw	low(01h)
	addwf	(reset_game@i),f
	skipnc
	incf	(reset_game@i+1),f
	movlw	high(01h)
	addwf	(reset_game@i+1),f
	
l2231:	
	movf	(reset_game@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(010h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2485
	movlw	low(010h)
	subwf	(reset_game@i),w
u2485:

	skipc
	goto	u2481
	goto	u2480
u2481:
	goto	l2225
u2480:
	goto	l754
	
l753:	
	line	168
;demo_dino.c: 167: }
;demo_dino.c: 168: while(1)
	
l754:	
	line	170
;demo_dino.c: 169: {
;demo_dino.c: 170: if(RC4==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(60/8),(60)&7
	goto	u2491
	goto	u2490
u2491:
	goto	l754
u2490:
	line	172
	
l2233:	
;demo_dino.c: 171: {
;demo_dino.c: 172: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	173
	
l2235:	
;demo_dino.c: 173: c=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_c)
	clrf	(_c+1)
	line	174
	
l2237:	
;demo_dino.c: 174: i=0;
	clrf	(_i)
	clrf	(_i+1)
	line	176
	
l2239:	
;demo_dino.c: 176: main();
	fcall	_main
	goto	l754
	line	177
	
l755:	
	goto	l754
	line	178
	
l756:	
	line	168
	goto	l754
	
l757:	
	line	179
	
l758:	
	return
	opt stack 0
GLOBAL	__end_of_reset_game
	__end_of_reset_game:
;; =============== function _reset_game ends ============

	signat	_reset_game,88
	global	_score
psect	text209,local,class=CODE,delta=2
global __ptext209
__ptext209:

;; *************** function _score *****************
;; Defined at:
;;		line 102 in file "G:\PIC ass\LCD Display\diano\demo_dino.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               2    8[COMMON] int 
;;  num             1    7[COMMON] PTR unsigned char 
;;		 -> STR_1(11), 
;;  name            1    6[COMMON] PTR unsigned char 
;;		 -> STR_2(9), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_command
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text209
	file	"G:\PIC ass\LCD Display\diano\demo_dino.c"
	line	102
	global	__size_of_score
	__size_of_score	equ	__end_of_score-_score
	
_score:	
	opt	stack 6
; Regs used in _score: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	103
	
l2181:	
;demo_dino.c: 103: char *num="0123456789";
	movlw	((STR_1-__stringbase))&0ffh
	movwf	(??_score+0)+0
	movf	(??_score+0)+0,w
	movwf	(score@num)
	line	104
;demo_dino.c: 104: char *name="score : ";
	movlw	((STR_2-__stringbase))&0ffh
	movwf	(??_score+0)+0
	movf	(??_score+0)+0,w
	movwf	(score@name)
	line	105
	
l2183:	
;demo_dino.c: 105: lcd_command(0x82);
	movlw	(082h)
	fcall	_lcd_command
	line	106
	
l2185:	
;demo_dino.c: 106: for(int j=0;j<7;j++)
	clrf	(score@j)
	clrf	(score@j+1)
	
l2187:	
	movf	(score@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2435
	movlw	low(07h)
	subwf	(score@j),w
u2435:

	skipc
	goto	u2431
	goto	u2430
u2431:
	goto	l2191
u2430:
	goto	l2197
	
l2189:	
	goto	l2197
	line	107
	
l732:	
	
l2191:	
;demo_dino.c: 107: lcd_data(name[j]);
	movf	(score@j),w
	addwf	(score@name),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	106
	
l2193:	
	movlw	low(01h)
	addwf	(score@j),f
	skipnc
	incf	(score@j+1),f
	movlw	high(01h)
	addwf	(score@j+1),f
	
l2195:	
	movf	(score@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2445
	movlw	low(07h)
	subwf	(score@j),w
u2445:

	skipc
	goto	u2441
	goto	u2440
u2441:
	goto	l2191
u2440:
	goto	l2197
	
l733:	
	line	108
	
l2197:	
;demo_dino.c: 108: lcd_command(0x8A);
	movlw	(08Ah)
	fcall	_lcd_command
	line	109
	
l2199:	
;demo_dino.c: 109: lcd_data(num[j]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_j),w
	addwf	(score@num),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	110
	
l2201:	
;demo_dino.c: 110: lcd_command(0x8B);
	movlw	(08Bh)
	fcall	_lcd_command
	line	111
;demo_dino.c: 111: lcd_data(num[i]);
	movf	(_i),w
	addwf	(score@num),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	112
	
l2203:	
;demo_dino.c: 112: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_score+0)+0+2),f
movlw	136
movwf	((??_score+0)+0+1),f
	movlw	86
movwf	((??_score+0)+0),f
u2657:
	decfsz	((??_score+0)+0),f
	goto	u2657
	decfsz	((??_score+0)+0+1),f
	goto	u2657
	decfsz	((??_score+0)+0+2),f
	goto	u2657
opt asmopt_on

	line	113
	
l2205:	
;demo_dino.c: 113: if(i>10)
	movf	(_i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Bh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2455
	movlw	low(0Bh)
	subwf	(_i),w
u2455:

	skipc
	goto	u2451
	goto	u2450
u2451:
	goto	l736
u2450:
	line	115
	
l2207:	
;demo_dino.c: 114: {
;demo_dino.c: 115: i=0;
	clrf	(_i)
	clrf	(_i+1)
	line	116
	
l2209:	
;demo_dino.c: 116: j++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_j),f
	skipnc
	incf	(_j+1),f
	movlw	high(01h)
	addwf	(_j+1),f
	line	117
	
l2211:	
;demo_dino.c: 117: if(j==9)
	movlw	09h
	xorwf	(_j),w
	iorwf	(_j+1),w
	skipz
	goto	u2461
	goto	u2460
u2461:
	goto	l736
u2460:
	line	118
	
l2213:	
;demo_dino.c: 118: j=0;
	clrf	(_j)
	clrf	(_j+1)
	goto	l736
	
l735:	
	goto	l736
	line	119
	
l734:	
	line	120
	
l736:	
	return
	opt stack 0
GLOBAL	__end_of_score
	__end_of_score:
;; =============== function _score ends ============

	signat	_score,88
	global	_dino_jump
psect	text210,local,class=CODE,delta=2
global __ptext210
__ptext210:

;; *************** function _dino_jump *****************
;; Defined at:
;;		line 122 in file "G:\PIC ass\LCD Display\diano\demo_dino.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  694[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_command
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text210
	file	"G:\PIC ass\LCD Display\diano\demo_dino.c"
	line	122
	global	__size_of_dino_jump
	__size_of_dino_jump	equ	__end_of_dino_jump-_dino_jump
	
_dino_jump:	
	opt	stack 6
; Regs used in _dino_jump: [wreg+status,2+status,0+pclath+cstack]
	line	123
	
l2175:	
;demo_dino.c: 123: lcd_command(0xc0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	124
;demo_dino.c: 124: lcd_data(3);
	movlw	(03h)
	fcall	_lcd_data
	line	125
;demo_dino.c: 125: lcd_command(0x81);
	movlw	(081h)
	fcall	_lcd_command
	line	126
;demo_dino.c: 126: lcd_data(1);
	movlw	(01h)
	fcall	_lcd_data
	line	127
;demo_dino.c: 127: lcd_command(0x81);
	movlw	(081h)
	fcall	_lcd_command
	line	128
;demo_dino.c: 128: lcd_data(3);
	movlw	(03h)
	fcall	_lcd_data
	line	129
;demo_dino.c: 129: lcd_command(0xc0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	130
;demo_dino.c: 130: lcd_data(0);
	movlw	(0)
	fcall	_lcd_data
	line	131
	
l2177:	
;demo_dino.c: 131: return(i++);
;	Return value of _dino_jump is never used
	movlw	low(01h)
	addwf	(_i),f
	skipnc
	incf	(_i+1),f
	movlw	high(01h)
	addwf	(_i+1),f
	goto	l739
	
l2179:	
	line	133
	
l739:	
	return
	opt stack 0
GLOBAL	__end_of_dino_jump
	__end_of_dino_jump:
;; =============== function _dino_jump ends ============

	signat	_dino_jump,90
	global	_start_game
psect	text211,local,class=CODE,delta=2
global __ptext211
__ptext211:

;; *************** function _start_game *****************
;; Defined at:
;;		line 147 in file "G:\PIC ass\LCD Display\diano\demo_dino.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    7[COMMON] int 
;;  start           1    6[COMMON] PTR unsigned char 
;;		 -> STR_4(15), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_command
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text211
	file	"G:\PIC ass\LCD Display\diano\demo_dino.c"
	line	147
	global	__size_of_start_game
	__size_of_start_game	equ	__end_of_start_game-_start_game
	
_start_game:	
	opt	stack 6
; Regs used in _start_game: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	148
	
l2157:	
;demo_dino.c: 148: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	149
;demo_dino.c: 149: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	150
	
l2159:	
;demo_dino.c: 150: char *start="  START GAME  ";
	movlw	((STR_4-__stringbase))&0ffh
	movwf	(??_start_game+0)+0
	movf	(??_start_game+0)+0,w
	movwf	(start_game@start)
	line	151
	
l2161:	
;demo_dino.c: 151: for(int i=0;i<14;i++)
	clrf	(start_game@i)
	clrf	(start_game@i+1)
	
l2163:	
	movf	(start_game@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Eh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2415
	movlw	low(0Eh)
	subwf	(start_game@i),w
u2415:

	skipc
	goto	u2411
	goto	u2410
u2411:
	goto	l2167
u2410:
	goto	l749
	
l2165:	
	goto	l749
	line	152
	
l747:	
	line	153
	
l2167:	
;demo_dino.c: 152: {
;demo_dino.c: 153: lcd_data(start[i]);
	movf	(start_game@i),w
	addwf	(start_game@start),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	154
	
l2169:	
;demo_dino.c: 154: _delay((unsigned long)((300)*(20000000/4000.0)));
	opt asmopt_off
movlw  8
movwf	((??_start_game+0)+0+2),f
movlw	150
movwf	((??_start_game+0)+0+1),f
	movlw	9
movwf	((??_start_game+0)+0),f
u2667:
	decfsz	((??_start_game+0)+0),f
	goto	u2667
	decfsz	((??_start_game+0)+0+1),f
	goto	u2667
	decfsz	((??_start_game+0)+0+2),f
	goto	u2667
	clrwdt
opt asmopt_on

	line	151
	
l2171:	
	movlw	low(01h)
	addwf	(start_game@i),f
	skipnc
	incf	(start_game@i+1),f
	movlw	high(01h)
	addwf	(start_game@i+1),f
	
l2173:	
	movf	(start_game@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Eh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2425
	movlw	low(0Eh)
	subwf	(start_game@i),w
u2425:

	skipc
	goto	u2421
	goto	u2420
u2421:
	goto	l2167
u2420:
	goto	l749
	
l748:	
	line	156
	
l749:	
	return
	opt stack 0
GLOBAL	__end_of_start_game
	__end_of_start_game:
;; =============== function _start_game ends ============

	signat	_start_game,88
	global	_character
psect	text212,local,class=CODE,delta=2
global __ptext212
__ptext212:

;; *************** function _character *****************
;; Defined at:
;;		line 35 in file "G:\PIC ass\LCD Display\diano\demo_dino.c"
;; Parameters:    Size  Location     Type
;;  obj             1    wreg     PTR unsigned char 
;;		 -> main@arr3(8), main@arr2(8), main@arr1(8), main@arr(8), 
;;  location        1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  obj             1    6[COMMON] PTR unsigned char 
;;		 -> main@arr3(8), main@arr2(8), main@arr1(8), main@arr(8), 
;;  i               2    7[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_command
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text212
	file	"G:\PIC ass\LCD Display\diano\demo_dino.c"
	line	35
	global	__size_of_character
	__size_of_character	equ	__end_of_character-_character
	
_character:	
	opt	stack 6
; Regs used in _character: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;character@obj stored from wreg
	movwf	(character@obj)
	line	36
	
l2139:	
;demo_dino.c: 36: lcd_command(0x40+location*8);
	movf	(character@location),w
	movwf	(??_character+0)+0
	movlw	(03h)-1
u2385:
	clrc
	rlf	(??_character+0)+0,f
	addlw	-1
	skipz
	goto	u2385
	clrc
	rlf	(??_character+0)+0,w
	addlw	040h
	fcall	_lcd_command
	line	37
	
l2141:	
;demo_dino.c: 37: _delay((unsigned long)((20)*(20000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_character+0)+0+1),f
	movlw	221
movwf	((??_character+0)+0),f
u2677:
	decfsz	((??_character+0)+0),f
	goto	u2677
	decfsz	((??_character+0)+0+1),f
	goto	u2677
	nop2
opt asmopt_on

	line	38
	
l2143:	
;demo_dino.c: 38: for(int i=0;i<8;i++)
	clrf	(character@i)
	clrf	(character@i+1)
	
l2145:	
	movf	(character@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2395
	movlw	low(08h)
	subwf	(character@i),w
u2395:

	skipc
	goto	u2391
	goto	u2390
u2391:
	goto	l2149
u2390:
	goto	l2155
	
l2147:	
	goto	l2155
	line	39
	
l709:	
	
l2149:	
;demo_dino.c: 39: lcd_data(obj[i]);
	movf	(character@i),w
	addwf	(character@obj),w
	movwf	(??_character+0)+0
	movf	0+(??_character+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_lcd_data
	line	38
	
l2151:	
	movlw	low(01h)
	addwf	(character@i),f
	skipnc
	incf	(character@i+1),f
	movlw	high(01h)
	addwf	(character@i+1),f
	
l2153:	
	movf	(character@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2405
	movlw	low(08h)
	subwf	(character@i),w
u2405:

	skipc
	goto	u2401
	goto	u2400
u2401:
	goto	l2149
u2400:
	goto	l2155
	
l710:	
	line	40
	
l2155:	
;demo_dino.c: 40: _delay((unsigned long)((20)*(20000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_character+0)+0+1),f
	movlw	221
movwf	((??_character+0)+0),f
u2687:
	decfsz	((??_character+0)+0),f
	goto	u2687
	decfsz	((??_character+0)+0+1),f
	goto	u2687
	nop2
opt asmopt_on

	line	41
	
l711:	
	return
	opt stack 0
GLOBAL	__end_of_character
	__end_of_character:
;; =============== function _character ends ============

	signat	_character,8312
	global	_lcd_data
psect	text213,local,class=CODE,delta=2
global __ptext213
__ptext213:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 26 in file "G:\PIC ass\LCD Display\diano\demo_dino.c"
;; Parameters:    Size  Location     Type
;;  data1           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data1           1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_character
;;		_main
;;		_score
;;		_dino_jump
;;		_game_over
;;		_start_game
;;		_reset_game
;; This function uses a non-reentrant model
;;
psect	text213
	file	"G:\PIC ass\LCD Display\diano\demo_dino.c"
	line	26
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 5
; Regs used in _lcd_data: [wreg]
;lcd_data@data1 stored from wreg
	movwf	(lcd_data@data1)
	line	27
	
l2133:	
;demo_dino.c: 27: RC0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	28
;demo_dino.c: 28: RC1 = 0;
	bcf	(57/8),(57)&7
	line	29
;demo_dino.c: 29: RC2 = 1;
	bsf	(58/8),(58)&7
	line	30
	
l2135:	
;demo_dino.c: 30: PORTD = data1;
	movf	(lcd_data@data1),w
	movwf	(8)	;volatile
	line	31
;demo_dino.c: 31: _delay((unsigned long)((20)*(20000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_lcd_data+0)+0+1),f
	movlw	221
movwf	((??_lcd_data+0)+0),f
u2697:
	decfsz	((??_lcd_data+0)+0),f
	goto	u2697
	decfsz	((??_lcd_data+0)+0+1),f
	goto	u2697
	nop2
opt asmopt_on

	line	32
	
l2137:	
;demo_dino.c: 32: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	33
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_lcd_command
psect	text214,local,class=CODE,delta=2
global __ptext214
__ptext214:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 17 in file "G:\PIC ass\LCD Display\diano\demo_dino.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_character
;;		_main
;;		_score
;;		_dino_jump
;;		_game_over
;;		_start_game
;;		_reset_game
;; This function uses a non-reentrant model
;;
psect	text214
	file	"G:\PIC ass\LCD Display\diano\demo_dino.c"
	line	17
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 5
; Regs used in _lcd_command: [wreg]
;lcd_command@data stored from wreg
	movwf	(lcd_command@data)
	line	18
	
l2127:	
;demo_dino.c: 18: RC0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	19
;demo_dino.c: 19: RC1 = 0;
	bcf	(57/8),(57)&7
	line	20
;demo_dino.c: 20: RC2 = 1;
	bsf	(58/8),(58)&7
	line	21
	
l2129:	
;demo_dino.c: 21: PORTD = data;
	movf	(lcd_command@data),w
	movwf	(8)	;volatile
	line	22
;demo_dino.c: 22: _delay((unsigned long)((20)*(20000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_lcd_command+0)+0+1),f
	movlw	221
movwf	((??_lcd_command+0)+0),f
u2707:
	decfsz	((??_lcd_command+0)+0),f
	goto	u2707
	decfsz	((??_lcd_command+0)+0+1),f
	goto	u2707
	nop2
opt asmopt_on

	line	23
	
l2131:	
;demo_dino.c: 23: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	24
	
l703:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
psect	text215,local,class=CODE,delta=2
global __ptext215
__ptext215:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
