	.word W7F2BL	; Alternate level layout
	.word W7F2BO	; Alternate object layout
	.byte LEVEL1_SIZE_12 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_02 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_08 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte 8 & %00011111 | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_FORTRESS | LEVEL5_TIME_300

	.byte $59, $00, $27, $77, $0A, $95, $75, $0A, $F0, $75, $0F, $E0, $78, $0B, $93, $36
	.byte $04, $22, $56, $05, $05, $73, $12, $99, $74, $13, $97, $75, $14, $95, $36, $16
	.byte $A4, $71, $12, $F0, $71, $1B, $E0, $74, $0F, $50, $01, $39, $0C, $A1, $4E, $0A
	.byte $31, $48, $00, $B0, $1E, $49, $1E, $B4, $00, $50, $1D, $BA, $00, $50, $1E, $B0
	.byte $0B, $4D, $1F, $B0, $0A, $55, $2A, $B0, $1F, $48, $2A, $B0, $1F, $74, $2A, $CF
	.byte $50, $2A, $B5, $00, $09, $2A, $FF, $51, $31, $B3, $01, $48, $2A, $B5, $00, $70
	.byte $31, $C1, $09, $3A, $FC, $74, $3A, $CC, $2B, $2B, $0B, $49, $3A, $B3, $01, $0D
	.byte $3A, $F1, $48, $4A, $B4, $00, $51, $4A, $B4, $00, $4C, $4B, $B0, $07, $51, $4B
	.byte $B0, $0A, $40, $52, $B0, $6D, $41, $52, $BA, $00, $52, $55, $B8, $00, $34, $5A
	.byte $A6, $73, $59, $93, $72, $58, $95, $71, $57, $97, $36, $62, $A4, $75, $61, $93
	.byte $74, $60, $95, $6F, $57, $F0, $72, $60, $F0, $6F, $5E, $E0, $72, $65, $E0, $31
	.byte $68, $A9, $70, $67, $93, $6F, $66, $95, $6E, $65, $97, $6C, $65, $F0, $6C, $6C
	.byte $E0, $70, $62, $50, $01, $49, $3F, $B3, $01, $0D, $3F, $F1, $0B, $3D, $0B, $70
	.byte $09, $92, $6C, $53, $92, $4A, $54, $31, $71, $70, $93, $32, $71, $A8, $33, $78
	.byte $A7, $72, $77, $93, $50, $7A, $31, $4E, $72, $32, $31, $7D, $A8, $70, $7C, $93
	.byte $4D, $7F, $32, $4E, $70, $05, $21, $87, $DF, $10, $87, $03, $30, $84, $F2, $10
	.byte $83, $00, $59, $7F, $2B, $19, $7D, $02, $19, $8A, $03, $36, $8A, $A2, $35, $8B
	.byte $F2, $15, $8A, $00, $15, $8E, $03, $32, $8E, $A2, $31, $8F, $F2, $11, $8E, $00
	.byte $11, $92, $03, $77, $87, $F0, $6F, $91, $E0, $2F, $92, $A1, $34, $97, $A6, $73
	.byte $96, $93, $72, $95, $95, $70, $9A, $E0, $70, $95, $F0, $32, $A3, $A3, $71, $A2
	.byte $93, $70, $A1, $95, $6F, $A0, $97, $6D, $A0, $F0, $6D, $A7, $E0, $32, $AB, $A3
	.byte $6F, $A8, $97, $70, $A9, $95, $71, $AA, $93, $6D, $A8, $F0, $6D, $AF, $E0, $71
	.byte $9C, $50, $02, $76, $A3, $99, $35, $A2, $0E, $35, $AD, $0E, $32, $83, $C2, $E8
	.byte $E1, $10, $38, $A4, $87, $39, $A4, $87, $39, $A8, $0B, $34, $B5, $A6, $73, $B4
	.byte $93, $72, $B3, $95, $71, $B2, $97, $6F, $B2, $F0, $6F, $B9, $E0, $31, $BA, $45
	.byte $0F, $BD, $0A, $EB, $58, $10, $FF
