	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_070
	.byte LEVEL2_BGPAL_03 | LEVEL2_OBJPAL_10 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_10 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte 9 & %00011111 | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_BOSSEOW | LEVEL5_TIME_300

	.byte $4F, $01, $B0, $0B, $4F, $00, $BA, $00, $52, $0D, $B0, $02, $50, $0C, $B2, $00
	.byte $2F, $06, $D1, $53, $0F, $B6, $00, $53, $0D, $B0, $02, $FF
