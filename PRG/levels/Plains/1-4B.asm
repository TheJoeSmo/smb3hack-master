	.word W104AL	; Alternate level layout
	.word W104AO	; Alternate object layout
	.byte LEVEL1_SIZE_13 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_05 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_01 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte 1 & %00011111 | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_OVERWORLD | LEVEL5_TIME_400

	.byte $58, $A8, $43, $58, $93, $43, $58, $82, $43, $58, $5A, $43, $58, $42, $43, $58
	.byte $10, $43, $19, $00, $C1, $BA, $40, $00, $BF, $01, $50, $00, $B6, $01, $57, $00
	.byte $12, $E0, $64, $3C, $16, $0C, $01, $16, $17, $01, $11, $15, $E2, $0F, $1D, $E2
	.byte $10, $20, $E3, $16, $2B, $01, $12, $32, $E3, $11, $2F, $E2, $38, $35, $40, $35
	.byte $3B, $82, $36, $40, $40, $37, $40, $40, $38, $40, $40, $37, $4E, $40, $38, $4E
	.byte $40, $16, $49, $01, $11, $47, $E2, $37, $52, $40, $38, $52, $40, $10, $4D, $E2
	.byte $11, $50, $E3, $35, $50, $0A, $32, $40, $09, $19, $52, $A3, $16, $5E, $01, $12
	.byte $66, $E3, $11, $63, $E2, $16, $70, $01, $11, $6E, $E2, $19, $76, $A3, $19, $7B
	.byte $A3, $57, $7A, $B1, $00, $32, $7A, $10, $16, $86, $01, $12, $7C, $E2, $12, $84
	.byte $E2, $13, $87, $E3, $16, $8F, $01, $16, $9A, $01, $36, $9E, $A2, $12, $A2, $E3
	.byte $10, $9F, $E2, $32, $9D, $83, $16, $AC, $01, $36, $B2, $60, $34, $B6, $60, $32
	.byte $BA, $60, $1A, $BB, $C0, $14, $51, $C3, $09, $31, $50, $00, $38, $B0, $40, $2D
	.byte $50, $0E, $2E, $50, $80, $2F, $50, $80, $30, $50, $80, $2C, $4F, $80, $2B, $4F
	.byte $80, $2A, $4F, $80, $29, $4F, $0E, $28, $4E, $80, $27, $4E, $80, $26, $4E, $80
	.byte $25, $4E, $0E, $04, $46, $B6, $02, $49, $0A, $FF
