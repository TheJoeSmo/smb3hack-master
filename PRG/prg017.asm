; Super Mario Bros. 3Mix by Southbird 2014
; For more info, see http://www.sonicepoch.com/sm3mix/
;
; PLEASE INCLUDE A CREDIT TO THE SOUTHBIRD DISASSEMBLY
; AND THE ABOVE LINK SOMEWHERE IN YOUR WORKS :)
;
; Original disassembler source generated by DCC6502 version v1.4
; All 3Mix new code by Southbird!
; For more info about DCC6502, e-mail veilleux@ameth.base
;
; FILENAME: prg017.bin, File Size: 8193,.base: $A000
;     -> NES mode enabled
;---------------------------------------------------------------------------
Tile_Layout_TS4_TS12:
	; This defines the individual 8x8 blocks used to construct one of the tiles
	; Referenced by Address_Per_Tileset, addressed by Level_Tileset
	; Stored by upper left, then lower left, then upper right, then lower right

	; Remember that palette is determined by the upper 2 bits of a TILE (not the PATTERN)
	; I.e. tiles starting at index $00, $40, $80, $C0 are each on that respective palette

	; Upper left 8x8 pattern per tile
	.byte $FC, $DC, $05, $05, $05, $E8, $05, $05, $05, $44, $05, $05, $49, $4B, $10, $28 ; Tiles $00 - $0F
	.byte $28, $60, $39, $62, $64, $09, $66, $FC, $FC, $FC, $FC, $23, $FC, $13, $6B, $0B ; Tiles $10 - $1F
	.byte $7D, $7D, $00, $18, $18, $18, $FF, $FF, $FF, $FF, $FF, $FF, $4C, $FF, $B8, $B8 ; Tiles $20 - $2F
	.byte $B8, $B8, $BC, $FF, $B0, $B1, $14, $1C, $4C, $4E, $0A, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DC, $05, $FE, $FE, $05, $05, $05, $F4, $F4, $F4, $03, $59, $00, $00, $3E, $3E ; Tiles $40 - $4F
	.byte $20, $21, $21, $22, $22, $58, $54, $3C, $FF, $FF, $FF, $5C, $FF, $FF, $FF, $D8 ; Tiles $50 - $5F
	.byte $98, $98, $98, $98, $98, $98, $92, $B4, $B4, $B4, $B4, $B4, $B4, $B4, $B4, $B4 ; Tiles $60 - $6F
	.byte $B4, $B8, $98, $98, $98, $98, $A4, $EC, $E4, $C0, $58, $59, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
	.byte $05, $50, $50, $54, $54, $C4, $05, $26, $28, $2A, $68, $6A, $FF, $0E, $16, $1A ; Tiles $80 - $8F
	.byte $1A, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $16, $18, $1A, $FF, $FF, $FF ; Tiles $90 - $9F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $8C, $8E, $8C ; Tiles $A0 - $AF
	.byte $8E, $8C, $8E, $8C, $8E, $76, $76, $74, $70, $72, $AC, $AE, $B8, $02, $FF, $FF ; Tiles $B0 - $BF
	.byte $44, $05, $48, $05, $05, $05, $1E, $1E, $05, $05, $6E, $05, $35, $05, $05, $37 ; Tiles $C0 - $CF
	.byte $D0, $FF, $FF, $FF, $FF, $FF, $FF, $05, $B3, $CC, $FC, $C5, $C7, $D4, $FE, $FC ; Tiles $D0 - $DF
	.byte $AA, $AB, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $E0 - $EF
	.byte $1C, $D7, $E0, $05, $F0, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $F8, $FF ; Tiles $F0 - $FF

	; Lower left 8x8 pattern per tile
	.byte $FC, $DD, $0A, $06, $D6, $E9, $7C, $7C, $06, $FD, $47, $06, $06, $06, $10, $28 ; Tiles $00 - $0F
	.byte $28, $64, $09, $66, $64, $09, $66, $FC, $13, $69, $FC, $23, $FC, $FC, $FC, $06 ; Tiles $10 - $1F
	.byte $06, $06, $10, $28, $28, $28, $FF, $FF, $FF, $FF, $FF, $FF, $4D, $FF, $B9, $B9 ; Tiles $20 - $2F
	.byte $B9, $B9, $BD, $FF, $B1, $B0, $24, $2C, $0E, $1E, $0B, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DD, $06, $FE, $FE, $06, $06, $06, $F5, $F5, $F5, $03, $59, $10, $10, $3F, $3F ; Tiles $40 - $4F
	.byte $30, $31, $31, $32, $32, $59, $55, $3D, $FF, $FF, $FF, $5D, $10, $11, $11, $D9 ; Tiles $50 - $5F
	.byte $99, $99, $99, $99, $99, $99, $93, $B5, $B5, $B5, $B5, $B5, $B5, $B5, $B5, $B5 ; Tiles $60 - $6F
	.byte $B5, $B9, $99, $99, $99, $99, $A5, $ED, $E4, $C1, $59, $59, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
	.byte $06, $51, $51, $55, $55, $C4, $06, $26, $28, $2A, $6A, $6A, $FF, $1E, $26, $2A ; Tiles $80 - $8F
	.byte $2A, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $26, $28, $2A, $FF, $FF, $FF ; Tiles $90 - $9F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $9C, $9E, $9C ; Tiles $A0 - $AF
	.byte $9E, $9C, $9E, $9C, $9E, $77, $77, $75, $71, $73, $AC, $AE, $B9, $12, $FF, $FF ; Tiles $B0 - $BF
	.byte $45, $06, $49, $0E, $06, $06, $1E, $1F, $6C, $06, $06, $6F, $36, $06, $06, $38 ; Tiles $C0 - $CF
	.byte $D1, $FF, $FF, $FF, $FF, $FF, $FF, $E6, $CD, $CD, $CD, $FE, $FE, $FE, $FE, $FE ; Tiles $D0 - $DF
	.byte $AB, $AB, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $E0 - $EF
	.byte $2C, $06, $E1, $06, $F2, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $F9, $FF ; Tiles $F0 - $FF

	; Upper right 8x8 pattern per tile	
	.byte $FC, $DE, $07, $07, $07, $EA, $07, $07, $07, $45, $07, $48, $4A, $07, $11, $11 ; Tiles $00 - $0F
	.byte $29, $61, $39, $63, $65, $09, $67, $FC, $FC, $FC, $23, $FC, $6A, $13, $FC, $0D ; Tiles $10 - $1F
	.byte $0D, $7F, $01, $01, $19, $01, $FF, $FF, $FF, $FF, $FF, $FF, $4E, $FF, $BA, $BA ; Tiles $20 - $2F
	.byte $BA, $BA, $BE, $FF, $B0, $B1, $15, $1D, $4D, $4F, $0C, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DE, $07, $FE, $FE, $07, $07, $07, $F6, $F6, $F6, $04, $07, $01, $01, $3E, $2E ; Tiles $40 - $4F
	.byte $21, $21, $22, $21, $02, $5A, $56, $3E, $FF, $FF, $FF, $5E, $01, $01, $02, $DA ; Tiles $50 - $5F
	.byte $9A, $9A, $9A, $9A, $9A, $9A, $CA, $B6, $B6, $B6, $B6, $B6, $B6, $B6, $B6, $B6 ; Tiles $60 - $6F
	.byte $B6, $BA, $9A, $9A, $9A, $9A, $A6, $EE, $E5, $C2, $5A, $5B, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
	.byte $07, $52, $56, $56, $52, $C6, $07, $27, $29, $2B, $69, $6B, $FF, $0F, $17, $17 ; Tiles $80 - $8F
	.byte $1B, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $17, $19, $1B, $FF, $FF, $FF ; Tiles $90 - $9F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $8D, $8F, $8D ; Tiles $A0 - $AF
	.byte $8F, $8D, $8F, $8D, $8F, $7A, $7A, $78, $70, $72, $AD, $AF, $BA, $22, $FF, $FF ; Tiles $B0 - $BF
	.byte $46, $07, $4A, $07, $1E, $1E, $06, $06, $07, $6D, $07, $6F, $07, $35, $37, $07 ; Tiles $C0 - $CF
	.byte $D2, $FF, $FF, $FF, $FF, $FF, $FF, $07, $B3, $CE, $FC, $C5, $C7, $D4, $FE, $FC ; Tiles $D0 - $DF
	.byte $AA, $AB, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $E0 - $EF
	.byte $1D, $D7, $E2, $07, $F1, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FA, $FF ; Tiles $F0 - $FF

	; Lower right 8x8 pattern per tile
	.byte $FC, $DF, $0C, $08, $D6, $EB, $0C, $7E, $46, $FD, $08, $08, $08, $08, $11, $11 ; Tiles $00 - $0F
	.byte $29, $65, $09, $67, $65, $09, $67, $68, $13, $FC, $23, $FC, $FC, $FC, $FC, $08 ; Tiles $10 - $1F
	.byte $08, $08, $11, $11, $29, $11, $FF, $FF, $FF, $FF, $FF, $FF, $4F, $FF, $BB, $BB ; Tiles $20 - $2F
	.byte $BB, $BB, $BF, $FF, $B1, $B0, $25, $2D, $0F, $1F, $0D, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DF, $08, $FE, $FE, $08, $08, $08, $F7, $F7, $F7, $04, $08, $11, $11, $3F, $2F ; Tiles $40 - $4F
	.byte $31, $31, $32, $31, $12, $5B, $57, $3F, $FF, $FF, $FF, $5F, $11, $11, $12, $DB ; Tiles $50 - $5F
	.byte $9B, $9B, $9B, $9B, $9B, $9B, $CB, $B7, $B7, $B7, $B7, $B7, $B7, $B7, $B7, $B7 ; Tiles $60 - $6F
	.byte $B7, $BB, $9B, $9B, $9B, $9B, $A7, $EF, $E5, $C3, $5B, $5B, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
	.byte $08, $53, $57, $57, $53, $C6, $08, $27, $29, $2B, $6B, $6B, $FF, $1F, $27, $27 ; Tiles $80 - $8F
	.byte $2B, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $27, $29, $2B, $FF, $FF, $FF ; Tiles $90 - $9F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $9D, $9F, $9D ; Tiles $A0 - $AF
	.byte $9F, $9D, $9F, $9D, $9F, $7B, $7B, $79, $71, $73, $AD, $AF, $BB, $32, $FF, $FF ; Tiles $B0 - $BF
	.byte $47, $08, $4B, $0F, $1E, $1F, $07, $07, $6C, $6D, $6E, $08, $08, $36, $38, $08 ; Tiles $C0 - $CF
	.byte $D3, $FF, $FF, $FF, $FF, $FF, $FF, $E7, $CF, $CF, $CF, $FE, $FE, $FE, $FE, $FE ; Tiles $D0 - $DF
	.byte $AB, $AB, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $E0 - $EF
	.byte $2D, $08, $E3, $08, $F3, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FB, $FF ; Tiles $F0 - $FF

