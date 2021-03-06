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
; FILENAME: PRG045.bin, File Size: 8193, ORG: $A000
;     -> NES mode enabled
;---------------------------------------------------------------------------
Tile_Layout_TS15:
	; This defines the individual 8x8 blocks used to construct one of the tiles
	; Referenced by Address_Per_Tileset, addressed by Level_Tileset
	; Stored by upper left, then lower left, then upper right, then lower right

	; Remember that palette is determined by the upper 2 bits of a TILE (not the PATTERN)
	; I.e. tiles starting at index $00, $40, $80, $C0 are each on that respective palette

	; Upper left 8x8 pattern per tile
	.byte $FC, $DC, $2C, $05, $05, $E8, $2E, $FC, $FC, $38, $05, $2D, $2D, $23, $05, $05 ; Tiles $00 - $0F
	.byte $00, $02, $04, $06, $20, $22, $24, $26, $40, $42, $44, $46, $60, $62, $64, $66 ; Tiles $10 - $1F
	.byte $07, $FD, $FD, $FD, $FD, $12, $12, $FF, $FF, $FF, $FF, $FF, $D0, $D0, $B8, $B8 ; Tiles $20 - $2F
	.byte $B8, $B8, $BC, $94, $B0, $B1, $FD, $FD, $12, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DC, $05, $7C, $FE, $05, $05, $05, $5A, $05, $05, $05, $0C, $2E, $05, $6F, $64 ; Tiles $40 - $4F
	.byte $05, $F4, $F4, $F4, $58, $14, $14, $0D, $49, $4B, $4F, $5C, $6C, $6E, $04, $D8 ; Tiles $50 - $5F
	.byte $98, $98, $98, $98, $98, $98, $92, $B4, $B4, $B4, $B4, $B4, $B4, $B4, $B4, $B4 ; Tiles $60 - $6F
	.byte $B4, $B8, $98, $98, $98, $98, $A4, $EC, $E4, $C0, $53, $6C, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
	.byte $05, $3C, $40, $44, $44, $C4, $4F, $51, $64, $65, $FF, $68, $6A, $FF, $FF, $FF ; Tiles $80 - $8F
	.byte $FF, $FF, $FF, $FF, $88, $FE, $00, $49, $4E, $04, $4E, $49, $68, $6A, $72, $72 ; Tiles $90 - $9F
	.byte $34, $3A, $3A, $38, $FF, $FF, $38, $FF, $FF, $57, $60, $63, $AE, $8C, $8E, $8C ; Tiles $A0 - $AF
	.byte $8E, $8C, $8E, $8C, $8E, $52, $52, $50, $40, $42, $AC, $AE, $B8, $8C, $8E, $52 ; Tiles $B0 - $BF
	.byte $00, $02, $04, $10, $12, $14, $1C, $1E, $20, $28, $2C, $30, $62, $6A, $6A, $20 ; Tiles $C0 - $CF
	.byte $3C, $40, $41, $12, $2C, $3A, $05, $05, $12, $2C, $88, $FE, $C5, $C7, $FE, $FE ; Tiles $D0 - $DF
	.byte $AA, $AB, $3A, $3A, $3A, $38, $38, $38, $05, $05, $38, $04, $10, $52, $53, $52 ; Tiles $E0 - $EF
	.byte $53, $D7, $E0, $05, $4D, $0A, $28, $2A, $FF, $FF, $FF, $FF, $FF, $FF, $F8, $FF ; Tiles $F0 - $FF

	; Lower left 8x8 pattern per tile
	.byte $FC, $DD, $3C, $06, $D6, $E9, $3E, $38, $FC, $FC, $0E, $06, $06, $06, $48, $4A ; Tiles $00 - $0F
	.byte $10, $12, $14, $16, $30, $32, $34, $36, $50, $52, $54, $56, $70, $72, $74, $76 ; Tiles $10 - $1F
	.byte $07, $FD, $16, $FD, $5A, $22, $13, $FF, $FF, $FF, $FF, $FF, $D1, $D1, $B9, $B9 ; Tiles $20 - $2F
	.byte $B9, $B9, $BD, $95, $B1, $B0, $16, $5A, $13, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DD, $06, $7E, $FE, $06, $06, $06, $5B, $49, $6C, $6C, $0E, $0E, $6D, $06, $65 ; Tiles $40 - $4F
	.byte $06, $F5, $F5, $F5, $48, $15, $15, $FE, $FF, $FF, $13, $5D, $7C, $7E, $14, $D9 ; Tiles $50 - $5F
	.byte $99, $99, $99, $99, $99, $99, $93, $B5, $B5, $B5, $B5, $B5, $B5, $B5, $B5, $B5 ; Tiles $60 - $6F
	.byte $B5, $B9, $99, $99, $99, $99, $A5, $ED, $E4, $C1, $54, $6D, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
	.byte $06, $3E, $42, $46, $48, $C4, $51, $51, $64, $FF, $FF, $6A, $6A, $FF, $FF, $FF ; Tiles $80 - $8F
	.byte $FF, $FF, $FF, $FF, $89, $FE, $01, $59, $04, $04, $04, $59, $71, $71, $6C, $6E ; Tiles $90 - $9F
	.byte $38, $FF, $FF, $38, $FF, $FF, $36, $3B, $3B, $58, $61, $62, $AE, $9C, $9E, $9C ; Tiles $A0 - $AF
	.byte $9E, $9C, $9E, $9C, $9E, $53, $53, $51, $41, $43, $AC, $AE, $B9, $9C, $9E, $53 ; Tiles $B0 - $BF
	.byte $0A, $0C, $0E, $16, $18, $1A, $22, $24, $26, $2A, $2E, $32, $60, $68, $68, $22 ; Tiles $C0 - $CF
	.byte $3E, $42, $43, $13, $2D, $3B, $06, $E6, $13, $2D, $89, $FE, $FE, $FE, $FE, $FE ; Tiles $D0 - $DF
	.byte $AB, $AB, $39, $2D, $39, $06, $06, $39, $39, $39, $39, $50, $51, $52, $51, $04 ; Tiles $E0 - $EF
	.byte $10, $06, $E1, $06, $4E, $1A, $38, $3A, $FF, $FF, $FF, $FF, $FF, $FF, $F9, $FF ; Tiles $F0 - $FF

	; Upper right 8x8 pattern per tile	
	.byte $FC, $DE, $2D, $07, $07, $EA, $2F, $FC, $38, $FC, $06, $2E, $21, $2E, $07, $07 ; Tiles $00 - $0F
	.byte $01, $03, $05, $07, $21, $23, $25, $27, $41, $43, $45, $47, $61, $63, $65, $67 ; Tiles $10 - $1F
	.byte $07, $FD, $27, $10, $10, $FD, $FD, $FF, $FF, $FF, $FF, $FF, $D2, $D2, $BA, $BA ; Tiles $20 - $2F
	.byte $BA, $BA, $BE, $96, $B0, $B1, $27, $10, $FD, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DE, $07, $7D, $FE, $07, $07, $07, $07, $07, $07, $07, $0D, $2F, $6D, $08, $07 ; Tiles $40 - $4F
	.byte $65, $F6, $F6, $F6, $59, $15, $15, $0E, $4A, $4C, $4F, $5E, $6D, $6F, $68, $DA ; Tiles $50 - $5F
	.byte $9A, $9A, $9A, $9A, $9A, $9A, $CA, $B6, $B6, $B6, $B6, $B6, $B6, $B6, $B6, $B6 ; Tiles $60 - $6F
	.byte $B6, $BA, $9A, $9A, $9A, $9A, $A6, $EE, $E5, $C2, $55, $6D, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
	.byte $07, $3D, $41, $45, $45, $C6, $50, $52, $FF, $66, $67, $69, $6B, $FF, $FF, $FF ; Tiles $80 - $8F
	.byte $FF, $FF, $FF, $FF, $8A, $FE, $02, $49, $4F, $0D, $4F, $48, $69, $6B, $72, $72 ; Tiles $90 - $9F
	.byte $3A, $3A, $35, $FF, $FF, $39, $FF, $FF, $39, $59, $60, $63, $AF, $8D, $8F, $8D ; Tiles $A0 - $AF
	.byte $8F, $8D, $8F, $8D, $8F, $72, $72, $70, $40, $42, $AD, $AF, $BA, $8D, $8F, $72 ; Tiles $B0 - $BF
	.byte $01, $03, $09, $11, $13, $15, $1D, $1F, $21, $29, $2D, $31, $63, $6B, $6A, $21 ; Tiles $C0 - $CF
	.byte $3D, $41, $41, $13, $2D, $3B, $07, $07, $13, $2D, $8A, $FE, $C7, $D4, $FE, $FE ; Tiles $D0 - $DF
	.byte $AA, $AB, $3B, $3B, $3B, $39, $39, $39, $07, $39, $07, $09, $11, $53, $52, $53 ; Tiles $E0 - $EF
	.byte $52, $D7, $E2, $07, $4E, $0B, $29, $2B, $FF, $FF, $FF, $FF, $FF, $FF, $FA, $FF ; Tiles $F0 - $FF

	; Lower right 8x8 pattern per tile
	.byte $FC, $DF, $3D, $08, $D6, $EB, $3F, $FC, $FC, $38, $0F, $08, $08, $08, $49, $4B ; Tiles $00 - $0F
	.byte $11, $13, $15, $17, $31, $33, $35, $37, $51, $53, $55, $57, $71, $73, $75, $77 ; Tiles $10 - $1F
	.byte $07, $FD, $17, $20, $11, $FD, $59, $FF, $FF, $FF, $FF, $FF, $D3, $D3, $BB, $BB ; Tiles $20 - $2F
	.byte $BB, $BB, $BF, $97, $B1, $B0, $17, $11, $59, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DF, $08, $66, $FE, $08, $08, $08, $08, $6C, $6C, $6E, $0F, $0F, $6F, $09, $64 ; Tiles $40 - $4F
	.byte $08, $F7, $F7, $F7, $48, $14, $14, $27, $FF, $FF, $5F, $5F, $7D, $7F, $15, $DB ; Tiles $50 - $5F
	.byte $9B, $9B, $9B, $9B, $9B, $9B, $CB, $B7, $B7, $B7, $B7, $B7, $B7, $B7, $B7, $B7 ; Tiles $60 - $6F
	.byte $B7, $BB, $9B, $9B, $9B, $9B, $A7, $EF, $E5, $C3, $56, $6C, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
	.byte $08, $3F, $43, $47, $47, $C6, $52, $52, $FF, $67, $67, $6B, $6B, $FF, $FF, $FF ; Tiles $80 - $8F
	.byte $FF, $FF, $FF, $FF, $8B, $FE, $03, $59, $0D, $0D, $0D, $58, $71, $71, $6D, $6F ; Tiles $90 - $9F
	.byte $FF, $FF, $39, $FF, $FF, $39, $3B, $3B, $37, $5A, $61, $62, $AF, $9D, $9F, $9D ; Tiles $A0 - $AF
	.byte $9F, $9D, $9F, $9D, $9F, $73, $73, $71, $41, $43, $AD, $AF, $BB, $9D, $9F, $73 ; Tiles $B0 - $BF
	.byte $0B, $0D, $0F, $17, $19, $1B, $23, $25, $27, $2B, $2F, $33, $61, $69, $68, $23 ; Tiles $C0 - $CF
	.byte $3F, $43, $43, $12, $12, $2C, $3A, $E7, $2C, $3A, $8B, $FE, $FE, $FE, $FE, $FE ; Tiles $D0 - $DF
	.byte $AB, $AB, $3A, $2C, $3B, $08, $38, $08, $38, $38, $38, $51, $50, $51, $52, $09 ; Tiles $E0 - $EF
	.byte $11, $08, $E3, $08, $4D, $1B, $39, $3B, $FF, $FF, $FF, $FF, $FF, $FF, $FB, $FF ; Tiles $F0 - $FF

