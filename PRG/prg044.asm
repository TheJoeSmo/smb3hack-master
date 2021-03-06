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
; FILENAME: PRG044.bin, File Size: 8193, ORG: $A000
;     -> NES mode enabled
;---------------------------------------------------------------------------
Tile_Layout_TS7:
	; This defines the individual 8x8 blocks used to construct one of the tiles
	; Referenced by Address_Per_Tileset, addressed by Level_Tileset
	; Stored by upper left, then lower left, then upper Right, then lower Right

	; Remember that palette is determined by the upper 2 bits of a TILE (not the PATTERN)
	; I.e. tiles starting at index $00, $40, $80, $C0 are each on that respective palette

	; Upper left 8x8 pattern per tile
	.byte $FC, $DC, $2C, $05, $05, $E8, $2E, $09, $09, $FE, $FE, $FE, $FD, $FD, $FD, $FC ; Tiles $00 - $0F
	.byte $FD, $03, $18, $1A, $FD, $1A, $24, $26, $40, $42, $44, $46, $60, $62, $FF, $FC ; Tiles $10 - $1F
	.byte $0F, $FD, $FD, $FD, $FD, $12, $12, $FF, $FF, $FF, $4A, $4B, $4C, $4D, $B8, $B8 ; Tiles $20 - $2F
	.byte $B8, $B8, $BC, $94, $B0, $B1, $FD, $FD, $12, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DC, $05, $7C, $FC, $05, $05, $05, $5A, $F4, $F4, $F4, $22, $FF, $1D, $1E, $FF ; Tiles $40 - $4F
	.byte $29, $FF, $2C, $39, $56, $50, $52, $54, $34, $32, $4F, $4F, $6C, $30, $31, $D8 ; Tiles $50 - $5F
	.byte $98, $98, $98, $98, $98, $98, $92, $B4, $B4, $B4, $B4, $B4, $B4, $B4, $B4, $B4 ; Tiles $60 - $6F
	.byte $B4, $B8, $98, $98, $98, $98, $A4, $EC, $E4, $C0, $68, $58, $2D, $58, $58, $FF ; Tiles $70 - $7F
	.byte $05, $FD, $FC, $FD, $FD, $26, $3A, $3E, $54, $56, $05, $FD, $7A, $FF, $50, $52 ; Tiles $80 - $8F
	.byte $30, $32, $FF, $39, $56, $50, $52, $54, $34, $32, $30, $32, $68, $30, $31, $72 ; Tiles $90 - $9F
	.byte $60, $AE, $62, $AE, $8C, $4A, $8E, $9C, $6A, $9E, $AC, $FE, $AE, $8C, $8E, $8C ; Tiles $A0 - $AF
	.byte $8E, $8C, $8E, $8C, $8E, $76, $76, $74, $70, $72, $AC, $AE, $B8, $8C, $8E, $52 ; Tiles $B0 - $BF
	.byte $18, $1C, $30, $39, $56, $50, $52, $54, $34, $32, $34, $36, $38, $A9, $6A, $20 ; Tiles $C0 - $CF
	.byte $3C, $40, $41, $12, $2C, $3A, $05, $05, $12, $2C, $3A, $C5, $C7, $D4, $FE, $FE ; Tiles $D0 - $DF
	.byte $AA, $AB, $3A, $3A, $3A, $38, $38, $38, $05, $05, $38, $04, $10, $30, $31, $52 ; Tiles $E0 - $EF
	.byte $53, $D7, $E0, $05, $63, $0A, $28, $2A, $FF, $FF, $FF, $FF, $FF, $FF, $F8, $FF ; Tiles $F0 - $FF

	; Lower left 8x8 pattern per tile
	.byte $FC, $DD, $3C, $06, $D6, $E9, $3E, $09, $0A, $0B, $0B, $FE, $0E, $FD, $FD, $11 ; Tiles $00 - $0F
	.byte $14, $16, $1A, $FD, $03, $FD, $34, $36, $50, $52, $54, $56, $70, $72, $FF, $FC ; Tiles $10 - $1F
	.byte $FD, $FD, $16, $FD, $5A, $22, $13, $FF, $FF, $FF, $4D, $4C, $FD, $FC, $B9, $B9 ; Tiles $20 - $2F
	.byte $B9, $B9, $BD, $95, $B1, $B0, $16, $5A, $13, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DD, $06, $7E, $FC, $06, $06, $06, $5B, $F5, $F5, $F5, $20, $1C, $1D, $1D, $28 ; Tiles $40 - $4F
	.byte $2A, $FF, $2C, $49, $66, $60, $62, $64, $44, $42, $13, $13, $7C, $40, $41, $D9 ; Tiles $50 - $5F
	.byte $99, $99, $99, $99, $99, $99, $93, $B5, $B5, $B5, $B5, $B5, $B5, $B5, $B5, $B5 ; Tiles $60 - $6F
	.byte $B5, $B9, $99, $99, $99, $99, $A5, $ED, $E4, $C1, $59, $59, $1F, $69, $59, $FF ; Tiles $70 - $7F
	.byte $06, $FD, $11, $12, $13, $24, $3E, $3E, $64, $66, $60, $FD, $FD, $FF, $60, $62 ; Tiles $80 - $8F
	.byte $40, $42, $FF, $49, $66, $60, $62, $64, $44, $42, $40, $42, $71, $40, $41, $6E ; Tiles $90 - $9F
	.byte $61, $AE, $63, $AE, $58, $FE, $78, $AC, $FE, $AE, $AC, $FE, $AE, $9C, $9E, $9C ; Tiles $A0 - $AF
	.byte $9E, $9C, $9E, $9C, $9E, $77, $77, $75, $71, $73, $AC, $AE, $B9, $9C, $9E, $53 ; Tiles $B0 - $BF
	.byte $1A, $1E, $32, $49, $66, $60, $62, $64, $44, $42, $44, $46, $48, $A9, $68, $22 ; Tiles $C0 - $CF
	.byte $3E, $42, $43, $13, $2D, $3B, $06, $E6, $13, $2D, $3B, $FE, $FE, $FE, $FE, $FE ; Tiles $D0 - $DF
	.byte $AB, $AB, $39, $2D, $39, $06, $06, $39, $39, $39, $39, $50, $51, $40, $41, $04 ; Tiles $E0 - $EF
	.byte $10, $06, $E1, $06, $18, $1A, $38, $3A, $FF, $FF, $FF, $FF, $FF, $FF, $F9, $FF ; Tiles $F0 - $FF

	; Upper Right 8x8 pattern per tile	
	.byte $FC, $DE, $2D, $07, $07, $EA, $2F, $FE, $FE, $0D, $FE, $FE, $FD, $FD, $FD, $FC ; Tiles $00 - $0F
	.byte $FD, $04, $19, $1B, $FD, $1B, $25, $27, $41, $43, $45, $47, $61, $63, $FF, $FC ; Tiles $10 - $1F
	.byte $0F, $FD, $27, $10, $10, $FD, $FD, $FF, $FF, $FF, $4A, $4B, $4C, $4D, $BA, $BA ; Tiles $20 - $2F
	.byte $BA, $BA, $BE, $96, $B0, $B1, $27, $10, $FD, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DE, $07, $7D, $FC, $07, $07, $07, $07, $F6, $F6, $F6, $23, $1C, $1D, $FF, $28 ; Tiles $40 - $4F
	.byte $2A, $2B, $FF, $FF, $FF, $51, $53, $55, $35, $33, $4F, $4F, $6D, $31, $31, $DA ; Tiles $50 - $5F
	.byte $9A, $9A, $9A, $9A, $9A, $9A, $CA, $B6, $B6, $B6, $B6, $B6, $B6, $B6, $B6, $B6 ; Tiles $60 - $6F
	.byte $B6, $BA, $9A, $9A, $9A, $9A, $A6, $EE, $E5, $C2, $5A, $6A, $2E, $5A, $5A, $FF ; Tiles $70 - $7F
	.byte $07, $FD, $FC, $FD, $FD, $27, $3B, $3F, $55, $57, $60, $FD, $07, $FF, $51, $53 ; Tiles $80 - $8F
	.byte $31, $33, $FF, $FF, $FF, $51, $53, $55, $35, $33, $31, $33, $69, $31, $31, $72 ; Tiles $90 - $9F
	.byte $AD, $64, $AD, $66, $49, $4B, $8F, $69, $6B, $9F, $AD, $7B, $AF, $8D, $8F, $8D ; Tiles $A0 - $AF
	.byte $8F, $8D, $8F, $8D, $8F, $7A, $7A, $78, $70, $72, $AD, $AF, $BA, $8D, $8F, $72 ; Tiles $B0 - $BF
	.byte $19, $1D, $31, $FF, $FF, $51, $53, $55, $35, $33, $35, $37, $39, $A9, $6A, $21 ; Tiles $C0 - $CF
	.byte $3D, $41, $41, $13, $2D, $3B, $07, $07, $13, $2D, $3B, $C5, $C7, $D4, $FE, $FE ; Tiles $D0 - $DF
	.byte $AA, $AB, $3B, $3B, $3B, $39, $39, $39, $07, $39, $07, $09, $11, $31, $31, $53 ; Tiles $E0 - $EF
	.byte $52, $D7, $E2, $07, $09, $0B, $29, $2B, $FF, $FF, $FF, $FF, $FF, $FF, $FA, $FF ; Tiles $F0 - $FF

	; Lower Right 8x8 pattern per tile
	.byte $FC, $DF, $3D, $08, $D6, $EB, $3F, $FE, $0B, $0C, $0B, $FE, $0E, $FD, $10, $11 ; Tiles $00 - $0F
	.byte $15, $17, $1B, $FD, $04, $FD, $35, $37, $51, $53, $55, $57, $71, $73, $FF, $FC ; Tiles $10 - $1F
	.byte $FD, $FD, $17, $20, $11, $FD, $59, $FF, $FF, $FF, $4D, $4C, $FD, $FC, $BB, $BB ; Tiles $20 - $2F
	.byte $BB, $BB, $BF, $97, $B1, $B0, $17, $11, $59, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DF, $08, $66, $FC, $08, $08, $08, $08, $F7, $F7, $F7, $21, $1D, $1D, $1E, $29 ; Tiles $40 - $4F
	.byte $1D, $2B, $FF, $FF, $FF, $61, $63, $65, $45, $43, $5F, $5F, $7D, $41, $41, $DB ; Tiles $50 - $5F
	.byte $9B, $9B, $9B, $9B, $9B, $9B, $CB, $B7, $B7, $B7, $B7, $B7, $B7, $B7, $B7, $B7 ; Tiles $60 - $6F
	.byte $B7, $BB, $9B, $9B, $9B, $9B, $A7, $EF, $E5, $C3, $5B, $5B, $2F, $5B, $6B, $FF ; Tiles $70 - $7F
	.byte $08, $10, $11, $12, $FD, $25, $3F, $3F, $65, $67, $FD, $FD, $7A, $FF, $61, $63 ; Tiles $80 - $8F
	.byte $41, $43, $FF, $FF, $FF, $61, $63, $65, $45, $43, $41, $43, $71, $41, $41, $6F ; Tiles $90 - $9F
	.byte $AD, $65, $AD, $67, $59, $5B, $79, $AD, $7B, $AF, $AD, $7B, $AF, $9D, $9F, $9D ; Tiles $A0 - $AF
	.byte $9F, $9D, $9F, $9D, $9F, $7B, $7B, $79, $71, $73, $AD, $AF, $BB, $9D, $9F, $73 ; Tiles $B0 - $BF
	.byte $1B, $1F, $33, $FF, $FF, $61, $63, $65, $45, $43, $45, $47, $49, $A9, $68, $23 ; Tiles $C0 - $CF
	.byte $3F, $43, $43, $12, $12, $2C, $3A, $E7, $2C, $3A, $05, $FE, $FE, $FE, $FE, $FE ; Tiles $D0 - $DF
	.byte $AB, $AB, $3A, $2C, $3B, $08, $38, $08, $38, $38, $38, $51, $50, $41, $41, $09 ; Tiles $E0 - $EF
	.byte $11, $08, $E3, $08, $19, $1B, $39, $3B, $FF, $FF, $FF, $FF, $FF, $FF, $FB, $FF ; Tiles $F0 - $FF

