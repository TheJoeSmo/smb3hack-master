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
; FILENAME: prg012.bin, File Size: 8193,.base: $A000
;     -> NES mode enabled
;---------------------------------------------------------------------------
Tile_Layout_TS0:
	; This defines the individual 8x8 blocks used to construct one of the tiles
	; Referenced by Address_Per_Tileset, addressed by Level_Tileset
	; Stored by upper left, then lower left, then upper right, then lower right

	; Remember that palette is determined by the upper 2 bits of a TILE (not the PATTERN)
	; I.e. tiles starting at index $00, $40, $80, $C0 are each on that respective palette

	; RegEx S&R to replace addresses with tile counts (works from $A000-$A...)
	; \$A.(.)(.) - \$A..(.)
	; Tiles $\1\2 - $\1\3

	; Upper left 8x8 pattern per tile
	.byte $12, $FE, $FF, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $FF, $FF, $FF ; Tiles $00 - $0F
	.byte $FF, $FF, $FF, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C, $FF, $FF, $FF ; Tiles $10 - $1F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $20 - $2F
	.byte $FF, $B1, $B2, $FE, $B4, $FE, $BD, $FE, $FE, $FE, $FE, $FE, $FE, $FB, $FF, $FF ; Tiles $30 - $3F
	.byte $A8, $E8, $FE, $CF, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $5C, $FC, $FD, $FF, $FE ; Tiles $40 - $4F
	.byte $90, $B6, $B6, $0C, $FB, $58, $FB, $4B, $4A, $2E, $64, $FE, $4A, $22, $22, $18 ; Tiles $50 - $5F
	.byte $C4, $50, $54, $DC, $56, $DC, $E7, $C4, $04, $2E, $64, $FE, $FE, $FE, $FE, $FF ; Tiles $60 - $6F
	.byte $FF, $B1, $B2, $FE, $B4, $FE, $BD, $FE, $FE, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
	.byte $44, $45, $9F, $9E, $AC, $9E, $9E, $10, $10, $10, $9B, $9F, $9B, $10, $10, $10 ; Tiles $80 - $8F
	.byte $9F, $9F, $10, $9F, $9B, $10, $10, $9B, $10, $AC, $9D, $9E, $9E, $9B, $9F, $10 ; Tiles $90 - $9F
	.byte $9F, $AC, $9E, $9E, $9B, $9F, $99, $9F, $10, $9F, $9E, $10, $10, $94, $10, $10 ; Tiles $A0 - $AF
	.byte $10, $32, $36, $D4, $00, $10, $10, $9B, $10, $9B, $9E, $08, $E0, $2A, $16, $AC ; Tiles $B0 - $BF
	.byte $40, $AC, $BE, $BE, $BE, $BE, $FE, $47, $FE, $B1, $70, $72, $78, $46, $46, $21 ; Tiles $C0 - $CF
	.byte $BE, $3A, $BE, $47, $FE, $FE, $BE, $FE, $FF, $FE, $FE, $FE, $FE, $FE, $FE, $60 ; Tiles $D0 - $DF
	.byte $90, $21, $6C, $FF, $B6, $D0, $26, $FE, $26, $58, $12, $C4, $7A, $7A, $C4, $FF ; Tiles $E0 - $EF
	.byte $FF, $B1, $B2, $FE, $B4, $FE, $BD, $FE, $FE, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $F0 - $FF

	; Lower left 8x8 pattern per tile
	.byte $13, $E1, $FF, $8E, $8E, $8E, $8E, $8E, $8E, $8E, $8E, $8E, $8E, $FF, $FF, $FF ; Tiles $00 - $0F
	.byte $FF, $FF, $FF, $88, $88, $88, $88, $88, $88, $88, $88, $88, $88, $FF, $FF, $FF ; Tiles $10 - $1F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $20 - $2F
	.byte $B0, $FE, $FF, $B3, $FE, $B5, $BD, $FE, $FE, $E1, $FE, $8A, $FE, $FB, $FF, $FF ; Tiles $30 - $3F
	.byte $A9, $D9, $FE, $CF, $FE, $E1, $FE, $E1, $FE, $E1, $E1, $5D, $FC, $FD, $CE, $CE ; Tiles $40 - $4F
	.byte $91, $B7, $B7, $0D, $FB, $59, $FB, $48, $4A, $46, $BB, $4C, $49, $21, $23, $19 ; Tiles $50 - $5F
	.byte $BB, $51, $55, $8B, $56, $DD, $E7, $C5, $05, $2F, $65, $8A, $FE, $8A, $FE, $FF ; Tiles $60 - $6F
	.byte $B0, $FE, $FF, $B3, $FE, $B5, $BD, $FE, $FE, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
	.byte $45, $45, $96, $97, $99, $1E, $10, $1E, $97, $97, $99, $97, $99, $1E, $1E, $1E ; Tiles $80 - $8F
	.byte $1E, $1E, $1E, $97, $AE, $96, $96, $99, $97, $9B, $97, $1E, $97, $99, $1E, $97 ; Tiles $90 - $9F
	.byte $97, $AE, $96, $96, $99, $1E, $AE, $95, $96, $96, $1E, $95, $C2, $9C, $C2, $C2 ; Tiles $A0 - $AF
	.byte $1E, $33, $37, $D5, $01, $1E, $1E, $84, $C2, $84, $95, $09, $E2, $2B, $17, $AE ; Tiles $B0 - $BF
	.byte $41, $AE, $BE, $1A, $45, $20, $3E, $BE, $B0, $B2, $74, $76, $7C, $46, $46, $FE ; Tiles $C0 - $CF
	.byte $45, $3B, $BE, $BE, $8A, $FE, $BE, $FE, $FF, $FE, $E1, $FE, $E1, $FE, $E1, $61 ; Tiles $D0 - $DF
	.byte $91, $23, $6D, $FF, $B7, $D1, $27, $CE, $20, $59, $13, $C5, $7E, $47, $BB, $FF ; Tiles $E0 - $EF
	.byte $B0, $FE, $FF, $B3, $FE, $B5, $BD, $FE, $FE, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $F0 - $FF

	; Upper right 8x8 pattern per tile	
	.byte $14, $FE, $FF, $8D, $8D, $8D, $8D, $8D, $8D, $8D, $8D, $8D, $8D, $FF, $FF, $FF ; Tiles $00 - $0F
	.byte $FF, $FF, $FF, $8D, $8D, $8D, $8D, $8D, $8D, $8D, $8D, $8D, $8D, $FF, $FF, $FF ; Tiles $10 - $1F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $20 - $2F
	.byte $B0, $FF, $FE, $B3, $B4, $FE, $FE, $ED, $FE, $FE, $C0, $FE, $89, $FB, $FF, $FF ; Tiles $30 - $3F
	.byte $AA, $EA, $FE, $CF, $FE, $FE, $C0, $FE, $C0, $FE, $C0, $5E, $FC, $FD, $FF, $FE ; Tiles $40 - $4F
	.byte $92, $B8, $B8, $0E, $FB, $5A, $FB, $4A, $4B, $30, $66, $FE, $4B, $24, $24, $1A ; Tiles $50 - $5F
	.byte $C6, $52, $54, $DE, $57, $DE, $E7, $C6, $06, $30, $66, $FE, $89, $FE, $89, $FF ; Tiles $60 - $6F
	.byte $B0, $FF, $FE, $B3, $B4, $FE, $FE, $ED, $FE, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
	.byte $44, $45, $9C, $9D, $9D, $9D, $AD, $11, $11, $11, $9C, $9A, $11, $11, $9A, $9C ; Tiles $80 - $8F
	.byte $11, $9C, $9C, $11, $11, $11, $9A, $11, $9A, $9E, $AD, $9D, $9D, $9A, $11, $9C ; Tiles $90 - $9F
	.byte $9C, $9D, $9D, $AD, $9C, $9A, $9C, $98, $9C, $11, $86, $C1, $11, $97, $11, $C1 ; Tiles $A0 - $AF
	.byte $C1, $34, $38, $D6, $02, $C1, $11, $11, $9A, $9A, $86, $0A, $EF, $2C, $1C, $AD ; Tiles $B0 - $BF
	.byte $42, $AD, $BE, $BE, $BE, $BE, $46, $FE, $FE, $B4, $71, $73, $79, $46, $46, $BE ; Tiles $C0 - $CF
	.byte $41, $3C, $41, $25, $FE, $89, $BE, $FE, $FF, $FE, $FE, $C0, $FE, $C0, $C0, $62 ; Tiles $D0 - $DF
	.byte $92, $24, $6E, $FF, $B8, $D2, $28, $FE, $28, $5A, $14, $C6, $7B, $7B, $C6, $FF ; Tiles $E0 - $EF
	.byte $B0, $FF, $FE, $B3, $B4, $FE, $FE, $ED, $FE, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $F0 - $FF

	; Lower right 8x8 pattern per tile
	.byte $15, $CD, $FF, $8F, $A4, $A5, $A6, $A7, $C8, $C9, $CA, $CB, $BF, $FF, $FF, $FF ; Tiles $00 - $0F
	.byte $FF, $FF, $FF, $8F, $A4, $A5, $A6, $A7, $C8, $C9, $CA, $CB, $BF, $FF, $FF, $FF ; Tiles $10 - $1F
	.byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $20 - $2F
	.byte $FE, $B1, $B2, $FF, $FE, $B5, $FE, $ED, $FE, $E1, $C0, $8A, $89, $FB, $FF, $FF ; Tiles $30 - $3F
	.byte $AB, $DB, $FE, $CF, $CD, $E1, $C0, $CD, $CD, $E1, $CD, $5F, $FC, $FD, $CE, $CE ; Tiles $40 - $4F
	.byte $93, $B9, $B9, $0F, $FB, $5B, $FB, $FE, $4F, $31, $67, $49, $48, $25, $25, $1B ; Tiles $50 - $5F
	.byte $C7, $53, $55, $DF, $57, $DF, $E7, $C7, $07, $31, $67, $8A, $89, $8A, $89, $FF ; Tiles $60 - $6F
	.byte $FE, $B1, $B2, $FF, $FE, $B5, $FE, $ED, $FE, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
	.byte $45, $45, $95, $94, $1F, $1F, $98, $94, $1F, $94, $94, $98, $1F, $1F, $98, $1F ; Tiles $80 - $8F
	.byte $1F, $1F, $94, $1F, $95, $95, $AF, $94, $98, $94, $9A, $94, $1F, $98, $94, $1F ; Tiles $90 - $9F
	.byte $94, $95, $95, $AF, $1F, $98, $96, $AF, $95, $95, $C1, $87, $C2, $9F, $C3, $C3 ; Tiles $A0 - $AF
	.byte $C1, $35, $39, $D7, $03, $C3, $C3, $C2, $85, $85, $87, $0B, $FA, $2D, $1D, $AF ; Tiles $B0 - $BF
	.byte $43, $AF, $18, $1B, $44, $BE, $BE, $22, $B3, $B5, $75, $77, $7D, $46, $46, $44 ; Tiles $C0 - $CF
	.byte $FE, $3D, $22, $BE, $8A, $89, $BE, $FE, $FF, $CD, $E1, $C0, $CD, $CD, $CD, $63 ; Tiles $D0 - $DF
	.byte $93, $46, $6F, $FF, $B9, $D3, $29, $CE, $29, $5B, $15, $C7, $7F, $7F, $C7, $FF ; Tiles $E0 - $EF
	.byte $FE, $B1, $B2, $FF, $FE, $B5, $FE, $ED, $FE, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $F0 - $FF

