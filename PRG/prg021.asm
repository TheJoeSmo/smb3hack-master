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
; FILENAME: prg021.bin, File Size: 8193, ORG: $A000
;     -> NES mode enabled
;---------------------------------------------------------------------------
Tile_Layout_TS2:
	; This defines the individual 8x8 blocks used to construct one of the tiles
	; Referenced by Address_Per_Tileset, addressed by Level_Tileset
	; Stored by upper left, then lower left, then upper right, then lower right

	; Remember that palette is determined by the upper 2 bits of a TILE (not the PATTERN)
	; I.e. tiles starting at index $00, $40, $80, $C0 are each on that respective palette

	; Upper left 8x8 pattern per tile
	.byte $FC, $DC, $FF, $05, $05, $E8, $20, $22, $22, $05, $05, $7E, $05, $64, $05, $05 ; Tiles $00 - $0F
	.byte $66, $FF, $FF, $0E, $0C, $0D, $2F, $2E, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $10 - $1F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $B8, $B8 ; Tiles $20 - $2F
	.byte $B8, $B8, $BC, $FF, $B0, $B1, $86, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DC, $05, $05, $FC, $05, $05, $05, $04, $F4, $F4, $F4, $FE, $FE, $04, $FE, $FE ; Tiles $40 - $4F
	.byte $FE, $7E, $10, $30, $24, $26, $28, $2A, $06, $05, $26, $5C, $04, $04, $04, $D8 ; Tiles $50 - $5F
	.byte $98, $98, $98, $98, $98, $98, $92, $B4, $B4, $B4, $B4, $B4, $B4, $B4, $B4, $B4 ; Tiles $60 - $6F
	.byte $B4, $B8, $98, $98, $98, $98, $A4, $EC, $E4, $C0, $D5, $B2, $E9, $30, $04, $FF ; Tiles $70 - $7F
	.byte $05, $54, $58, $58, $44, $C4, $48, $48, $18, $68, $1C, $10, $60, $10, $10, $10 ; Tiles $80 - $8F
	.byte $60, $05, $05, $05, $FF, $FF, $44, $27, $3D, $27, $3D, $0A, $30, $30, $31, $34 ; Tiles $90 - $9F
	.byte $34, $31, $34, $34, $FF, $FF, $FF, $88, $FE, $2A, $14, $40, $6C, $8C, $8E, $8C ; Tiles $A0 - $AF
	.byte $8E, $8C, $8E, $8C, $8E, $76, $76, $74, $70, $72, $AC, $AE, $B8, $FF, $FF, $FF ; Tiles $B0 - $BF
	.byte $34, $05, $FC, $2C, $FC, $FC, $34, $30, $38, $FE, $FE, $FE, $FE, $38, $FE, $39 ; Tiles $C0 - $CF
	.byte $5F, $FE, $5F, $38, $1D, $39, $30, $05, $B3, $CC, $FC, $C5, $C7, $D4, $FE, $FC ; Tiles $D0 - $DF
	.byte $AA, $AB, $4C, $4A, $00, $40, $50, $06, $30, $34, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $E0 - $EF
	.byte $50, $D7, $E0, $05, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $F1, $17, $F8, $FF ; Tiles $F0 - $FF

	; Lower left 8x8 pattern per tile
	.byte $FC, $DD, $FF, $06, $D6, $E9, $22, $22, $24, $7C, $06, $06, $7F, $65, $06, $06 ; Tiles $00 - $0F
	.byte $67, $D7, $FF, $0F, $2E, $2F, $FD, $FC, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $10 - $1F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $B9, $B9 ; Tiles $20 - $2F
	.byte $B9, $B9, $BD, $FF, $B1, $B0, $86, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DD, $06, $06, $FC, $06, $06, $06, $09, $F5, $F5, $F5, $FE, $FE, $09, $09, $7C ; Tiles $40 - $4F
	.byte $5E, $FF, $20, $32, $18, $1A, $0A, $0E, $05, $05, $27, $5D, $FE, $FE, $09, $D9 ; Tiles $50 - $5F
	.byte $99, $99, $99, $99, $99, $99, $93, $B5, $B5, $B5, $B5, $B5, $B5, $B5, $B5, $B5 ; Tiles $60 - $6F
	.byte $B5, $B9, $99, $99, $99, $99, $A5, $ED, $E4, $C1, $B2, $B2, $E8, $32, $05, $FF ; Tiles $70 - $7F
	.byte $06, $58, $58, $56, $48, $C4, $48, $46, $19, $69, $1D, $11, $61, $11, $61, $11 ; Tiles $80 - $8F
	.byte $61, $06, $06, $11, $FF, $FF, $58, $27, $3F, $27, $3D, $31, $34, $34, $31, $34 ; Tiles $90 - $9F
	.byte $34, $0E, $32, $32, $FF, $FF, $FF, $89, $FE, $2B, $15, $41, $6D, $9C, $9E, $9C ; Tiles $A0 - $AF
	.byte $9E, $9C, $9E, $9C, $9E, $77, $77, $75, $71, $73, $AC, $AE, $B9, $FF, $FF, $FF ; Tiles $B0 - $BF
	.byte $31, $06, $36, $3E, $FE, $FE, $3E, $31, $31, $3A, $FE, $FE, $3A, $31, $3A, $FF ; Tiles $C0 - $CF
	.byte $3B, $FE, $3B, $31, $3B, $FF, $31, $E6, $CD, $CD, $CD, $FE, $FE, $FE, $FE, $FE ; Tiles $D0 - $DF
	.byte $AB, $AB, $4A, $4B, $01, $41, $51, $07, $31, $35, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $E0 - $EF
	.byte $51, $06, $E1, $06, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $F0, $3C, $F9, $FF ; Tiles $F0 - $FF

	; Upper right 8x8 pattern per tile	
	.byte $FC, $DE, $FF, $07, $07, $EA, $21, $23, $23, $07, $7D, $07, $7F, $07, $64, $66 ; Tiles $00 - $0F
	.byte $07, $FF, $FF, $4E, $0C, $0D, $2F, $2E, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $10 - $1F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $BA, $BA ; Tiles $20 - $2F
	.byte $BA, $BA, $BE, $FF, $B0, $B1, $FF, $86, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DE, $07, $07, $FC, $07, $07, $07, $09, $F6, $F6, $F6, $FE, $09, $FE, $FE, $09 ; Tiles $40 - $4F
	.byte $7C, $7F, $11, $31, $25, $27, $29, $2B, $07, $05, $28, $5E, $09, $09, $FE, $DA ; Tiles $50 - $5F
	.byte $9A, $9A, $9A, $9A, $9A, $9A, $CA, $B6, $B6, $B6, $B6, $B6, $B6, $B6, $B6, $B6 ; Tiles $60 - $6F
	.byte $B6, $BA, $9A, $9A, $9A, $9A, $A6, $EE, $E5, $C2, $D5, $B2, $EB, $31, $06, $FF ; Tiles $70 - $7F
	.byte $07, $55, $59, $59, $45, $C6, $49, $49, $1A, $6A, $1E, $12, $62, $62, $12, $12 ; Tiles $80 - $8F
	.byte $12, $12, $07, $07, $FF, $FF, $45, $3C, $27, $3C, $27, $30, $30, $0B, $34, $34 ; Tiles $90 - $9F
	.byte $33, $34, $34, $33, $FF, $FF, $FF, $8A, $FE, $2C, $16, $42, $6E, $8D, $8F, $8D ; Tiles $A0 - $AF
	.byte $8F, $8D, $8F, $8D, $8F, $7A, $7A, $78, $70, $72, $AD, $AF, $BA, $FF, $FF, $FF ; Tiles $B0 - $BF
	.byte $1C, $07, $FC, $3A, $FC, $FC, $32, $32, $3A, $FE, $FC, $FE, $FC, $33, $FE, $3D ; Tiles $C0 - $CF
	.byte $3A, $FE, $33, $35, $3C, $FF, $07, $07, $B3, $CE, $FC, $C5, $C7, $D4, $FE, $FC ; Tiles $D0 - $DF
	.byte $AA, $AB, $4C, $4A, $02, $42, $52, $32, $32, $36, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $E0 - $EF
	.byte $52, $D7, $E2, $07, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $F3, $18, $FA, $FF ; Tiles $F0 - $FF

	; Lower right 8x8 pattern per tile
	.byte $FC, $DF, $FF, $08, $D6, $EB, $23, $23, $25, $7C, $7D, $7E, $08, $08, $65, $67 ; Tiles $00 - $0F
	.byte $08, $FF, $D7, $4F, $2E, $2F, $FD, $FC, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $10 - $1F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $BB, $BB ; Tiles $20 - $2F
	.byte $BB, $BB, $BF, $FF, $B1, $B0, $FF, $86, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
	.byte $DF, $08, $08, $FC, $08, $08, $08, $FE, $F7, $F7, $F7, $FE, $04, $04, $04, $7D ; Tiles $40 - $4F
	.byte $7F, $FF, $21, $33, $19, $1B, $0B, $0F, $05, $05, $29, $5F, $FE, $04, $FE, $DB ; Tiles $50 - $5F
	.byte $9B, $9B, $9B, $9B, $9B, $9B, $CB, $B7, $B7, $B7, $B7, $B7, $B7, $B7, $B7, $B7 ; Tiles $60 - $6F
	.byte $B7, $BB, $9B, $9B, $9B, $9B, $A7, $EF, $E5, $C3, $B2, $B2, $EA, $33, $07, $FF ; Tiles $70 - $7F
	.byte $08, $59, $59, $57, $49, $C6, $49, $47, $1B, $6B, $1F, $13, $63, $63, $63, $63 ; Tiles $80 - $8F
	.byte $63, $13, $13, $13, $FF, $FF, $59, $3E, $27, $3C, $27, $34, $34, $33, $34, $34 ; Tiles $90 - $9F
	.byte $33, $32, $32, $0F, $FF, $FF, $FF, $8B, $FE, $2D, $17, $43, $6F, $9D, $9F, $9D ; Tiles $A0 - $AF
	.byte $9F, $9D, $9F, $9D, $9F, $7B, $7B, $79, $71, $73, $AD, $AF, $BB, $FF, $FF, $FF ; Tiles $B0 - $BF
	.byte $33, $08, $FE, $3F, $FE, $FC, $33, $33, $3F, $FE, $FC, $FE, $FC, $30, $39, $1D ; Tiles $C0 - $CF
	.byte $3F, $39, $30, $3F, $33, $3E, $06, $E7, $CF, $CF, $CF, $FE, $FE, $FE, $FE, $FE ; Tiles $D0 - $DF
	.byte $AB, $AB, $4A, $4B, $03, $43, $53, $36, $33, $37, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $E0 - $EF
	.byte $53, $08, $E3, $08, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $F2, $3D, $FB, $FF ; Tiles $F0 - $FF

