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
	FNCALL	_main,_dino
	FNCALL	_main,_lcd_command
	FNCALL	_main,_lcd_data
	FNCALL	_main,_delay
	FNCALL	_main,_jump
	FNCALL	_main,_gameover
	FNCALL	_main,_main
	FNCALL	_gameover,_lcd_command
	FNCALL	_gameover,_lcd_data
	FNCALL	_jump,_lcd_command
	FNCALL	_jump,_lcd_data
	FNCALL	_jump,_delay
	FNCALL	_dino,_lcd_command
	FNCALL	_dino,_delay
	FNCALL	_dino,_lcd_data
	FNCALL	_lcd_data,_delay
	FNCALL	_lcd_command,_delay
	FNROOT	_main
	global	_object
	global	_object1
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"G:\PIC ass\LCD Display\diano\diano.c"
	line	17

;initializer for _object
	retlw	015h
	retlw	015h
	retlw	015h
	retlw	01Fh
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	0
	line	18

;initializer for _object1
	retlw	07h
	retlw	07h
	retlw	06h
	retlw	017h
	retlw	01Fh
	retlw	06h
	retlw	06h
	retlw	0
	global	_j
	global	_object2
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
	global	_TRISD
_TRISD	set	136
	global	_TRISC0
_TRISC0	set	1080
	global	_TRISC1
_TRISC1	set	1081
	global	_TRISC2
_TRISC2	set	1082
	global	_TRISC3
_TRISC3	set	1083
	file	"dino.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_j:
       ds      2

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_object2:
       ds      8

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"G:\PIC ass\LCD Display\diano\diano.c"
	line	17
_object:
       ds      8

psect	dataBANK0
	file	"G:\PIC ass\LCD Display\diano\diano.c"
	line	18
_object1:
       ds      8

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
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
	movlw low(__pdataBANK0+16)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_lcd_command
?_lcd_command:	; 0 bytes @ 0x0
	global	??_lcd_command
??_lcd_command:	; 0 bytes @ 0x0
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	??_delay
??_delay:	; 0 bytes @ 0x0
	global	?_jump
?_jump:	; 0 bytes @ 0x0
	global	?_gameover
?_gameover:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x0
	global	lcd_command@data
lcd_command@data:	; 1 bytes @ 0x0
	ds	1
	global	?_dino
?_dino:	; 0 bytes @ 0x1
	global	??_jump
??_jump:	; 0 bytes @ 0x1
	global	??_gameover
??_gameover:	; 0 bytes @ 0x1
	global	dino@num
dino@num:	; 1 bytes @ 0x1
	global	jump@i
jump@i:	; 2 bytes @ 0x1
	ds	1
	global	??_dino
??_dino:	; 0 bytes @ 0x2
	ds	1
	global	dino@obj
dino@obj:	; 1 bytes @ 0x3
	ds	1
	global	dino@i
dino@i:	; 2 bytes @ 0x4
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x6
	ds	1