Tile_Attributes_TS15:
	.byte $21, $58, $96, $F1, $2E, $5A, $96, $F1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_TS15
;
; Entry point for loading level layout data for Level_Tileset = 5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_TS15:
	LDY #00

	LDX #TILE15_CLOUDS_LL

PRG045_A40A:
	LDA #TILE15_SKY
	JSR Tile_Mem_ClearB
	INY
	CPY #$10
	BNE PRG045_A40A

PRG045_A418:
	LDA #TILE15_SKY
	JSR Tile_Mem_ClearB
	INY
	CPY #$20
	BNE PRG045_A418

	; Need to pattern clouds that repeats every 3 screens

	; 0123456789ABCDEF 0123456789ABCDEF 0123456789ABCDEF
	; 0120120120120120 1201201201201201 2012012012012012


	LDX #2
TS15_CloudRows_Loop:
	; Start index
	LDY TS15_CloudRow_StartStopIndex,X

	; Rotation vars
	LDA TS15_CloudRow_StartTiles,X
	STA <var1
	ADD #1
	STA <var2
	ADD #1
	STA <var3
	
	; End index
	LDA TS15_CloudRow_StartStopIndex+1,X
	STA <var4
	
	JSR TS15_Clear_CloudRow

	DEX			; X--
	BPL TS15_CloudRows_Loop	; While X >= 0, loop!

	LDY #$30