Tile_Attributes_TS2:
	.byte $14, $5A, $A9, $E2, $14, $5A, $A9, $E2
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_TS2
;
; Entry point for loading level layout data for Level_Tileset = 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_TS2:

	; Clear Tile memory

	; Fortresses predefine tiles such that you end up with a ceiling of
	; shaded brickwork, brickwork in the background, and a checkerboard
	; floor across the bottom; kind of interesting the style wasn't
	; always popular (e.g. in the World 1 fortress)

	LDY #6	; Offsets passed alternate layout/object pointers, second header byte
	LDA [Level_LayPtr_AddrL],Y
	AND #LEVEL3_VERTICAL
	PHP	; Save status

	LDY #$00	 

	PLP	; Restore status
	BNE TS21Clear_Vert	; If this is a vertical fortress, jump to TS21Clear_Vert

PRG021_A40A:
	LDA #TILE2_BGBRICK_NOSHADOW
	JSR Tile_Mem_ClearB
	LDA #TILE2_DIAMONDDARK
	JSR Tile_Mem_ClearA
	CPY #$10
	BNE PRG021_A40A

PRG021_A418:
	LDA #TILE2_BGBRICK_NOSHADOW
	JSR Tile_Mem_ClearB
	LDA #TILE2_BGBRICK_TOPSHADOW
	JSR Tile_Mem_ClearA
	CPY #$20
	BNE PRG021_A418