Tile_Attributes_TS0:
	; These are defining base ranges to check if a tile is "enterable" on the map
	; Essentially, for a given "range" of tile on the map ($00, $40, $80, $C0),
	; the corresponding value is indexed (take the previous value >> 6) and returns
	; a "quick failure", i.e. "You're standing on a tile in [that range] and it
	; has a value less than [retrieved from below]; you can't possibly enter it!"

	; NOTE: The pool and star are both "enterable"...
	.byte TILE_PANEL1, TILE_PYRAMID_COMP, TILE_POOL, TILE_HANDTRAP

	; These values (equivalent to above) also pulled in via Level_Tileset_LUT??
	.byte TILE_PANEL1, TILE_PYRAMID_COMP, TILE_POOL, TILE_HANDTRAP

	.byte $20, $0E, $A4, $4C, $B7, $97

Tile_Mem_Clear:	; A40E
	; The following loop clears all of the tile memory space to $02 (an all-black tile)
	LDY #$00	
PRG012_A410:
	LDA #$02	
	JSR Tile_Mem_ClearB
	JSR Tile_Mem_ClearA
	CPY #$f0	 
	BNE PRG012_A410	 ; If Y <> $F0, loop! (increments happen in ClearA)

	RTS		 ; Return

Map_Tile_ColorSets:
	.byte $00, $01, $0B, $03, $04, $05, $06, $07, $02, $08

Map_Object_ColorSets:
	.byte $08, $08, $08, $09, $0A, $08, $08, $08, $08, $08