PRG045_A426:
	LDA #TILE15_SKY
	JSR Tile_Mem_ClearB
	JSR Tile_Mem_ClearA
	CPY #$F0
	BNE PRG045_A426

	JSR LoadLevel_RandomTS15Clouds

	JMP LevelLoad	; Begin actual level loading!

TS15_CloudRow_StartTiles:		.byte TILE15_CLOUDS_UL, TILE15_CLOUDS_ML, TILE15_CLOUDS_LL
TS15_CloudRow_StartStopIndex:	.byte $00, $10, $20, $30	; This serves as start (+0) and stop (+1)

TS15_Clear_CloudRow:
	LDA <var1
	STA Tile_Mem,Y	 		; Screen 0
	STA Tile_Mem+$510,Y		; Screen 3 (0)
	STA Tile_Mem+$A20,Y		; Screen 6 (0)
	STA Tile_Mem+$F30,Y		; Screen 9 (0)
	STA Tile_Mem+$1440,Y	; Screen 12 (0)
	
	LDA <var2
	STA Tile_Mem+$1B0,Y		; Screen 1
	STA Tile_Mem+$6C0,Y		; Screen 4 (1)
	STA Tile_Mem+$BD0,Y		; Screen 7 (1)
	STA Tile_Mem+$10E0,Y	; Screen 10 (1)
	STA Tile_Mem+$15F0,Y	; Screen 13 (1)

	LDA <var3
	STA Tile_Mem+$360,Y		; Screen 2
	STA Tile_Mem+$870,Y		; Screen 5 (2)
	STA Tile_Mem+$D80,Y		; Screen 8 (2)
	STA Tile_Mem+$1290,Y	; Screen 11 (2)
	STA Tile_Mem+$17A0,Y	; Screen 14 (2)
	
	; Rotate! 2 -> 1, 3 -> 2, 1 -> 3
	LDA <var1
	PHA
	
	LDA <var2
	STA <var1
	
	LDA <var3
	STA <var2
	
	PLA
	STA <var3
	
	INY		 ; Y++

	CPY <var4
	BNE TS15_Clear_CloudRow
	
	RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_RandomTS15Clouds