PRG021_A426:
	LDA #TILE2_BGBRICK_NOSHADOW
	JSR Tile_Mem_ClearB
	JSR Tile_Mem_ClearA
	CPY #$D0
	BNE PRG021_A426

PRG021_A432:
	LDA #TILE2_CHECKERBOARDUL
	JSR Tile_Mem_ClearB
	INY
	LDA #TILE2_CHECKERBOARDUR
	JSR Tile_Mem_ClearB
	INY
	CPY #$E0
	BNE PRG021_A432

PRG021_A442:
	LDA #TILE2_CHECKERBOARDLL
	JSR Tile_Mem_ClearB
	INY
	LDA #TILE2_CHECKERBOARDLR
	JSR Tile_Mem_ClearB
	INY
	CPY #$F0
	BNE PRG021_A442

	JMP LevelLoad	; Begin actual level loading!

TS21Clear_Vert:
	LDA #TILE2_BGBRICK_NOSHADOW
	JSR Tile_Mem_ClearB
	JSR Tile_Mem_ClearA
	CPY #$f0
	BNE TS21Clear_Vert


	JMP LevelLoad	; Begin actual level loading!

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_Generator_TS2
;
; Based on the values in Temp_Var15 and LL_ShapeDef, chooses an
; appropriate generator function to builds this piece of the
; level.  Tedious, but saves space and is paper-design friendly.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PRG021_A455:
	.byte 0, 15, 30, 45, 60, 75, 90, 105

