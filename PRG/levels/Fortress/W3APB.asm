	.word W3BOL	; Alternate level layout
	.word W3BOO	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_05 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte LEVEL4_BGBANK_INDEX(2) | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MINIBOSS | LEVEL5_TIME_300

	.byte $39, $00, $4F, $3A, $00, $4F, $6D, $00, $3B, $0F, $2D, $00, $4F, $2E, $00, $4F
	.byte $2F, $01, $D1, $17, $0D, $07, $36, $0A, $00, $E0, $68, $20, $FF
