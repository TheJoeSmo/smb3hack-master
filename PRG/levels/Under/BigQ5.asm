	.word W505BL	; Alternate level layout
	.word W505BO	; Alternate object layout
	.byte LEVEL1_SIZE_08 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_05 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_09 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte 3 & %00011111 | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_300

	.byte $40, $00, $0F, $80, $5E, $1F, $03, $90, $44, $29, $07, $80, $4E, $1F, $03, $80
	.byte $3E, $1F, $03, $80, $2E, $1F, $03, $80, $1E, $1F, $03, $80, $04, $B0, $07, $80
	.byte $0E, $1F, $03, $80, $00, $1F, $01, $40, $70, $BF, $00, $50, $70, $B8, $00, $59
	.byte $70, $B1, $0F, $40, $73, $BF, $0C, $50, $7F, $B8, $00, $20, $71, $D1, $30, $7D
	.byte $C4, $24, $72, $80, $25, $71, $80, $26, $72, $80, $27, $71, $80, $28, $72, $80
	.byte $29, $71, $80, $2A, $72, $80, $2B, $71, $80, $2C, $72, $80, $2D, $71, $80, $E3
	.byte $71, $B0, $E7, $42, $E5, $40, $02, $B1, $01, $40, $0C, $B1, $01, $42, $03, $B0
	.byte $00, $42, $0C, $B0, $00, $43, $02, $B0, $02, $43, $0B, $B0, $02, $44, $01, $B0
	.byte $01, $44, $0D, $B0, $01, $45, $01, $B7, $00, $45, $0E, $B7, $00, $4D, $01, $B0
	.byte $01, $4D, $0D, $B0, $01, $4E, $02, $B0, $01, $4E, $0C, $B0, $01, $4F, $02, $B0
	.byte $0B, $20, $07, $C1, $82, $02, $10, $00, $82, $0D, $10, $00, $90, $00, $85, $42
	.byte $25, $04, $32, $25, $09, $32, $28, $07, $31, $2B, $04, $31, $2B, $0A, $31, $2C
	.byte $05, $31, $2C, $09, $31, $2D, $06, $33, $E0, $61, $A1, $40, $12, $B1, $01, $42
	.byte $13, $B0, $00, $82, $12, $10, $00, $43, $12, $B0, $02, $44, $11, $B0, $01, $45
	.byte $11, $B7, $00, $4D, $11, $B0, $01, $4E, $12, $B0, $01, $4F, $12, $B0, $0B, $4E
	.byte $1C, $B0, $01, $4D, $1D, $B0, $01, $45, $1E, $B7, $00, $44, $1D, $B0, $01, $43
	.byte $1B, $B0, $02, $42, $1C, $B0, $00, $40, $1C, $B1, $01, $80, $14, $B0, $07, $20
	.byte $17, $C1, $25, $14, $32, $25, $19, $32, $28, $17, $31, $2B, $14, $31, $2C, $15
	.byte $31, $2C, $19, $31, $2B, $1A, $31, $2D, $16, $33, $82, $1D, $10, $00, $29, $0D
	.byte $70, $E1, $61, $53, $09, $1D, $0C, $40, $22, $B1, $01, $45, $21, $B7, $00, $44
	.byte $21, $B0, $01, $43, $22, $B0, $02, $42, $23, $B0, $00, $4D, $21, $B0, $01, $4E
	.byte $22, $B0, $01, $4F, $22, $B0, $0B, $4E, $2C, $B0, $01, $4D, $2D, $B0, $01, $45
	.byte $2E, $B7, $00, $82, $22, $10, $00, $44, $2D, $B0, $01, $43, $2B, $B0, $02, $42
	.byte $2C, $B0, $00, $40, $2C, $B1, $01, $82, $2D, $10, $00, $80, $24, $B0, $07, $20
	.byte $27, $C1, $E2, $71, $63, $26, $25, $31, $26, $29, $31, $2B, $27, $31, $2A, $23
	.byte $31, $2A, $2B, $31, $2B, $28, $07, $45, $31, $B7, $00, $44, $31, $B0, $01, $43
	.byte $32, $B0, $02, $42, $33, $B0, $00, $40, $32, $B1, $01, $82, $32, $10, $00, $4D
	.byte $31, $B0, $01, $4E, $32, $B0, $01, $4F, $32, $B0, $0B, $4E, $3C, $B0, $01, $4D
	.byte $3D, $B0, $01, $45, $3E, $B7, $00, $44, $3D, $B0, $01, $43, $3B, $B0, $02, $42
	.byte $3C, $B0, $00, $40, $3C, $B1, $01, $80, $34, $B0, $07, $20, $37, $C1, $27, $34
	.byte $32, $27, $39, $32, $2C, $35, $35, $2B, $34, $30, $2B, $3B, $30, $82, $3D, $10
	.byte $00, $45, $41, $B7, $00, $44, $41, $B0, $01, $43, $42, $B0, $02, $42, $43, $B0
	.byte $00, $40, $42, $B1, $01, $82, $42, $10, $00, $4D, $41, $B0, $01, $4E, $42, $B0
	.byte $01, $4F, $42, $B0, $0B, $4E, $4C, $B0, $01, $4D, $4D, $B0, $01, $45, $4E, $B7
	.byte $00, $44, $4D, $B0, $01, $43, $4B, $B0, $02, $42, $4C, $B0, $00, $40, $4C, $B1
	.byte $01, $80, $44, $B0, $07, $20, $47, $C1, $27, $45, $31, $27, $49, $31, $2B, $46
	.byte $33, $2D, $45, $30, $2D, $4A, $30, $2F, $44, $17, $90, $4D, $85, $42, $10, $4C
	.byte $EA, $70, $43, $EA, $96, $4D, $54, $02, $96, $40, $54, $02, $9A, $44, $80, $07
	.byte $18, $48, $0D, $82, $4D, $10, $00, $2C, $38, $0D, $E4, $71, $21, $52, $44, $B0
	.byte $00, $52, $4B, $B0, $00, $33, $47, $0E, $33, $48, $0E, $36, $46, $0E, $36, $49
	.byte $0E, $40, $52, $B1, $01, $42, $53, $B0, $00, $43, $52, $B0, $02, $82, $52, $10
	.byte $00, $44, $51, $B0, $01, $45, $51, $B7, $00, $4D, $51, $B0, $01, $4E, $52, $B0
	.byte $01, $4F, $52, $B0, $0B, $4E, $5C, $B0, $01, $4D, $5D, $B0, $01, $45, $5E, $B7
	.byte $00, $44, $5D, $B0, $01, $43, $5B, $B0, $02, $42, $5C, $B0, $00, $40, $5C, $B1
	.byte $01, $80, $54, $B0, $07, $20, $57, $C1, $82, $5D, $10, $00, $26, $55, $31, $26
	.byte $59, $31, $29, $56, $33, $2C, $56, $33, $2A, $55, $30, $2B, $55, $30, $2A, $5A
	.byte $30, $2B, $5A, $30, $8D, $5C, $07, $E5, $51, $C2, $8D, $5C, $03, $FF