Tile_Attributes_TS7:
	.byte $20, $5A, $9A, $ED, $2A, $5A, $9C, $ED


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_TS7
;
; Entry point for loading level layout data for Level_Tileset = 7
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_TS7:
	; Clear Tile memory
	LDY #$00	 
PRG044_A40A:
	LDA #TILE7_SKY
	JSR Tile_Mem_ClearB
	JSR Tile_Mem_ClearA
	CPY #$f0
	BNE PRG044_A40A

	JMP LevelLoad	; Begin actual level loading!

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_Generator_TS7
;
; Based on the values in var15 and LL_ShapeDef, chooses an
; appropriate generator function to builds this piece of the
; level.  Tedious, but saves space and is paper-design friendly.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PRG044_A42A:
	.byte 0, 15, 30, 45, 60, 75, 90, 105

LoadLevel_Generator_TS7:
	; From level loader function:
	; * var15, var16, and LL_ShapeDef are three bytes read from the data


	LDA <var15
	AND #%11100000
	LSR A		
	LSR A		
	LSR A		
	LSR A		
	LSR A		
	TAX		 	; X = upper 3 bits of var15 (0-7) (selects a multiple of 15 as the base)

	LDA LL_ShapeDef
	LSR A	
	LSR A	
	LSR A	
	LSR A			; A = upper 4 bits of LL_ShapeDef shifted down
	ADD PRG044_A42A,X	; Add multiple of 15
	TAX
	DEX
	TXA		 ; A = ((LL_ShapeDef >> 4) + PRG015_A419[X]) - 1


	; PRG044_A42A provides values well in excess of 51, but only 51
	; addresses are defined here; reserved for expansion...

	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word LoadLevel_DelfinoBlock		;  0 - Background building
	.word LoadLevel_DelfinoBlock		;  1 - Foreground building
	.word $0000		;  2 - 
	.word $0000		;  3 - 
	.word $0000		;  4 - 
	.word $0000		;  5 - RESERVE for LoadLevel_DelfinoBlock
	.word $0000			;  6 - Diamond rectangle 
	.word LoadLevel_ActionSwitch		; 7 - Action Switch
	.word LoadLevel_PipeRaiseHelper1	; 8 - Pipe Raise Helper 1
	.word LoadLevel_PipeRaiseHelper2	; 9 - Pipe Raise Helper 2
	.word LoadLevel_PipeRaiseHelper3	; 10 - Pipe Raise Helper 3
	.word LoadLevel_PipeRaiseHelper4	; 11 - Pipe Raise Helper 4
	.word LoadLevel_DelfinoAwnWins		; 12 - Upper level windows with awnings
	.word LoadLevel_DelfinoWins			; 13 - Lower level windows with shutters
	.word LoadLevel_DelfinoRoof			; 14 - Building roof
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
	.word LoadLevel_HRightWallPipeRun	; 28 - Horizontal Right-hand wall pipe (alt level)
	.word LoadLevel_HRightWallPipeRun	; 29 - Horizontal Right-hand wall pipe (no entrance)
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
	.word LoadLevel_DelfinoRoofBG		; 43 - Building roof background
	.word LoadLevel_VTransitPipeRun		; 44 - Vertical in-level transit pipe
	.word LoadLevel_DelfinoTree			; 45 - BG Tree!
	.word LoadLevel_DelfinoPalmTree		; 46 - BG Palm tree
	.word LoadLevel_NBBlock				; 47 - Run of N&B Blocks
	.word LoadLevel_NBBlock_VEdge		; 48 - Run of N&B Vertical Edges
	.word LoadLevel_VGroundPipe5Run		; 49 - Vertical ground pipe 5 (exits to common end area)
	.word LoadLevel_HRightWallPipeRun3	; 50 - Horizontal Right-hand wall pipe 3 (no entrance)
	.word LoadLevel_Lava			; 51 - Lava?  Not used in these modes I don't think... (it's green in Tileset 5/13!)
	.word LoadLevel_DelfinoGround		;  52 - Rectangle of ground
	.word $0000		;  53 - 
	.word $0000		;  54 - 
	.word $0000		;  55 - 
	.word $0000			;  56 - RESERVE for LoadLevel_DelfinoGround
	.word Delfino_PipeVRun	; 57 - Half-pipe vertical (right)
	.word Delfino_PipeVRun	; 58 - Half-pipe vertical (left)
	.word Delfino_PipeHRun	; 59 - Half-pipe horizontal (bottom)
	.word Delfino_PipeHRun	; 60 - Half-pipe horizontal (top)
	.word LoadLevel_PurpleCoins		; 61 - Run of Purple coins
	.word LoadLevel_PurpleCoinR		; 62 - Rectangle of Purple Coins


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LeveLoad_FixedSizeGen_TS7
;
; Much simpler generators that are fixed-size, commonly used for 
; just single tile placement styles (althouD a couple relatively 
; complex ones exist in here as well)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LeveLoad_FixedSizeGen_TS7:
	; It is verified before calling this function that all of
	; the upper 4 bits of LL_ShapeDef are ZERO

	; So the upper 3 bits of var15 serve as the most significant bits
	; to a value where LL_ShapeDef provide the 4 least significant bits

	LDA <var15
	AND #%11100000
	LSR A		
	ADD LL_ShapeDef	
	TAX		 	; Resultant index is put into 'X'
	JSR DynJump	 

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word LoadLevel_Door2		;  0 - Door
	.word LoadLevel_DelfinoCasino	;  1 - Casino Delfino sign
	.word LoadLevel_FillDiamondBG	;  2 - Diamond background
	.word DelfinoSlots_Tiles		;  3 - Casino slot machine slots
	.word $0000		;  4 - 
	.word $0000				;  5 - 
	.word $0000				;  6 - 
	.word $0000				;  7 - 
	.word LoadLevel_StarCoin1		;  8 - Star Coin 1
	.word LoadLevel_StarCoin2		;  9 - Star Coin 2
	.word LoadLevel_StarCoin3		; 10 - Star Coin 3
	.word LoadLevel_DelfinoPipeC	; 11 - Half-pipe corner
	.word LoadLevel_DelfinoPipeC	; 12 - Half-pipe corner
	.word LoadLevel_DelfinoPipeC	; 13 - Half-pipe corner
	.word LoadLevel_DelfinoPipeC	; 14 - Half-pipe corner
	.word $0000				; 15 - 
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


	; Goes to next row and updates backup variable var2
