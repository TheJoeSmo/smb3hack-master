; Original address was $B1AF
; World 1's Big [?] block area (empty)
	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_05 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_07 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_03 | LEVEL3_VSCROLL_FREE
	.byte 3 & %00011111 | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_300

	.byte $40, $00, $0E, $FF