;
; Generates 60 random "power up" clouds in Plains style levels
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LL_TS15Clouds:
	.byte TILE15_CLOUDSINGLE1, TILE15_CLOUDSINGLE2, TILE15_CLOUDSINGLE3, TILE15_CLOUDSINGLE1

LoadLevel_RandomTS15Clouds:
	LDA #9
	STA Misc_Counter ; Generate 10 random clouds!

PRG045_D22B:
	JSR Randomize	 ; Seed the randomizer
	LDA RandomN	 ; Get a random number
	TAX		 ; -> 'X'

	AND #$7F
	ADD #$30
	STA <var16	 ; var16 = 'X'

	TXA		 
	AND #$03	 
	CMP #$03	 
	BNE PRG045_D257	 ; If this random value is not 3, jump to PRG045_D257 (mod 3 essentially)

	; Otherwise, if 3, subtract 2 (make 0)
	SUB #2

PRG045_D257:
	TAX		 ; Get random 0-2 value

	LDA LL_TS15Clouds,X	 ; Get random power up cloud!
	LDY <var16
	JSR Tile_Mem_ClearB
	TYA
	EOR #$0F
	TAY
	LDA LL_TS15Clouds+1,X	 ; Get random power up cloud!
	JSR Tile_Mem_ClearA

	DEC Misc_Counter	 ; Misc_Counter--
	BPL PRG045_D22B	 	; While Misc_Counter >= 0, loop!

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_Generator_TS15
;
; Based on the values in var15 and LL_ShapeDef, chooses an
; appropriate generator function to builds this piece of the
; level.  Tedious, but saves space and is paper-design friendly.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PRG045_A42A:
	.byte 0, 15, 30, 45, 60, 75, 90, 105