Tile_Attributes_TS4_TS12:
	.byte $1F, $4C, $8D, $F0, $2E, $4C, $AD, $F0 ; SB: Solidity start $8A -> $AD

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_TS4_TS12
;
; Entry point for loading level layout data for Level_Tileset = 4/12
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_TS4_TS12:

	; SB: Hackish, forces a different clear if level is vertical
	; To support a vertical mode level, we must not use the
	; TILE4_SKY_STOPGEN tile, and instead just put TILE4_SKY...
	
	LDY #6	; Offsets passed alternate layout/object pointers, second header byte
	LDA (Level_LayPtr_AddrL),Y
	AND #LEVEL3_VERTICAL
	PHP	; Save status

	LDY #$00	 

	PLP	; Restore status
	BEQ TS4Clear_NotVert	; If level is not vertical, jump to TS4Clear_NotVert

	; Clearing in vertical mode
TS4Clear_Vert:
	LDA #TILE4_SKY
	JSR Tile_Mem_ClearB
	LDA #TILE4_SKY
	JSR Tile_Mem_ClearA
	CPY #$10
	BNE TS4Clear_Vert

	BEQ PRG017_A418		; Jump (technically always) to PRG017_A418

	; Clearing in non-vertical mode
TS4Clear_NotVert:
	LDA #TILE4_SKY
	JSR Tile_Mem_ClearB
	LDA #TILE4_SKY_STOPGEN
	JSR Tile_Mem_ClearA
	CPY #$10
	BNE TS4Clear_NotVert