LoadLevel_Generator_TS2:
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
	ADD PRG021_A455,X	; Add multiple of 15
	TAX
	DEX
	TXA		 ; A = ((LL_ShapeDef >> 4) + PRG015_A419[X]) - 1


	; PRG015_A455 provides values well in excess of 58, but only 58
	; addresses are defined here; reserved for expansion...

	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word LoadLevel_Pillar			;  0 - Generate foreground pillar
	.word LoadLevel_Pillar_BG		;  1 - Generate background pillar
	.word LoadLevel_BrickAndShadow		;  2 - Run of solid Bowser's type bricks with shadow underneath
	.word LoadLevel_ShadowBGBrick		;  3 - Run of background bricks lightly shadowed
	.word LoadLevel_ShadowBGBrick		;  4 - Run of background bricks darkly shadowed
	.word LoadLevel_WindowShort		;  5 - Run of "short" windows (gapped by 3 tiles)
	.word LoadLevel_WindowTall		;  6 - Run of "tall" windows (gapped by 3 tiles)
	.word LoadLevel_WindowVeryShort		;  7 - Run of "very short" windows (gapped by 3 tiles)
	.word LoadLevel_HangingGlobes		;  8 - Run of hanging globes
	.word LoadLevel_UnderRectangle	;  9 - Rectangle of fence
	.word LoadLevel_DoNothing		; 10 - REMOVED
	.word LoadLevel_SpikeUp			; 11 - Run of upward pointing spikes
	.word LoadLevel_SpikeDown		; 12 - Run of downward pointing spikes
	.word LoadLevel_SolidBrick		; 13 - Run of solid brick tiles
	.word LoadLevel_BrightDiamondLong	; 14 - Retangle of gray diamond tiles
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
	.word $0000		; 43 - UNUSED
	.word LoadLevel_VTransitPipeRun		; 44 - Vertical in-level transit pipe
	.word LoadLevel_ShadowFlood		; 45 - Flood of BGBRICK shadowed blocks
	.word LoadLevel21_Background		; 46 - Rectangle of BGBRICK shadowed blocks
	.word LoadLevel21_Background		; 47 - Rectangle of blackness background blocks
	.word LoadLevel_Lava			; 48 - Run of lava (top and bottom)
	.word LoadLevel_Conveyor		; 49 - Run of left conveyor
	.word LoadLevel_Conveyor		; 50 - Run of right conveyor
	.word LoadLevel_PathHorizontal		; 51 - Horizontal moving platform path
	.word LoadLevel_PathVertical		; 52 - Vertical moving platform path
	.word LoadLevel_Path45T2B		; 53 - 45 degree top-to-bottom moving platform path
	.word LoadLevel_Path45B2T		; 54 - 45 degree bottom-to-top moving platform path
	.word LoadLevel_Path625T2B		; 55 - 62.5 degree top-to-bottom moving platform path
	.word LoadLevel_Path625B2T		; 56 - 62.5 degree bottom-to-top moving platform path
	.word LoadLevel_BrightDiamond		; 57 - Rectangle of red bright blocks
	.word LoadLevel_DonutLifts		; 58 - Run of donut lifts
	.word LoadLevel_GlobeManual		; 59 - Manually placed ceiling globes
	.word LoadLevel_Vine			; 60 - A set-length vine (normally "to ground")
	.word LoadLevel_EmptyBoxesLong	; 61 - Retangle of empty box tiles (good for the dark!)
	.word LoadLevel_TopManiacZapper	; 62 - Topmaniac Zapper
	.word LoadLevel_TopManiacZapper	; 63 - Topmaniac Zapper
	.word LoadLevel_PurpleCoins		; 64 - Run of Purple coins
	.word LoadLevel_PurpleCoinR		; 65 - Rectangle of Purple Coins
	.word LoadLevel_Munchers21			; 66 - Run of munchers
	.word LoadLevel_Munchers21_Upsidedown ; 67 - Run of upside down munchers
	.word LevelLoad_OnBlocks21			; 68 - Run of on blocks
	.word LevelLoad_OffBlocks21			; 69 - Run of off blocks
	.word LevelLoad_SwitchUpsideDown21  ; 70 - Run of upside down switches
	.word LevelLoad_CrumblingBlock21	; 71 - Run of crumbling blocks

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LeveLoad_FixedSizeGen_TS2
;
; Much simpler generators that are fixed-size, commonly used for 
; just single tile placement styles (although a couple relatively 
; complex ones exist in here as well)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LeveLoad_FixedSizeGen_TS2:
	LDA <Temp_Var15
	AND #%11100000
	LSR A		 
	ADD LL_ShapeDef	
	TAX		 

	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word LoadLevel_Door2			;  0 - Door style 2
	.word LoadLevel_AltBackground		;  1 - Generates a different background
	.word LoadLevel_RotoDisc		;  2 - Roto disc hub block
	.word LoadLevel_ThroneRoom		;  3 - Prefab end world throne room (not really useful in general!)
	.word LoadLevel_Candle			;  4 - Hot foot's candle
	.word LoadLevel_FenceFlip		;  5 - Flippable fence segment
	.word LoadLevel_Door1			;  6 - Door style 1
	.word LoadLevel_EndDoor			;  7 - The end door that the princess is behind
	.word LoadLevel_StarCoin1		;  8 - Star Coin 1
	.word LoadLevel_StarCoin2		;  9 - Star Coin 2
	.word LoadLevel_StarCoin3		; 10 - Star Coin 3
	.word LoadLevel_ActionSwitch		; 11 - Action Switch
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_ShadowBGBrick
;
; Puts down 1-16 of a shadowed background brick
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LL_ShadowBrick:
	.byte TILE2_BGBRICK_TOPSHADOW, TILE2_BGBRICK_TOPDSHADOW

LoadLevel_ShadowBGBrick:
	LDA LL_ShapeDef
	PHA		 ; Save LL_ShapeDef
	SUB #$40	 
	LSR A		 
	LSR A		 
	LSR A		 
	LSR A		 
	TAX		 ; X = relative address

	PLA		 ; Restore LL_ShapeDef
	AND #$0f	
	STA <Temp_Var3	 ; Temp_Var3 = lower 4 bits of LL_ShapeDef

	LDY TileAddr_Off ; Y = TileAddr_Off

PRG021_A565:
	LDA LL_ShadowBrick,X	 ; Get BGBRICK shadow tile
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column
	DEC <Temp_Var3		 ; Temp_Var3--
	BPL PRG021_A565	 	; While Temp_Var3 >= 0, loop!

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_WindowShort
;
; Puts down 1-16 short (1 mid tall) windows; multiple windows are
; gapped 3 tiles apart.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_WindowShort:
	LDX #$00	 ; X = 0 (short window)
	BEQ PRG021_A57A	 ; Jump (technically always) to PRG021_A57A

