	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_02 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_10 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_00 | LEVEL3_VSCROLL_LOCKLOW
	.byte 12 & %00011111 | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_OVERWORLD | LEVEL5_TIME_300

	.byte $79, $00, $8F, $50, $17, $09, $74, $12, $11, $56, $05, $04, $34, $02, $A4, $37
	.byte $07, $89, $FF
