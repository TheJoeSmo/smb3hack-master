	.word $0000	; Alternate level layout
	.word $0000	; Alternate object layout
	.byte LEVEL1_SIZE_12 | LEVEL1_YSTART_070
	.byte LEVEL2_BGPAL_07 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_01 | LEVEL3_VSCROLL_LOCKED
	.byte 24 & %00011111 | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_GHOSTHOUSE | LEVEL5_TIME_300

	.byte $4E, $B1, $EB, $0E, $4F, $5B, $8B, $28, $50, $00, $EA, $5A, $45, $19, $E5, $0F
	.byte $05, $0A, $E2, $06, $04, $E2, $0A, $03, $96, $4B, $00, $C2, $13, $40, $14, $B4
	.byte $14, $49, $03, $A0, $06, $49, $0A, $A1, $02, $0A, $0D, $96, $49, $0D, $A0, $06
	.byte $4B, $14, $B2, $12, $65, $21, $44, $65, $1A, $44, $45, $14, $F5, $04, $19, $39
	.byte $9F, $4A, $00, $C0, $02, $49, $00, $C0, $02, $40, $29, $BF, $05, $6A, $27, $2B
	.byte $4E, $00, $B1, $26, $59, $00, $B1, $5A, $57, $16, $B1, $0A, $37, $1A, $A3, $57
	.byte $00, $81, $15, $15, $01, $08, $57, $32, $B1, $04, $57, $3E, $B1, $04, $4E, $2F
	.byte $B1, $64, $4B, $3B, $C2, $29, $53, $32, $F1, $04, $52, $33, $F3, $02, $51, $34
	.byte $F5, $00, $34, $34, $40, $51, $40, $F5, $00, $52, $3F, $F3, $02, $53, $3E, $F1
	.byte $04, $58, $49, $B0, $0E, $57, $4C, $B0, $0B, $56, $4F, $B0, $08, $55, $52, $B0
	.byte $05, $6B, $56, $26, $50, $58, $B8, $02, $34, $40, $70, $27, $12, $70, $0A, $4E
	.byte $9F, $49, $3E, $A0, $28, $0A, $61, $95, $49, $5E, $A1, $02, $0A, $3E, $9F, $43
	.byte $2F, $B0, $05, $01, $30, $09, $70, $18, $45, $70, $1E, $45, $70, $2E, $47, $70
	.byte $3A, $47, $70, $46, $47, $70, $52, $43, $02, $4E, $E2, $04, $3E, $E3, $6B, $65
	.byte $26, $40, $67, $BF, $05, $4B, $6D, $C2, $26, $0A, $6D, $9F, $49, $6D, $A0, $26
	.byte $0A, $7D, $9F, $6B, $80, $26, $50, $84, $BA, $05, $6A, $71, $26, $40, $77, $BF
	.byte $05, $40, $6D, $B0, $09, $26, $71, $0B, $26, $82, $00, $27, $47, $24, $23, $6F
	.byte $84, $24, $6F, $84, $0A, $8C, $97, $6B, $94, $26, $40, $96, $BF, $05, $5A, $8A
	.byte $C0, $35, $6A, $A3, $2A, $4C, $9C, $B1, $23, $40, $AC, $BF, $05, $40, $9C, $B1
	.byte $0F, $08, $9E, $0A, $2B, $9C, $05, $2B, $9D, $05, $2B, $9E, $05, $2B, $9F, $05
	.byte $2B, $A0, $05, $2B, $A1, $05, $51, $B9, $09, $2B, $8C, $A0, $2A, $A2, $40, $2B
	.byte $A2, $40, $2A, $A5, $40, $2B, $A5, $40, $27, $A7, $23, $27, $A9, $00, $FF