LL_WindowHeight:
	.byte 1, 3	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_WindowTall
;
; Puts down 1-16 tall (3 mid tall) windows; multiple windows are
; gapped 3 tiles apart.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_WindowTall:
	LDX #$01	 ; X = 1 (tall window)

PRG021_A57A:
	STX <Temp_Var12		 ; Temp_Var12 = 'X' (0 or 1)

	; Backup Map_Tile_AddrL/H into Temp_Var1/2
	LDA <Map_Tile_AddrL	
	STA <Temp_Var1		
	LDA <Map_Tile_AddrH	
	STA <Temp_Var2		

	LDA LL_ShapeDef
	AND #$0f	
	STA <Temp_Var4		; Temp_Var4 = lower 4 bits of LL_ShapeDef (Width of run)

PRG021_A58B:
	LDX <Temp_Var12		; X = Temp_Var12 (0 or 1)

	LDA LL_WindowHeight,X	 ; Get height of this window
	STA <Temp_Var3		 ; Store into Temp_Var3
 
	LDY TileAddr_Off	 ; Y = TileAddr_Off

	LDA #TILE2_WINDOWTOP	 ; Top of window
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem

	JMP PRG021_A5A0	 	; Jump to PRG021_A5A0

	; Loop for all middle sections of window
PRG021_A59C:
	LDA #TILE2_WINDOWMID	 ; Middle of window
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem

PRG021_A5A0:

	; Move to next row by adding 16 to tile offset
	JSR LoadLevel_TileMemNextRow

	DEC <Temp_Var3		 ; Temp_Var3-- (window height counter)
	BNE PRG021_A59C	 	; While Temp_Var3 <> 0, loop!

	LDA #TILE2_WINDOWBOT	 ; Bottom of window
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem

	; Restore Map_Tile_Addr from backup
	LDA <Temp_Var1
	STA <Map_Tile_AddrL
	LDA <Temp_Var2	
	STA <Map_Tile_AddrH

	LDX #$03	 ; X = 3  (three tile spacing between windows)
	LDY TileAddr_Off ; Y = TileAddr_Off
PRG021_A5C0:
	; The following (down to PRG014_CE05) is ALMOST the same as LoadLevel_NextColumn,
	; except it also backs up the new address (kind of pointless, but sure...)

	INY		 ; Y++
	TYA		 ; A = Y
	AND #$0f	 ; Check column
	BNE PRG014_A5DD  ; If on column 1-15, jump to PRG014_CE05

	; Otherwise, need to move over to the next screen (+$1B0)
	LDA <Map_Tile_AddrL
	ADD #$b0	 
	STA <Map_Tile_AddrL
	STA <Temp_Var1		 ; Update Map_Tile_AddrL backup
	LDA <Map_Tile_AddrH
	ADC #$01	 
	STA <Map_Tile_AddrH
	STA <Temp_Var2		 ; Update Map_Tile_AddrH backup

	; Get TileAddr_Off and only keep the row, but clear 'Y' lower bits since
	; we're going to column 0 on the same row, new screen...
	LDA TileAddr_Off
	AND #$f0
	TAY	
PRG014_A5DD:

	DEX		 	; X--
	BPL PRG021_A5C0	 	; While X >= 0, loop!

	STY TileAddr_Off	 ; Y = TileAddr_Off

	DEC <Temp_Var4		 ; Temp_Var4-- (run count)
	BPL PRG021_A58B	 	; While Temp_Var4 >= 0, loop!

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_WindowVeryShort
;
; Puts down 1-16 very short (mid only) windows; multiple windows 
; are gapped 3 tiles apart.  (CHECKME: Are these used??)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_WindowVeryShort:
	LDA LL_ShapeDef	 
	AND #$0f	 
	STA <Temp_Var3		; Temp_Var3 = lower 4 bits of LL_ShapeDef (width of run)

	LDY TileAddr_Off	; Y = TileAddr_Off
PRG021_A5F2:
	LDA #TILE2_WINDOWMID	; Middle of window
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem

	LDX #$03	 	; X = 3 (windows are gapped by 3)
	LDY TileAddr_Off	; Y = TileAddr_Off
PRG021_A5FB:
	JSR LoadLevel_NextColumn ; Next column
	DEX		 	; X--
	BPL PRG021_A5FB	 	; While X >= 0, loop!

	STY TileAddr_Off	 ; Y = TileAddr_Off
	DEC <Temp_Var3		 ; Temp_Var3--
	BPL PRG021_A5F2	 	; While Temp_Var3 >= 0, loop...

	RTS		 ; Return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_HangingGlobes
;
; Puts down 1-16 hanging globe things; multiple of these are
; gapped 3 tiles apart.  They're generated from the starting
; position until the video offset 'Y' has reached an arbitrary
; value of "16" (kind of a poor implementation; why not seek
; the ceiling??)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_HangingGlobes:
	LDA LL_ShapeDef
	AND #$0f	
	STA <Temp_Var3		; Temp_Var3 = lower 4 bits of LL_ShapeDef

	LDY TileAddr_Off	; Y = TileAddr_Off

