	.word W202BL	; Alternate level layout
	.word W202BO	; Alternate object layout
	.byte LEVEL1_SIZE_10 | LEVEL1_YSTART_170
	.byte LEVEL2_BGPAL_06 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
	.byte LEVEL3_TILESET_04 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
	.byte 23 & %00011111 | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_MARIOLAND | LEVEL5_TIME_300

	.byte $6D, $00, $ED, $86, $40, $00, $DC, $02, $66, $03, $B6, $95, $68, $06, $E3, $0A
	.byte $44, $03, $21, $0A, $0A, $05, $02, $0F, $04, $01, $0F, $40, $02, $16, $04, $01
	.byte $16, $40, $44, $17, $C1, $00, $43, $1A, $C2, $00, $02, $1D, $04, $01, $1D, $40
	.byte $43, $22, $C2, $00, $02, $25, $04, $01, $25, $40, $44, $27, $C1, $00, $02, $2C
	.byte $6F, $04, $2A, $64, $44, $3E, $C1, $00, $44, $43, $C1, $00, $22, $40, $21, $02
	.byte $49, $04, $01, $49, $40, $02, $4E, $04, $01, $4E, $40, $02, $53, $04, $01, $53
	.byte $40, $02, $58, $04, $01, $58, $40, $68, $24, $E3, $0E, $4A, $24, $F6, $4A, $31
	.byte $F8, $68, $45, $E3, $13, $4A, $45, $F5, $69, $59, $E3, $09, $4A, $55, $FA, $68
	.byte $63, $E3, $03, $66, $67, $E4, $01, $68, $69, $E3, $01, $68, $6B, $E2, $01, $68
	.byte $6D, $E3, $11, $02, $6D, $04, $01, $6D, $40, $03, $70, $04, $02, $70, $40, $44
	.byte $74, $C1, $00, $02, $76, $04, $01, $76, $40, $43, $79, $C2, $00, $44, $7D, $C1
	.byte $00, $68, $7F, $E2, $01, $68, $81, $E3, $14, $02, $7F, $04, $01, $7F, $40, $4A
	.byte $85, $F5, $02, $88, $04, $03, $8A, $04, $01, $88, $40, $02, $8A, $40, $66, $96
	.byte $E4, $01, $40, $98, $DC, $07, $4D, $87, $DD, $06, $4D, $80, $D2, $04, $54, $80
	.byte $D6, $06, $58, $7E, $D2, $01, $4D, $63, $D2, $14, $53, $63, $D2, $15, $59, $50
	.byte $D1, $2B, $4D, $50, $DB, $03, $50, $57, $D2, $0F, $4D, $57, $D2, $01, $56, $45
	.byte $D4, $0A, $4D, $47, $D2, $08, $54, $41, $D6, $01, $56, $3C, $D4, $02, $56, $31
	.byte $D4, $08, $4D, $33, $D1, $11, $4D, $26, $D1, $0A, $54, $1B, $D1, $0A, $59, $00
	.byte $D1, $25, $4D, $11, $D1, $12, $31, $1C, $25, $4A, $0F, $FA, $4D, $00, $D1, $0E
	.byte $54, $09, $D4, $04, $4F, $00, $D9, $01, $55, $04, $D3, $02, $30, $09, $24, $78
	.byte $02, $A4, $01, $78, $07, $A4, $01, $12, $05, $0B, $39, $2D, $61, $14, $2D, $0A
	.byte $76, $31, $E1, $01, $59, $8E, $D1, $11, $50, $98, $09, $E0, $68, $F8, $E8, $38
	.byte $A0, $75, $93, $40, $71, $94, $40, $FF
