	.word W708L	; Alternate level layout
	.word W708O	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_10 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(10) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_300

	.byte $19, $00, $1F, $1A, $00, $1F, $12, $00, $46, $12, $0F, $46, $11, $00, $1F, $10
	.byte $00, $1F, $37, $0C, $91, $E0, $51, $50, $FF
