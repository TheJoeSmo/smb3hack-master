; Super Mario Bros. 3Mix by Southbird 2014
; For more info, see http://www.sonicepoch.com/sm3mix/
;
; PLEASE INCLUDE A CREDIT TO THE SOUTHBIRD DISASSEMBLY
; AND THE ABOVE LINK SOMEWHERE IN YOUR WORKS :)
;
; Original disassembler source generated by DCC6502 version v1.4
; All 3Mix new code by Southbird!
; For more info about DCC6502, e-mail veilleux@ameth.org
;
; FILENAME: prg015.bin, File Size: 8193, ORG: $A000
;     -> NES mode enabled
;---------------------------------------------------------------------------
Tile_Layout_TS16:
	; This defines the individual 8x8 blocks used to construct one of the tiles
	; Referenced by Address_Per_Tileset, addressed by Level_Tileset
	; Stored by upper left, then lower left, then upper right, then lower right

	; Remember that palette is determined by the upper 2 bits of a TILE (not the PATTERN)
	; I.e. tiles starting at index $00, $40, $80, $C0 are each on that respective palette

	; Upper left 8x8 pattern per tile
	.byte $55, $DC, $FF, $05, $05, $E8, $05, $03, $55, $75, $55, $57, $FC, $03, $3C, $FC ; Tiles $00 - $0F
	.byte $44, $48, $4C, $40, $42, $5E, $FC, $FC, $FC, $FC, $FC, $22, $10, $25, $24, $62 ; Tiles $10 - $1F
	.byte $51, $6C, $5C, $5E, $6E, $55, $01, $63, $55, $1C, $1E, $55, $FF, $FF, $B8, $B8 ; Tiles $20 - $2F
	.byte $B8, $B8, $BC, $00, $10, $01, $15, $FC, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DC, $05, $FC, $FC, $05, $05, $05, $30, $3C, $3C, $3C, $3D, $FC, $03, $3C, $FC ; Tiles $40 - $4F
	.byte $F4, $F4, $F4, $30, $00, $13, $01, $62, $0A, $66, $01, $62, $FF, $FF, $FF, $D8 ; Tiles $50 - $5F
	.byte $98, $98, $98, $98, $98, $98, $92, $B4, $B4, $B4, $B4, $B4, $B4, $B4, $B4, $B4 ; Tiles $60 - $6F
	.byte $B4, $B8, $98, $98, $98, $98, $A4, $EC, $E4, $C0, $5C, $5E, $E9, $30, $44, $FF ; Tiles $70 - $7F
	.byte $05, $3A, $3E, $FF, $FF, $C4, $50, $03, $3C, $3C, $3C, $3D, $FC, $03, $3C, $FC ; Tiles $80 - $8F
	.byte $68, $6A, $1A, $1C, $6E, $0F, $6E, $0F, $0F, $55, $01, $63, $55, $1C, $1E, $55 ; Tiles $90 - $9F
	.byte $62, $51, $6C, $5C, $5E, $6E, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $8C, $8E, $8C ; Tiles $A0 - $AF
	.byte $8E, $8C, $8E, $8C, $8E, $76, $76, $74, $70, $72, $AC, $AE, $B8, $FF, $FF, $FF ; Tiles $B0 - $BF
	.byte $05, $05, $05, $27, $FC, $FC, $FC, $03, $3C, $3C, $3C, $3D, $FC, $03, $3C, $FC ; Tiles $C0 - $CF
	.byte $44, $45, $46, $48, $48, $FF, $07, $05, $30, $52, $FC, $C5, $C7, $D4, $FE, $FC ; Tiles $D0 - $DF
	.byte $AA, $AB, $55, $01, $63, $55, $1C, $1E, $55, $62, $51, $6C, $5C, $5E, $6E, $FF ; Tiles $E0 - $EF
	.byte $0E, $D7, $E0, $05, $01, $62, $0A, $66, $01, $62, $FF, $FF, $F1, $17, $F8, $FF ; Tiles $F0 - $FF

	; Lower left 8x8 pattern per tile
	.byte $65, $DD, $FF, $06, $D6, $E9, $14, $35, $45, $65, $65, $67, $FC, $23, $16, $FC ; Tiles $00 - $0F
	.byte $45, $49, $4D, $5C, $FC, $5E, $FC, $FC, $38, $3F, $FC, $22, $20, $21, $21, $65 ; Tiles $10 - $1F
	.byte $61, $65, $6C, $6E, $65, $60, $04, $73, $1C, $2C, $2E, $1E, $FF, $FF, $B9, $B9 ; Tiles $20 - $2F
	.byte $B9, $B9, $BD, $10, $10, $05, $15, $FC, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DD, $06, $FC, $FC, $06, $06, $06, $35, $37, $37, $16, $5B, $FC, $23, $16, $FC ; Tiles $40 - $4F
	.byte $F5, $F5, $F5, $32, $58, $18, $60, $62, $5A, $66, $60, $62, $FF, $FF, $FF, $D9 ; Tiles $50 - $5F
	.byte $99, $99, $99, $99, $99, $99, $93, $B5, $B5, $B5, $B5, $B5, $B5, $B5, $B5, $B5 ; Tiles $60 - $6F
	.byte $B5, $B9, $99, $99, $99, $99, $A5, $ED, $E4, $C1, $5E, $5E, $E8, $32, $45, $FF ; Tiles $70 - $7F
	.byte $06, $3E, $3E, $FF, $FF, $C4, $51, $35, $37, $37, $16, $5B, $FC, $23, $16, $FC ; Tiles $80 - $8F
	.byte $6C, $0F, $1E, $0F, $6E, $0F, $0F, $0F, $0F, $60, $04, $73, $1C, $2C, $2E, $1E ; Tiles $90 - $9F
	.byte $65, $61, $65, $6C, $6E, $65, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $9C, $9E, $9C ; Tiles $A0 - $AF
	.byte $9E, $9C, $9E, $9C, $9E, $77, $77, $75, $71, $73, $AC, $AE, $B9, $FF, $FF, $FF ; Tiles $B0 - $BF
	.byte $5B, $06, $06, $06, $FC, $06, $FC, $35, $37, $37, $16, $5B, $FC, $23, $16, $FC ; Tiles $C0 - $CF
	.byte $44, $45, $48, $48, $4A, $FF, $FF, $E6, $32, $54, $CD, $FE, $FE, $FE, $FE, $FE ; Tiles $D0 - $DF
	.byte $AB, $AB, $60, $04, $73, $1C, $2C, $2E, $1E, $65, $61, $65, $6C, $6E, $65, $FF ; Tiles $E0 - $EF
	.byte $64, $06, $E1, $06, $60, $62, $5A, $66, $60, $62, $FF, $FF, $F0, $3C, $F9, $FF ; Tiles $F0 - $FF

	; Upper right 8x8 pattern per tile	
	.byte $56, $DE, $FF, $FF, $FF, $EA, $FF, $37, $56, $76, $54, $56, $3D, $37, $04, $37 ; Tiles $00 - $0F
	.byte $46, $4A, $4E, $41, $43, $FC, $5F, $FC, $FC, $FC, $22, $FC, $05, $12, $24, $52 ; Tiles $10 - $1F
	.byte $61, $6D, $5D, $5F, $6F, $60, $01, $56, $56, $1D, $1F, $56, $FF, $FF, $BA, $BA ; Tiles $20 - $2F
	.byte $BA, $BA, $BE, $01, $13, $02, $12, $FC, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DE, $FF, $FC, $FC, $FF, $FF, $FF, $37, $04, $37, $37, $3D, $3D, $37, $04, $37 ; Tiles $40 - $4F
	.byte $F6, $F6, $F6, $31, $12, $02, $01, $63, $01, $63, $0B, $0D, $FF, $FF, $FF, $DA ; Tiles $50 - $5F
	.byte $9A, $9A, $9A, $9A, $9A, $9A, $CA, $B6, $B6, $B6, $B6, $B6, $B6, $B6, $B6, $B6 ; Tiles $60 - $6F
	.byte $B6, $BA, $9A, $9A, $9A, $9A, $A6, $EE, $E5, $C2, $5D, $5F, $EB, $31, $46, $FF ; Tiles $70 - $7F
	.byte $FF, $3B, $3F, $FF, $FF, $C6, $56, $37, $04, $37, $37, $3D, $3D, $37, $04, $37 ; Tiles $80 - $8F
	.byte $69, $6B, $1B, $1D, $0F, $6F, $0F, $6F, $0F, $60, $01, $56, $56, $1D, $1F, $56 ; Tiles $90 - $9F
	.byte $52, $61, $6D, $5D, $5F, $6F, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $8D, $8F, $8D ; Tiles $A0 - $AF
	.byte $8F, $8D, $8F, $8D, $8F, $7A, $7A, $78, $70, $72, $AD, $AF, $BA, $FF, $FF, $FF ; Tiles $B0 - $BF
	.byte $FF, $FF, $26, $FF, $FF, $FC, $FC, $37, $04, $37, $37, $3D, $3D, $37, $04, $37 ; Tiles $C0 - $CF
	.byte $44, $45, $47, $49, $49, $FF, $08, $FF, $31, $53, $FC, $C5, $C7, $D4, $FE, $FC ; Tiles $D0 - $DF
	.byte $AA, $AB, $60, $01, $56, $56, $1D, $1F, $56, $52, $61, $6D, $5D, $5F, $6F, $FF ; Tiles $E0 - $EF
	.byte $67, $D7, $E2, $FF, $01, $63, $01, $63, $0B, $0D, $FF, $FF, $F3, $18, $FA, $FF ; Tiles $F0 - $FF

	; Lower right 8x8 pattern per tile
	.byte $66, $DF, $FF, $FF, $D6, $EB, $15, $3C, $46, $66, $64, $66, $3D, $34, $25, $34 ; Tiles $00 - $0F
	.byte $47, $4B, $4F, $FC, $5D, $FC, $5F, $3E, $38, $FC, $22, $FC, $21, $22, $21, $62 ; Tiles $10 - $1F
	.byte $66, $66, $6D, $6F, $66, $70, $04, $63, $1D, $2D, $2F, $1F, $FF, $FF, $BB, $BB ; Tiles $20 - $2F
	.byte $BB, $BB, $BF, $03, $13, $12, $12, $FC, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DF, $FF, $FC, $FC, $FF, $FF, $FF, $3C, $36, $3C, $34, $3D, $3D, $34, $25, $34 ; Tiles $40 - $4F
	.byte $F7, $F7, $F7, $33, $19, $59, $61, $63, $61, $63, $0C, $0D, $FF, $FF, $FF, $DB ; Tiles $50 - $5F
	.byte $9B, $9B, $9B, $9B, $9B, $9B, $CB, $B7, $B7, $B7, $B7, $B7, $B7, $B7, $B7, $B7 ; Tiles $60 - $6F
	.byte $B7, $BB, $9B, $9B, $9B, $9B, $A7, $EF, $E5, $C3, $5F, $5F, $EA, $33, $47, $FF ; Tiles $70 - $7F
	.byte $FF, $3F, $3F, $FF, $FF, $C6, $57, $3C, $36, $3C, $34, $3D, $3D, $34, $25, $34 ; Tiles $80 - $8F
	.byte $0F, $6D, $0F, $1F, $0F, $6F, $0F, $0F, $0F, $70, $04, $63, $1D, $2D, $2F, $1F ; Tiles $90 - $9F
	.byte $62, $66, $66, $6D, $6F, $66, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $9D, $9F, $9D ; Tiles $A0 - $AF
	.byte $9F, $9D, $9F, $9D, $9F, $7B, $7B, $79, $71, $73, $AD, $AF, $BB, $FF, $FF, $FF ; Tiles $B0 - $BF
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $3C, $36, $3C, $34, $3D, $3D, $34, $25, $34 ; Tiles $C0 - $CF
	.byte $44, $45, $49, $49, $4B, $FF, $FF, $E7, $33, $55, $CF, $FE, $FE, $FE, $FE, $FE ; Tiles $D0 - $DF
	.byte $AB, $AB, $70, $04, $63, $1D, $2D, $2F, $1F, $62, $66, $66, $6D, $6F, $66, $FF ; Tiles $E0 - $EF
	.byte $65, $FF, $E3, $FF, $61, $63, $61, $63, $0C, $0D, $FF, $FF, $F2, $3D, $FB, $FF ; Tiles $F0 - $FF