PRG014_A613:
	LDA #TILE2_HANGGLOBE_GLOBE	 ; Hanging globe thing
	STA [Map_Tile_AddrL],Y	 	; Store into tile mem

	JMP PRG021_A61E	 ; Jump to PRG021_A61E

PRG021_A61A:
	LDA #TILE2_HANGGLOBE_CABLE	; Hanging globe thing's cable
	STA [Map_Tile_AddrL],Y	 	; Store into tile mem

PRG021_A61E:
	TYA
	SUB #16
	TAY	
	AND #$f0
	CMP #16
	BNE PRG021_A61A		; While Y <> 16 (end of its range), loop

	LDA #TILE2_HANGGLOBE_TOP ; Ceiling connector of globe thing
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem

	LDX #$03	 	; X = 3 (gap by 3)
	LDY TileAddr_Off 	; Y = TileAddr_Off
PRG021_A632:
	JSR LoadLevel_NextColumn ; Next column
	DEX		 ; X--
	BPL PRG021_A632	 ; While X >= 0, loop!

	STY TileAddr_Off	 ; TileAddr_Off = Y

	DEC <Temp_Var3		 ; Temp_Var3--
	BPL PRG014_A613	 	; While Temp_Var3 >= 0, loop!
	RTS		 ; Return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_BrightDiamond
;
; Puts down 1-256 bright diamond blocks, up to 16 tiles tall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_BrightDiamond:
	LDX #$01	 ; X = 1 (bright diamond blocks)
	BNE PRG021_A678	 ; Jump to PRG021_A678

LL_DiamondBrick:
	.byte TILE2_DIAMONDBRIGHT, TILE2_SOLIDBRICK

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_SolidBrick
;
; Puts down 1-256 solid bricks, up to 16 tiles tall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_SolidBrick:
	LDX #$00	 ; X = 0 (solid brick)

PRG021_A678:
	JSR LL21_InitLongRun	 ; Get setup for long run

PRG021_A67B:
	LDA <Temp_Var3		 
	STA <Temp_Var5		 ; Temp_Var5 = Temp_Var3 (backup run width)

PRG021_A67F:
	LDA LL_DiamondBrick,X	 ; Get appropriate tile
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column
	DEC <Temp_Var5		 ; Temp_Var5-- (width decrement)

	LDA <Temp_Var5
	CMP #$ff
	BNE PRG021_A67F	 	; While Temp_Var5 >= 0, loop!

	JSR LL21_LongRunNextRow	 ; Go to next row
	DEC <Temp_Var4		 ; Temp_Var4-- (height decrement)
	BPL PRG021_A67B	 	; While Temp_Var4 >= 0, loop!
	RTS		 ; Return


	; This routine prepares for a long run of tiles by getting an additional
	; byte from the layout stream and preparing the Map_Tile_Addr backup
LL21_InitLongRun:
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
LL21_LongRunNextRow:
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_BrightDiamondLong
;
; Puts down 1-256 bright diamond blocks, up to 16 tiles tall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_BrightDiamondLong:
	LDA #TILE2_DIAMONDBRIGHT ; Bright diamond block
	
LL_BDL_Entry:
	STA <Temp_Var5

	JSR LL21_InitLongRun	 ; Get setup for long run

PRG021_A6DB:
	LDX <Temp_Var4		 ; X = Temp_Var4 (with of run)
PRG021_A6DD:
	LDA <Temp_Var5
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column
	DEX		 	 ; X--
	BPL PRG021_A6DD	 	 ; While X >= 0, loop!

	JSR LL21_LongRunNextRow	 ; Next row
	DEC <Temp_Var3		 ; Temp_Var3--
	BPL PRG021_A6DB	 	; While Temp_Var3 >= 0, loop!

	RTS		 ; Return
	
	
LoadLevel_EmptyBoxesLong:
	LDA #TILEA_BLOCKEMPTY
	BNE LL_BDL_Entry

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_SpikeUp
;
; Puts down 1-16 upward spikes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_SpikeUp:
	LDX #$00	 ; X = 0 (spike upward)
	BEQ PRG021_A6F7	 ; Jump to PRG021_A6F7

LL_Spike:
	.byte TILE2_SPIKEUP, TILE2_SPIKEDOWN

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_SpikeDown
;
; Puts down 1-16 downward spikes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_SpikeDown:
	LDX #$01	 ; X = 1 (spike downward)

PRG021_A6F7:
	LDA LL_ShapeDef	 
	AND #$0f	 
	STA <Temp_Var4		 ; Temp_Var4 = lower 4 bits of LL_ShapeDef (width of run)

	LDY TileAddr_Off	 ; Y = TileAddr_Off

PRG021_A701:
	LDA LL_Spike,X	 	 ; Get appropriate spike tile
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column
	DEC <Temp_Var4		 ; Temp_Var4--
	BPL PRG021_A701	 	; While Temp_Var4 >= 0, loop!
	RTS		 	; Return...


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_ShadowFlood
;
; Puts in TILE2_BGBRICK_SHADOW2 until it hits near the bottom
; (11 rows of this) at the specified width 1-16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_ShadowFlood:
	; Backup Map_Tile_AddrL/H into Temp_Var1/2
	LDA <Map_Tile_AddrL
	STA <Temp_Var1	
	LDA <Map_Tile_AddrH
	STA <Temp_Var2	

	LDA LL_ShapeDef	 
	AND #$0f	 
	STA <Temp_Var3		; Temp_Var3 = lower 4 bits of LL_ShapeDef

	LDY TileAddr_Off	 ; Y = TileAddr_Off