LL44_ReturnTileAndNextRow:
	; Restore Map_Tile_Addr from backup
	LDA <var1
	STA <level_data_pointer
	LDA <var2
	STA <level_data_pointer+1

	; Go to next row by adding 16 to tile offset
	LDA TileAddr_Off
	ADD #16
	STA TileAddr_Off
	TAY
	LDA <level_data_pointer+1
	ADC #$00	 
	STA <level_data_pointer+1
	STA <var2	; Update level_data_pointer+1 backup

	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_DelfinoBlock
;
; Adds a rectangle (width 1-256 / height 1-16) of Delfino  brick
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LL_DBlock_UL:	.byte TILE7_BGDARKWALL_L,	TILE7_WALLTOP

LL_DBlock_UM:	.byte TILE7_BGDARKWALL_M,	TILE7_WALLTOP

LL_DBlock_UR:	.byte TILE7_BGDARKWALL_M,	TILE7_WALLTOP

LL_DBlock_ML:	.byte TILE7_BGDARKWALL_L,	TILE7_BGWALL_M

LL_DBlock_MM:	.byte TILE7_BGDARKWALL_M,	TILE7_BGWALL_M

LL_DBlock_MR:	.byte TILE7_BGDARKWALL_M,	TILE7_BGWALL_M

LL_DBlock_LL:	.byte TILE7_BGDARKWALL_LL,	TILE7_BGWALL_B