Tile_Attributes_TS16:
	.byte $25, $54, $A0, $E2, $2D, $56, $AD, $F0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_TS16
;
; Entry point for loading level layout data for Level_Tileset = 16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_TS16:

	; Clear Tile memory
	LDY #$00

PRG046_LevelLoad_loop:	 
	LDA #TILE16_BG			; Set everything to sewer background
	JSR Tile_Mem_ClearB
	JSR Tile_Mem_ClearA
	CPY #$f0
	BNE PRG046_LevelLoad_loop

	JMP LevelLoad			; Begin actual level loading!


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_Generator_TS16
;
; Based on the values in Temp_Var15 and LL_ShapeDef, chooses an
; appropriate generator function to builds this piece of the
; level.  Tedious, but saves space and is paper-design friendly.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PRG046_A419:
	.byte 0, 15, 30, 45, 60, 75, 90, 105

LoadLevel_Generator_TS16:
	; From level loader function:
	; * Temp_Var15, Temp_Var16, and LL_ShapeDef are three bytes read from the data

	LDA <Temp_Var15
	AND #%11100000
	LSR A		
	LSR A		
	LSR A		
	LSR A		
	LSR A		
	TAX		 	; X = upper 3 bits of Temp_Var15 (0-7) (selects a multiple of 15 as the base)

	LDA LL_ShapeDef
	LSR A	
	LSR A	
	LSR A	
	LSR A			; A = upper 4 bits of LL_ShapeDef shifted down
	ADD PRG046_A419,X	; Add multiple of 15
	TAX
	DEX
	TXA		 ; A = ((LL_ShapeDef >> 4) + PRG046_A419[X]) - 1


	; Regular Generators
	JSR DynJump

	.word LoadLevel_Slope45T2B		;  0 - Above ground (UG only) 45 degree slope top-to-bottom
	.word LoadLevel_Slope45B2T		;  1 - Above ground (UG only) 45 degree slope bottom-to-top
	.word LoadLevel_Slope45T2BCeiling	;  2 - Above ground (UG only) 45 degree ceiling slope top-to-bottom
	.word LoadLevel_Slope45B2TCeiling	;  3 - Above ground (UG only) 45 degree ceiling slope bottom-to-top
	.word LoadLevel_Slope45T2B		;  4 - Underground/Hills normal 45 degree slope top-to-bottom
	.word LoadLevel_Slope45B2T		;  5 - Underground/Hills normal 45 degree slope bottom-to-top
	.word LoadLevel_Slope45T2BCeiling	;  6 - Underground/Hills normal 45 degree ceiling slope top-to-bottom
	.word LoadLevel_Slope45B2TCeiling	;  7 - Underground/Hills normal 45 degree ceiling slope bottom-to-top
	.word LoadLevel_Slope45T2B		;  8 - Underwater 45 degree slope top-to-bottom
	.word LoadLevel_Slope45B2T		;  9 - Underwater 45 degree slope bottom-to-top
	.word LoadLevel_Slope45T2BCeiling	; 10 - Underwater 45 degree ceiling slope top-to-bottom
	.word LoadLevel_Slope45B2TCeiling	; 11 - Underwater 45 degree ceiling slope bottom-to-top
	.word $000		; 12 - Do a run of solid ground, underwater
	.word $0000		; 13 - Run of the clouds
	.word $0000		; 14 - Same as 9, except underwater ground tiles instead
	.word LoadLevel_BlockRun		; 15 - Run of bricks
	.word LoadLevel_BlockRun		; 16 - Run of '?' blocks with a coin
	.word LoadLevel_BlockRun		; 17 - Run of bricks with a coin
	.word LoadLevel_BlockRun		; 18 - Run of wood blocks
	.word LoadLevel_BlockRun		; 19 - Run of green note blocks (?)
	.word LoadLevel_BlockRun		; 20 - Run of note blocks
	.word LoadLevel_BlockRun		; 21 - Run of bouncing wood blocks
	.word LoadLevel_BlockRun		; 22 - Run of coins
	.word LoadLevel_VGroundPipeRun		; 23 - Vertical ground pipe 1 (alt level)
	.word LoadLevel_VGroundPipeRun		; 24 - Vertical ground pipe 2 (Big [?] area)
	.word LoadLevel_VGroundPipeRun		; 25 - Vertical ground pipe 3 (no entrance)
	.word LoadLevel_VCeilingPipeRun		; 26 - Vertical ceiling pipe 1 (alt level)
	.word LoadLevel_VCeilingPipeRun		; 27 - Vertical ceiling pipe 2 (no entrance)
	.word LoadLevel_HRightWallPipeRun	; 28 - Horizontal right-hand wall pipe (alt level)
	.word LoadLevel_HRightWallPipeRun	; 29 - Horizontal right-hand wall pipe (no entrance)
	.word LoadLevel_HLeftWallPipeRun	; 30 - Horizontal left-hand wall pipe (alt level)
	.word LoadLevel_HLeftWallPipeRun	; 31 - Horizontal left-hand wall pipe (no entrance)
	.word LoadLevel_Cannon			; 32 - Bullet bill cannon
	.word LoadLevel_CCBridge		; 33 - Cheep-Cheep style 'oo' bridge
	.word LoadLevel_CCBridge		; 34 - Would result in empty tiles?  (form of 33)
	.word LoadLevel_TopDecoBlocks		; 35 - Top-Deco Rectangle Waterfall
	.word LoadLevel_TopDecoBlocks		; 36 - Top-Deco Rectangle Left waving water pool
	.word LoadLevel_TopDecoBlocks		; 37 - Top-Deco Rectangle No current waving water pool
	.word LoadLevel_TopDecoBlocks		; 38 - Top-Deco Rectangle Right waving water pool
	.word LoadLevel_TopDecoBlocks		; 39 - Top-Deco Rectangle Water wrong-way BG
	.word LoadLevel_TopDecoBlocks		; 40 - Top-Deco Rectangle Diamond blocks (not really any deco on top)
	.word LoadLevel_TopDecoBlocks		; 41 - Top-Deco Rectangle Sand ground 
	.word LoadLevel_TopDecoBlocks		; 42 - Top-Deco Rectangle orange block??
	.word LoadLevel_TopDecoBlocks		; 43 - Top-Deco Rectangle Haunting BG Brick 1
	.word LoadLevel_TopDecoBlocks		; 44 - Top-Deco Rectangle Haunting BG Brick 2
	.word LoadLevel_Slope225T2B		; 45 - Above ground (UG only) 22.5 degree slope top-to-bottom
	.word LoadLevel_Slope225B2T		; 46 - Above ground (UG only) 22.5 degree slope bottom-to-top
	.word LoadLevel_Slope225T2BCeiling	; 47 - Above ground (UG only) 22.5 degree ceiling slope top-to-bottom
	.word LoadLevel_Slope225B2TCeiling	; 47 - Above ground (UG only) 22.5 degree ceiling slope bottom-to-top
	.word LoadLevel_Slope225T2B		; 49 - Underground/Hills normal 22.5 degree slope top-to-bottom
	.word LoadLevel_Slope225B2T		; 50 - Underground/Hills normal 22.5 degree slope bottom-to-top
	.word LoadLevel_Slope225T2BCeiling	; 51 - Underground/Hills normal 22.5 degree ceiling slope top-to-bottom
	.word LoadLevel_Slope225B2TCeiling	; 52 - Underground/Hills normal 22.5 degree ceiling slope bottom-to-top
	.word LoadLevel_Slope225T2B		; 53 - Underwater 22.5 degree slope top-to-bottom
	.word LoadLevel_Slope225B2T		; 54 - Underwater 22.5 degree slope bottom-to-top
	.word LoadLevel_Slope225T2BCeiling	; 55 - Underwater 22.5 degree ceiling slope top-to-bottom
	.word LoadLevel_Slope225B2TCeiling	; 56 - Underwater 22.5 degree ceiling slope bottom-to-top
	.word LoadLevel_Munchers46			; 57 - Run of munchers
	.word LoadLevel_PurpleCoins			; 58 - Run of Purple coins
	.word LoadLevel_PurpleCoinR			; 59 - Rectangle of Purple Coins
	.word LoadLevel_Munchers46_Upsidedown ; 60 - Run of upside down munchers
	.word LevelLoad_OnBlocks46			; 61 - Run of on blocks
	.word LevelLoad_OffBlocks46			; 62 - Run of off blocks
	.word LevelLoad_SwitchUpsideDown46  ; 63 - Run of upside down switches
	.word LevelLoad_CrumblingBlock46	; 64 - Run of crumbling blocks
	.word LoadLevel_Ground46	; 65 - Ground for the sewers
	.word LoadLevel_Ceiling46	; 66 - Ceiling for the sewers
	.word LevelLoad_LeftWall46	; 67 - Left wall for the sewers
	.word LevelLoad_RightWall46	; 68 - Right wall for the sewers
	.word LoadLevel_Wall46		; 69 - Wall for sewers
	.word LevelLoad_TopShadow46 	; 70
	.word LevelLoad_BottomShadow46  ; 71
	.word LevelLoad_LeftShadow46	; 72
	.word LevelLoad_RightShadow46	; 73

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LeveLoad_FixedSizeGen_TS16
;
; Much simpler generators that are fixed-size, commonly used for 
; just single tile placement styles (although a couple relatively 
; complex ones exist in here as well)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LeveLoad_FixedSizeGen_TS16:
	; It is verified before calling this function that all of
	; the upper 4 bits of LL_ShapeDef are ZERO

	; So the upper 3 bits of Temp_Var15 serve as the most significant bits
	; to a value where LL_ShapeDef provide the 4 least significant bits

	LDA <Temp_Var15
	AND #%11100000
	LSR A		
	ADD LL_ShapeDef	
	TAX		 	; Resultant index is put into 'X'
	JSR DynJump	 

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word LoadLevel_Corner			;  0 - Above Ground upper-left corner tile
	.word LoadLevel_Corner			;  1 - Underground/Hills normal upper-left corner tile
	.word LoadLevel_Corner			;  2 - Underwater upper-left corner tile
	.word LoadLevel_Corner			;  3 - Above Ground upper-right corner tile
	.word LoadLevel_Corner			;  4 - Underground/Hills normal upper-right corner tile
	.word LoadLevel_Corner			;  5 - Underwater upper-right corner tile
	.word LoadLevel_Corner			;  6 - Above Ground lower-left corner tile
	.word LoadLevel_Corner			;  7 - Underground/Hills normal lower-left corner tile
	.word LoadLevel_Corner			;  8 - Underwater lower-left corner tile
	.word LoadLevel_Corner			;  9 - Above Ground lower-right corner tile
	.word LoadLevel_Corner			; 10 - Underground/Hills normal lower-right corner tile
	.word LoadLevel_Corner			; 11 - Underwater lower-right corner tile
	.word LoadLevel_StarCoin1		; 12 - Star Coin 1
	.word LoadLevel_StarCoin2		; 13 - Star Coin 2
	.word LoadLevel_StarCoin3		; 14 - Star Coin 3
	.word LoadLevel_Door2			; 15 - Door style 2
	.word LoadLevel_PowerBlock		; 16 - ? block with flower
	.word LoadLevel_PowerBlock		; 17 - ? block with leaf 
	.word LoadLevel_PowerBlock		; 18 - ? block with star
	.word LoadLevel_PowerBlock		; 19 - ? block with coin OR star
	.word LoadLevel_PowerBlock		; 20 - ? block with coin (??)
	.word LoadLevel_PowerBlock		; 21 - Muncher Plant!
	.word LoadLevel_PowerBlock		; 22 - Brick with flower
	.word LoadLevel_PowerBlock		; 23 - Brick with leaf
	.word LoadLevel_PowerBlock		; 24 - Brick with star
	.word LoadLevel_PowerBlock		; 25 - Brick with coin OR star
	.word LoadLevel_PowerBlock		; 26 - Brick with 10-coin
	.word LoadLevel_PowerBlock		; 27 - Brick with 1-up
	.word LoadLevel_PowerBlock		; 28 - Brick with vine
	.word LoadLevel_PowerBlock		; 29 - Brick with P-Switch
	.word LoadLevel_PowerBlock		; 30 - Invisible coin
	.word LoadLevel_PowerBlock		; 31 - Invisible 1-up
	.word LoadLevel_PowerBlock		; 32 - Invisible note
	.word LoadLevel_PowerBlock		; 33 - Note block with flower
	.word LoadLevel_PowerBlock		; 34 - Note block with leaf
	.word LoadLevel_PowerBlock		; 35 - Note block with star
	.word LoadLevel_PowerBlock		; 36 - Wood block with flower
	.word LoadLevel_PowerBlock		; 37 - Wood block with leaf
	.word LoadLevel_PowerBlock		; 38 - Wood block with star
	.word LoadLevel_PowerBlock		; 39 - Invisible note to coin heaven
	.word LoadLevel_PowerBlock		; 40 - P-Switch
	.word LoadLevel_EndGoal			; 41 - The end goal
	.word LoadLevel_PipeRaiseHelper1	; 42 - Pipe Raise Helper 1
	.word LoadLevel_PipeRaiseHelper2	; 43 - Pipe Raise Helper 2
	.word LoadLevel_PipeRaiseHelper3	; 44 - Pipe Raise Helper 3
	.word LoadLevel_PipeRaiseHelper4	; 45 - Pipe Raise Helper 4
	.word LoadLevel_ActionSwitch		; 46 - Action Switch
	.word $0000
	.word DoubleBlocks				; 48 - Double blocks for the inside of the double wide slopes.
	.word DoubleBlocks
	.word DoubleBlocks
	.word DoubleBlocks

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_Corner
;
; Places a single corner tile in sewer levels
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LL_Corners46:
	.byte TILE16_GROUNDTL, $00, $00	; Upper left
	.byte TILE16_GROUNDTR, $00, $00	; Upper right
	.byte TILE16_GROUNDBL, $00, $00	; Lower left (not avail AG) 
	.byte TILE16_GROUNDBR, $00, $00	; Lower right (not avail AG) 

