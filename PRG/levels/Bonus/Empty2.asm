; Original address was $0004

	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_01 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_09 | LEVEL3_VSCROLL_LOCKLOW
	.byte 15 & %00011111 | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_OVERWORLD | LEVEL5_TIME_300

	.byte $FF