Map_Complete_Bits:
	; Quick LUT to get the bit for this completion row
	.byte $80, $40, $20, $10, $08, $04, $02, $01

	; Keep in sync with PRG011 Map_SpecComp_Tiles
Map_Removable_Tiles:
	.byte TILE_FORT				; 0
	.byte TILE_ALTFORT			; 1
	.byte TILE_LARGEFORT		; 2
	.byte TILE_GHOSTHOUSE		; 3
	.byte TILE_TOADHOUSE		; 4
	.byte TILE_QBLOCK			; 5
	.byte TILE_AIRSHIP			; 6
	.byte TILE_HANDTRAP			; 7
	.byte TILE_PYRAMID			; 8
	.byte TILE_BOWSERCASTLELR	; 9
MRT_END	; marker to calculate size -- allows user expansion of Map_Removable_Tiles

	; Keep in sync with PRG011 Map_SpecComp_TilesComp
Map_RemoveTo_Tiles:
	; NOTE: Must have as many elements as Map_Removable_Tiles!
	.byte TILE_FORTRUBBLE		; 0
	.byte TILE_ALTRUBBLE		; 1
	.byte TILE_LARGEFORT_RUBBLE	; 2
	.byte TILE_GHOSTHOUSE_COMP	; 3
	.byte TILE_BONUS_COMP		; 4
	.byte TILE_BONUS_COMP		; 5
	.byte TILE_AIRSHIP_COMP		; 6
	.byte TILE_HANDTRAP_COMP	; 7
	.byte TILE_PYRAMID_COMP		; 8
	.byte TILE_BOWSERCASTLELRC	; 9

Map_Bottom_Tiles:
	; This defines which tile covers the bottom horizontal border, per world
	.byte TILE_BORDER1, TILE_BORDER1, TILE_BORDER1, TILE_BORDER1, TILE_BORDER2
	.byte TILE_BORDER1, TILE_BORDER1, TILE_BORDER3, TILE_BORDER1, TILE_BORDER1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Map_Reload_with_Completions
;
; This very important subroutine actually loads in the map layout
; data and sets level panels which have been previously completed
; to their proper state (e.g. M/L for level panels, crumbled fort)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Map_Reload_with_Completions:
	; Clears all map tiles to $02 (all black tiles)
	JSR Tile_Mem_Clear

	; Fill 16x tile $4E every $1B0 (upper horizontal border)
	LDX #$30	 ; X = $30
PRG012_A462:
	TXA		 
	TAY		 
	LDA #$02	 
	JSR Tile_Mem_ClearB
	TYA		 
	ADD #$10	 
	TAY		 
	LDA #$4e	 
	JSR Tile_Mem_ClearB
	INX		 ; X++
	CPX #$40	 
	BNE PRG012_A462	 ; While X <> $40, loop!

	; After these two, Map_Tile_Addr = Tile_Mem_Addr + $110
	LDA Tile_Mem_Addr
	ADD #$10	 
	STA Map_Tile_AddrL

	LDA Tile_Mem_Addr+1
	ADC #$01	 
	STA Map_Tile_AddrH

	; Temp_Var1/2 will form an address pointing at the beginning of this world's map tile layout...
	LDA World_Num
	ASL A
	TAY		 ; Y = World_Num < 1 (index into Map_Tile_Layouts)
	LDA Map_Tile_Layouts,Y	
	STA Temp_Var1		
	LDA Map_Tile_Layouts+1,Y
	STA Temp_Var2		
	
	; SB: Temp_Var3 will track which World Zero lock bit we're on, if applicable
	; This takes up the upper 4 bits of map object completions
	LDA #%00010000
	STA Temp_Var3

	; This loop loads the layout data into the Tile_Mem
	; Note that it COULD terminate early via an $FF
	; at any time, but this is never used...
PRG012_A496:
	LDY #$00	 	; Y = 0
PRG012_A498:
	LDA (Temp_Var1),Y	; Get byte from tile layout
	CMP #$ff	 
	BEQ PRG012_A4C1	 	; If it's $FF (terminator), jump to PRG012_A4C1
	STA (Map_Tile_AddrL),Y	; Copy byte to RAM copy of tiles
	
	; SB: Special -- world zero locks
	CMP #TILE_ROCKBREAKH
	BNE MRWC_NotROCKBREAKH
	
	; World Zero lock; this depends on them showing up in left-to-right order
	; and never having one to the right be above one to the left!
	LDA Map_ObjCompletions+9
	AND Temp_Var3
	BEQ MRWC_NotUnlocked	; If this lock has not yet been unlocked, jump to MRWC_NotUnlocked
	
	; Lock is unlocked; replace with path tile!
	LDA #TILE_HORZPATH
	STA (Map_Tile_AddrL),Y
	
MRWC_NotUnlocked:
	ASL Temp_Var3	; Next lock bit
	
MRWC_NotROCKBREAKH:
	INY		 	; Y++

	; 144 supports a 16x9 map screen (the left and right columns
	; each contain a normally invisible-until-scrolled tile)
	CPY #144	 	
	BNE PRG012_A498	 	; If Y <> 144, loop!

	; This does a 16-bit addition of 144 to the
	; address stored at [Temp_Var2][Temp_Var1]
	TYA
	ADD Temp_Var1	
	STA Temp_Var1	
	LDA Temp_Var2	
	ADC #$00	
	STA Temp_Var2

	; The tile layout for the map actually has a lot of
	; unused vertical space (used for level layout) so
	; this needs to add a significant amount more ($1b0)
	; to the Map_Tile_Addr
	LDA Map_Tile_AddrL
	ADD #$b0	
	STA Map_Tile_AddrL
	LDA Map_Tile_AddrH
	ADC #$01
	STA Map_Tile_AddrH
	JMP PRG012_A496	 	; Do next 144 bytes...

PRG012_A4C1:
	; Layout is loaded!

	; This places the tiles along the bottom (lower horizontal border)
	LDY #$e0	 	; Offset to the bottom row
	LDX World_Num	 	; Current world
	LDA Map_Bottom_Tiles,X	; Get the appropriate tile for the bottom row
