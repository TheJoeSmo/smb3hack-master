	.word W2F1CL	; Alternate level layout
	.word W2F1CO	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_02 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte 8 & %00011111 | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_CASTLE | LEVEL5_TIME_300

	.byte $5A, $00, $B0, $0F, $50, $00, $B0, $0F, $51, $00, $B8, $00, $51, $0F, $B8, $00
	.byte $31, $02, $D4, $38, $0D, $E1, $37, $05, $00, $E0, $E3, $30, $FF