LoadLevel_Corner46:
	LDX LL_ShapeDef		 ; LL_ShapeDef is limited 0-15 because of fixed size gen mode, so it's perfect! 
	LDY TileAddr_Off
	LDA LL_Corners46,X	 ; Get corner tile
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem
	RTS


DoubleBlocks:
	.byte TILE16_INNER_TL, TILE16_INNER_TL+1
	.byte TILE16_INNER_TR, TILE16_INNER_TR+1
	.byte TILE16_INNER_BL, TILE16_INNER_BL+1
	.byte TILE16_INNER_BR, TILE16_INNER_BR+1


; Two Block Generator
LoadLevel_DoubleBlock46:
	LDA LL_ShapeDef		; LL_ShapeDef is limited 0-15 because of fixed size gen mode, so it's perfect! 
	ASL A
	TAX

	LDY TileAddr_Off
	LDA DoubleBlocks,X	 ; Get first block
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column
	INX
	LDA DoubleBlocks,X	 ; Get second block
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem

	RTS		 ; Return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_TopShadow46
;
; Puts down 1-16 top shadows
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_TopShadow46:
	LDA #TILE16_SHADOW_TOP
	BNE LLM46_SeTTile


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_BottomShadow46
;
; Puts down 1-16 bottom shadows
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_BottomShadow46:
	LDA #TILE16_SHADOW_BTM
	BNE LLM46_SeTTile


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_Ground
;
; Puts down 1-16 ground
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_Ground46:
	LDA #TILE16_GROUNDTM
	BNE LLM46_SeTTile


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_Ceiling
;
; Puts down 1-16 ceiling
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_Ceiling46:
	LDA #TILE16_GROUNDBM
	BNE LLM46_SeTTile


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_Munchers
;
; Puts down 1-16 munchers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_Munchers46:
	LDA #TILEA_MUNCHER
	BNE LLM46_SeTTile

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_Munchers15_Upsidedown
;
; Puts down 1-16 munchers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_Munchers46_Upsidedown:
	LDA #TILEA_UPSIDEDOWN_MUNCHER
	BNE LLM46_SeTTile

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_OnBlocks46
;
; Puts down 1-16 on blocks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_OnBlocks46:
	LDA #TILEA_ON_BLOCK
	BNE LLM46_SeTTile

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_OffBlocks46
;
; Puts down 1-16 on blocks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_OffBlocks46:
	LDA #TILEA_OFF_BLOCK
	BNE LLM46_SeTTile

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_SwitchUpsideDown46
;
; Puts down 1-16 on blocks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_SwitchUpsideDown46:
	LDA #TILEA_EXSWITCHR
	BNE LLM46_SeTTile


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_SwitchUpsideDown46
;
; Puts down 1-16 on blocks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_CrumblingBlock46:
	LDA #TILEA_CRUMBLINGBLOCK
	BNE LLM46_SeTTile

