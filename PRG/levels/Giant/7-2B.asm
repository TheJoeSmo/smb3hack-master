	.word W503_EndL	; Alternate level layout
	.word W503_EndO	; Alternate object layout
	.byte LEVEL1_SIZE_15 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_10 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_01 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte 11 & %00011111 | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_300

	.byte $19, $00, $7F, $01, $00, $2F, $20, $02, $D5, $03, $00, $20, $05, $00, $20, $07
	.byte $00, $20, $09, $00, $20, $0B, $00, $20, $0D, $00, $20, $0F, $00, $20, $11, $00
	.byte $20, $13, $00, $20, $15, $00, $20, $17, $00, $20, $17, $1E, $50, $57, $20, $83
	.byte $06, $01, $20, $2F, $19, $27, $79, $17, $27, $59, $15, $2B, $57, $13, $2D, $56
	.byte $11, $2F, $55, $0F, $31, $54, $19, $3F, $7F, $15, $41, $83, $01, $40, $2A, $0F
	.byte $48, $26, $0D, $48, $26, $0B, $48, $26, $09, $48, $26, $07, $48, $26, $05, $48
	.byte $26, $03, $48, $26, $11, $52, $21, $13, $52, $21, $15, $52, $21, $19, $5F, $7E
	.byte $15, $5F, $83, $17, $67, $5F, $15, $69, $5D, $13, $6B, $5A, $11, $6D, $56, $0F
	.byte $6F, $55, $01, $6F, $2A, $19, $82, $77, $15, $8A, $83, $0F, $94, $83, $19, $9A
	.byte $71, $15, $9B, $83, $19, $A2, $71, $15, $A3, $83, $19, $AA, $71, $12, $AB, $86
	.byte $19, $B2, $71, $15, $B3, $83, $19, $BA, $7D, $16, $BD, $82, $15, $C4, $21, $13
	.byte $C4, $22, $11, $C4, $23, $0B, $C4, $23, $09, $C4, $23, $07, $C4, $23, $05, $C4
	.byte $28, $17, $D4, $50, $13, $DA, $22, $15, $DA, $22, $17, $DA, $22, $19, $DA, $22
	.byte $13, $E4, $20, $15, $E4, $20, $17, $E4, $20, $20, $EE, $DF, $2F, $EE, $D4, $19
	.byte $E4, $20, $13, $E8, $23, $19, $E8, $73, $15, $E8, $23, $17, $E8, $23, $31, $EC
	.byte $E2, $EE, $71, $20, $36, $07, $8F, $2C, $71, $87, $2F, $C4, $87, $15, $AA, $0A
	.byte $2D, $39, $81, $2B, $3C, $81, $2D, $3F, $81, $30, $3F, $81, $33, $3F, $81, $13
	.byte $92, $73, $FF