PRG017_A418:
	LDA #TILE4_SKY
	JSR Tile_Mem_ClearB
	JSR Tile_Mem_ClearA
	CPY #$f0
	BNE PRG017_A418
	JMP LevelLoad	; Begin actual level loading!


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_Generator_TS4_TS12
;
; Based on the values in Temp_Var15 and LL_ShapeDef, chooses an
; appropriate generator function to builds this piece of the
; level.  Tedious, but saves space and is paper-design friendly.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PRG017_A427:
	.byte 0, 15, 30, 45, 60, 75, 90, 105

LoadLevel_Generator_TS4_TS12:
	; From level loader function:
	; * Temp_Var15, Temp_Var16, and LL_ShapeDef are three bytes read from the data


	LDA Temp_Var15
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
	ADD PRG017_A427,X	; Add multiple of 15
	TAX
	DEX
	TXA		 ; A = ((LL_ShapeDef >> 4) + PRG015_A419[X]) - 1


	; PRG017_A427 provides values well in excess of 64, but only 64
	; addresses are defined here; reserved for expansion...

	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word LoadLevel_LongWoodBlock		;  0 - Long wooden block
	.word LoadLevel_BigWoodBlocks		;  1 - Big wood blocks
	.word LoadLevel_BigWoodBlocks		;  2 - Icy Green Cap
	.word LoadLevel_LittleBushRun17		;  3 - Put in a run of those cute little bushes
	.word LoadLevel_BushBunch		;  4 - Put down a run of a bunch of bushes
	.word LoadLevel_LargeGreenOrSnow	;  5 - Generate large green platform
	.word LoadLevel_LargeGreenOrSnow	;  6 - Generate large snowy platform
	.word LoadLevel_PathHorizontal		;  7 - Horizontal moving platform path
	.word LoadLevel_PathVertical		;  8 - Vertical moving platform path
	.word LoadLevel_Path45T2B		;  9 - 45 degree top-to-bottom moving platform path
	.word LoadLevel_Path45B2T		; 10 - 45 degree bottom-to-top moving platform path
	.word LoadLevel_CloudRun17		; 11 - Run of the clouds
	.word LoadLevel_Path625T2B		; 12 - 62.5 degree top-to-bottom moving platform path
	.word LoadLevel_Path625B2T		; 13 - 62.5 degree bottom-to-top moving platform path
	.word LoadLevel_LongCloud		; 14 - Long cloud platform
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
	.word LoadLevel_TopDecoBlocks		; 41 - Top-Deco Rectangle (SB: SMB2 cave filler)
	.word LoadLevel_TopDecoBlocks		; 42 - Top-Deco Rectangle (SB: SMB2 posts)
	.word LoadLevel_DoNothing		; 43 - UNUSED
	.word LoadLevel_VTransitPipeRun		; 44 - Vertical in-level transit pipe
	.word LoadLevel_IceBlocks		; 45 - Run of ice blocks
	.word LoadLevel_IceBlocks		; 46 - Run of frozen munchers
	.word LoadLevel_IceBlocks		; 47 - Run of frozen coins
	.word LoadLevel_DonutLifts		; 48 - Run of donut lifts
	.word LoadLevel_Conveyor		; 49 - Run of left conveyor
	.word LoadLevel_Conveyor		; 50 - Run of right conveyor
	.word LoadLevel_Jelectro		; 51 - Run of solid black tiles
	.word LoadLevel_LargeIceBlocks		; 52 - Run of large 2x2 ice blocks
	.word LoadLevel_LittleCloudRun		; 53 - Put in a run of those little smiling Judgem's type clouds
	.word LoadLevel_Muncher17		; 54 - Long run of munchers
	.word LoadLevel_LongSMB2Ground		; 55 - Long SMB2 style ground (SB)
	.word LoadLevel_LargeMushPlat		; 56 - Long mushroom platform (for SMB1 classic style)
	.word LoadLevel_SkyVert			; 57 - Vertical run of sky tiles (mainly for making large green platforms where they normally can't be)
	.word LoadLevel_BGBlackSpace	; 58 - Rectangle of black background
	.word LoadLevel_PurpleCoins		; 59 - Run of Purple coins
	.word LoadLevel_PurpleCoinR		; 60 - Rectangle of Purple Coins


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LeveLoad_FixedSizeGen_TS4_TS12
;
; Much simpler generators that are fixed-size, commonly used for 
; just single tile placement styles (although a couple relatively 
; complex ones exist in here as well)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LeveLoad_FixedSizeGen_TS4_TS12:
	; It is verified before calling this function that all of
	; the upper 4 bits of LL_ShapeDef are ZERO

	; So the upper 3 bits of Temp_Var15 serve as the most significant bits
	; to a value where LL_ShapeDef provide the 4 least significant bits

	LDA Temp_Var15
	AND #%11100000
	LSR A		
	ADD LL_ShapeDef	
	TAX		 	; Resultant index is put into 'X'
	JSR DynJump	 

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word LoadLevel_LilCloud		;  0 - Inserts little background cloud
	.word LoadLevel_WideCloud		;  1 - Inserts wide background cloud
	.word LoadLevel_SuspensionCableR	;  2 - Right hooked suspension cable
	.word LoadLevel_SuspensionCableL	;  3 - Left hooked suspension cable
	.word LoadLevel_FatTrunk		;  4 - Fat trunk
	.word LoadLevel_Door2			;  5 - Door style 2
	.word LoadLevel_PlatformPuller		;  6 - SB: Places sky tile for breaking built-in barrier
	.word LoadLevel_PlatformPuller		;  7 - Platform puller tile
	.word LoadLevel_VineToGround		;  8 - Constructs a vine from the start down to next non-sky tile
	.word LoadLevel_StarCoin1		;  9 - Star Coin 1
	.word LoadLevel_StarCoin2		; 10 - Star Coin 2
	.word LoadLevel_StarCoin3		; 11 - Star Coin 3
	.word LoadLevel_PipeRaiseHelper1	; 12 - Pipe Raise Helper 1
	.word LoadLevel_PipeRaiseHelper2	; 13 - Pipe Raise Helper 2
	.word LoadLevel_PipeRaiseHelper3	; 14 - Pipe Raise Helper 3
	.word LoadLevel_PipeRaiseHelper4	; 15 - Pipe Raise Helper 4
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
	.word LoadLevel_ActionSwitch	; 42 - Action Switch
	.word LoadLevel_FillIceBGBlack	; 43 - Fill black background

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_PlatformPuller
;
; Inserts a "platform puller" and ... something else??
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LL_PlatformPuller:
	.byte TILE4_SKY, TILE4_PLATFORMPULLER

LoadLevel_PlatformPuller:
	LDA LL_ShapeDef
	SUB #$06
	TAX		 ; X = relative index

	LDY TileAddr_Off 	 ; Y = TileAddr_Off
	LDA LL_PlatformPuller,X	 ; Get platform puller thingy tile
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem
	RTS		 ; Return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_LongWoodBlock
;
; Generates a long wooden block, which has a left edge, a variable
; run length of 1-256 of middle, and then a right edge
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_LongWoodBlock:
	JSR LoadLevel_GetLayoutByte	 ; Get layout byte -> 'X' (width of run)

	LDY TileAddr_Off
	LDA #TILE4_LONGWOOD_L	 ; Long wooden block left
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem
	JMP PRG017_A53C	 	 ; Jump to PRG017_A53C

PRG017_A538:
	LDA #TILE4_LONGWOOD_M	 ; Long wooden block middle
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem

PRG017_A53C:
	JSR LoadLevel_NextColumn ; Next column
	DEX		 	 ; X-- (width decrement)
	BNE PRG017_A538	 	 ; While X > 0, loop!

	LDA #TILE4_LONGWOOD_R	 ; Long wooden block right
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem
	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_LongSMB2Ground
;
; Generates a long run of SMB2 style ground (grass upper, sand lower)
; run length of 1-256 of middle, and then a right edge
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SMB2Ground_Tiles:	.byte TILE4_LARGEWOOD_LL, TILE4_SMB2_GNDTOP	; SB: The LARGEWOOD will show up as sand with proper graphics

LoadLevel_LongSMB2Ground:
	LDA LL_ShapeDef
	AND #$0f	
	STA Temp_Var3	 ; Temp_Var3 = lower 4 bits of LL_ShapeDef (height of run)

	; Backup Map_Tile_AddrL/H into Temp_Var1/2
	LDA Map_Tile_AddrL
	STA Temp_Var1	
	LDA Map_Tile_AddrH
	STA Temp_Var2	

	JSR LoadLevel_GetLayoutByte	 ; Get layout byte -> 'X' (width of run)
	STX Temp_Var4		; -> Temp_Var4

	LDX #1	; Ground top first

	LDY TileAddr_Off

SMB2Ground_TopBot_Loop:
	LDA Temp_Var4
	STA Temp_Var5	; Temp_Var5 = Temp_Var4 (reload inner loop)

SMB2Ground_Inner_Loop:
	LDA SMB2Ground_Tiles,X
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem

	JSR LoadLevel_NextColumn ; Next column

	DEC Temp_Var5		; Temp_Var5--
	BNE SMB2Ground_Inner_Loop	; While Temp_Var5 > 0, loop!

	; Finished a row...
	JSR LL17_ReturnTileAndNextRow

	CPX #0
	BEQ LLLS2G_SandRun
	
	DEX		 	 	; X-- (next tile)
	
LLLS2G_SandRun:
	DEC Temp_Var3
	BPL SMB2Ground_TopBot_Loop	; While X >= 0, loop!

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_BigWoodBlocks
;
; Generates a large wood or large other snow covered green block
; with a variable length middle part
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LL_BigWoodBlocks:
	.byte TILE4_LARGEWOOD_UL, TILE4_LARGEWOOD_LL
	.byte TILE12_SNOWGREEN_UL, TILE4_LARGEWOOD_LL

	.byte TILE4_LARGEWOOD_UM, TILE4_LARGEWOOD_LM
	.byte TILE12_SNOWGREEN_UM, TILE4_LARGEBLOCK_LL

	.byte TILE4_LARGEWOOD_UR, TILE4_LARGEWOOD_LR
	.byte TILE12_SNOWGREEN_UR, TILE4_LARGEBLOCK_LM

LoadLevel_BigWoodBlocks:
	; Backup Map_Tile_AddrL/H into Temp_Var1/2 
	LDA Map_Tile_AddrL 
	STA Temp_Var1 
	LDA Map_Tile_AddrH 
	STA Temp_Var2
 
	LDX #$00	 ; LARGEWOOD 

	LDA LL_ShapeDef 
	AND #$f0	 
	CMP #$20	 
	BEQ PRG017_A568	 ; Decision to use X = 0 or X = 2 (LARGEWOOD or LARGEBLOCK) 

	LDX #$02	 ; LARGEBLOCK 

PRG017_A568:
	LDA LL_ShapeDef	  
	AND #$0f	  
	STA Temp_Var3		 ; Temp_Var3 = lower 4 bits of LL_ShapeDef (width of run)
 
	LDY TileAddr_Off	 ; Y = TileAddr_Off
	
	LDA LL_BigWoodBlocks,X	 ; Get left edge tile 
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem
	JMP PRG017_A57F	 	; Jump to PRG017_A57F
 
PRG017_A57A:
	LDA LL_BigWoodBlocks+4,X ; Get middle tile 
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem

PRG017_A57F:
	JSR LoadLevel_NextColumn ; Next column 
	DEC Temp_Var3		 ; Temp_Var3-- 
	BNE PRG017_A57A	 	 ; While Temp_Var3 > 0, loop
 
	LDA LL_BigWoodBlocks+8,X ; Get right edge tile 
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem

	; Go to next row by adding 16
	LDA TileAddr_Off 
	ADD #16 
	STA TileAddr_Off 
	LDA Temp_Var2 
	ADC #$00 
	STA Map_Tile_AddrH 
	
	LDA Temp_Var1 
	STA Map_Tile_AddrL	; Restore just the lower part of the video address (new line, original column)
 
	INX		 ; X++ 
	TXA		  
	AND #$01 
	BNE PRG017_A568	 ; Only loop once
 
	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_LittleBushRun17
;
; Puts down 1-16 of those cute little bushes for Level_Tileset
; 4 or 12 (ice; in this case, also adds a snowy block underneath)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_LittleBushRun17:
	; Backup Map_Tile_AddrL/H into Temp_Var1/2
	LDA Map_Tile_AddrL
	STA Temp_Var1	
	LDA Map_Tile_AddrH
	STA Temp_Var2	

	LDA LL_ShapeDef
	AND #$0f	
	STA Temp_Var3	 ; Temp_Var3 = lower 4 bits of LL_ShapeDef (width of run)

	TAX		; X = width
	LDY TileAddr_Off

PRG017_A5B8:
	LDA #TILE4_LITTLEBUSH
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column
	DEX		 	; X-- (Width decrement)
	BPL PRG017_A5B8	 	; While X >= 0, loop!

	LDA Level_Tileset
	CMP #12
	BNE PRG017_A5D8	 	; If Level_Tileset > 12 (ice level), jump to PRG017_A5D8 (RTS)

	; For ice levels only, add a snowy block beneath each bush

	JSR LL17_ReturnTileAndNextRow	 ; Return to beginning, then go to next row

	LDX Temp_Var3		 ; X = Temp_Var3
PRG017_A5CE:
	LDA #TILE12_SNOWY_M	 ; Snow block middle
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column
	DEX		 	; X--
	BPL PRG017_A5CE		; While X >= 0, loop!

PRG017_A5D8:
	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_BushBunch
;
; Puts down a 1-16 with bunch of little bushes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_BushBunch:
	LDA LL_ShapeDef
	AND #$0f	
	STA Temp_Var3		; Temp_Var3 = lower 4 bits of LL_ShapeDef (width of run)

	LDY TileAddr_Off ; Y = TileAddr_Off

	LDA #TILE4_BUSHBUNCH_L	; Left tile of bush bunch
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem
	JMP PRG017_A5EE	 	; Jump to PRG017_A5EE

PRG017_A5EA:
	LDA #TILE4_BUSHBUNCH_M	 ; Middle tile of bush bunch
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem

PRG017_A5EE:
	JSR LoadLevel_NextColumn ; Next column
	DEC Temp_Var3		 ; Temp_Var3--
	BNE PRG017_A5EA	 	; While Temp_Var3 > 0, loop!

	LDA #TILE4_BUSHBUNCH_R	 ; Right tile of bush bunch
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem
	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_LargeGreenOrSnow
;
; Generates a large green or snow (Tileset 12) platform, of
; variable width, and a height determined by building down
; until the left side no longer touches sky (ideally ground)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LL_BigBlock_Left:
	.byte TILE4_GREENBLOCK_UL, TILE4_GREENBLOCK_LL
	.byte TILE12_SNOWBLOCK_UL, TILE12_SNOWBLOCK_LL

LL_BigBlock_Middle:
	.byte TILE4_GREENBLOCK_UM, TILE4_GREENBLOCK_LM
	.byte TILE12_SNOWBLOCK_UM, TILE12_SNOWBLOCK_LM

LL_BigBlock_Right:
	.byte TILE4_GREENBLOCK_UR, TILE4_GREENBLOCK_LR
	.byte TILE12_SNOWBLOCK_UR, TILE12_SNOWBLOCK_LR


LoadLevel_LargeGreenOrSnow:
	; Backup Map_Tile_AddrL/H into Temp_Var1/2
	LDA Map_Tile_AddrL
	STA Temp_Var1
	LDA Map_Tile_AddrH
	STA Temp_Var2	

	LDX #$00	 ; X = 0 (green block)

	LDA LL_ShapeDef	 
	AND #$f0	 
	CMP #$60	 
	BEQ PRG017_A61B	 ; Depending on entry, jump to PRG017_A61B

	LDX #$02	 ; X = 2 (snow block)

PRG017_A61B:
	LDA LL_ShapeDef
	AND #$0f	
	STA Temp_Var3	 	; Temp_Var3 = lower 4 bits of LL_ShapeDef (width of platform)

	LDY TileAddr_Off	 ; Y = TileAddr_Off

	; The upper-left corner MUST be sky, or else we do nothing!
	; This builds the platform down until it no longer detects sky

	LDA (Map_Tile_AddrL),Y	; Get tile here
	CMP #TILE4_SKY	 	; Is this sky?
	BNE PRG017_A64E	 	; If not, jump to PRG017_A64E (RTS)

	LDA LL_BigBlock_Left,X	 ; Get left edge tile
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem

	JMP PRG017_A638	 	; Jump to PRG017_A638

PRG017_A633:
	LDA LL_BigBlock_Middle,X ; Get middle tile
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem

PRG017_A638:
	JSR LoadLevel_NextColumn ; Next column
	DEC Temp_Var3		 ; Temp_Var3-- (width decrement)
	BNE PRG017_A633	 	; While Temp_Var3 > 0, loop!

	LDA LL_BigBlock_Right,X	 ; Get right tile
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem

	JSR LL17_ReturnTileAndNextRow	 ; Return to beginning, then go to next row

	TXA
	ORA #$01	 
	TAX		 ; X |= 1 (all subsequent passes generate the "lower" tiles)
	JMP PRG017_A61B	 ; Jump to PRG017_A61B


PRG017_A64E:
	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_LongCloud
;
; Generates a long cloud platform of variable width in the middle
; Only for Tileset 4, not 12
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LL_LongCloud:
	.byte TILE4_LONGCLOUD_UL, TILE4_LONGCLOUD_LL, TILE4_LONGCLOUD_UM, TILE4_LONGCLOUD_LM, TILE4_LONGCLOUD_UR, TILE4_LONGCLOUD_LR

LoadLevel_LongCloud:
	; Backup Map_Tile_AddrL/H into Temp_Var1/2
	LDA Map_Tile_AddrL
	STA Temp_Var1
	LDA Map_Tile_AddrH
	STA Temp_Var2

	LDA LL_ShapeDef	
	AND #$0f	
	STA Temp_Var3	 ; Temp_Var3 = lower 4 bits of LL_ShapeDef (width of run)

	LDY TileAddr_Off	 ; Y = TileAddr_Off

	LDX #$00	 ; X = 0
PRG017_A669:
	LDA Temp_Var3
	STA Temp_Var4	 ; Temp_Var4 = Temp_Var3

	LDA LL_LongCloud,X	 ; Get left edge tile

	STA (Map_Tile_AddrL),Y	; Store into tile mem
	JMP PRG017_A67A	 	; Jump to PRG017_A67A

PRG017_A675:
	LDA LL_LongCloud+2,X	 ; Get middle tile
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem

PRG017_A67A:
	JSR LoadLevel_NextColumn ; Next column
	DEC Temp_Var4		 ; Temp_Var4--
	BNE PRG017_A675	 	; While Temp_Var4 > 0, loop!

	LDA LL_LongCloud+4,X	 ; Get right tile
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem

	JSR LL17_ReturnTileAndNextRow	 ; Return to beginning, then go to next row

	INX		 ; X++
	CPX #$02	 
	BNE PRG017_A669	 ; If X <> 2, loop!

	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_IceBlocks
;
; Generates 1-16 ice blocks of the three types
; Only for Tileset 12, not 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LL_IceBlocks:
	.byte TILE12_ICEBLOCK, TILE12_FROZENMUNCHER, TILE12_FROZENCOIN

LoadLevel_IceBlocks:
	LDA LL_ShapeDef
	PHA		 ; Save LL_ShapeDef

	SUB #$10
	LSR A	
	LSR A	
	LSR A	
	LSR A	
	TAX		 ; X = relative index

	PLA		 ; Restore LL_ShapeDef
	AND #$0f
	STA Temp_Var3	; Temp_Var3 = lower 4 bits of LL_ShapeDef

	LDY TileAddr_Off	 ; Y = TileAddr_Off

PRG017_A6A6:
	LDA LL_IceBlocks,X	 ; Get appropriate ice block
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column
	DEC Temp_Var3		 ; Temp_Var3-- (width decrement)
	BPL PRG017_A6A6	 	; While Temp_Var3 >= 0, loop!

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_LargeIceBlocks
;
; Generates 1-16 large 2x2 ice blocks; Only for Tileset 12, not 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LL_LargeIceBlock:
	.byte TILE12_LARGEICEBLOCK_UL, TILE12_LARGEICEBLOCK_LL, TILE12_LARGEICEBLOCK_UR, TILE12_LARGEICEBLOCK_LR

LoadLevel_LargeIceBlocks:
	; Backup Map_Tile_AddrL/H into Temp_Var1/2
	LDA Map_Tile_AddrL
	STA Temp_Var1
	LDA Map_Tile_AddrH
	STA Temp_Var2

	LDA LL_ShapeDef	
	AND #$0f	
	STA Temp_Var3		 ; Temp_Var3 = lower 4 bits of LL_ShapeDef (width of run)

	LDY TileAddr_Off	 ; Y = TileAddr_Off

	LDX #$00	 	; X = 0

PRG017_A6CB:
	LDA Temp_Var3	
	STA Temp_Var4		 ; Temp_Var4 = Temp_Var3

PRG017_A6CF:
	LDA LL_LargeIceBlock,X	 ; Get left tile
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column

	LDA LL_LargeIceBlock+2,X ; Get right tile
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column

	DEC Temp_Var4		 ; Temp_Var4-- (width decrement)
	BPL PRG017_A6CF	 	; While Temp_Var4 >= 0, loop!

	JSR LL17_ReturnTileAndNextRow	 ; Return to beginning, then go to next row

	INX		 ; X++
	CPX #$02	 
	BNE PRG017_A6CB	 ; If X <> 2, loop!

	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_CloudRun17
;
; Puts down a run of the big clouds, repeating the middle for
; the run in a strange fashion...
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LL_Cloud17:
	.byte TILE12_CLOUD_UL, TILE12_CLOUD_LL, TILE12_CLOUD_UM, TILE12_CLOUD_LM, TILE12_CLOUD_UR, TILE12_CLOUD_LR

LoadLevel_CloudRun17:
	; Backup Map_Tile_AddrL/H into Temp_Var1/2
	LDA Map_Tile_AddrL
	STA Temp_Var1
	LDA Map_Tile_AddrH
	STA Temp_Var2

	LDA LL_ShapeDef
	AND #$0f
	STA Temp_Var3		 ; Temp_Var3 = lower 4 bits of LL_ShapeDef (width of cloud)

	LDY TileAddr_Off	 ; Y = TileAddr_Off
	LDX #$00		 ; X = 0

PRG017_A706:
	LDA Temp_Var3
	STA Temp_Var4		 ; Temp_Var4 = Temp_Var3

	LDA LL_Cloud17,X	 ; Get left edge tile
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem
	JMP PRG017_A717	 	 ; Jump to PRG017_A717

PRG017_A712:
	LDA LL_Cloud17+2,X	 ; Get middle tile
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem

PRG017_A717:
	JSR LoadLevel_NextColumn ; Next column
	DEC Temp_Var4		 ; Temp_Var4-- (width decrement)
	BNE PRG017_A712	 	 ; While Temp_Var4 > 0, loop!

	LDA LL_Cloud17+4,X	 ; Get right edge tile
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem

	JSR LL17_ReturnTileAndNextRow	 ; Return to beginning, then go to next row
	INX		 	; X++
	CPX #$02	 
	BNE PRG017_A706	 	; If X <> 2, loop!

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_LilCloud
;
; Inserts a single little background cloud tile
; Tileset 4 only
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_LilCloud:
	LDY TileAddr_Off	 ; Y = TileAddr_Off
	LDA #TILE4_LILCLOUD	 ; Little cloud tile
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem
	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_WideCloud
;
; Inserts a wide background cloud 
; Tileset 4 only
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_WideCloud:
	LDY TileAddr_Off	 ; Y = TileAddr_Off
	LDA #TILE4_BGCLOUD_L	 ; Get left cloud tile
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column
	LDA #TILE4_BGCLOUD_R	 ; Get right cloud tile
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem
	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_SuspensionCableR/L
;
; Generates a platform suspension cable which extends upward until
; it hits a non-sky tile above it, hooked on the right/left side.
; Tileset 4 only
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_SuspensionCableR:
	LDX #$00	 ; X = 0 (right cable)
	JMP PRG017_A74E	 ; Jump to PRG017_A74E

LL_SuspensionCables:
	.byte TILE4_CABLE_CONR, TILE4_CABLE_CONL, TILE4_CABLE_MIDR, TILE4_CABLE_MIDL

LoadLevel_SuspensionCableL:
	LDX #$01	 ; X = 1 (left cable)

PRG017_A74E:
	LDY TileAddr_Off	 ; Y = TileAddr_Off

	LDA LL_SuspensionCables,X	; Get proper cable connector
	STA (Map_Tile_AddrL),Y	 	; Store into tile mem

	JMP PRG017_A764	 		; Jump to PRG017_A764

PRG017_A759:
	LDA (Map_Tile_AddrL),Y	 	; Get tile here
	CMP #TILE4_SKY
	BNE PRG017_A772			; If not sky, jump to PRG017_A772 (RTS)

	LDA LL_SuspensionCables+2,X	 ; Get proper cable tile 
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem

PRG017_A764:

	; Jump to previous row by subtracting 16 from tile offset
	TYA
	SUB #16
	TAY
	LDA Map_Tile_AddrH
	SBC #$00	 
	STA Map_Tile_AddrH

	JMP PRG017_A759	 ; Jump to PRG017_A759

PRG017_A772:
	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_FatTrunk
;
; Generates a fat trunk from starting point down until it hits
; non-sky tiles.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_FatTrunk:
	LDY TileAddr_Off	 ; Y = TileAddr_Off

PRG017_A776:
	LDA (Map_Tile_AddrL),Y	 ; Get tile here
	CMP #TILE4_SKY	
	BNE PRG017_A78E	 	; If tile is not sky, jump to PRG017_A78E (RTS)

	LDA #TILE4_FATTRUNK	; Fat trunk tile
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem

	; Jump to next row by adding 16 to offset
	TYA	
	ADD #16
	TAY	
	LDA Map_Tile_AddrH
	ADC #$00	 
	STA Map_Tile_AddrH

	JMP PRG017_A776	 	; Jump to PRG017_A776

PRG017_A78E:
	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_Muncher17
;
; Add 1-256 munchers!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_Muncher17:
	JSR LoadLevel_GetLayoutByte	; Get another byte from the layout data -> 'X'
	LDY TileAddr_Off	 	; Y = TileAddr_Off
PRG017_A795:
	LDA #TILE4_MUNCHER	 	; Muncher
	STA (Map_Tile_AddrL),Y	 	; Store into tile mem
	JSR LoadLevel_NextColumn	; Next column
	DEX		 ; X--
	CPX #$ff	
	BNE PRG017_A795	 ; While X > 0, loop!

	RTS		 ; Return


	; Routine to get a byte from the layout, put it into 'X',
	; and advance the Level_LayPtr_Addr pointer...
LoadLevel_GetLayoutByte:
	LDY #$00	 		; Y = 0
	LDA (Level_LayPtr_AddrL),Y	; Get another byte from layout
	TAX		 		; -> 'X'

	LDA Level_LayPtr_AddrL
	ADD #$01
	STA Level_LayPtr_AddrL
	LDA Level_LayPtr_AddrH
	ADC #$00
	STA Level_LayPtr_AddrH
	RTS		 ; Return


	; Goes to next row and updates backup variable Temp_Var2
LL17_ReturnTileAndNextRow:
	; Restore Map_Tile_Addr from backup
	LDA Temp_Var1
	STA Map_Tile_AddrL
	LDA Temp_Var2
	STA Map_Tile_AddrH

	; Go to next row by adding 16 to tile offset
	LDA TileAddr_Off
	ADD #16
	STA TileAddr_Off
	TAY
	LDA Map_Tile_AddrH
	ADC #$00	 
	STA Map_Tile_AddrH
	STA Temp_Var2	; Update Map_Tile_AddrH backup

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_LargeMushPlat
;
; Large mushroom platform
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_LargeMushPlat:
	LDA LL_ShapeDef
	AND #$0f	
	STA Temp_Var3	 ; Temp_Var3 = lower 4 bits of LL_ShapeDef (width of run)

	LDY TileAddr_Off	 ; Y = TileAddr_Off

	LDA #TILE4_GREENBLOCK_UL
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column

LLMushPlat:
	LDA #TILE4_GREENBLOCK_UM	 ; Get appropriate tile
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column
	DEC Temp_Var3		 ; Temp_Var3--
	BPL LLMushPlat	 	; While Temp_Var3 >= 0, loop!

	LDA #TILE4_GREENBLOCK_UR
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_SkyVert
;
; Run of vertical sky tiles
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_SkyVert:
	LDA LL_ShapeDef
	AND #$0f	
	STA Temp_Var3	 ; Temp_Var3 = lower 4 bits of LL_ShapeDef (height of run)

	LDY TileAddr_Off	 ; Y = TileAddr_Off

	; Backup Map_Tile_AddrL/H into Temp_Var1/2
	LDA Map_Tile_AddrL
	STA Temp_Var1	
	LDA Map_Tile_AddrH
	STA Temp_Var2	
	

LLSky_Loop:
	LDA #TILE4_SKY	 ; Get appropriate tile
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem
	JSR LL17_ReturnTileAndNextRow ; Next row
	DEC Temp_Var3		 ; Temp_Var3--
	BPL LLSky_Loop	 	; While Temp_Var3 >= 0, loop!

	RTS		 ; Return
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_BGBlackSpace
;
; Generates a rectangle of black background space
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_BGBlackSpace:
	LDA LL_ShapeDef
	AND #$0f	
	STA Temp_Var3	 ; Temp_Var3 = lower 4 bits of LL_ShapeDef (height of run)

	; Backup Map_Tile_AddrL/H into Temp_Var1/2
	LDA Map_Tile_AddrL
	STA Temp_Var1	
	LDA Map_Tile_AddrH
	STA Temp_Var2	

	JSR LoadLevel_GetLayoutByte	 ; Get layout byte -> 'X' (width of run)
	INX
	STX Temp_Var4		; -> Temp_Var4

	LDY TileAddr_Off

LLBBlack_TopBot_Loop:
	LDA Temp_Var4
	STA Temp_Var5	; Temp_Var5 = Temp_Var4 (reload inner loop)

LLBBlack_Inner_Loop:
	LDA #TILE4_BGBLACK
	STA (Map_Tile_AddrL),Y	 ; Store into tile mem

	JSR LoadLevel_NextColumn ; Next column

	DEC Temp_Var5		; Temp_Var5--
	BNE LLBBlack_Inner_Loop	; While Temp_Var5 > 0, loop!

	; Finished a row...
	JSR LL17_ReturnTileAndNextRow

	DEC Temp_Var3
	BPL LLBBlack_TopBot_Loop	; While X >= 0, loop!

	RTS		 ; Return



	; Setup for the path routines

	; Broken into another file for ease of integration in NoDice editor
	.include "PRG/levels/HighUp.asm"
	.include "PRG/levels/Ice.asm"
	
; Rest of ROM bank was empty