; Horizontal Block Run
LLM46_SeTTile:
	STA <Temp_Var5

	LDA LL_ShapeDef	
	AND #$0f	
	TAX		 ; Temp_Var4 = lower 4 bits of LL_ShapeDef
	LDY TileAddr_Off	 ; Y = TileAddr_Off

PRG046_A6DD:
	LDA <Temp_Var5
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column
	DEX		 	 ; X--
	BPL PRG046_A6DD	 	 ; While X >= 0, loop!

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_LeftShadow46
;
; Puts down 1-16 left shadows
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_LeftShadow46:
	LDA #TILE16_SHADOW_LEFT
	BNE LLM46_SeTTileV


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_RightShadow46
;
; Puts down 1-16 left walls
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_RightShadow46:
	LDA #TILE16_SHADOW_RIGHT
	BNE LLM46_SeTTileV


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_LeftWall46
;
; Puts down 1-16 left walls
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_LeftWall46:
	LDA #TILE16_GROUNDML
	BNE LLM46_SeTTileV


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_RightWall46
;
; Puts down 1-16 right walls
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_RightWall46:
	LDA #TILE16_GROUNDMR


; Vertical Block Run
LLM46_SeTTileV:
	STA <Temp_Var5

	LDA LL_ShapeDef
	PHA	 			 ; Save LL_ShapeDef
	AND #$0f	 
	STA <Temp_Var1	 ; Temp_Var1 = lower 4 bits of LL_ShapeDef
	PLA				 ; Restore LL_ShapeDef
	
	LDY TileAddr_Off 	; Y = TileAddr_Off