;;Data sizes: Strings 0, constant 0, data 16, bss 10, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7       9
;; BANK0           80      0      24
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; dino@obj	PTR unsigned char  size(1) Largest target is 8
;;		 -> object2(BANK0[8]), object1(BANK0[8]), object(BANK0[8]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_dino
;;   _gameover->_lcd_command
;;   _gameover->_lcd_data
;;   _jump->_lcd_command
;;   _jump->_lcd_data
;;   _dino->_lcd_command
;;   _dino->_lcd_data
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
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
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 1     1      0     712
;;                                              6 COMMON     1     1      0
;;                               _dino
;;                        _lcd_command
;;                           _lcd_data
;;                              _delay
;;                               _jump
;;                           _gameover
;;                               _main
;; ---------------------------------------------------------------------------------
;; (1) _gameover                                             0     0      0      44
;;                        _lcd_command
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _jump                                                 2     2      0     112
;;                                              1 COMMON     2     2      0
;;                        _lcd_command
;;                           _lcd_data
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _dino                                                 5     4      1     156
;;                                              1 COMMON     5     4      1
;;                        _lcd_command
;;                              _delay
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (2) _lcd_data                                             1     1      0      22
;;                                              0 COMMON     1     1      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (2) _lcd_command                                          1     1      0      22
;;                                              0 COMMON     1     1      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (3) _delay                                                0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _dino
;;     _lcd_command
;;       _delay
;;     _delay
;;     _lcd_data
;;       _delay
;;   _lcd_command
;;     _delay
;;   _lcd_data
;;     _delay
;;   _delay
;;   _jump
;;     _lcd_command
;;       _delay
;;     _lcd_data
;;       _delay
;;     _delay
;;   _gameover
;;     _lcd_command
;;       _delay
;;     _lcd_data
;;       _delay
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
;;DATA                 0      0      24      12        0.0%
;;ABS                  0      0      21       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               50      0      18       5       30.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      7       9       1       64.3%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 21 in file "G:\PIC ass\LCD Display\diano\diano.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_dino
;;		_lcd_command
;;		_lcd_data
;;		_delay
;;		_jump
;;		_gameover
;;		_main
;; This function is called by:
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"G:\PIC ass\LCD Display\diano\diano.c"
	line	21
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	22
	
l2143:	
;diano.c: 22: dino(object,1);
	clrf	(?_dino)
	bsf	status,0
	rlf	(?_dino),f
	movlw	(_object)&0ffh
	fcall	_dino
	line	23
;diano.c: 23: dino(object1,2);
	movlw	(02h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_dino)
	movlw	(_object1)&0ffh
	fcall	_dino
	line	24
;diano.c: 24: dino(object2,3);
	movlw	(03h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_dino)
	movlw	(_object2)&0ffh
	fcall	_dino
	line	25
	
l2145:	
;diano.c: 25: TRISD=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	26
	
l2147:	
;diano.c: 26: TRISC0=0;
	bcf	(1080/8)^080h,(1080)&7
	line	27
	
l2149:	
;diano.c: 27: TRISC1=0;
	bcf	(1081/8)^080h,(1081)&7
	line	28
	
l2151:	
;diano.c: 28: TRISC2=0;
	bcf	(1082/8)^080h,(1082)&7
	line	29
	
l2153:	
;diano.c: 29: TRISC3=1;
	bsf	(1083/8)^080h,(1083)&7
	line	30
	
l2155:	
;diano.c: 30: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	31
	
l2157:	
;diano.c: 31: lcd_command(0x0c);
	movlw	(0Ch)
	fcall	_lcd_command
	line	32
	
l2159:	
;diano.c: 32: lcd_command(0x38);
	movlw	(038h)
	fcall	_lcd_command
	line	33
	
l2161:	
;diano.c: 33: lcd_command(0xc0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	34
	
l2163:	
;diano.c: 34: lcd_data(0);
	movlw	(0)
	fcall	_lcd_data
	line	35
	
l2165:	
;diano.c: 35: lcd_command(0xcf);
	movlw	(0CFh)
	fcall	_lcd_command
	line	36
	
l2167:	
;diano.c: 36: lcd_data(2);
	movlw	(02h)
	fcall	_lcd_data
	line	38
	
l2169:	
;diano.c: 38: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	39
	
l2171:	
;diano.c: 39: delay();
	fcall	_delay
	goto	l2173
	line	40
;diano.c: 40: while(1)
	
l705:	
	line	42
	
l2173:	
;diano.c: 41: {
;diano.c: 42: if(RC3==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(59/8),(59)&7
	goto	u2351
	goto	u2350
u2351:
	goto	l2177
u2350:
	line	44
	
l2175:	
;diano.c: 43: {
;diano.c: 44: jump();
	fcall	_jump
	goto	l2177
	line	45
	
l706:	
	line	47
	
l2177:	
;diano.c: 45: }
;diano.c: 47: lcd_data(3);
	movlw	(03h)
	fcall	_lcd_data
	line	48
	
l2179:	
;diano.c: 48: lcd_command(0xcf-j);
	decf	(_j),w
	xorlw	0ffh
	addlw	0CFh
	fcall	_lcd_command
	line	49
	
l2181:	
;diano.c: 49: lcd_data(3);
	movlw	(03h)
	fcall	_lcd_data
	line	50
	
l2183:	
;diano.c: 50: delay();
	fcall	_delay
	line	51
	
l2185:	
;diano.c: 51: lcd_command(0xcf-j);
	decf	(_j),w
	xorlw	0ffh
	addlw	0CFh
	fcall	_lcd_command
	line	52
	
l2187:	
;diano.c: 52: lcd_data(2);
	movlw	(02h)
	fcall	_lcd_data
	line	53
	
l2189:	
;diano.c: 53: j++;
	movlw	low(01h)
	addwf	(_j),f
	skipnc
	incf	(_j+1),f
	movlw	high(01h)
	addwf	(_j+1),f
	line	54
	
l2191:	
;diano.c: 54: if(j>15&&RC3==0)
	movf	(_j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(010h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2365
	movlw	low(010h)
	subwf	(_j),w
u2365:

	skipc
	goto	u2361
	goto	u2360
u2361:
	goto	l2199
u2360:
	
l2193:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(59/8),(59)&7
	goto	u2371
	goto	u2370
u2371:
	goto	l2199
u2370:
	line	56
	
l2195:	
;diano.c: 55: {
;diano.c: 56: gameover();
	fcall	_gameover
	line	57
;diano.c: 57: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	58
	
l2197:	
;diano.c: 58: main();
	fcall	_main
	goto	l2199
	line	59
	
l707:	
	line	60
	
l2199:	
;diano.c: 59: }
;diano.c: 60: if(j>15)
	movf	(_j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(010h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2385
	movlw	low(010h)
	subwf	(_j),w
u2385:

	skipc
	goto	u2381
	goto	u2380
u2381:
	goto	l2209
u2380:
	line	62
	
l2201:	
;diano.c: 61: {
;diano.c: 62: lcd_command(0xc0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	63
;diano.c: 63: lcd_data(3);
	movlw	(03h)
	fcall	_lcd_data
	line	64
	
l2203:	
;diano.c: 64: j=0;
	clrf	(_j)
	clrf	(_j+1)
	line	65
	
l2205:	
;diano.c: 65: lcd_command(0xc0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	66
	
l2207:	
;diano.c: 66: lcd_data(0);
	movlw	(0)
	fcall	_lcd_data
	goto	l2209
	line	67
	
l708:	
	line	68
	
l2209:	
;diano.c: 67: }
;diano.c: 68: if(RC3==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(59/8),(59)&7
	goto	u2391
	goto	u2390
u2391:
	goto	l2173
u2390:
	line	70
	
l2211:	
;diano.c: 69: {
;diano.c: 70: jump();
	fcall	_jump
	goto	l2173
	line	71
	
l709:	
	goto	l2173
	line	72
	
l710:	
	line	40
	goto	l2173
	
l711:	
	line	73
	
l712:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_gameover
psect	text175,local,class=CODE,delta=2
global __ptext175
__ptext175:

;; *************** function _gameover *****************
;; Defined at:
;;		line 122 in file "G:\PIC ass\LCD Display\diano\diano.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_command
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text175
	file	"G:\PIC ass\LCD Display\diano\diano.c"
	line	122
	global	__size_of_gameover
	__size_of_gameover	equ	__end_of_gameover-_gameover
	
_gameover:	
	opt	stack 5
; Regs used in _gameover: [wreg+status,2+status,0+pclath+cstack]
	line	123
	
l2141:	
;diano.c: 123: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	124
;diano.c: 124: lcd_data(' ');
	movlw	(020h)
	fcall	_lcd_data
	line	125
;diano.c: 125: lcd_data(' ');
	movlw	(020h)
	fcall	_lcd_data
	line	126
;diano.c: 126: lcd_data(' ');
	movlw	(020h)
	fcall	_lcd_data
	line	127
;diano.c: 127: lcd_data('G');
	movlw	(047h)
	fcall	_lcd_data
	line	128
;diano.c: 128: lcd_data('A');
	movlw	(041h)
	fcall	_lcd_data
	line	129
;diano.c: 129: lcd_data('M');
	movlw	(04Dh)
	fcall	_lcd_data
	line	130
;diano.c: 130: lcd_data('E');
	movlw	(045h)
	fcall	_lcd_data
	line	131
;diano.c: 131: lcd_data(' ');
	movlw	(020h)
	fcall	_lcd_data
	line	132
;diano.c: 132: lcd_data('O');
	movlw	(04Fh)
	fcall	_lcd_data
	line	133
;diano.c: 133: lcd_data('V');
	movlw	(056h)
	fcall	_lcd_data
	line	134
;diano.c: 134: lcd_data('E');
	movlw	(045h)
	fcall	_lcd_data
	line	135
;diano.c: 135: lcd_data('R');
	movlw	(052h)
	fcall	_lcd_data
	line	136
;diano.c: 136: lcd_data(0);
	movlw	(0)
	fcall	_lcd_data
	line	137
	
l732:	
	return
	opt stack 0
GLOBAL	__end_of_gameover
	__end_of_gameover:
;; =============== function _gameover ends ============

	signat	_gameover,88
	global	_jump
psect	text176,local,class=CODE,delta=2
global __ptext176
__ptext176:

;; *************** function _jump *****************
;; Defined at:
;;		line 105 in file "G:\PIC ass\LCD Display\diano\diano.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    1[COMMON] int 
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
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_command
;;		_lcd_data
;;		_delay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text176
	file	"G:\PIC ass\LCD Display\diano\diano.c"
	line	105
	global	__size_of_jump
	__size_of_jump	equ	__end_of_jump-_jump
	
_jump:	
	opt	stack 5
; Regs used in _jump: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	106
	
l2125:	
;diano.c: 106: lcd_command(0xc0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	107
;diano.c: 107: lcd_data(3);
	movlw	(03h)
	fcall	_lcd_data
	line	108
;diano.c: 108: lcd_command(0x81);
	movlw	(081h)
	fcall	_lcd_command
	line	109
;diano.c: 109: lcd_data(1);
	movlw	(01h)
	fcall	_lcd_data
	line	110
;diano.c: 110: delay();
	fcall	_delay
	line	111
	
l2127:	
;diano.c: 111: for(int i=0;i<8;i++)
	clrf	(jump@i)
	clrf	(jump@i+1)
	
l2129:	
	movf	(jump@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2335
	movlw	low(08h)
	subwf	(jump@i),w
u2335:

	skipc
	goto	u2331
	goto	u2330
u2331:
	goto	l2133
u2330:
	goto	l2139
	
l2131:	
	goto	l2139
	line	112
	
l727:	
	line	113
	
l2133:	
;diano.c: 112: {
;diano.c: 113: lcd_data(object1[i]);
	movf	(jump@i),w
	addlw	_object1&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_lcd_data
	line	111
	
l2135:	
	movlw	low(01h)
	addwf	(jump@i),f
	skipnc
	incf	(jump@i+1),f
	movlw	high(01h)
	addwf	(jump@i+1),f
	
l2137:	
	movf	(jump@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2345
	movlw	low(08h)
	subwf	(jump@i),w
u2345:

	skipc
	goto	u2341
	goto	u2340
u2341:
	goto	l2133
u2340:
	goto	l2139
	
l728:	
	line	115
	
l2139:	
;diano.c: 114: }
;diano.c: 115: lcd_command(0x81);
	movlw	(081h)
	fcall	_lcd_command
	line	116
;diano.c: 116: lcd_data(3);
	movlw	(03h)
	fcall	_lcd_data
	line	117
;diano.c: 117: lcd_command(0xc0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	118
;diano.c: 118: lcd_data(0);
	movlw	(0)
	fcall	_lcd_data
	line	120
	
l729:	
	return
	opt stack 0
GLOBAL	__end_of_jump
	__end_of_jump:
;; =============== function _jump ends ============

	signat	_jump,88
	global	_dino
psect	text177,local,class=CODE,delta=2
global __ptext177
__ptext177:

;; *************** function _dino *****************
;; Defined at:
;;		line 179 in file "G:\PIC ass\LCD Display\diano\diano.c"
;; Parameters:    Size  Location     Type
;;  obj             1    wreg     PTR unsigned char 
;;		 -> object2(8), object1(8), object(8), 
;;  num             1    1[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  obj             1    3[COMMON] PTR unsigned char 
;;		 -> object2(8), object1(8), object(8), 
;;  i               2    4[COMMON] int 
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
;;      Temps:          1       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_command
;;		_delay
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text177
	file	"G:\PIC ass\LCD Display\diano\diano.c"
	line	179
	global	__size_of_dino
	__size_of_dino	equ	__end_of_dino-_dino
	
_dino:	
	opt	stack 5
; Regs used in _dino: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;dino@obj stored from wreg
	movwf	(dino@obj)
	line	180
	
l2107:	
;diano.c: 180: lcd_command(0x40+num*8);
	movf	(dino@num),w
	movwf	(??_dino+0)+0
	movlw	(03h)-1
u2305:
	clrc
	rlf	(??_dino+0)+0,f
	addlw	-1
	skipz
	goto	u2305
	clrc
	rlf	(??_dino+0)+0,w
	addlw	040h
	fcall	_lcd_command
	line	181
;diano.c: 181: delay();
	fcall	_delay
	line	182
	
l2109:	
;diano.c: 182: for(int i=0;i<8;i++)
	clrf	(dino@i)
	clrf	(dino@i+1)
	
l2111:	
	movf	(dino@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2315
	movlw	low(08h)
	subwf	(dino@i),w
u2315:

	skipc
	goto	u2311
	goto	u2310
u2311:
	goto	l2115
u2310:
	goto	l2123
	
l2113:	
	goto	l2123
	line	183
	
l746:	
	line	184
	
l2115:	
;diano.c: 183: {
;diano.c: 184: lcd_data(obj[i]);
	movf	(dino@i),w
	addwf	(dino@obj),w
	movwf	(??_dino+0)+0
	movf	0+(??_dino+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_lcd_data
	line	185
	
l2117:	
;diano.c: 185: delay();
	fcall	_delay
	line	182
	
l2119:	
	movlw	low(01h)
	addwf	(dino@i),f
	skipnc
	incf	(dino@i+1),f
	movlw	high(01h)
	addwf	(dino@i+1),f
	
l2121:	
	movf	(dino@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2325
	movlw	low(08h)
	subwf	(dino@i),w
u2325:

	skipc
	goto	u2321
	goto	u2320
u2321:
	goto	l2115
u2320:
	goto	l2123
	
l747:	
	line	187
	
l2123:	
;diano.c: 186: }
;diano.c: 187: lcd_command(0xc0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	188
	
l748:	
	return
	opt stack 0
GLOBAL	__end_of_dino
	__end_of_dino:
;; =============== function _dino ends ============

	signat	_dino,8312
	global	_lcd_data
psect	text178,local,class=CODE,delta=2
global __ptext178
__ptext178:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 75 in file "G:\PIC ass\LCD Display\diano\diano.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		_main
;;		_jump
;;		_gameover
;;		_dino
;;		_moving_tree
;;		_start
;;		_score
;; This function uses a non-reentrant model
;;
psect	text178
	file	"G:\PIC ass\LCD Display\diano\diano.c"
	line	75
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 5
; Regs used in _lcd_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_data@data stored from wreg
	movwf	(lcd_data@data)
	line	76
	
l2099:	
;diano.c: 76: RC0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	77
;diano.c: 77: RC1=0;
	bcf	(57/8),(57)&7
	line	78
;diano.c: 78: RC2=1;
	bsf	(58/8),(58)&7
	line	79
	
l2101:	
;diano.c: 79: PORTD=data;
	movf	(lcd_data@data),w
	movwf	(8)	;volatile
	line	80
	
l2103:	
;diano.c: 80: delay();
	fcall	_delay
	line	81
	
l2105:	
;diano.c: 81: RC2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	82
	
l715:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_lcd_command
psect	text179,local,class=CODE,delta=2
global __ptext179
__ptext179:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 84 in file "G:\PIC ass\LCD Display\diano\diano.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		_main
;;		_jump
;;		_gameover
;;		_dino
;;		_moving_tree
;;		_start
;;		_score
;; This function uses a non-reentrant model
;;
psect	text179
	file	"G:\PIC ass\LCD Display\diano\diano.c"
	line	84
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 5
; Regs used in _lcd_command: [wreg+status,2+status,0+pclath+cstack]
;lcd_command@data stored from wreg
	movwf	(lcd_command@data)
	line	85
	
l2091:	
;diano.c: 85: RC0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	86
;diano.c: 86: RC1=0;
	bcf	(57/8),(57)&7
	line	87
;diano.c: 87: RC2=1;
	bsf	(58/8),(58)&7
	line	88
	
l2093:	
;diano.c: 88: PORTD=data;
	movf	(lcd_command@data),w
	movwf	(8)	;volatile
	line	89
	
l2095:	
;diano.c: 89: delay();
	fcall	_delay
	line	90
	
l2097:	
;diano.c: 90: RC2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	91
	
l718:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
	global	_delay
psect	text180,local,class=CODE,delta=2
global __ptext180
__ptext180:

;; *************** function _delay *****************
;; Defined at:
;;		line 93 in file "G:\PIC ass\LCD Display\diano\diano.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_lcd_data
;;		_lcd_command
;;		_jump
;;		_dino
;;		_start
;; This function uses a non-reentrant model
;;
psect	text180
	file	"G:\PIC ass\LCD Display\diano\diano.c"
	line	93
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 5
; Regs used in _delay: [wreg]
	line	94
	
l2051:	
;diano.c: 94: TMR1CS=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(129/8),(129)&7
	line	95
;diano.c: 95: T1CKPS0=1;
	bsf	(132/8),(132)&7
	line	96
;diano.c: 96: T1CKPS1=1;
	bsf	(133/8),(133)&7
	line	97
	
l2053:	
;diano.c: 97: TMR1H=0x0b;
	movlw	(0Bh)
	movwf	(15)	;volatile
	line	98
;diano.c: 98: TMR1L=0xdc;
	movlw	(0DCh)
	movwf	(14)	;volatile
	line	99
	
l2055:	
;diano.c: 99: TMR1ON=1;
	bsf	(128/8),(128)&7
	line	100
;diano.c: 100: while(!TMR1IF);
	goto	l721
	
l722:	
	
l721:	
	btfss	(96/8),(96)&7
	goto	u2271
	goto	u2270
u2271:
	goto	l721
u2270:
	
l723:	
	line	101
;diano.c: 101: TMR1IF=0;
	bcf	(96/8),(96)&7
	line	102
;diano.c: 102: TMR1ON=0;
	bcf	(128/8),(128)&7
	line	103
	
l724:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,88
psect	text181,local,class=CODE,delta=2
global __ptext181
__ptext181:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