LL_DBlock_LM:	.byte TILE7_BGDARKWALL_B,	TILE7_BGWALL_B

LL_DBlock_LR:	.byte TILE7_BGDARKWALL_B,	TILE7_BGWALL_B

LoadLevel_DelfinoBlock:

	LDA LL_ShapeDef	 
	SUB #$10
	LSR A	
	LSR A	
	LSR A	
	LSR A	
	TAX		; X = relative index
		
	LDY #$00	 ; Y = 0

	LDA [Level_LayPtr_AddrL],Y
	STA <var3		; Get next byte from layout -> var3 (width of run)

	; Level_LayPtr_Addr += 1
	LDA <Level_LayPtr_AddrL
	ADD #$01	 
	STA <Level_LayPtr_AddrL
	LDA <Level_LayPtr_AddrH
	ADC #$00	 
	STA <Level_LayPtr_AddrH

	; Backup level_data_pointer/H into var1/2
	LDA <level_data_pointer
	STA <var1	
	LDA <level_data_pointer+1
	STA <var2	

	LDA LL_ShapeDef	
	AND #$0f	
	STA <var4	; var4 = lower 4 bits of LL_ShapeDef (height of run)

	LDY TileAddr_Off	; Y = TileAddr_Off

	; TOP ROW
	JSR Delfino_Block_DoRow

	TXA
	ADD #(LL_DBlock_ML - LL_DBlock_UL)
	TAX

	; MIDDLE ROW
Delfino_RowLoop:
	JSR Delfino_Block_DoRow

	DEC <var4
	BPL Delfino_RowLoop	; While var4 >= 0, loop!

	TXA
	ADD #(LL_DBlock_ML - LL_DBlock_UL)
	TAX

	; BOTTOM ROW
	JSR Delfino_Block_DoRow

	RTS		 ; Return


Delfino_Block_DoRow:
	LDA <var3
	STA <var5		; Width of run -> var5

	; Left edge
	LDA LL_DBlock_UL,X	 ; Get brick tile
	STA [level_data_pointer],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Go to next column

	; Middle
Delfino_WidthLoop:
	LDA LL_DBlock_UM,X	 ; Get brick tile
	STA [level_data_pointer],Y	 ; Store into tile mem

	JSR LoadLevel_NextColumn ; Go to next column

	DEC <var5		 ; var5--
	BPL Delfino_WidthLoop	 	 ; While var5 <> 0, loop!

	; Right edge
	LDA LL_DBlock_UR,X	 ; Get brick tile
	STA [level_data_pointer],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Go to next column
	
	JMP LL44_ReturnTileAndNextRow	; Next row / return column


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_DelfinoAwnWins
;
; Repeating pattern of awning and windows
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_DelfinoAwnWins:
	; Backup level_data_pointer/H into var1/2
	LDA <level_data_pointer
	STA <var1	
	LDA <level_data_pointer+1
	STA <var2	

	LDA LL_ShapeDef	 
	AND #$0f	 
	STA <var3		; var3 = lower 4 bits of LL_ShapeDef (width of run)
	STA <var5

	LDY TileAddr_Off	; Y = TileAddr_Off

	; Left awning would be here
	JSR LoadLevel_NextColumn ; Go to next column

	; Loop windows 
