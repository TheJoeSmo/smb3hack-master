	.word W708BL	; Alternate level layout
	.word W708BO	; Alternate object layout
	.byte LEVEL1_SIZE_10 | LEVEL1_YSTART_140
	.byte LEVEL2_BGPAL_07 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_70
	.byte LEVEL3_TILESET_10 | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
	.byte 21 & %00011111 | LEVEL4_INITACT_NOTHING
	.byte LEVEL5_BGM_ATHLETIC | LEVEL5_TIME_300

	.byte $59, $00, $81, $9F, $35, $0B, $A1, $35, $1F, $A1, $34, $2A, $A1, $36, $45, $A1
	.byte $34, $4A, $A1, $34, $5B, $A1, $35, $76, $A1, $35, $83, $A1, $35, $8A, $A1, $16
	.byte $03, $20, $2E, $77, $04, $70, $2D, $78, $05, $70, $2B, $16, $03, $03, $58, $05
	.byte $0A, $13, $0B, $13, $53, $0B, $0F, $74, $0A, $70, $04, $11, $10, $64, $11, $12
	.byte $17, $13, $1F, $13, $74, $1E, $70, $04, $53, $1F, $0F, $33, $12, $00, $12, $28
	.byte $14, $13, $28, $14, $13, $28, $03, $15, $28, $19, $74, $28, $C0, $16, $3B, $16
	.byte $16, $3B, $03, $77, $3C, $70, $2A, $78, $3D, $70, $28, $58, $3D, $0A, $15, $49
	.byte $20, $1D, $16, $49, $20, $1D, $12, $4A, $13, $73, $49, $70, $04, $52, $4A, $0F
	.byte $14, $45, $13, $75, $44, $70, $04, $54, $45, $0F, $11, $50, $63, $11, $52, $63
	.byte $13, $54, $14, $14, $54, $14, $12, $59, $13, $13, $59, $13, $13, $59, $03, $14
	.byte $61, $15, $15, $6B, $17, $15, $6B, $03, $16, $6C, $20, $2F, $16, $6C, $03, $77
	.byte $6D, $70, $2E, $78, $6F, $70, $2B, $57, $6D, $0A, $58, $6F, $0A, $12, $76, $13
	.byte $13, $76, $13, $74, $75, $70, $04, $52, $76, $0F, $12, $84, $12, $13, $83, $13
	.byte $74, $81, $70, $05, $12, $89, $13, $13, $89, $13, $74, $89, $70, $03, $75, $89
	.byte $C0, $14, $94, $16, $15, $91, $1A, $32, $97, $91, $E9, $22, $10, $33, $3D, $23
	.byte $33, $3F, $00, $32, $7C, $A3, $77, $6A, $03, $34, $05, $A1, $FF