PRG021_A720:
	LDX <Temp_Var3		 	; X = Temp_Var3
PRG021_A722:
	LDA #TILE2_BGBRICK_SHADOW2	; Shadow tile
	STA [Map_Tile_AddrL],Y	 	; Store into tile mem
	JSR LoadLevel_NextColumn	; Next column
	DEX		 		; X--
	BPL PRG021_A722	 		; While X >= 0, loop!

	JSR LL21_LongRunNextRow	 	; Next row
	CPY #$b0	 
	BLT PRG021_A720	 		; If 'Y' < $B0, loop around
	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel21_Background
;
; Puts down 1-256 background tiles (either BGBRICK shadowed tiles
; or solid black nothingness tiles), up to 16 tiles tall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LL21_Background:
	.byte TILE2_BGBRICK_SHADOW2, TILE2_BLACK

LoadLevel21_Background:
	LDY #$00	 	; Y = 0 

	LDA [Level_LayPtr_AddrL],Y	 ; Get byte from layout data
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
	PHA		 ; Save LL_ShapeDef

	SUB #$20
	LSR A	
	LSR A	
	LSR A	
	LSR A	
	TAX		 ; X = relative index

	PLA		 ; Restore LL_ShapeDef

	AND #$0f	 
	STA <Temp_Var4		 ; Temp_Var4 = lower 4 bits of LL_ShapeDef (height of run)

PRG021_A762:
	LDY TileAddr_Off	 ; Y = TileAddr_Off

	LDA <Temp_Var3	
	STA <Temp_Var5		 ; Temp_Var5 = Temp_Var3 (restore original width)

PRG021_A769:
	LDA LL21_Background,X	 ; Get appropriate background tile
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column

	DEC <Temp_Var5		 ; Temp_Var5-- (width decrement)
	LDA <Temp_Var5		 
	CMP #$ff	 
	BNE PRG021_A769	 	; While Temp_Var5 >= 0, loop!
	JSR LL21_LongRunNextRow	 ; Next row
	DEC <Temp_Var4		 ; Temp_Var4-- (height decrement)
	BPL PRG021_A762	 	; While Temp_Var4 >= 0, loop!
	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_AltBackground
;
; Alternate background generator of dark red diamond blocks and
; shadowing... will have to describe this better
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_AltBackground:
	LDY #$00	 ; Y = 0
PRG021_A783:
	LDA #TILE2_DARKREDDIAMOND
	JSR Tile_Mem_ClearA
	CPY #$10
	BNE PRG021_A783

PRG021_A78C:
	LDA #TILE2_BGBRICK_TOPDSHADOW
	JSR Tile_Mem_ClearA
	CPY #$20
	BNE PRG021_A78C	 ; $A793 

PRG021_A795:
	LDA #TILE2_BGBRICK_SHADOW2
	JSR Tile_Mem_ClearA
	CPY #$80	
	BNE PRG021_A795	 

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_RotoDisc
;
; Puts down a single roto disc hub block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_RotoDisc:
	LDY TileAddr_Off	 ; Y = TileAddr_Off
	LDA #TILE2_ROTODISCBLOCK ; Roto disc's block
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem
	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_Candle
;
; Puts down a single Hot Foot's candle
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_Candle:
	LDY TileAddr_Off	; Y = TileAddr_Off
	LDA #TILE2_CANDLE	; Hot foot's candle
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem
	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_FenceFlip
;
; Inserts a 3x3 flippable fence segment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_FenceFlip:
	; Temp_Var3 = 2 (3 rows)
	LDA #2
	STA <Temp_Var3

	LDX #TILE2_FENCE_UL	 	; X = TILE2_FENCE_UL
	LDY TileAddr_Off	 ; Y = TileAddr_Off
LL_FenceFlip_Loop:

	; Backup Map_Tile_AddrL/H into Temp_Var1/2
	LDA <Map_Tile_AddrL	
	STA <Temp_Var1		
	LDA <Map_Tile_AddrH	
	STA <Temp_Var2		

	; Temp_Var4 = 2 (3 columns)
	LDA #2
	STA <Temp_Var4

LL_FenceFlip_InnerLoop:
	TXA	 ; Get fence tile
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem
	
	JSR LoadLevel_NextColumn	; Next column
	
	INX		 	; X++ (next fence tile)

	DEC <Temp_Var4	; One less column...
	BPL LL_FenceFlip_InnerLoop	; While Temp_Var4 >= 0, loop!

	; Restore Map_Tile_Addr from backup
	LDA <Temp_Var1		 
	STA <Map_Tile_AddrL	
	LDA <Temp_Var2		
	STA <Map_Tile_AddrH	
	LDY TileAddr_Off	 ; Y = TileAddr_Off

	; Next row
	JSR LoadLevel_TileMemNextRow

	STY TileAddr_Off
	
	DEC <Temp_Var3	; One less row...
	BPL LL_FenceFlip_Loop	; While Temp_Var3 >= 0, loop!

	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_EndDoor