DAW_Loop:
	LDA #TILE7_BGAWN_WTOP	; Top of window
	STA [level_data_pointer],Y	 ; Store into tile mem

	JSR LoadLevel_NextColumn ; Go to next column
	JSR LoadLevel_NextColumn ; Go to next column

	DEC <var3		 ; var3--
	BPL DAW_Loop	 	; While var3 >= 0, loop...

	JSR LL44_ReturnTileAndNextRow	; Next row / return column

	; Reset count
	LDA <var5
	STA <var3

	; Left awning
	LDA #TILE7_BGAWNING_L	; Top of window
	STA [level_data_pointer],Y	 ; Store into tile mem

	; Loop awning
DAW_Loop2:
	JSR LoadLevel_NextColumn ; Go to next column

	LDA #TILE7_BGAWNING_WM	; Awning/window
	STA [level_data_pointer],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Go to next column

	LDA #TILE7_BGAWNING_M	; Awning
	STA [level_data_pointer],Y	 ; Store into tile mem

	DEC <var3		 ; var3--
	BPL DAW_Loop2	 	; While var3 >= 0, loop...

	; Right awning
	LDA #TILE7_BGAWNING_R	; Top of window
	STA [level_data_pointer],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Go to next column


	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_DelfinoWins
;
; Repeating pattern of windows
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DelfinoWins:	.byte TILE7_WINDOW_BOT, TILE7_WINDOW_TOP

LoadLevel_DelfinoWins:
	; Backup level_data_pointer/H into var1/2
	LDA <level_data_pointer
	STA <var1	
	LDA <level_data_pointer+1
	STA <var2	

	LDA LL_ShapeDef	 
	AND #$0f	 
	STA <var3		; var3 = lower 4 bits of LL_ShapeDef (width of run)
	STA <var5

	LDY TileAddr_Off	; Y = TileAddr_Off

	LDX #1

DAWs_RowLoop:
	; Reset count
	LDA <var5
	STA <var3

DAWs_Loop:
	LDA DelfinoWins,X	; Window tile
	STA [level_data_pointer],Y	 ; Store into tile mem

	LDA #4
	STA <var4

DAWs_GapLoop:
	JSR LoadLevel_NextColumn ; Go to next column
	DEC <var4
	BNE DAWs_GapLoop

	DEC <var3		 ; var3--
	BPL DAWs_Loop	 	; While var3 >= 0, loop...

	JSR LL44_ReturnTileAndNextRow	; Next row / return column

	DEX
	BPL DAWs_RowLoop

	; Reset count
	LDA <var5
	STA <var3

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_DelfinoRoof
;
; Front-face roof for building
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_DelfinoRoof:
	; Backup level_data_pointer/H into var1/2
	LDA <level_data_pointer
	STA <var1	
	LDA <level_data_pointer+1
	STA <var2	

	LDA LL_ShapeDef	 
	AND #$0f	 
	STA <var3		; var3 = lower 4 bits of LL_ShapeDef (width of run)

	LDY TileAddr_Off	; Y = TileAddr_Off

	; Roof eternally expands, starts with 3 mid
	LDA #3
	STA <var4

DAR_RowLoop:

	; First, left roof tile
	LDA #TILE7_BGROOF_L		
	STA [level_data_pointer],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Go to next column

	; Mid loop
	LDX <var4
DAR_InnerLoop:
	; Do mid tiles
	LDA #TILE7_BGROOF_M
	STA [level_data_pointer],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Go to next column

	DEX
	BNE DAR_InnerLoop

	; Last, right roof tile
	LDA #TILE7_BGROOF_R		
	STA [level_data_pointer],Y	 ; Store into tile mem

	; Next mid cycle is two more
	INC <var4
	INC <var4

	JSR LL44_ReturnTileAndNextRow	; Next row / return column

	; But go back one column
	JSR LoadLevel_PrevColumn44

	DEC <var3
	BPL DAR_RowLoop

	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_DelfinoRoofBG
;
; Depth enhancement for roof... I guess
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_DelfinoRoofBG:
	; Backup level_data_pointer/H into var1/2
	LDA <level_data_pointer
	STA <var1	
	LDA <level_data_pointer+1
	STA <var2	

	LDA LL_ShapeDef	 
	AND #$0f	 
	STA <var3		; var3 = lower 4 bits of LL_ShapeDef (width of run)

	LDY TileAddr_Off	; Y = TileAddr_Off

DARBG_RowLoop:

	; First, left roof tile
	LDA #TILE7_BGROOF_BL
	STA [level_data_pointer],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Go to next column

	LDA #TILE7_BGROOF_BM
	STA [level_data_pointer],Y	 ; Store into tile mem

	JSR LL44_ReturnTileAndNextRow	; Next row / return column

	; But go back one column
	JSR LoadLevel_PrevColumn44

	DEC <var3
	BPL DARBG_RowLoop

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_DelfinoTree
;
; BG Tree
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_DelfinoTree:
	; Backup level_data_pointer/H into var1/2
	LDA <level_data_pointer
	STA <var1	
	LDA <level_data_pointer+1
	STA <var2	

	LDA LL_ShapeDef	 
	AND #$0f	 
	STA <var3		; var3 = lower 4 bits of LL_ShapeDef (width of run)

	LDY TileAddr_Off	; Y = TileAddr_Off