LoadLevel_Generator_TS15:
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
	ADD PRG045_A42A,X	; Add multiple of 15
	TAX
	DEX
	TXA		 ; A = ((LL_ShapeDef >> 4) + PRG015_A419[X]) - 1


	; PRG045_A42A provides values well in excess of 51, but only 51
	; addresses are defined here; reserved for expansion...
	
	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word LoadLevel_RectangleExt		;  0 - Rectangle of lineart tiles
	.word LoadLevel_BGChain		;  1 - BG Chain 1
	.word LoadLevel_BGChain		;  2 - BG Chain 2
	.word LoadLevel_WoodRun		;  3 - Run of wood planks
	.word LoadLevel_Lava15		;  4 - Lava
	.word LoadLevel_Brick15		;  5 - Brick
	.word LoadLevel_Ground15		;  6 - Ground
	.word LoadLevel_ActionSwitch		; 7 - Action Switch
	.word LoadLevel_PipeRaiseHelper1	; 8 - Pipe Raise Helper 1
	.word LoadLevel_PipeRaiseHelper2	; 9 - Pipe Raise Helper 2
	.word LoadLevel_PipeRaiseHelper3	; 10 - Pipe Raise Helper 3
	.word LoadLevel_PipeRaiseHelper4	; 11 - Pipe Raise Helper 4
	.word LoadLevel_WindowShort45		; 12 - Short windows
	.word LoadLevel_WindowTall45		; 13 - Tall windows
	.word LoadLevel_DonutLifts				; 14 - Donut lifts
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
	.word LoadLevel_SpikeUp45			; 43 - Spikes up
	.word LoadLevel_VTransitPipeRun		; 44 - Vertical in-level transit pipe
	.word LoadLevel_SpikeDown45			; 45 - Spikes down
	.word LoadLevel_TopDecoBlocks		; 46 - Top-Deco Rectangle Diamond blocks
	.word LoadLevel_BGLines				; 47 - BG Lines
	.word LoadLevel_GNWBrick			; 48 - Game N Watch bricks
	.word LoadLevel_VGroundPipe5Run		; 49 - Vertical ground pipe 5 (exits to common end area)
	.word LoadLevel_HRightWallPipeRun3	; 50 - Horizontal right-hand wall pipe 3 (no entrance)
	.word LoadLevel_GNWBrickV			; 51 - Game N Watch bricks vertical
	.word LoadLevel_PurpleCoins		; 52 - Run of Purple coins
	.word LoadLevel_PurpleCoinR		; 53 - Rectangle of Purple Coins


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LeveLoad_FixedSizeGen_TS15
;
; Much simpler generators that are fixed-size, commonly used for 
; just single tile placement styles (although a couple relatively 
; complex ones exist in here as well)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LeveLoad_FixedSizeGen_TS15:
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
	.word LoadLevel_BGChainTerminus		;  0 - Chain terminus
	.word LoadLevel_Door2				;  1 - Door
	.word $0000				;  2 - 
	.word $0000				;  3 - 
	.word $0000		;  4 - 
	.word $0000				;  5 - 
	.word $0000				;  6 - 
	.word $0000				;  7 - 
	.word LoadLevel_StarCoin1		;  8 - Star Coin 1
	.word LoadLevel_StarCoin2		;  9 - Star Coin 2
	.word LoadLevel_StarCoin3		; 10 - Star Coin 3
	.word $0000				; 11 - 
	.word $0000				; 12 - 
	.word $0000				; 13 - 
	.word $0000				; 14 - 
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
	.word LoadLevel_BlockBossPortal	; 42 - For final castle boss arena; block pipes you've accomplished
	.word $0000				; 43 - 
	.word LoadLevel_FillBackground		; 44 - Sky fill


	; Goes to next row and updates backup variable var2
LL45_ReturnTileAndNextRow:
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
; LoadLevel_RectangleExt
;
; Rectangle of ext blocks with cross-section detection
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LLExt_Tiles:
	; 		Bottom				Middle				Top
	.byte TILE15_LINEBLK_LL,	TILE15_LINEBLK_ML,	TILE15_LINEBLK_UL	; Left
	.byte TILE15_LINEBLK_LM,	TILE15_LINEBLK_MM,	TILE15_LINEBLK_UM	; Middle
	.byte TILE15_LINEBLK_LR,	TILE15_LINEBLK_MR,	TILE15_LINEBLK_UR	; Right

LoadLevel_RectangleExt:
	LDX #2		; Top row tiles (ext)

LLExtect_2:
	LDY #$00	 		; Y = 0
	LDA [Level_LayPtr_AddrL],Y	; Get next byte
	STA <var3		 	; Store into var3 (width)

	; Level_LayPtr_Addr++
	LDA <Level_LayPtr_AddrL
	ADD #$01	 
	STA <Level_LayPtr_AddrL
	LDA <Level_LayPtr_AddrH
	ADC #$00	 
	STA <Level_LayPtr_AddrH

LLExtect_RowLoop:
	LDY TileAddr_Off	 ; Y = TileAddr_Off

	; By default there's only one "row" of the top/bottom
	LDA #1

	CPX #1
	BNE LLExtect_TopBot	; If not doing the middle ext tiles, keep the row count of 1

LLExtect_FenceMiddle:
	; The "middle" rows are set by parameter...
	LDA LL_ShapeDef	 
	AND #$0f	

LLExtect_TopBot:
	STA <var4	; Set rows for inner loop


LLExtect_InnerLoop:
	LDA <var4
	BEQ LLExtect_InnerLoop_End	; Using "0" as loop termination so allow for no middle rows

	; Backup level_data_pointer/H into var1/2
	LDA <level_data_pointer
	STA <var1	
	LDA <level_data_pointer+1
	STA <var2	

	; Reset width counter
	LDA <var3	
	STA <var5	; var5 = var3 (width)

	; Left tile
	LDA LLExt_Tiles,X	 	 ; Get block
	JSR LLExtect_PlaceTile	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column

LLExtect_ColLoop:
	LDA <var5
	BEQ LLExtect_ColLoop_End		; Using "0" as loop termination so allow for no middle columns

	LDA LLExt_Tiles+3,X	 ; Get block
	JSR LLExtect_PlaceTile	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column

	DEC <var5
	JMP LLExtect_ColLoop	 	; Loop around...

