	.word WZ1L	; Alternate level layout
	.word WZ1O	; Alternate object layout
	.byte LEVEL1_SIZE_14 | LEVEL1_YSTART_140
	.byte LEVEL2_BGPAL_01 | LEVEL2_OBJPAL_09 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_15 | LEVEL3_VSCROLL_FREE | LEVEL3_PIPENOTEXIT
	.byte 27 & %00011111 | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_UNDERGROUND | LEVEL5_TIME_300

	.byte $40, $00, $0C, $76, $00, $20, $02, $77, $03, $20, $00, $78, $04, $20, $00, $79
	.byte $05, $20, $03, $7A, $08, $20, $06, $1A, $09, $50, $00, $1A, $0B, $50, $00, $79
	.byte $0A, $20, $00, $78, $0C, $21, $02, $37, $0F, $18, $77, $10, $22, $00, $7A, $0F
	.byte $20, $01, $77, $18, $23, $00, $59, $0F, $08, $3A, $11, $46, $18, $17, $01, $18
	.byte $19, $52, $0C, $77, $1A, $20, $00, $77, $1C, $20, $00, $77, $1E, $20, $00, $77
	.byte $20, $20, $00, $77, $22, $20, $00, $77, $26, $23, $00, $36, $24, $21, $72, $25
	.byte $20, $1F, $6F, $25, $20, $14, $30, $25, $10, $31, $25, $10, $7A, $27, $20, $04
	.byte $79, $2C, $20, $00, $78, $2D, $20, $00, $79, $2E, $20, $00, $7A, $2F, $20, $00
	.byte $79, $30, $20, $00, $7A, $31, $20, $00, $79, $32, $20, $00, $7A, $33, $20, $05
	.byte $33, $34, $10, $34, $34, $14, $33, $36, $10, $33, $38, $10, $34, $35, $0B, $6F
	.byte $3D, $20, $06, $30, $43, $10, $31, $43, $10, $6D, $41, $21, $00, $2C, $42, $22
	.byte $2C, $44, $01, $6C, $39, $20, $04, $6D, $39, $21, $00, $6D, $3D, $21, $00, $0E
	.byte $3B, $08, $78, $3B, $20, $00, $77, $3E, $20, $00, $7A, $3E, $20, $00, $79, $41
	.byte $20, $01, $79, $45, $20, $00, $76, $47, $20, $00, $75, $48, $20, $03, $73, $48
	.byte $21, $00, $54, $49, $08, $33, $49, $11, $34, $4A, $10, $5A, $4C, $E3, $75, $4E
	.byte $20, $02, $79, $52, $20, $14, $70, $53, $24, $00, $72, $58, $22, $00, $6F, $53
	.byte $20, $08, $70, $5B, $22, $00, $72, $59, $20, $01, $74, $57, $20, $00, $72, $54
	.byte $20, $00, $32, $55, $12, $33, $54, $13, $34, $54, $12, $30, $54, $86, $31, $54
	.byte $86, $31, $5A, $0B, $69, $55, $20, $0A, $75, $59, $20, $0D, $6B, $60, $20, $03
	.byte $47, $5C, $FF, $6E, $64, $20, $03, $4A, $60, $FC, $4A, $64, $FC, $76, $66, $22
	.byte $00, $60, $5F, $2B, $00, $60, $55, $28, $00, $60, $56, $20, $0C, $07, $58, $01
	.byte $E5, $78, $71, $E1, $28, $85, $26, $5A, $00, $60, $63, $2E, $00, $26, $62, $01
	.byte $24, $60, $82, $23, $60, $82, $22, $60, $82, $24, $57, $86, $23, $57, $86, $22
	.byte $57, $86, $6F, $68, $20, $01, $70, $6A, $20, $01, $71, $6C, $20, $04, $72, $72
	.byte $20, $02, $71, $76, $20, $08, $6F, $81, $20, $00, $6D, $84, $20, $02, $72, $87
	.byte $20, $00, $72, $89, $20, $00, $70, $8A, $21, $00, $68, $8A, $21, $00, $68, $8B
	.byte $20, $0A, $71, $8B, $20, $0A, $50, $8B, $EA, $69, $8B, $1A, $6F, $8F, $20, $01
	.byte $70, $96, $21, $00, $68, $96, $21, $00, $75, $99, $20, $04, $72, $9D, $22, $00
	.byte $72, $99, $22, $00, $32, $9A, $12, $32, $9B, $0C, $74, $79, $20, $02, $72, $78
	.byte $21, $00, $72, $7C, $21, $00, $31, $79, $12, $53, $7A, $08, $63, $9A, $21, $00
	.byte $63, $9C, $21, $00, $60, $99, $20, $04, $61, $9D, $22, $00, $61, $99, $22, $00
	.byte $01, $9C, $09, $6C, $A3, $20, $1E, $76, $A3, $20, $1E, $6D, $A3, $28, $00, $6D
	.byte $B2, $23, $00, $34, $AF, $A1, $2A, $A4, $91, $EA, $51, $FA, $6D, $C1, $28, $00
	.byte $78, $CD, $22, $00, $76, $CF, $24, $00, $74, $D1, $26, $00, $72, $D3, $28, $00
	.byte $70, $D5, $2A, $00, $7A, $D8, $20, $07, $51, $DA, $09, $0A, $BF, $0A, $34, $BE
	.byte $91, $37, $C9, $A1, $79, $C9, $21, $01, $EB, $61, $9C, $34, $A5, $88, $32, $A4
	.byte $0A, $52, $B3, $05, $34, $B2, $8A, $6F, $9F, $20, $02, $FF