DAT_RowLoop:

	; First, left roof tile
	LDA #TILE7_BGTREE
	STA [level_data_pointer],Y	 ; Store into tile mem
	JSR LL44_ReturnTileAndNextRow	; Next row / return column

	DEC <var3
	BPL DAT_RowLoop

	LDA #TILE7_BGTREE_ROOT
	STA [level_data_pointer],Y	 ; Store into tile mem

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_DelfinoPalmTree
;
; BG Palm Tree
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_DelfinoPalmTree:
	; Backup level_data_pointer/H into var1/2
	LDA <level_data_pointer
	STA <var1	
	LDA <level_data_pointer+1
	STA <var2	

	LDA LL_ShapeDef	 
	AND #$0f	 
	STA <var3		; var3 = lower 4 bits of LL_ShapeDef (width of run)

	LDY TileAddr_Off	; Y = TileAddr_Off

	; Palm tree upper
	LDA #TILE7_PALM_UL
	STA [level_data_pointer],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Go to next column
	LDA #TILE7_PALM_UR
	STA [level_data_pointer],Y	 ; Store into tile mem

	JSR LL44_ReturnTileAndNextRow	; Next row / return column

	; Palm tree lower
	LDA #TILE7_PALM_LL
	STA [level_data_pointer],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Go to next column
	LDA #TILE7_PALM_LR
	STA [level_data_pointer],Y	 ; Store into tile mem

	JSR LL44_ReturnTileAndNextRow	; Next row / return column

DAPT_RowLoop:

	LDA #TILE7_PALM_TL
	STA [level_data_pointer],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Go to next column
	LDA #TILE7_PALM_TR
	STA [level_data_pointer],Y	 ; Store into tile mem
	
	JSR LL44_ReturnTileAndNextRow	; Next row / return column

	DEC <var3
	BPL DAPT_RowLoop

	RTS		 ; Return

	
LoadLevel_PrevColumn44:
	DEY		 ; Y-- (previous column)
	TYA		 
	AND #$0f	 
	BNE PRG044_A7D6	 ; If we haven't crossed left screen boundary, jump to PRG020_A7D6

	; Go to previous screen by subtracting $1B0
	LDA <level_data_pointer
	SUB #$b0
	STA <level_data_pointer
	LDA <level_data_pointer+1
	SBC #$01
	STA <level_data_pointer+1

	INY
	TYA
	ORA #$0f
	TAY

PRG044_A7D6:
	STY TileAddr_Off	 ; TileAddr_Off = Y
	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_NBBlock
;
; Length of N&B Blocks. Yeah, N&B, not the brand you're thinking.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

NBBlock_Tiles:
	.byte TILE7_NB1_TL, TILE7_NB1_TM, TILE7_NB1_TR, TILE7_NB1_RE
	.byte TILE7_NB1_BL, TILE7_NB1_BM, TILE7_NB1_BM, TILE7_NB1_TJ
	.byte TILE7_NB1_TA

	.byte TILE7_NB2_TL, TILE7_NB2_TM, TILE7_NB2_TR, TILE7_NB2_RE
	.byte TILE7_NB2_BL, TILE7_NB2_BM, TILE7_NB2_BM, TILE7_NB2_TJ
	.byte TILE7_NB2_TA

	.byte TILE7_NB3_TL, TILE7_NB3_TM, TILE7_NB3_TR, TILE7_NB3_RE
	.byte TILE7_NB3_BL, TILE7_NB3_BM, TILE7_NB3_BM, TILE7_NB3_TJ
	.byte TILE7_NB3_TA

NBBlock_Offsets:	.byte 0, 9, 18

LoadLevel_NBBlock:

	LDA LL_ShapeDef	 
	SUB #$10
	LSR A	
	LSR A	
	LSR A	
	LSR A	
	TAX		; X = relative index
		
	LDY #$00	 ; Y = 0

	LDA [Level_LayPtr_AddrL],Y
	STA <var3		; Get next byte from layout -> var3 (width of run)
	STA <var5

	; Level_LayPtr_Addr += 1
	LDA <Level_LayPtr_AddrL
	ADD #$01	 
	STA <Level_LayPtr_AddrL
	LDA <Level_LayPtr_AddrH
	ADC #$00	 
	STA <Level_LayPtr_AddrH

	; Backup level_data_pointer/H into var1/2
	LDA <level_data_pointer
	STA <var1	
	LDA <level_data_pointer+1
	STA <var2	

	; Defines color (really atypical of SMB3 generators)
	LDA LL_ShapeDef	
	AND #$0f
	TAX
	LDA NBBlock_Offsets,X
	TAX

	LDY TileAddr_Off	; Y = TileAddr_Off

	; Regular left edge tile
	LDA NBBlock_Tiles,X
	STA <var4

NBBlock_TopLoop:


	LDA <var4
	JSR NBBlock_PutIfNoSky

	LDA NBBlock_Tiles+1,X
	JSR NBBlock_PutIfNoSky

	LDA NBBlock_Tiles+2,X
	JSR NBBlock_PutIfNoSky

	; Change to adjacent left edge tile afterward
	LDA NBBlock_Tiles+8,X
	STA <var4

	DEC <var3
	BPL NBBlock_TopLoop

	LDA NBBlock_Tiles+3,X
	JSR NBBlock_PutIfNoSky

	JSR LL44_ReturnTileAndNextRow	; Next row / return column

	LDA <var5
	STA <var3

NBBlock_BotLoop:
	LDA NBBlock_Tiles+4,X
	STA [level_data_pointer],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Go to next column

	LDA NBBlock_Tiles+5,X
	STA [level_data_pointer],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Go to next column

	LDA NBBlock_Tiles+6,X
	STA [level_data_pointer],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Go to next column

	DEC <var3
	BPL NBBlock_BotLoop

	LDA NBBlock_Tiles+7,X
	STA [level_data_pointer],Y	 ; Store into tile mem


	RTS

