	.word W602BAL	; Alternate level layout
	.word W602BAO	; Alternate object layout
	.byte LEVEL1_SIZE_12 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_13 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte 7 & %00011111 | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MARIOLAND | LEVEL5_TIME_300

	.byte $79, $00, $81, $30, $76, $02, $11, $74, $12, $13, $0E, $08, $F3, $4E, $07, $E3
	.byte $12, $04, $14, $00, $12, $07, $24, $06, $13, $07, $D3, $16, $09, $E1, $2F, $09
	.byte $22, $70, $14, $26, $2E, $14, $81, $6E, $18, $28, $2C, $18, $81, $6C, $1C, $2A
	.byte $59, $31, $71, $05, $79, $37, $81, $7F, $15, $27, $11, $00, $15, $28, $21, $06
	.byte $12, $2A, $F2, $52, $29, $E2, $16, $2A, $E1, $77, $23, $10, $77, $21, $10, $77
	.byte $1F, $10, $15, $39, $11, $00, $15, $3A, $21, $06, $16, $3C, $E1, $12, $3C, $F2
	.byte $52, $3B, $E2, $2F, $0A, $00, $77, $4C, $81, $10, $57, $4E, $71, $05, $57, $54
	.byte $91, $06, $70, $52, $81, $04, $50, $54, $67, $00, $73, $44, $23, $35, $1E, $86
	.byte $4C, $54, $07, $E5, $78, $20, $0A, $1D, $08, $07, $62, $1F, $00, $10, $65, $26
	.byte $06, $07, $65, $26, $06, $08, $65, $D3, $16, $67, $E1, $03, $66, $F3, $43, $65
	.byte $E3, $69, $70, $8F, $01, $0A, $72, $1C, $00, $14, $75, $22, $06, $0F, $75, $22
	.byte $06, $0A, $75, $22, $06, $06, $76, $F3, $46, $75, $E3, $0B, $75, $D3, $16, $77
	.byte $E1, $07, $82, $1F, $00, $0E, $85, $28, $09, $07, $85, $24, $09, $01, $87, $F5
	.byte $41, $87, $E5, $08, $86, $D4, $16, $87, $E2, $13, $87, $E2, $10, $87, $E2, $0B
	.byte $87, $E2, $11, $77, $E1, $12, $67, $E1, $0C, $67, $E1, $35, $89, $25, $2D, $7F
	.byte $81, $2E, $7F, $81, $2F, $7F, $81, $30, $7F, $81, $31, $7F, $81, $32, $7F, $81
	.byte $33, $7F, $81, $35, $7F, $81, $34, $7F, $81, $32, $8B, $21, $32, $8C, $00, $07
	.byte $96, $2F, $09, $07, $93, $1F, $00, $01, $98, $F5, $41, $98, $E5, $16, $98, $E2
	.byte $12, $98, $E2, $0E, $98, $E2, $0A, $98, $E2, $08, $97, $D4, $27, $A4, $81, $29
	.byte $A4, $81, $2B, $A4, $81, $2D, $A4, $81, $2F, $A4, $81, $31, $A4, $81, $33, $A4
	.byte $81, $23, $9F, $0B, $23, $8E, $0A, $0D, $A2, $0A, $79, $B7, $81, $08, $50, $B7
	.byte $09, $8D, $08, $24, $8D, $14, $21, $8B, $18, $21, $89, $1C, $21, $96, $31, $21
	.byte $96, $35, $21, $8D, $52, $31, $04, $8E, $6E, $37, $01, $88, $5F, $31, $02, $8D
	.byte $7F, $38, $01, $85, $91, $31, $01, $8D, $A2, $36, $01, $91, $AD, $31, $07, $FF