LLExtect_ColLoop_End:
	; Right tile
	LDA LLExt_Tiles+6,X	 	 ; Get block
	JSR LLExtect_PlaceTile	 ; Store into tile mem

	; Restore Map_Tile_Addr from backup
	LDA <var1		 
	STA <level_data_pointer	
	LDA <var2		
	STA <level_data_pointer+1	
	
	; Go to next row by adding 16 to address
	LDA TileAddr_Off
	ADD #16
	STA TileAddr_Off
	TAY
	LDA <level_data_pointer+1
	ADC #$00	 
	STA <level_data_pointer+1
	STA <var2		 ; Update level_data_pointer+1 backup
	
	DEC <var4
	JMP LLExtect_InnerLoop	; Loop around...


LLExtect_InnerLoop_End:
	; After loop...

	DEX
	BPL LLExtect_RowLoop	 	; While X >= 0 (didn't yet do bottom row), loop!

LLExtect_EndFence:
	RTS		 ; RetExtn



LLExtect_PlaceTile:
	PHA	; Save tile

	CMP [level_data_pointer],Y
	BEQ LLExtect_PlaceTile_Normal	; If placing the same tile, just stick with it
	
	
	; Fortress tile check...
	; If covering up an existing fence tile, use the "mid fence"
	; TILE15_LINEBLK_UL >= x >= TILE15_LINEBLK_LR
	LDA [level_data_pointer],Y
	CMP #TILE15_LINEBLK_UL
	BLT LLExtect_PlaceTile_Normal
	CMP #TILE15_LINEBLK_LR+1
	BGE LLExtect_PlaceTile_Normal
	
	; Overlap!
	PLA		; Reject old tile
	LDA #TILE15_LINEBLK_MM
	PHA		; Replace tile

LLExtect_PlaceTile_Normal:
	PLA
	STA [level_data_pointer],Y	; Store tile

	RTS
	

LoadLevel_PrevColumn45:
	DEY		 ; Y-- (previous column)
	TYA		 
	AND #$0F
	CMP #$0F
	BNE PRG045_A7D6	 ; If we haven't crossed left screen boundary, jump to PRG020_A7D6

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

PRG045_A7D6:
	STY TileAddr_Off	 ; TileAddr_Off = Y
	RTS		 ; Return
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_BGChain
;
; Length of BG Chain
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
BGChain_Tiles:
	.byte TILE15_BGCHAIN1, TILE15_BGCHAIN2	; 0
	.byte TILE15_BGCHAIN3, TILE15_BGCHAIN3	; 1

LoadLevel_BGChain:
	LDA LL_ShapeDef
	LSR A	
	LSR A	
	LSR A	
	LSR A	
	AND #1
	ASL A
	TAX

	; Backup level_data_pointer/H into var1/2
	LDA <level_data_pointer
	STA <var1	
	LDA <level_data_pointer+1
	STA <var2	

	LDA LL_ShapeDef	 
	AND #$0f	 
	STA <var3		; var3 = lower 4 bits of LL_ShapeDef (length of chain)
	STA <var5

	LDY TileAddr_Off	; Y = TileAddr_Off
BGChainLoop:
	LDA BGChain_Tiles,X
	STA [level_data_pointer],Y	 ; Store into tile mem

	TXA
	EOR #1
	TAX

	JSR LoadLevel_PrevColumn45
	JSR LoadLevel_TileMemNextRow

	DEC <var3		 ; var3--
	BPL BGChainLoop	 	; While var3 >= 0, loop...

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_BGChainTerminus
;
; Terminus to the chains
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_BGChainTerminus:

	LDA #TILE15_BGCHAINTERM

	LDY TileAddr_Off ; Y = TileAddr_Off
	STA [level_data_pointer],Y	 ; Store into tile mem


	RTS		 ; Return	


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_WoodRun
;
; Run of wood plank floors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_WoodRun:
	LDA LL_ShapeDef	 
	AND #$0f	 
	STA <var3		; var3 = lower 4 bits of LL_ShapeDef (length of chain)

	LDY TileAddr_Off	; Y = TileAddr_Off
	LDX #TILE15_WOOD_L
WoodPlanksLoop:
	TXA
	STA [level_data_pointer],Y	 ; Store into tile mem
	EOR #1
	TAX

	JSR LoadLevel_NextColumn

	TXA
	STA [level_data_pointer],Y	 ; Store into tile mem
	EOR #1
	TAX

	JSR LoadLevel_NextColumn

	DEC <var3		 ; var3--
	BPL WoodPlanksLoop	 	; While var3 >= 0, loop...

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_Brick15
;
; Adds a rectangle (width 1-256 / height 1-16) of Brick15 ground
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LLGB15_Tiles:	.byte TILE15_BRICK, TILE15_GROUND

LoadLevel_Ground15:
	LDX #1
	BNE LL15_CommonRect

LoadLevel_Brick15:
	LDX #0

LL15_CommonRect:
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

Brick15Ground_RowLoop:
	LDA <var3
	STA <var5		; Width of run -> var5

Brick15Ground_WidthLoop:
	LDA LLGB15_Tiles,X
	STA [level_data_pointer],Y	 ; Store into tile mem

	JSR LoadLevel_NextColumn ; Go to next column

	DEC <var5		 ; var5--
	BPL Brick15Ground_WidthLoop	 	 ; While var5 <> 0, loop!

	JSR LL45_ReturnTileAndNextRow	; Next row / return column
	
	DEC <var4
	BPL Brick15Ground_RowLoop
	
	RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_WindowShort45
;
; Puts down 1-16 short (1 mid tall) windows; multiple windows are
; gapped 3 tiles apart.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_WindowShort45:
	LDX #$00	 ; X = 0 (short window)
	BEQ PRG045_A57A	 ; Jump (technically always) to PRG045_A57A

LL_Window45Height:
	.byte 1, 3	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_WindowTall45
;
; Puts down 1-16 tall (3 mid tall) windows; multiple windows are
; gapped 3 tiles apart.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_WindowTall45:
	LDX #$01	 ; X = 1 (tall window)

PRG045_A57A:
	STX <var12		 ; var12 = 'X' (0 or 1)

	; Backup level_data_pointer/H into var1/2
	LDA <level_data_pointer	
	STA <var1		
	LDA <level_data_pointer+1	
	STA <var2		

	LDA LL_ShapeDef
	AND #$0f	
	STA <var4		; var4 = lower 4 bits of LL_ShapeDef (Width of run)

PRG045_A58B:
	LDX <var12		; X = var12 (0 or 1)

	LDA LL_Window45Height,X	 ; Get height of this window
	STA <var3		 ; Store into var3
 
	LDY TileAddr_Off	 ; Y = TileAddr_Off

	LDA #TILE15_WINDOW_TOP	 ; Top of window
	STA [level_data_pointer],Y	 ; Store into tile mem

	JMP PRG045_A5A0	 	; Jump to PRG045_A5A0

	; Loop for all middle sections of window
PRG045_A59C:
	LDA #TILE15_WINDOW_MID	 ; Middle of window
	STA [level_data_pointer],Y	 ; Store into tile mem

PRG045_A5A0:

	; Move to next row by adding 16 to tile offset
	JSR LoadLevel_TileMemNextRow

	DEC <var3		 ; var3-- (window height counter)
	BNE PRG045_A59C	 	; While var3 <> 0, loop!

	LDA #TILE15_WINDOW_MID	 ; Bottom of window
	STA [level_data_pointer],Y	 ; Store into tile mem

	; Restore Map_Tile_Addr from backup
	LDA <var1
	STA <level_data_pointer
	LDA <var2	
	STA <level_data_pointer+1

	LDX #$03	 ; X = 3  (three tile spacing between windows)
	LDY TileAddr_Off ; Y = TileAddr_Off
PRG045_A5C0:
	; The following (down to PRG045_CE05) is ALMOST the same as LoadLevel_NextColumn,
	; except it also backs up the new address (kind of pointless, but sure...)

	INY		 ; Y++
	TYA		 ; A = Y
	AND #$0f	 ; Check column
	BNE PRG045_A5DD  ; If on column 1-15, jump to PRG045_CE05

	; Otherwise, need to move over to the next screen (+$1B0)
	LDA <level_data_pointer
	ADD #$b0	 
	STA <level_data_pointer
	STA <var1		 ; Update level_data_pointer backup
	LDA <level_data_pointer+1
	ADC #$01	 
	STA <level_data_pointer+1
	STA <var2		 ; Update level_data_pointer+1 backup

	; Get TileAddr_Off and only keep the row, but clear 'Y' lower bits since
	; we're going to column 0 on the same row, new screen...
	LDA TileAddr_Off
	AND #$f0
	TAY	
PRG045_A5DD:

	DEX		 	; X--
	BPL PRG045_A5C0	 	; While X >= 0, loop!

	STY TileAddr_Off	 ; Y = TileAddr_Off

	DEC <var4		 ; var4-- (run count)
	BPL PRG045_A58B	 	; While var4 >= 0, loop!

	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_SpikeUp45
;
; Puts down 1-16 upward spikes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_SpikeUp45:
	LDX #$00	 ; X = 0 (spike upward)
	BEQ PRG045_A6F7	 ; Jump to PRG045_A6F7

LL_Spike45:
	.byte TILE15_SPIKEUP, TILE15_SPIKEDOWN

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_SpikeDown45
;
; Puts down 1-16 downward spikes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_SpikeDown45:
	LDX #$01	 ; X = 1 (spike downward)

PRG045_A6F7:
	LDA LL_ShapeDef	 
	AND #$0f	 
	STA <var4		 ; var4 = lower 4 bits of LL_ShapeDef (width of run)

	LDY TileAddr_Off	 ; Y = TileAddr_Off

PRG045_A701:
	LDA LL_Spike45,X	 	 ; Get appropriate spike tile
	STA [level_data_pointer],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column
	DEC <var4		 ; var4--
	BPL PRG045_A701	 	; While var4 >= 0, loop!
	RTS		 	; Return...


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_BGLines
;
; Puts down 1-16 BG zigzags
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_BGLines:
	LDA LL_ShapeDef	 
	AND #$0f
	ASL A
	ADD #2
	STA <var4		 ; var4 = lower 4 bits of LL_ShapeDef (height of run)
	
	; Halfway transition
	LSR A
	STA <var5

	LDY TileAddr_Off	 ; Y = TileAddr_Off

LLBGLines_Loop:
	LDA #TILE15_BGLINES_B

	LDX <var4
	CPX <var5
	BLT LLBGLines_Top

	BNE LLBGLines_Bottom

	; Midpoint
	LDA #TILE15_BGLINES_M
	BNE LLBGLines_Top

LLBGLines_Bottom:
	LDA #TILE15_BGLINES_T

LLBGLines_Top:
	STA [level_data_pointer],Y	 ; Store into tile mem
	
	JSR LoadLevel_TileMemNextRow ; Next column
	
	DEC <var4		 ; var4--
	BPL LLBGLines_Loop	 	; While var4 >= 0, loop!
	RTS		 	; Return...


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_GNWBrick
;
; Puts down 1-16 Game N Watch bricks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_GNWBrick:
	LDA LL_ShapeDef	 
	AND #$0f	 
	STA <var4		 ; var4 = lower 4 bits of LL_ShapeDef (width of run)

	LDY TileAddr_Off	 ; Y = TileAddr_Off

GNWBrick_Loop:
	LDA #TILE15_GNWBRICK	 	 ; Get appropriate spike tile
	STA [level_data_pointer],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column
	DEC <var4		 ; var4--
	BPL GNWBrick_Loop	 	; While var4 >= 0, loop!
	RTS		 	; Return...

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_GNWBrickV
;
; Puts down 1-16 Game N Watch bricks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_GNWBrickV:
	LDA LL_ShapeDef	 
	AND #$0f	 
	STA <var4		 ; var4 = lower 4 bits of LL_ShapeDef (width of run)

	LDY TileAddr_Off	 ; Y = TileAddr_Off

GNWBrick_LoopV:
	LDA #TILE15_GNWBRICK	 	 ; Get appropriate spike tile
	STA [level_data_pointer],Y	 ; Store into tile mem
	JSR LoadLevel_TileMemNextRow ; Next row
	DEC <var4		 ; var4--
	BPL GNWBrick_LoopV	 	; While var4 >= 0, loop!
	RTS		 	; Return...


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_BlockBossPortal
;
; Blocks end arena pipes as you accomplish battles
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_BlockBossPortal:

	; These generators are effected by the completed Arenas!
	
	; TileAddr_Off comes in as ...
	; 31 35 3A 3E
	; 72 75 7A 7D	
	
	; So we'll figure upper/lower via bit 6 / $40
	; Shifting lower bit by 2 should work out the index
	
	LDA TileAddr_Off
	AND #$40	; Of course, this is backwards, since the lower doors are lower indexes
	EOR #$40	; So there
	LSR A	; $20
	LSR A	; $10
	LSR A	; $08
	LSR A	; $04
	STA <var1
	
	LDA TileAddr_Off
	AND #$0F
	LSR A
	LSR A
	ORA <var1
	TAY		; Y = 0 to 7
	
	LDX #TILEA_DOOR2
	
	LDA Level_ArenaData
	AND Arena_CompleteBit,Y
	BEQ LLBBP_BlockIt	; If this arena door is not complete, jump to LLBBP_BlockIt

	LDX #TILE15_SKY

LLBBP_BlockIt:
	LDY TileAddr_Off ; Y = TileAddr_Off

	TXA
	STA [level_data_pointer],Y	 ; Store into tile mem

	JSR LoadLevel_TileMemNextRow
	
	TXA
	STA [level_data_pointer],Y	 ; Store into tile mem

	RTS

	
	; Broken into another file for ease of integration in NoDice editor
	.include "PRG/levels/Ext.asm"
	