NBBlock_PutIfNoSky:
	STA <var6
	
	LDA [level_data_pointer],Y
	CMP #TILE7_SKY
	BNE NBTL_NoSky
	
	LDA <var6
	STA [level_data_pointer],Y	 ; Store into tile mem
	
NBTL_NoSky:
	JMP LoadLevel_NextColumn ; Go to next column


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_NBBlock_VEdge
;
; N&B Blocks vertical edge
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
NBBlock_VBlocks:	.byte TILE7_NB1_VE, TILE7_NB2_VE, TILE7_NB3_VE

LoadLevel_NBBlock_VEdge:
	; Backup level_data_pointer/H into var1/2
	LDA <level_data_pointer
	STA <var1	
	LDA <level_data_pointer+1
	STA <var2	

	LDY #$00	 ; Y = 0

	LDA [Level_LayPtr_AddrL],Y
	STA <var3		; Get next byte from layout -> var3 (width of run)

	; Level_LayPtr_Addr += 1
	LDA <Level_LayPtr_AddrL
	ADD #$01	 
	STA <Level_LayPtr_AddrL
	LDA <Level_LayPtr_AddrH
	ADC #$00	 
	STA <Level_LayPtr_AddrH
	
	LDA LL_ShapeDef	 
	AND #$0f	
	TAX
	LDA NBBlock_VBlocks,X
	STA <var4

	LDY TileAddr_Off	; Y = TileAddr_Off

NBBVE_Loop:

	LDA <var4
	STA [level_data_pointer],Y	 ; Store into tile mem
	JSR LoadLevel_TileMemNextRow	; Next row

	DEC <var3
	BPL NBBVE_Loop

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_DelfinoGround
;
; Adds a rectangle (width 1-256 / height 1-16) of Delfino ground
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_DelfinoGround:
	LDA LL_ShapeDef	 
	SUB #$10
	LSR A	
	LSR A	
	LSR A	
	LSR A	
	TAX		; X = relative index

	LDY #0
	LDA [Level_LayPtr_AddrL],Y
	STA <var3		; Get next byte from layout -> var3 (width of run)

	; Level_LayPtr_Addr += 1
	LDA <Level_LayPtr_AddrL
	ADD #$01	 
	STA <Level_LayPtr_AddrL
	LDA <Level_LayPtr_AddrH
	ADC #$00	 
	STA <Level_LayPtr_AddrH

	; Backup level_data_pointer/H into var1/2
	LDA <level_data_pointer
	STA <var1	
	LDA <level_data_pointer+1
	STA <var2	

	LDA LL_ShapeDef	
	AND #$0f	
	STA <var4	; var4 = lower 4 bits of LL_ShapeDef (height of run)

	LDY TileAddr_Off	; Y = TileAddr_Off

DelfinoGround_RowLoop:
	LDA <var3
	STA <var5		; Width of run -> var5

DelfinoGround_WidthLoop:
	LDA #TILE7_GROUND
	STA [level_data_pointer],Y	 ; Store into tile mem

	JSR LoadLevel_NextColumn ; Go to next column

	DEC <var5		 ; var5--
	BPL DelfinoGround_WidthLoop	 	 ; While var5 <> 0, loop!

	JSR LL44_ReturnTileAndNextRow	; Next row / return column
	
	DEC <var4
	BPL DelfinoGround_RowLoop
	
	RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_DelfinoCasino
;
; Casino Delfino Sign
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DelfinoCasino_Tiles:
	.byte TILE7_FLASHY, TILE7_FLASHY, TILE7_FLASHY, TILE7_FLASHY, TILE7_FLASHY, TILE7_FLASHY, TILE7_FLASHY
	.byte TILE7_FLASHY, TILE7_BLACK, TILE7_CASINO1, TILE7_CASINO2, TILE7_CASINO3, TILE7_BLACK, TILE7_FLASHY
	.byte TILE7_FLASHY, TILE7_FLASHY, TILE7_FLASHY, TILE7_FLASHY, TILE7_FLASHY, TILE7_FLASHY, TILE7_FLASHY

LoadLevel_DelfinoCasino:
	; Backup level_data_pointer/H into var1/2
	LDA <level_data_pointer
	STA <var1	
	LDA <level_data_pointer+1
	STA <var2	

	LDX #0
	LDY TileAddr_Off	; Y = TileAddr_Off
	
	LDA #2
	STA <var4

DelfinoCasino_RowLoop:
	LDA #6
	STA <var3

DelfinoCasino_WidthLoop:
	LDA DelfinoCasino_Tiles,X
	STA [level_data_pointer],Y	 ; Store into tile mem
	INX

	JSR LoadLevel_NextColumn ; Go to next column

	DEC <var3
	BPL DelfinoCasino_WidthLoop	 	 ; While X > 0, loop!

	JSR LL44_ReturnTileAndNextRow	; Next row / return column
	
	DEC <var4
	BPL DelfinoCasino_RowLoop
	
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_FillDiamondBG
;
; Fill in the casino diamond background
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_FillDiamondBG:
	LDX #TILE7_DIAMONDBG1
	LDY TileAddr_Off	 ; Y = TileAddr_Off

	; The lower 5 bits of var15 are whatever in fixed size gen...

	LDA <var15	 
	AND #$10	 
	BNE PRG044_D9E1	 ; If bit 4 of var15 is set, jump to PRG044_D9E1

	; Otherwise...
	CPY #$c0	  
	BLT PRG044_D9E9	 ; If Y < $C0 (end of screen), jump to PRG044_D9E9

