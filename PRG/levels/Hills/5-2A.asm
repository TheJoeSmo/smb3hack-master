	.word W502BL	; Alternate level layout
	.word W502BO	; Alternate object layout
	.byte LEVEL1_SIZE_09 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_01 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_09 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte 19 & %00011111 | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MARIOLAND | LEVEL5_PCOMET_STARTALT | LEVEL5_TIME_300

	.byte $40, $00, $0E, $99, $00, $81, $40, $17, $0E, $61, $17, $14, $51, $97, $0F, $81
	.byte $04, $99, $0D, $50, $08, $16, $1F, $62, $16, $24, $52, $96, $20, $82, $03, $99
	.byte $1D, $50, $09, $16, $2B, $62, $16, $30, $52, $96, $2C, $82, $03, $99, $29, $50
	.byte $09, $55, $39, $B0, $06, $57, $39, $B0, $06, $56, $3A, $B0, $04, $58, $3A, $B0
	.byte $04, $32, $3A, $24, $32, $3D, $00, $32, $2C, $83, $32, $20, $83, $33, $0F, $84
	.byte $37, $1A, $B1, $E1, $02, $70, $37, $35, $B1, $E3, $02, $71, $19, $41, $04, $7A
	.byte $41, $E0, $37, $44, $40, $38, $44, $40, $39, $44, $40, $37, $48, $40, $38, $48
	.byte $40, $39, $48, $40, $39, $4B, $43, $36, $53, $40, $37, $53, $40, $38, $53, $40
	.byte $39, $53, $40, $1A, $57, $E0, $58, $58, $B0, $00, $57, $59, $B0, $00, $56, $5A
	.byte $B0, $00, $55, $5B, $B0, $00, $54, $5C, $B0, $00, $5A, $64, $D0, $15, $1A, $7A
	.byte $E0, $19, $7A, $01, $99, $7B, $81, $0B, $39, $67, $40, $38, $67, $40, $37, $67
	.byte $40, $39, $77, $40, $38, $77, $40, $37, $77, $40, $39, $6E, $42, $19, $87, $04
	.byte $7A, $87, $E0, $55, $7E, $0A, $51, $04, $0C, $98, $17, $D1, $96, $10, $D1, $95
	.byte $22, $D1, $95, $2D, $D1, $33, $8B, $81, $34, $8B, $81, $35, $8B, $81, $36, $8B
	.byte $81, $37, $8B, $81, $38, $8A, $83, $39, $8B, $81, $80, $84, $BF, $0B, $0F, $83
	.byte $07, $00, $83, $EE, $E8, $88, $60, $58, $63, $B0, $00, $57, $62, $B0, $00, $56
	.byte $61, $B0, $00, $5A, $42, $D0, $15, $55, $60, $B0, $00, $59, $58, $D1, $0B, $17
	.byte $5E, $0D, $39, $5C, $43, $33, $5D, $11, $36, $5D, $00, $54, $5F, $B0, $00, $FF