; Loop through the number of times defined by Temp_Var1 placing Temp_Var5 into level memory vertically.
PRG046_D811:
	; Store into tile mem
	LDA <Temp_Var5
	STA [Map_Tile_AddrL],Y	 

	; Go to next row by adding 16 to tile offset
	TYA
	ADD #16
	TAY	
	LDA <Map_Tile_AddrH
	ADC #$00	 
	STA <Map_Tile_AddrH

	; While Temp_Var1 >= 0, loop!
	DEC <Temp_Var1
	BPL PRG046_D811	 	
	RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_Wall
;
; Puts down 1-256 wall blocks, up to 16 tiles tall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_Wall46:
	LDX #$01	 ; X = 1 (bright diamond blocks)
	BNE PRG046_A678	 ; Jump to PRG046_A678

LL_LargeGenerator46:
	.byte TILE16_GROUNDMM, TILE16_GROUNDMM

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_SolidBrick46
;
; Puts down 1-256 solid bricks, up to 16 tiles tall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_SolidBrick46:
	LDX #$00	 ; X = 0 (solid brick)

PRG046_A678:
	JSR LL46_InitLongRun	 ; Get setup for long run

PRG046_A67B:
	LDA <Temp_Var3		 
	STA <Temp_Var5		 ; Temp_Var5 = Temp_Var3 (backup run width)

