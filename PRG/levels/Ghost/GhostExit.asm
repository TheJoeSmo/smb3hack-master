	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_02 | LEVEL1_YSTART_180
	.byte LEVEL2_BGPAL_07 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_05 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte 5 & %00011111 | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_GHOSTHOUSE2 | LEVEL5_TIME_300

	.byte $1A, $00, $50, $20, $08, $02, $00, $51, $19, $09, $19, $0E, $60, $05, $18, $0F
	.byte $60, $04, $17, $10, $60, $03, $16, $11, $60, $02, $FF