PRG012_A4C9:
	JSR Tile_Mem_ClearB	; Place the tiles
	INY		 	; Y++
	CPY #$f0	 
	BNE PRG012_A4C9	 	; While Y <> $F0, jump to PRG012_A4C9

	LDA World_Num
	TAY		
	LDA Map_Tile_ColorSets,Y
	STA PalSel_Tile_Colors	 	; Store which colors to use on map tiles
	LDA Map_Object_ColorSets,Y
	STA PalSel_Obj_Colors	 	; Store which colors to use on map objects

	; Map completions now work as a parallel array to the map links
	; We start on the first map screen and, if we change to a new
	; screen, we add $1B0 to our base offset

	; So first, initial screen setup... this actually points to
	; row "1", and that the "highest" level start is on row "2"
	LDA Tile_Mem_Addr
	STA Map_Tile_AddrL
	LDA Tile_Mem_Addr+1
	STA Map_Tile_AddrH
	INC Map_Tile_AddrH	; Because map is always on the "lower" screen (as far as tile memory goes)


	; Current screen we're working on (used to check for screen shift)
	LDY #$00
	STY Temp_Var1	; -> Temp_Var1

	; Index into Map Links
	STY Temp_Var2	; -> Temp_Var2

	; Load the starting Map Completions offset for world
	LDX World_Num
	LDA MapCompletions_Starts,X
	STA Temp_Var3	; -> Temp_Var3

	; Temp_Var4 is just a temp down below...

	TXA
	ASL A		 
	TAY		 	; Y = World_Num < 1 (2 bytes per world)

	; Temp_Var5/6 form an address to Map_ByRowType
	LDA Map_ByRowType,Y	 
	STA Temp_Var5
	LDA Map_ByRowType+1,Y	 
	STA Temp_Var6

	; Temp_Var7/8 form an address to Map_ByScrCol
	LDA Map_ByScrCol,Y	 
	STA Temp_Var7
	LDA Map_ByScrCol+1,Y	 
	STA Temp_Var8

MapCompletions_Loop:

	; Get start of map completions for world after this one (so we can check termination)
	LDY World_Num
	LDA MapCompletions_Starts+1,Y
	

	; Check current map completion offset, see if we're touching the index of the following world...
	CMP Temp_Var3
	BNE MapCompletions_Cont

	; We're done with this world!
	RTS

MapCompletions_Cont:

	LDY Temp_Var2	; Y = current index of map links
	LDX Temp_Var3	; X = current index of Map_Completions

	INC Temp_Var2	; Temp_Var2++ (next index of map links)
	INC Temp_Var3	; Temp_Var3++ (next index of Map_Completions)

	; Check if we've advanced to a new screen (need to update base offset)
	LDA (Temp_Var7),Y	; Getting value from ByScrCol
	AND #$F0		; Checking screen only, ignoring column
	CMP Temp_Var1
	BEQ MapCompletions_SameScreen	; If we're still on the same screen, jump to MapCompletions_SameScreen

	; We're on the next screen...
	STA Temp_Var1		; Update Temp_Var1 to new screen

	; Move base pointer to next screen...
	JSR Map_NextScreen

MapCompletions_SameScreen:

	LDA Map_Completions,X
	AND #(MCOMP_COMPLETE | MCOMP_SECRET)
	BEQ MapCompletions_Loop	; If this level is not marked complete, loop back around...

	; These bits plus bit 7 (NO video updates) -> Temp_VarNP0 for MapCompletion_FixAdjPaths
	ORA #$80
	STA Temp_VarNP0

	; Now we need to assemble a proper 'Y' offset for Map_Tile_Addr

	; First consider row coordinate -- note that "highest" point on map is "row 2"
	; and our base pointer is at "row 1", so we take the row value and subtract $10
	LDA (Temp_Var5),Y	; Get row/tileset value
	AND #$F0		; Row only
	SUB #$10		; Fix row origin
	STA Temp_Var4		; -> Temp_Var4

	; Now consider column coordinate
	LDA (Temp_Var7),Y	; Get column/screen value
	AND #$0F		; Only want the column value, not screen
	ORA Temp_Var4		; OR in the row offset
	TAY			; -> 'Y'

	; Okay, mark this tile as complete, as appropriate!
	JSR MapCompletion_CompleteTile	

	JMP MapCompletions_Loop


MapCompletion_CompleteTile:
	LDA (Map_Tile_AddrL),Y	 ; Get this tile

	STY Temp_Var4	 ; Y -> Temp_Var4
	STA World_Map_Tile	 ; -> World_Map_Tile

	; SB: Check if this is a primary level tile
	AND #$F0
	BNE MarkComp_NotPrimary

	; Primary level!
	LDA World_Map_Tile	; A = tile
	ORA #$10		; Get proper "check mark" tile
	BNE PRG031_A581		; Jump (technically always) to PRG031_A581

MarkComp_NotPrimary:
	LDA World_Map_Tile

	; Mini-fortresses or others here
	LDX #(MRT_END-Map_Removable_Tiles-1)
PRG031_A54C:
	CMP Map_Removable_Tiles,X	; Check this tile
	BEQ PRG031_A556	 		; If it matches this index, jump to PRG031_A556

	DEX		 		; X--
	BPL PRG031_A54C	 		; While X >=0, loop!
	BMI PRG012_A597	 		; If matched nothing, jump to PRG012_A597

PRG031_A556:
	LDA Map_RemoveTo_Tiles,X	; Get the replacement tile

PRG031_A581:
	LDY Temp_Var4		 ; Y = Temp_Var4 (offset to tile)
	STA (Map_Tile_AddrL),Y	 ; Set proper completion tile!

PRG012_A597:

	; Fix surrounding path tiles that have been opened
	; (Temp_VarNP0 set above a little after MapCompletions_SameScreen)
	JSR MapCompletion_FixAdjPaths

	RTS		 ; Return



Map_Tile_Layouts:
	; This points to the layout data for each world's map tile layout
	.word W1_Map_Layout, W2_Map_Layout, W3_Map_Layout, W4_Map_Layout, W5_Map_Layout
	.word W6_Map_Layout, W7_Map_Layout, W8_Map_Layout, W9_Map_Layout, W10_Map_Layout


	; Each world's layout; very simple data, specifies a linear list of tile bytes.
	; Every 144 bytes form a 16x9 single screen of world map.
	; The stream is terminated by $FF
