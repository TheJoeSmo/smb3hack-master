	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_02 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_09 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_FREE
	.byte 23 & %00011111 | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_400

	.byte $78, $00, $B2, $20, $0E, $0B, $08, $4F, $16, $09, $50, $0C, $B0, $04, $34, $01
	.byte $A3, $FF