;
; The end door where the princess is kept.  Note that this
; was designed for one-shot use and does not have the proper
; mechanisms to be fully "safe" for general use (i.e. it'll
; bust apart at screen edge and other conditions)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LL_EndDoor:
	.byte TILE2_ENDDOOR_UL, TILE2_ENDDOOR_UR
	.byte TILE2_ENDDOOR_LL, TILE2_ENDDOOR_LR

LoadLevel_EndDoor:
	LDX #$00	 	; X = 0
	LDY TileAddr_Off	 ; Y = TileAddr_Off
PRG021_A7CF:
	LDA LL_EndDoor,X	 ; Get this tile
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem
	INY		 	; Y++ (next column, NOT PROTECTED AGAINST SCREEN EDGE!)
	INX		 	; X++ (next door tile)

	TXA		 
	AND #$01	 
	BNE PRG021_A7CF	 	; If X & 1, jump to PRG021_A7CF

	; Otherwise, next row (NOT PROTECTED AGAINST OVERFLOW!)
	LDA TileAddr_Off
	ADD #16
	TAY	
	CPX #$04	 	
	BNE PRG021_A7CF	 	; If X <> 4 (end of the door), loop!
	RTS		 ; Return
	


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_GlobeManual
;
; Adds one of the hanging globes but manually instead of ruled.
; Specify height instead of repeat.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_GlobeManual:
	LDY TileAddr_Off	 ; Y = TileAddr_Off

	LDA #TILE2_HANGGLOBE_TOP ; Ceiling connector of globe thing
	STA [Map_Tile_AddrL],Y	 	; Store into tile mem

	JSR LoadLevel_TileMemNextRow		; Go to next row

	LDA #TILE2_HANGGLOBE_CABLE	; Hanging globe thing's cable
	STA [Map_Tile_AddrL],Y	 	; Store into tile mem

	LDX #1	; Use globe chain
	JSR LLGlobeManual_Enter

	LDA #TILE2_HANGGLOBE_GLOBE ; Globe thing
	STA [Map_Tile_AddrL],Y	 	; Store into tile mem

	RTS
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_TopManiacZapper
;
; Puts down 1-16 Top Maniac 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LL_TMZ_Top:	.byte TILE2_ZAPPER_TL, TILE2_ZAPPER_TR
LL_TMZ_Mid:	.byte TILE2_ZAPPER_L, TILE2_ZAPPER_R

LoadLevel_TopManiacZapper:
	LDA LL_ShapeDef	 
	AND #$0f	 
	STA <Temp_Var3		; Temp_Var3 = lower 4 bits of LL_ShapeDef (width of run)

	LDA LL_ShapeDef	 
	LSR A	
	LSR A	
	LSR A	
	LSR A	
	AND #1
	TAX

	LDY TileAddr_Off	; Y = TileAddr_Off

	LDA LL_TMZ_Top,X
	STA [Map_Tile_AddrL],Y

LL_TMZ_Loop:
	JSR LoadLevel_TileMemNextRow	; Next row

	LDA LL_TMZ_Mid,X
	STA [Map_Tile_AddrL],Y

	DEC <Temp_Var3		 ; Temp_Var3--
	BPL LL_TMZ_Loop	 	; While Temp_Var3 >= 0, loop...

	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_Munchers
;
; Puts down 1-16 munchers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_Munchers21:
	LDA #TILEA_MUNCHER
	BNE LLM21_SeTTile

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_Munchers15_Upsidedown
;
; Puts down 1-16 munchers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_Munchers21_Upsidedown:
	LDA #TILEA_UPSIDEDOWN_MUNCHER
	BNE LLM21_SeTTile

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_OnBlocks15
;
; Puts down 1-16 on blocks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_OnBlocks21:
	LDA #TILEA_ON_BLOCK
	BNE LLM21_SeTTile

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_OffBlocks15
;
; Puts down 1-16 on blocks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_OffBlocks21:
	LDA #TILEA_OFF_BLOCK
	BNE LLM21_SeTTile

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_SwitchUpsideDown15
;
; Puts down 1-16 on blocks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_SwitchUpsideDown21:
	LDA #TILEA_EXSWITCHR
	BNE LLM21_SeTTile


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_SwitchUpsideDown15
;
; Puts down 1-16 on blocks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_CrumblingBlock21:
	LDA #TILEA_CRUMBLINGBLOCK

LLM21_SeTTile:
	STA <Temp_Var5

	LDA LL_ShapeDef	
	AND #$0f	
	TAX		 ; Temp_Var4 = lower 4 bits of LL_ShapeDef
	LDY TileAddr_Off	 ; Y = TileAddr_Off

PRG021_SimpleGenLoop:
	LDA <Temp_Var5
	STA [Map_Tile_AddrL],Y	 ; Store into tile mem
	JSR LoadLevel_NextColumn ; Next column
	DEX		 	 ; X--
	BPL PRG021_SimpleGenLoop	 	 ; While X >= 0, loop!

	RTS		 ; Return
	



	; Broken into another file for ease of integration in NoDice editor
	.include "PRG/levels/Fortress.asm"
