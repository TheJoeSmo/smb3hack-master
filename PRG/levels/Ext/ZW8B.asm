	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_02 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_09 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_LOCKLOW
	.byte 27 & %00011111 | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_YOLD | LEVEL5_TIME_300

	.byte $19, $00, $71, $2F, $50, $17, $09, $14, $10, $10, $00, $37, $05, $A1, $FF