PRG044_D9E1:
	TYA	
	SUB #$c0
	TAY	
	JMP PRG044_D9F3	 ; Jump to PRG044_D9F3

PRG044_D9E9:
	TXA
	EOR #1
	TAX
	JSR Tile_Mem_ClearA
	CPY #$00	 
	BNE PRG044_D9E9	 

PRG044_D9F3:
	TXA
	EOR #1
	TAX
	JSR Tile_Mem_ClearB
	INY		 
	CPY #$D0	 
	BNE PRG044_D9F3	 
	
PRG044_A432:
	LDA #TILE7_CHECKERBOARDUL
	JSR Tile_Mem_ClearB
	INY
	LDA #TILE7_CHECKERBOARDUR
	JSR Tile_Mem_ClearB
	INY
	CPY #$E0
	BNE PRG044_A432
		
PRG044_A442:
	LDA #TILE7_CHECKERBOARDLL
	JSR Tile_Mem_ClearB
	INY
	LDA #TILE7_CHECKERBOARDLR
	JSR Tile_Mem_ClearB
	INY
	CPY #$F0
	BNE PRG044_A442

	RTS		 ; Return
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_DelfinoSlots
;
; Casino Delfino Slot Machine Slots
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DelfinoSlots_Tiles:
	.byte TILE7_FLASHY, TILE7_FLASHY, TILE7_FLASHY
	.byte TILE7_FLASHY, TILE7_SLOTBG, TILE7_FLASHY
	.byte TILE7_FLASHY, TILE7_FLASHY, TILE7_FLASHY

LoadLevel_DelfinoSlots:
	; Backup level_data_pointer/H into var1/2
	LDA <level_data_pointer
	STA <var1	
	LDA <level_data_pointer+1
	STA <var2	

	LDX #0
	LDY TileAddr_Off	; Y = TileAddr_Off

	; Number of rows
	LDA #2
	STA <var4

DelfinoSlots_RowLoop:

	; Slots remaining
	LDA #2
	STA <var5

	; Next 3 tiles
	TXA
	ADD #3
	TAX

DelfinoSlots_SlotLoop:

	; Back up 3 tiles to repeat
	TXA
	SUB #3
	TAX

	; Columns of single slot
	LDA #2
	STA <var3

DelfinoSlots_WidthLoop:
	LDA DelfinoSlots_Tiles,X
	STA [level_data_pointer],Y	 ; Store into tile mem
	INX

	JSR LoadLevel_NextColumn ; Go to next column

	DEC <var3
	BPL DelfinoSlots_WidthLoop	 	 ; While var3 > 0, loop!

	; Skip a tile
	JSR LoadLevel_NextColumn ; Go to next column

	DEC <var5
	BPL DelfinoSlots_SlotLoop	 	 ; While var5 > 0, loop!

	JSR LL44_ReturnTileAndNextRow	; Next row / return column
	
	DEC <var4
	BPL DelfinoSlots_RowLoop
	
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Delfino_PipeVRun
;
; Run of vertical half-pipe tiles, for being in pipe works
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Delfino_PipeVRun_Tiles:	
	.byte TILE1_PIPEVL, TILE1_PIPEVR

Delfino_PipeVRun:

	LDA LL_ShapeDef	 
	LSR A	
	LSR A	
	LSR A	
	LSR A
	AND #1
	TAX		; X = relative index

	; Backup level_data_pointer/H into var1/2
	LDA <level_data_pointer
	STA <var1	
	LDA <level_data_pointer+1
	STA <var2	
	
	LDA LL_ShapeDef	
	AND #$0f	
	STA <var4	; var4 = lower 4 bits of LL_ShapeDef (height of run)

	LDY TileAddr_Off	; Y = TileAddr_Off

Delfino_PipeVRun_Loop:
	LDA Delfino_PipeVRun_Tiles,X
	STA [level_data_pointer],Y	 ; Store into tile mem

	JSR LL44_ReturnTileAndNextRow ; Go to next column

	DEC <var4
	BPL Delfino_PipeVRun_Loop	 	 ; While X > 0, loop!

	RTS
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Delfino_PipeHRun
;
; Run of horizontal half-pipe tiles, for being in pipe works
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Delfino_PipeHRun_Tiles:	
	.byte TILE1_PIPEHT, TILE1_PIPEHB

Delfino_PipeHRun:

	LDA LL_ShapeDef	 
	LSR A	
	LSR A	
	LSR A	
	LSR A
	LSR A
	AND #1
	TAX		; X = relative index
	
	LDA LL_ShapeDef	
	AND #$0f	
	STA <var4	; var4 = lower 4 bits of LL_ShapeDef (width of run)

	LDY TileAddr_Off	; Y = TileAddr_Off

Delfino_PipeHRun_Loop:
	LDA Delfino_PipeHRun_Tiles,X
	STA [level_data_pointer],Y	 ; Store into tile mem

	JSR LoadLevel_NextColumn ; Go to next column

	DEC <var4
	BPL Delfino_PipeHRun_Loop	 	 ; While X > 0, loop!

	RTS	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_DelfinoPipeC
;
; Half-pipe corner tile
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DelfinoPipeC_Tiles:
	.byte TILE7_PIPECORNER_UL, TILE7_PIPECORNER_UR, TILE7_PIPECORNER_LL, TILE7_PIPECORNER_LR

LoadLevel_DelfinoPipeC:
	TXA	
	SUB #11
	TAX		 ; Now 'X' is relative index

	LDY TileAddr_Off ; Y = TileAddr_Off

	LDA DelfinoPipeC_Tiles,X
	STA [level_data_pointer],Y	 ; Store into tile mem

	RTS
	
	; Broken into another file for ease of integration in NoDice editor
	.include "PRG/levels/Delfino.asm"
	