PRG046_A67F:
	LDA LL_LargeGenerator46,X	 ; Get appropriate tile
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column
	DEC <Temp_Var5		 ; Temp_Var5-- (width decrement)

	LDA <Temp_Var5
	CMP #$ff
	BNE PRG046_A67F	 	; While Temp_Var5 >= 0, loop!

	JSR LL46_LongRunNextRow	 ; Go to next row
	DEC <Temp_Var4		 ; Temp_Var4-- (height decrement)
	BPL PRG046_A67B	 	; While Temp_Var4 >= 0, loop!
	RTS		 ; Return


	; This routine prepares for a long run of tiles by getting an additional
	; byte from the layout stream and preparing the Map_Tile_Addr backup
LL46_InitLongRun:
	LDY #$00	 ; Y = 0
	LDA [Level_LayPtr_AddrL],Y	 ; Get another byte from layout
	STA <Temp_Var3		 	; Store into Temp_Var3

	; Level_LayPtr_Addr++
	LDA <Level_LayPtr_AddrL
	ADD #$01	 
	STA <Level_LayPtr_AddrL
	LDA <Level_LayPtr_AddrH
	ADC #$00	 
	STA <Level_LayPtr_AddrH

	; Backup Map_Tile_AddrL/H into Temp_Var1/2
	LDA <Map_Tile_AddrL
	STA <Temp_Var1	
	LDA <Map_Tile_AddrH
	STA <Temp_Var2	

	LDA LL_ShapeDef	
	AND #$0f	
	STA <Temp_Var4		 ; Temp_Var4 = lower 4 bits of LL_ShapeDef
	LDY TileAddr_Off	 ; Y = TileAddr_Off
	RTS		 	; Return


	; This routine goes to the next row of the long run
LL46_LongRunNextRow:
	; Restore Map_Tile_Addr from backup
	LDA <Temp_Var1		 
	STA <Map_Tile_AddrL	
	LDA <Temp_Var2		
	STA <Map_Tile_AddrH	

	; Go to next row by adding 16 to tile offset
	LDA TileAddr_Off
	ADD #16
	STA TileAddr_Off
	TAY		
	LDA <Map_Tile_AddrH
	ADC #$00
	STA <Map_Tile_AddrH
	STA <Temp_Var2	 	; Update Map_Tile_AddrH backup
	RTS		 ; Return


	; Broken into another file for ease of integration in NoDice editor
	.include "PRG/levels/Sewers.asm"