W1_Map_Layout:	.include "PRG/maps/World1L"
W2_Map_Layout:	.include "PRG/maps/World2L"
W3_Map_Layout:	.include "PRG/maps/World3L"
W4_Map_Layout:	.include "PRG/maps/World4L"
W5_Map_Layout:	.include "PRG/maps/World5L"
W6_Map_Layout:	.include "PRG/maps/World6L"
W7_Map_Layout:	.include "PRG/maps/World7L"
W8_Map_Layout:	.include "PRG/maps/World8L"
W9_Map_Layout:	.include "PRG/maps/World9L"
W10_Map_Layout:	.include "PRG/maps/World10L"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Map_PrepareLevel
;
; Based on what spot of the map you entered, figure out which "level"
; you're entering ("level" means any enterable spot on the map including
; bonus games, etc.)
;
; The ultimate output is properly configured
; Level_ObjPtr_AddrL/H and Level_ObjPtrOrig_AddrL/H (object list pointer)
; Level_LayPtr_AddrL/H and Level_LayPtrOrig_AddrL/H (tile layout pointer)
; Level_Tileset
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Map_PrepareLevel:
	LDA Player_FallToKing	; A = Player_FallToKing
	BEQ PRG012_B10A	 	; If Player_FallToKing = 0 (not falling into king's room), jump to PRG012_B10A
	JMP PRG012_B262	 	; Otherwise, jump to PRG012_B262

PRG012_B10A:
	LDA World_Num	 
	ASL A		 
	TAY		 	; Y = World_Num < 1 (2 bytes per world)

	; Temp_Var2/1 form an address to Map_ByRowType
	LDA Map_ByRowType,Y	 
	STA Temp_Var1		 
	LDA Map_ByRowType+1,Y	 
	STA Temp_Var2		 

	; Temp_Var4/3 form an address to Map_ByScrCol
	LDA Map_ByScrCol,Y	 
	STA Temp_Var3		 
	LDA Map_ByScrCol+1,Y	 
	STA Temp_Var4		 

	; Temp_Var6/5 form an address to Map_ObjSets
	LDA Map_ObjSets,Y	 
	STA Temp_Var5		 
	LDA Map_ObjSets+1,Y	 
	STA Temp_Var6		 

	; Temp_Var8/7 form an address to Map_LevelLayouts
	LDA Map_LevelLayouts,Y	 
	STA Temp_Var7		 
	LDA Map_LevelLayouts+1,Y	 
	STA Temp_Var8		 

	; Temp_Var10/9 form an address to Map_ByXHi_InitIndex
	LDA Map_ByXHi_InitIndex,Y	 
	STA Temp_Var9		 
	LDA Map_ByXHi_InitIndex+1,Y	 
	STA Temp_Var10		 


	LDX Player_Current
	LDY World_Map_XHi,X
	LDA (Temp_Var9),Y	; get initial index based on the current "screen" of the map the Player was on
	TAY		 	; Y = the aforementioned index

	LDA #$00
	STA Temp_Var15		; Temp_Var15 = 0 (will be a page change value)

	; Now we search, beginning from the specified index, and try to match the row the Player
	; is on with the upper 4 bits of the value we get from the next table
	; The index remains in the 'Y' register at completion
	LDX Player_Current
PRG012_B150:
	LDA (Temp_Var1),Y	
	AND #$f0	 	; Specifically only consider the "row" this specifies
	CMP World_Map_Y,X	; Compare to the Player's Y position on the map
	BEQ PRG012_B162	 	; If this byte matches your Y position on the map, jump to PRG012_B162
	INY		 	; Y++
	BNE PRG012_B150	 	; While Y <> 0, loop!

	; Didn't find any matching position!  
	INC Temp_Var2		; Move to the next address page
	INC Temp_Var15		; Temp_Var15++ (to acknowledge the page change for the next part)
	JMP PRG012_B150	 	; Try again...

PRG012_B162:

	; Add the page change (if any) to Temp_Var4 (applies same page change here)
	LDA Temp_Var4
	ADD Temp_Var15
	STA Temp_Var4

	LDA #$00
	STA Temp_Var15		; Temp_Var15 = 0

	; Temp_Var9 will now be a value where the current "column" on the map is 
	; in the lower 4 bits and the current "screen" (XHi) is in the upper bits.
	LDA World_Map_X,X
	LSR A		 
	LSR A		 
	LSR A		 
	LSR A		 
	STA Temp_Var9		
	LDA World_Map_XHi,X
	ASL A		 
	ASL A		 
	ASL A		 
	ASL A		 
	ORA Temp_Var9

	; 'Y' was set by the last loop...
PRG012_B17D:
	CMP (Temp_Var3),Y	; See if this position matches
	BEQ PRG012_B18B	 	; If this matches, jump to PRG012_B18B
	INY			; Y++
	BNE PRG012_B17D	 	; While Y <> 0, loop!

	; Didn't find any matching position!  
	INC Temp_Var4		; Move to the next address page
	INC Temp_Var15		; Temp_Var15++ (to acknowledge the page change for the next part)
	JMP PRG012_B17D	 	; Try again...

PRG012_B18B:

	; Add the page change (if any) to Temp_Var2 (applies same page change here)
	LDA Temp_Var2	
	ADD Temp_Var15	
	STA Temp_Var2	

	LDA World_Num
	CMP #$08	
	BNE PRG012_B1A1	 	; If World_Num > 8 (World 9), jump to PRG012_B1A1

	; World 9 bypass
	LDA (Temp_Var1),Y	; Just goes to get the original value "type" ID, which in this case is world to enter
	AND #$0f

	; Destination world is fed back out through Map_Warp_PrevWorld
	STA Map_Warp_PrevWorld
	RTS		 ; Return

PRG012_B1A1:

	; Checkpoint support: Form a unique ID for checkpoint based on the completion index

	; Set 'X' to offset to Player's checkpoint data
	LDX Player_Current
	LDA LevCP_ByPlayer,X
	TAX
	
	; Value in 'Y' with world offset added to it; unique enough!
	TYA				; A = Y (relative map link offset)
	;ADD LevCP_BaseID	; Add base map completion index to make unique	<-- Only need to do this if persisting across worlds
	STA LevCP_ActiveID	; Set as active checkpoint ID
	
	CMP LevCP_ID,X	
	BNE	Map_CheckOtherCP	; If the level we're entering does not match active checkpoint, jump to Map_CheckOtherCP
	
	; Start at checkpoint!
	JMP Map_EnterByCheckpoint
	
Map_CheckOtherCP:
	; SB: If the other player was in this level and died, the opposite player can
	; pick it up where he left off... rather than replaying the whole level. Also
	; avoids an awkward scenario where both players have died in an attempt and
	; have mismatched Star Coin collections on the checkpoint.

	; Backup 'Y'
	TYA
	PHA

	LDA Total_Players
	CMP #2
	BLT Map_CPNotValidAtLoad	; If not a 2P game, .baseet it
	
	LDA Player_Current
	EOR #1
	TAY
	LDA LevCP_ByPlayer,Y
	TAY		; The OTHER player's checkpoint...
	LDA LevCP_ID,Y
	CMP LevCP_ActiveID
	BNE Map_CPNotValidAtLoad	; If there's a mismatch, checkpoint data is invalid, and jump to Map_CPNotValidAtLoad

	; 'X' is offset to current Player's checkpoint
	; 'Y' is offset to other Player's checkpoint
	
	; Backup 'X'
	TXA
	PHA
	
	LDA #(LevCP_End - LevCP_ID)
	STA Temp_Var1
LCCD2P_Loop:
	LDA LevCP_ID,Y	; Other player's data
	STA LevCP_ID,X	; This player's data

	INX
	INY

	DEC Temp_Var1
	BNE LCCD2P_Loop

	; Restore 'X'
	PLA
	TAX

	; Restore 'Y'
	PLA
	TAY

	; Start at checkpoint!
	JMP Map_EnterByCheckpoint
	
Map_CPNotValidAtLoad:
	; Restore 'Y'
	PLA
	TAY

	JMP Map_NotEnteringByCheckpoint
	
	; SB: Since I moved bonus maps out to TS19, that can't be coded in the map anymore,
	; so these tiles are explicit overrides!
Map_Bonus_Tiles:
	.byte TILE_TOADHOUSE, TILE_ALTTOADHOUSE, TILE_QBLOCK
Map_Bonus_Tiles_End
	
Map_NotEnteringByCheckpoint:

	; Do tileset override for bonus tiles!
	LDX #(Map_Bonus_Tiles_End - Map_Bonus_Tiles)
Map_BonusTile_CheckLoop:

	LDA World_Map_Tile
	CMP Map_Bonus_Tiles,X
	BNE Map_BonusTile_NotBonus		; If this is not a bonus tile, jump to Map_BonusTile_NotBonus
	
	; BONUS TILE!
	LDA #19
	BNE Map_BonusTile_OverrideTS	; Jump (technically always) to Map_BonusTile_OverrideTS

Map_BonusTile_NotBonus:
	DEX
	BPL Map_BonusTile_CheckLoop
	
	LDA (Temp_Var1),Y	
	AND #$0f	 	; Get "type" bits 
	
Map_BonusTile_OverrideTS:
	STA Level_Tileset	; Store into Level_Tileset

	; Add the page change (if any) to Temp_Var6 (applies same page change here)
	LDA Temp_Var6
	ADD Temp_Var15
	STA Temp_Var6

	TYA		 
	TAX		 ; X = Y (our sought after offset)
	ASL A		 
	TAY		 ; Y <<= 1
	BCC PRG012_B1BB	 ; Somewhat excessive skip to not add carry if we don't need to :P

	; Apply carry to Temp_Var6
	LDA Temp_Var6
	ADC #$00	
	STA Temp_Var6	

PRG012_B1BB:

	; Store address of object set into Level_ObjPtr_AddrL/H and Level_ObjPtrOrig_AddrL/H
	LDA (Temp_Var5),Y	 
	STA Level_ObjPtr_AddrL
	STA Level_ObjPtrOrig_AddrL	 
	INY		 
	LDA (Temp_Var5),Y	 
	STA Level_ObjPtr_AddrH		 
	STA Level_ObjPtrOrig_AddrH	 

	; Add the page change (if any) to Temp_Var6 (applies same page change here)
	LDA Temp_Var8	
	ADD Temp_Var15	
	STA Temp_Var8	

	TXA
	ASL A		 
	TAY		 ; Y = X (the backed up index) << 1
	BCC PRG012_B1DC	 ; Somewhat excessive skip to not add carry if we don't need to :P

	; Apply carry to Temp_Var8
	LDA Temp_Var8
	ADC #$00	
	STA Temp_Var8	

PRG012_B1DC:
	STY Temp_Var16	 ; Keep index in Temp_Var16

	; Store address of object set into Level_LayPtr_AddrL/H and Level_LayPtrOrig_AddrL/H
	LDA (Temp_Var7),Y	 
	STA Level_LayPtr_AddrL		 
	STA Level_LayPtrOrig_AddrL	 
	INY		 
	LDA (Temp_Var7),Y	 
	STA Level_LayPtr_AddrH		 
	STA Level_LayPtrOrig_AddrH	 


	LDA Map_EnterViaID
	BNE Map_DoEnterViaID	 ; If Map_EnterViaID > 0, jump to Map_DoEnterViaID

	LDA Level_Tileset
	CMP #19
	BNE PRG012_B1FB	 ; If Level_Tileset > 19 (Bonus Game intro), jump to PRG012_B1FB

	JMP PRG012_B384	 ; Otherwise, jump to PRG012_B384

PRG012_B1FB:
	LDA #$03	 
	STA World_EnterState
	RTS		 ; Return


Map_DoEnterViaID:
	; Most "entry" on the world map uses your map position to pick out a 
	; pointer to a level.  Simple stuff.

	; But certain things like the airship, coin ship, white toad house, etc. 
	; must "override" the map placement to go to something specific; that's 
	; where Map_EnterViaID comes in; if set to a value, it jumps to a 
	; PARTICULAR place regardless of map placement.

	; Not all map objects go anywhere special though...

	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word MO_Unused		; 0: (Not used, normal panel entry)
	.word MO_EnterBoo	; 1: Dancing Boo
	.word MO_Unused		; 2: Launch Star
	.word MO_DareDevil	; 3: Daredevil Comet
	.word MO_Unused		; 4: Purple Comet
	.word MO_EnterObj	; 5: Cheep Cheep
	.word MO_EnterObj	; 6: Shy Guy
	.word MO_EnterObj	; 7: Rex
	.word MO_EnterObj	; 8: Gao
	.word MO_EnterObj	; 9: Fazzy Crab
	.word MO_EnterObj	; 10: Octo Goomba
	.word MO_EnterObj	; 11: Magiblot


Map_EnterByCheckpoint:
	; Change the pointers to be pointing into the checkpoint data

	; Restore layout
	LDA LevCP_LayBackup,X
	STA Level_LayPtr_AddrL		 
	STA Level_LayPtrOrig_AddrL	 
	
	LDA LevCP_LayBackup+1,X
	STA Level_LayPtr_AddrH		 
	STA Level_LayPtrOrig_AddrH	 

	; Restore objects
	LDA LevCP_ObjBackup,X
	STA Level_ObjPtr_AddrL
	STA Level_ObjPtrOrig_AddrL	 
	
	LDA LevCP_ObjBackup+1,X
	STA Level_ObjPtr_AddrH		 
	STA Level_ObjPtrOrig_AddrH	 
	
	; Restore tileset
	LDA LevCP_TSSCBackup,X
	AND #$0F		; Lower 4 bits only
	STA Level_Tileset

	; Restore star coins
	LDY #2	; Y = 2 (loop counter)
	
	LDA #$40		; Right-most bit for star coin pack
	STA Temp_Var1	; -> Temp_Var1

MEBCP_SCLoop:
	LDA LevCP_TSSCBackup,X
	AND Temp_Var1
	BEQ MEBCP_NoCoin	; If this coin wasn't collected, jump to MEBCP_NoCoin
	
	; Coin was collected, but we must store a 1
	LDA #1
	
MEBCP_NoCoin:
	STA Inventory_Cards,Y

	LSR Temp_Var1		; Next bit weight

	DEY					; Y--
	BPL MEBCP_SCLoop	; While Y >= 0, loop!
	
	
	BNE PRG012_B1FB		; Jump (technically always) to PRG012_B1FB


PRG012_B262:

	; Falling into King's room...
	; SB: Now World [X] Complete screen!!

	LDA #<KNG1L
	STA Level_LayPtr_AddrL
	LDA #>KNG1L
	STA Level_LayPtr_AddrH

	LDA #<Empty_ObjLayout
	STA Level_ObjPtr_AddrL
	LDA #>Empty_ObjLayout
	STA Level_ObjPtr_AddrH

	; King's room tile set
	LDA #$02
	STA Level_Tileset

	RTS		 ; Return


MO_Unused:
	; Tries to queue Hammer Bro battle music, but doesn't
	; really work, winds up being like no override at all

	; NOTE: The only difference is World_EnterState will
	; fail to be set to 3, which causes no discernable 
	; effect in SMB3-US, but probably would break the 
	; world entry "outro" in the original SMB3-J

	LDA #$70
	STA Level_MusicQueue

	RTS		 ; Return

MO_DareDevil:
	LDY Player_Current
	
	; Backup Player's current powerup into Level_TreasureItem
	; with $80 set as a flag...
	LDA World_Map_Power,Y
	ORA #$80		; ... means we entered via Daredevil Comet
	STA Level_TreasureItem
	
	; Player will always be small!
	LDA #0
	STA World_Map_Power,Y
	RTS

MO_NSpade:
	; Level_Tileset = 19 (Bonus game intro)
	LDA #19
	STA Level_Tileset

	; Bonus_GameType = 2 (N-Spade)
	LDA #$02
	STA Bonus_GameType

	LDY #$00
	STY Bonus_KTPrize	; !!
	STY Bonus_GameHost	; Standard Toad Host
	

	; NOTE: This was probably going to vary by game type, 
	; but in final version, Y = 0 (see PRG022 for more)

	; Bonus game layout
	LDA Bonus_LayoutData,Y
	STA Level_LayPtr_AddrL
	LDA Bonus_LayoutData+1,Y
	STA Level_LayPtr_AddrH	

	; World_EnterState = 3
	LDA #$03
	STA World_EnterState

	RTS		 ; Return

	; White Toad House layouts
ToadShop_Layouts:
	.word $0000
	.word $0000
	.word $0000
	.word $0000
	.word $0000
	.word $0000
	.word $0000
	.word $0000

	; White Toad House configuration
	; NOTE: This is NOT actually an object layout pointer (which is always fixed in Toad Houses), 
	; this just defines what is in the lone chest in white Toad Houses (P-Wing / Anchor)
ToadShop_Objects:
	.word $0200
	.word $0A00
	.word $0200
	.word $0A00
	.word $0200
	.word $0A00
	.word $0200
	.word $0A00

MO_Shop:
	LDA World_Num	; Get world number
	ASL A		 ; Turn into 2-byte index
	TAY		 ; -> 'Y'

	; Load proper Toad Shop layout
	LDA ToadShop_Layouts,Y
	STA Level_LayPtr_AddrL
	LDA ToadShop_Layouts+1,Y
	STA Level_LayPtr_AddrH	
	
	; Load proper Toad Shop object set
	LDA ToadShop_Objects,Y
	STA Level_ObjPtr_AddrL
	LDA ToadShop_Objects+1,Y
	STA Level_ObjPtr_AddrH	

	; Level_Tileset = 7 (Toad House)
	LDA #$07
	STA Level_Tileset

	RTS		 ; Return

	; Possibly thinking of having per-world coin ships?
CoinShip_Layouts:
	.word CoinShipL
	.word CoinShipL
	.word CoinShipL
	.word CoinShipL
	.word CoinShipL
	.word CoinShipL
	.word CoinShipL
	.word CoinShipL

CoinShip_Objects:
	.word CoinShipO
	.word CoinShipO
	.word CoinShipO
	.word CoinShipO
	.word CoinShipO
	.word CoinShipO
	.word CoinShipO
	.word CoinShipO

MO_CoinShip:
	LDA World_Num	; Get world number
	ASL A		 ; Turn into 2-byte index
	TAY		 ; -> 'Y'

	; Get coin ship layout
	LDA CoinShip_Layouts,Y
	STA Level_LayPtr_AddrL
	LDA CoinShip_Layouts+1,Y
	STA Level_LayPtr_AddrH	

	; Get coin ship objects
	LDA CoinShip_Objects,Y
	STA Level_ObjPtr_AddrL
	LDA CoinShip_Objects+1,Y
	STA Level_ObjPtr_AddrH	
	
	; Set Level_Tileset = 10 (Airship)
	LDA #10
	STA Level_Tileset

	RTS		 ; Return


MO_EnterBoo:
	LDA #<W3BatlL
	STA Level_LayPtr_AddrL
	LDA #>W3BatlL
	STA Level_LayPtr_AddrH

	LDA #<W3BatlO
	STA Level_ObjPtr_AddrL
	LDA #>W3BatlO
	STA Level_ObjPtr_AddrH

	LDA #4
	STA Level_Tileset

	RTS

EnterMapObj_Layout:		.word W1BatlL,  W2BatlL,	W4BatlL,	W5BatlL,	W6BatlL,	W7BatlL,	WZBatlL
EnterMapObj_Objects:	.word W1BatlO,  W2BatlO,	W4BatlO,	W5BatlO,	W6BatlO,	W7BatlO,	WZBatlO
EnterMapObj_Tileset:	.byte 1,		4,		 	4,			9,			7,			14,			15

MO_EnterObj:
	LDA Map_EnterViaID
	PHA
	ASL A
	TAY

	; Set the layout
	LDA EnterMapObj_Layout-(MAPOBJ_CHEEPCHEEP * 2),Y
	STA Level_LayPtr_AddrL
	LDA EnterMapObj_Layout-(MAPOBJ_CHEEPCHEEP * 2)+1,Y
	STA Level_LayPtr_AddrH

	; Set the objects
	LDA EnterMapObj_Objects-(MAPOBJ_CHEEPCHEEP * 2),Y
	STA Level_ObjPtr_AddrL
	LDA EnterMapObj_Objects-(MAPOBJ_CHEEPCHEEP * 2)+1,Y
	STA Level_ObjPtr_AddrH

	PLA
	TAY

	; Level_Tileset
	LDA EnterMapObj_Tileset-MAPOBJ_CHEEPCHEEP,Y
	STA Level_Tileset

	RTS		 ; Return


PRG012_B384:
	; Level_Tileset = 19 (Bonus Game intro!)

	; Copy Player map data into "Entered" vars
	LDY Player_Current
	LDA World_Map_Y,Y
	STA Map_Entered_Y,Y
	LDA World_Map_XHi,Y
	STA Map_Entered_XHi,Y
	LDA World_Map_X,Y	
	STA Map_Entered_X,Y	
	;LDA Map_UnusedPlayerVal2,Y	
	LDA World_Num	; SB: Now a world backup!
	STA Map_Previous_World,Y	

	LDA #19
	STA Level_Tileset	 ; Re-affirming Level_Tileset = 19?

	LDY Temp_Var16		 ; Index of level entered

	; Set Bonus_GameType (always 1 in actual game)
	LDA (Temp_Var5),Y
	STA Bonus_GameType

	; Set Bonus_KTPrize (always irrelevant in actual game)
	LDA (Temp_Var7),Y
	STA Bonus_KTPrize

	INY		 ; Y++

	; Set Bonus_GameHost (always 0 in actual game)
	LDA (Temp_Var5),Y
	STA Bonus_GameHost

	LDA (Temp_Var7),Y
	ASL A
	TAY		 ; -> 'Y'
	
	LDA Bonus_LayoutData,Y
	STA Level_LayPtr_AddrL
	LDA Bonus_LayoutData+1,Y
	STA Level_LayPtr_AddrH

	; World_EnterState = 3
	LDA #$03
	STA World_EnterState

	RTS		 ; Return



	; Each of these has an entry PER WORLD (0-8, Worlds 1-9)

	; This table specifies a lookup for the world that supplies an initial
	; offset value for the following table based on the "XHi" position the
	; Player was on the map.  Obviously for many worlds there is no valid
	; offset value on some of the higher map screens...
Map_ByXHi_InitIndex:
	.word W1_InitIndex, W2_InitIndex, W3_InitIndex, W4_InitIndex, W5_InitIndex, W6_InitIndex, W7_InitIndex, W8_InitIndex, W9_InitIndex, W10_InitIndex

	; This table is initially indexed by the initial offset supplied by Map_ByXHi_InitIndex 
	; and provides a series of map row locations (upper 4 bits) and level tileset (lower 4 bits)
Map_ByRowType:
	.word W1_ByRowType, W2_ByRowType, W3_ByRowType, W4_ByRowType, W5_ByRowType, W6_ByRowType, W7_ByRowType, W8_ByRowType, W9_ByRowType, W10_ByRowType

	; This table just maps the column positions of enterable level tiles
Map_ByScrCol:
	.word W1_ByScrCol, W2_ByScrCol, W3_ByScrCol, W4_ByScrCol, W5_ByScrCol, W6_ByScrCol, W7_ByScrCol, W8_ByScrCol, W9_ByScrCol, W10_ByScrCol

	; This table maps the relevant object layout pointers for the levels
Map_ObjSets:
	.word W1_ObjSets, W2_ObjSets, W3_ObjSets, W4_ObjSets, W5_ObjSets, W6_ObjSets, W7_ObjSets, W8_ObjSets, W9_ObjSets, W10_ObjSets

	; This tbale maps the relevant level layout pointers for the levels
Map_LevelLayouts:
	.word W1_LevelLayout, W2_LevelLayout, W3_LevelLayout, W4_LevelLayout, W5_LevelLayout, W6_LevelLayout, W7_LevelLayout, W8_LevelLayout, W9_LevelLayout, W10_LevelLayout

	; "Structure" data files -- contains data that links levels to
	; their layout and objects by the rows and columns 
	.include "PRG/maps/World1S"
	.include "PRG/maps/World2S"
	.include "PRG/maps/World3S"
	.include "PRG/maps/World4S"
	.include "PRG/maps/World5S"
	.include "PRG/maps/World6S"
	.include "PRG/maps/World7S"
	.include "PRG/maps/World8S"
	.include "PRG/maps/World9S"
	.include "PRG/maps/World10S"


	; Gets tile from layout by world (not loaded memory)
	; Used for counting star coins
Map_GetTile_ByWorld_Init:
	; 'X' is world

	TXA
	PHA
	
	; World to 2 byte index
	TXA
	ASL A
	TAX
	
	; Need layout address
	LDA Map_Tile_Layouts,X
	STA Temp_Var3
	LDA Map_Tile_Layouts+1,X
	STA Temp_Var4
	
	; Access rows
	LDA Map_ByRowType,X
	STA Temp_Var5
	LDA Map_ByRowType+1,X
	STA Temp_Var6
	
	; Access columns
	LDA Map_ByScrCol,X
	STA Temp_Var7
	LDA Map_ByScrCol+1,X
	STA Temp_Var8
	
	PLA
	TAX
	
	RTS


MGTBW_TileBase:		.word 0-32, 144-32, 288-32, 432-32

	; Returns in Temp_Var10
Map_GetTile_ByWorld:
	; 'Y' is index into link

	TYA
	PHA
	
	; Get row -> Temp_Var10
	LDA (Temp_Var5),Y
	AND #$F0
	STA Temp_Var10
	
	; Get col, merge with row -> Temp_Var10, col high -> 'Y'
	LDA (Temp_Var7),Y
	PHA
	AND #$0F
	ORA Temp_Var10
	STA Temp_Var10
	PLA
	AND #$F0
	LSR A
	LSR A
	LSR A	; Make a 2 byte index
	TAY
			
	; Get offset to layout screen
	LDA Temp_Var3			; Layout low
	ADD MGTBW_TileBase,Y	; Offset to location
	STA Temp_Var11			; -> Temp_Var11
	LDA Temp_Var4			; Layout high
	ADC MGTBW_TileBase+1,Y	; Offset to location
	STA Temp_Var12			; -> Temp_Var12
	
	LDY Temp_Var10			; Offset within map screen
	LDA (Temp_Var11),Y		; Fetch it
	STA Temp_Var10

	PLA
	TAY

	RTS
