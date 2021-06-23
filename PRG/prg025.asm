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
; FILENAME: prg025.bin, File Size: 8193,.base: $C000
;     -> NES mode enabled
;---------------------------------------------------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This table contains commands for Video_Misc_Updates2 which tells
; it how to generate certain graphical elements programatically
;
; Note: See Video_Upd_Table in PRG030 for format
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Remember that the left edge is typically clipped, so nothing is visible there...
Video_Upd_Table2:
	.word Graphics_Buffer		; $00 - Graphics buffer for dynamically generated content
	.word Title_Load_Palette	; $01 - Loads palette for title screen (and falls into Title_Checkerboard_Floor)
	.word PRG025_CA9B		; $02 - ???
	.word Title_FadeIn_1		; $03 - Title screen colors fade in part 1
	.word Title_FadeIn_2		; $04 - Title screen colors fade in part 2
	.word Title_FadeIn_3		; $05 - Title screen colors fade in part 3
	.word Title_FadeIn_4		; $06 - Title screen colors fade in part 4
	.word Title_ClearPressStart	; $07 - SB: Removed

	; The title screen -- this is too complicated/large to load in one single buffer
	; instance, so it is broken up across several frames in chunks.  Maybe I could
	; explain what's being loaded a little better, but whatever :}
	.word TitleScreen_LogoLine01	; $08 - Title Screen part 01 Title Sequence begin
	.word TitleScreen_LogoLine02	; $09 - Title Screen part 02
	.word TitleScreen_LogoLine03	; $0A - Title Screen part 03
	.word TitleScreen_LogoLine04	; $0B - Title Screen part 04
	.word TitleScreen_LogoLine05	; $0C - Title Screen part 05
	.word TitleScreen_LogoLine06	; $0D - Title Screen part 06
	.word TitleScreen_LogoLine07	; $0E - Title Screen part 07
	.word TitleScreen_LogoLine08	; $0F - Title Screen part 08
	.word TitleScreen_LogoLine09	; $10 - Title Screen part 09
	.word TitleScreen_LogoLine10	; $11 - Title Screen part 10
	.word TitleScreen_LogoLine11	; $12 - Title Screen part 11
	.word TitleScreen_LogoLine12	; $13 - Title Screen part 12
	.word TitleScreen_LogoLine13	; $14 - Title Screen part 13
	.word TitleScreen_LogoLine14	; $15 - Title Screen part 14
	.word TitleScreen_LogoLine15	; $16 - Title Screen part 15
	.word TitleScreen_LogoLine16	; $17 - Title Screen part 16
	.word TitleScreen_LogoLine17	; $18 - Title Screen part 17
	.word TitleScreen_LogoLine18	; $19 - Title Screen part 18
	.word TitleScreen_LogoLine19	; $1A - Title Screen part 19
	.word TitleScreen_LogoLine20	; $1B - Title Screen part 20
	.word TitleScreen_LogoLine21	; $1C - Title Screen part 21
	.word TitleScreen_LogoLine22	; $1D - Title Screen part 22
	.word TitleScreen_LogoLine23	; $1E - Title Screen part 23
	.word TitleScreen_LogoLine24	; $1F - Title Screen part 24
	.word TitleScreen_LogoAttr1	; $20 - Title Screen part 25
	.word TitleScreen_LogoAttr2	; $21 - Title Screen part 26
	.word TitleScreen_DarkPal	; $22 - Title Screen part 27 Sequence end

	.word Title_Checkerboard_Floor	; $23 - The black & white squares at the beginning 
	.word Ending_CurtainExtension	; $24 - Slightly longer curtain in ending
	.word PRG025_CCCE		; $25 - ???
	.word EndSeq_WorldFadeIn1	; $26 - End pic world fade in effect part 1
	.word EndSeq_WorldFadeIn2	; $27 - End pic world fade in effect part 2
	.word EndSeq_WorldFadeIn3	; $28 - End pic world fade in effect part 3
	.word EndSeq_WorldFadeIn4	; $29 - End pic world fade in effect part 4
	.word Curtain_Line01	; $2A - Curtain part 01
	.word Curtain_Line02	; $2B - Curtain part 02
	.word Curtain_Line03	; $2C - Curtain part 03
	.word Curtain_Line04	; $2D - Curtain part 04
	.word Curtain_Line05	; $2E - Curtain part 05
	.word Curtain_Line06	; $2F - Curtain part 06
	.word Curtain_Line07	; $30 - Curtain part 07
	.word Curtain_Line08	; $31 - Curtain part 08
	.word Curtain_Line09	; $32 - Curtain part 09
	.word Curtain_Line10	; $33 - Curtain part 10
	.word Curtain_Line11	; $34 - Curtain part 11
	.word Curtain_Line12	; $35 - Curtain part 12
	.word Curtain_Line13	; $36 - Curtain part 13
	.word Curtain_Line14	; $37 - Curtain part 14
	.word Curtain_Line15	; $38 - Curtain part 15
	.word Curtain_Line16	; $39 - Curtain part 16
	.word Curtain_Line17	; $3A - Curtain part 17
	.word Curtain_Line18	; $3B - Curtain part 18
	.word Curtain_Line19	; $3C - Curtain part 19
	.word Curtain_Line20	; $3D - Curtain part 20
	.word Curtain_Line21	; $3E - Curtain part 21
	.word Curtain_Line22	; $3F - Curtain part 22
	.word Curtain_Line23	; $40 - Curtain part 23
	.word Curtain_Line24	; $41 - Curtain part 24
	.word Curtain_Line25	; $42 - Curtain part 25
	.word Curtain_Line26	; $43 - Curtain part 26
	.word Curtain_Line27	; $44 - Curtain part 27
	.word Curtain_Line28	; $45 - Curtain part 28
	.word Curtain_Line29	; $46 - Curtain part 29
	.word Curtain_Line30	; $47 - Curtain part 30
	.word CurtainAttr_Line01	; $48 - Curtain attribute 1
	.word CurtainAttr_Line02	; $49 - Curtain attribute 2
	.word Curtain_FadeIn_1		; $4A - Curtain fade in 1
	.word Curtain_FadeIn_2		; $4B - Curtain fade in 2
	.word Curtain_FadeIn_3		; $4C - Curtain fade in 3
	.word Curtain_FadeIn_4		; $4D - Curtain fade in 4
	.word DebugMenu_Line1		; $4E - Debug menu line 1
	.word DebugMenu_Line2		; $4F - Debug menu line 2
	.word DebugMenu_Line3		; $50 - Debug menu line 3
	.word DebugMenu_Line4		; $51 - Debug menu line 4
	.word DebugMenu_Line5		; $52 - Debug menu line 5
	.word DebugMenu_Line6		; $53 - Debug menu line 6
	.word DebugMenu_Line7		; $54 - Debug menu line 7
	.word DebugMenu_Line8		; $55 - Debug menu line 8
	.word DebugMenu_Palette		; $56 - Debug menu palette
	.word Graphics_Buffer		; $57 - Alternate push compatible when running
	.word Curtain_P2PushStart		; $58 - "PLAYER 2 / PUSH START"
	.word Curtain_P2PushStartClear		; $59 - Erase "PLAYER 2 / PUSH START"
	.word Ending2_Fade1			; $5A
	.word Ending2_Fade2			; $5B
	.word Ending2_Fade3			; $5C
	.word Ending2_Fade4			; $5D
	.word Ending2_BowsersPal	; $5E - Bowser's palette
	.word Ending2_Msg4			; $5F
	.word Ending2_Msg3			; $60
	.word Ending2_Msg2			; $61
	.word Ending2_Msg1			; $62

Title_Load_Palette:
	; This is the initial palette applied to the title screen

	DBYT $3F00
	.byte 32	; 32 bytes to follow (32 colors)

	; The colors!
	.byte $0F, $0F, $30, $16, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
	.byte $0F, $16, $36, $0F, $0F, $2A, $36, $0F, $0F, $27, $30, $0F, $0F, $2A, $30, $0F

	; Falls into...

Title_Checkerboard_Floor:

	DBYT $2B00
	.byte 32	; 32 bytes to follow
	.byte $E6, $E6, $E7, $E7, $E6, $E6, $E7, $E7, $E6, $E6, $E7, $E7, $E6, $E6, $E7, $E7
	.byte $E6, $E6, $E7, $E7, $E6, $E6, $E7, $E7, $E6, $E6, $E7, $E7, $E6, $E6, $E7, $E7

	DBYT $2B20
	.byte 32 | VU_REPEAT
	.byte $F6

	DBYT $2B40
	.byte 32 | VU_REPEAT
	.byte $F6
	
	DBYT $2B60
	.byte 32 | VU_REPEAT
	.byte $F6

	DBYT $2B80
	.byte 32 | VU_REPEAT
	.byte $F6
	
	DBYT $2BC0
	.byte 64
	.byte %10101010
	
	; Terminator!
	.byte $00

TitleScreen_LogoLine01:
	DBYT $2000
	.byte VU_REPEAT | $20, $FC
	
	; Terminator
	.byte $00

TitleScreen_LogoLine02:
	; Terminator
	.byte $00

TitleScreen_LogoLine03:
	DBYT $2020
	.byte VU_REPEAT | $0B, $FC

	DBYT $202B
	.byte $15, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $FC, $FC, $FC, $FC, $FC
	.byte $FC, $FC, $FC, $FC, $FC, $FC

	; Terminator
	.byte $00

TitleScreen_LogoLine04:
	DBYT $2040
	.byte VU_REPEAT | $0B, $FC

	DBYT $204B
	.byte $15, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4A, $FC, $FC, $FC, $FC
	.byte $FC, $FC, $FC, $FC, $FC, $FC

	; Terminator
	.byte $00

TitleScreen_LogoLine05:
	DBYT $2060
	.byte $16, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $50, $51, $52, $53
	.byte $54, $55, $56, $57, $58, $59, $5A

	DBYT $2076
	.byte VU_REPEAT | $0A, $FC

	; Terminator
	.byte $00

TitleScreen_LogoLine06:
	DBYT $2080
	.byte $16, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $60, $61, $62, $63
	.byte $64, $65, $66, $67, $68, $69, $6A

	DBYT $2096
	.byte VU_REPEAT | $0A, $FC

	; Terminator
	.byte $00

TitleScreen_LogoLine07:
	DBYT $20A0
	.byte $20, $FC, $FC, $FC, $FC, $FC, $70, $71, $72, $73, $74, $75, $76, $77, $78, $FC
	.byte $FC, $FC, $FC, $7D, $7E, $7F, $C0, $C1, $FC, $C3, $C4, $FC, $FC, $FC, $FC, $FC
	.byte $FC

	; Terminator
	.byte $00

TitleScreen_LogoLine08:
	DBYT $20C0
	.byte $20, $FC, $FC, $FC, $FC, $FC, $80, $81, $82, $83, $84, $85, $86, $87, $88, $89
	.byte $8A, $8B, $FC, $8D, $8E, $8F, $D0, $D1, $D2, $D3, $D4, $D5, $FC, $FC, $FC, $FC
	.byte $FC

	; Terminator
	.byte $00

TitleScreen_LogoLine09:
	DBYT $20E0
	.byte $20, $FC, $FC, $FC, $FC, $FC, $90, $91, $92, $93, $94, $95, $96, $97, $98, $99
	.byte $9A, $9B, $9C, $9D, $9E, $9F, $E0, $E1, $E2, $E3, $E4, $E5, $FC, $FC, $FC, $FC
	.byte $FC

	; Terminator
	.byte $00

TitleScreen_LogoLine10:
	DBYT $2100
	.byte $20, $FC, $FC, $FC, $FC, $FC, $A0, $A1, $A2, $A3, $A4, $A5, $A6, $A7, $A8, $A9
	.byte $AA, $AB, $AC, $AD, $AE, $AF, $F0, $F1, $F2, $F3, $F4, $F5, $FC, $FC, $FC, $FC
	.byte $FC

	; Terminator
	.byte $00

TitleScreen_LogoLine11:
	DBYT $2120
	.byte $20, $FC, $FC, $FC, $FC, $FC, $FC, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9
	.byte $BA, $BB, $BC, $BD, $BE, $BF, $C6, $C7, $C8, $D6, $D7, $D8, $E8, $FC, $FC, $FC
	.byte $FC

	; Terminator
	.byte $00

TitleScreen_LogoLine12:
	DBYT $2140
	.byte VU_REPEAT | $0E, $FC

	DBYT $214E
	.byte $12, $C9, $CA, $CB, $CC, $FC, $70, $71, $72, $2B, $2C, $2D, $2E, $FC, $FC, $FC
	.byte $FC, $FC, $FC

	; Terminator
	.byte $00

TitleScreen_LogoLine13:
	DBYT $2160
	.byte VU_REPEAT | $0E, $FC

	DBYT $216E
	.byte $12, $D9, $DA, $DB, $DC, $DD, $80, $81, $82, $3B, $3C, $3D, $3E, $3F, $FC, $FC
	.byte $FC, $FC, $FC

	; Terminator
	.byte $00

TitleScreen_LogoLine14:
	DBYT $2180
	.byte VU_REPEAT | $0E, $FC

	DBYT $218E
	.byte $12, $E9, $EA, $EB, $EC, $ED, $90, $91, $2A, $4B, $4C, $4D, $4E, $4F, $FC, $FC
	.byte $FC, $FC, $FC

	; Terminator
	.byte $00

TitleScreen_LogoLine15:
	DBYT $21A0
	.byte $20, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $F9
	.byte $FA, $FB, $B0, $C2, $A0, $A1, $3A, $5B, $5C, $5D, $5E, $5F, $FC, $FC, $FC, $FC
	.byte $FC

	; Terminator
	.byte $00

TitleScreen_LogoLine16:
	DBYT $21C0
	.byte $20
	.byte $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $79, $7A
	.byte $7B, $7C, $DE, $DF, $B1, $B2, $6B, $6C, $6D, $6E, $6F, $FC, $FC, $FC, $FC, $FC

	; Terminator
	.byte $00

TitleScreen_LogoLine17:
	DBYT $21E0
	.byte $20
	.byte $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC
	.byte $EE, $EF, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC

	; Terminator
	.byte $00

TitleScreen_LogoLine18:
	DBYT $2200
	
	.byte 32
	;            S    U    P    E    R         M    A    R    I    O         B    R    O    S         3       (C)    1    9    8    8        NI   IN   NT   TE   EN   DO
	.byte $FC, $12, $14, $0F, $04, $11, $FC, $0C, $00, $11, $08, $0E, $FC, $01, $11, $0E, $12, $FC, $1D, $FC, $CD, $1B, $23, $22, $22, $FC, $24, $25, $26, $27, $28, $29

	; Terminator
	.byte $00

TitleScreen_LogoLine19:
	DBYT $2220

	.byte 32
	;            S    M    3    M    I    X         B    Y         S    O    U    T    H    B    I    R    D         2    0    1    4         R    E    V         2    B
	.byte $FC, $12, $0C, $1D, $0C, $08, $17, $FC, $01, $18, $FC, $12, $0E, $14, $13, $07, $01, $08, $11, $03, $FC, $1C, $1A, $1B, $1E, $FC, $11, $04, $15, $FC, $1C, $01

	; Terminator
	.byte $00

TitleScreen_LogoLine20:
	DBYT $2240
	.byte VU_REPEAT | $20, $FC
	
	; Terminator
	.byte $00

TitleScreen_LogoLine21:
	DBYT $2260

	.byte 32
	;                                                        P    R    E    S    S         S    T    A    R    T
	.byte $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $0F, $11, $04, $12, $12, $FC, $12, $13, $00, $11, $13, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC

	.byte $00	; Terminator

	; Terminator
	.byte $00


TitleScreen_LogoLine22:
	DBYT $2280
	.byte VU_REPEAT | $20, $FC

	DBYT $22A0
	.byte VU_REPEAT | $20, $FC

	; Terminator
	.byte $00

TitleScreen_LogoLine23:
	DBYT $22C0
	.byte VU_REPEAT | $20, $FC

	; Terminator
	.byte $00

TitleScreen_LogoLine24:
	DBYT $22E0
	.byte VU_REPEAT | $20, $FC

	; Terminator
	.byte $00

TitleScreen_LogoAttr1:
	DBYT $23C0
	.byte $20
	.byte $55, $55, $55, $55, $55, $55, $55, $55
	.byte $55, $55, $55, $55, $55, $55, $55, $55
	.byte $AA, $55, $55, $F5, $75, $55, $55, $A9
	.byte $A8, $A6, $A5, $ED, $77, $55, $55, $55	; End of logo I think...

	; Terminator
	.byte $00

TitleScreen_LogoAttr2:
	DBYT $23E0
	.byte $20
	.byte $00, $00, $00, $00, $00, $00, $00, $00
	.byte $00, $00, $00, $00, $00, $00, $00, $00
	.byte $00, $00, $00, $00, $00, $00, $00, $00
	.byte $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A

	; Terminator
	.byte $00

TitleScreen_DarkPal:
	DBYT $3F00
	.byte 16 | VU_REPEAT
	.byte $0F

	; Terminator
	.byte $00

PRG025_CA9B:
	DBYT $3F00
	.byte 16	; 16 bytes (colors) to follow...
	.byte $0F, $0F, $30, $16, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F

	; Terminator
	.byte $00

Title_FadeIn_1:
	DBYT $3F00
	.byte 32	; 16 bytes (colors) to follow...
	.byte $07, $0F, $00, $06, $07, $0F, $01, $02, $07, $0F, $0A, $0A, $07, $0F, $07, $02
	.byte $07, $0F, $06, $0F, $07, $0F, $06, $0F, $07, $0F, $06, $0F, $0F, $0F, $0F, $0F
	.byte $00	; Terminator

Title_FadeIn_2:
	DBYT $3F00
	.byte 32	; 16 bytes (colors) to follow...
	.byte $17, $0F, $10, $16, $17, $0F, $11, $02, $17, $0F, $1A, $1A, $17, $0F, $17, $02
	.byte $17, $0F, $16, $0F, $17, $0A, $16, $0F, $17, $0F, $16, $0F, $0F, $0F, $0F, $0F
	.byte $00	; Terminator

Title_FadeIn_3:
	DBYT $3F00
	.byte 32
	.byte $27, $0F, $20, $16, $27, $0F, $21, $02, $27, $0F, $2A, $1A, $27, $0F, $27, $02
	.byte $27, $06, $26, $0F, $27, $1A, $26, $0F, $27, $06, $26, $0F, $0F, $0F, $0F, $0F
	.byte $00	; Terminator

Title_FadeIn_4:
	DBYT $3F00
	.byte 32
	.byte $37, $0F, $30, $16, $37, $0F, $21, $02, $37, $0F, $2A, $1A, $37, $0F, $27, $02
	.byte $37, $16, $36, $0F, $37, $2A, $36, $0F, $37, $16, $36, $0F, $0F, $0F, $0F, $0F
	.byte $00	; Terminator

Title_ClearPressStart:

	;DBYT $226A
	;.byte VU_REPEAT | 11, $FC

	DBYT $2260
	.byte $20
	.byte $FC, $FC, $FC, $FC, $FC, $FC, $FC, $00, $2F, $01, $2F, $12, $13, $00, $11, $13, $FC, $13, $0E, $FC, $02, $0B, $04, $00, $11, $FC, $FC, $FC, $FC, $FC, $FC, $FC

	.byte $00	; Terminator


Ending_CurtainExtension:
	DBYT $22E0
	.byte $20, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08
	.byte $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08
	.byte $09

	DBYT $2300
	.byte $20, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08
	.byte $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08
	.byte $09

	DBYT $2320
	.byte $20, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08
	.byte $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08
	.byte $09

	DBYT $2340
	.byte $20, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08
	.byte $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08
	.byte $09

	DBYT $2360
	.byte $20, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08
	.byte $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08
	.byte $09

	DBYT $2380
	.byte $20, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08
	.byte $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08
	.byte $09

	DBYT $23A0
	.byte $20, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08
	.byte $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08
	.byte $09

	DBYT $2800
	.byte $20, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08
	.byte $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08, $09, $08
	.byte $09

	DBYT $2820
	.byte $20, $18, $19, $18, $19, $18, $19, $18, $19, $18, $19, $18, $19, $18, $19, $18
	.byte $19, $18, $19, $18, $19, $18, $19, $18, $19, $18, $19, $18, $19, $18, $19, $18
	.byte $19

	DBYT $2840
	.byte $20, $28, $29, $28, $29, $28, $29, $28, $29, $28, $29, $28, $29, $28, $29, $28
	.byte $29, $28, $29, $28, $29, $28, $29, $28, $29, $28, $29, $28, $29, $28, $29, $28
	.byte $29

	DBYT $23C0
	.byte VU_REPEAT | $20, $00

	DBYT $23E0
	.byte VU_REPEAT | $10, $00

	DBYT $23F0
	.byte VU_REPEAT | $10, $00

	DBYT $2BC0
	.byte VU_REPEAT | $08, $A0

	DBYT $2BC8
	.byte VU_REPEAT | $08, $AA

	DBYT $2BD0
	.byte VU_REPEAT | $10, $AA

	DBYT $2BE0
	.byte VU_REPEAT | $10, $AA

	DBYT $3F00
	.byte $20, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
	.byte $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
	.byte $0F

	; Terminator
	.byte $00

PRG025_CCCE:
	DBYT $3F00
	.byte $20, $0F, $0F, $30, $16, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
	.byte $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
	.byte $0F

	; Terminator
	.byte $00

EndSeq_WorldFadeIn1:
	DBYT $3F00
	.byte $20, $0F, $0F, $30, $16, $0F, $0F, $0F, $00, $0F, $0F, $00, $0F, $0F, $0F, $00
	.byte $00, $0F, $0F, $0F, $00, $0F, $00, $0F, $0F, $0F, $00, $0F, $0F, $0F, $00, $0F
	.byte $0F

	; Terminator
	.byte $00

EndSeq_WorldFadeIn2:
	DBYT $3F00
	.byte $20, $0F, $0F, $30, $16, $0F, $0F, $00, $10, $0F, $00, $10, $00, $0F, $00, $10
	.byte $10, $0F, $00, $00, $10, $0F, $10, $00, $00, $0F, $10, $00, $00, $0F, $10, $00
	.byte $00

	; Terminator
	.byte $00

EndSeq_WorldFadeIn3:
	DBYT $3F00
	.byte $20, $0F, $0F, $30, $16, $0F, $00, $10, $30, $0F, $10, $30, $10, $0F, $10, $30
	.byte $30, $0F, $10, $10, $30, $0F, $30, $10, $10, $0F, $30, $10, $10, $0F, $30, $10
	.byte $10

	; Terminator
	.byte $00

EndSeq_WorldFadeIn4:
	DBYT $3F00
	.byte $20, $0F, $0F, $30, $16, $0F, $27, $2A, $36, $0F, $3C, $30, $37, $0F, $21, $2A
	.byte $36, $0F, $10, $36, $0F, $0F, $25, $36, $0F, $0F, $29, $36, $0F, $0F, $29, $36
	.byte $0F

	; Terminator
	.byte $00

Curtain_Line01:
	DBYT $2000

	.byte 32
	.byte $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8
	.byte $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8

	.byte $00	; Terminator

Curtain_Line02:
	DBYT $2020

	.byte 32
	.byte $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA
	.byte $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA

	.byte $00	; Terminator

Curtain_Line03:
	DBYT $2040

	.byte 32
	.byte $B7, $B8, $FD, $FD, $FD, $FD, $FD, $00, $01, $02, $03, $04, $FD, $FD, $FD, $FD
	.byte $FD, $FD, $FD, $FD, $05, $06, $07, $08, $09, $FD, $FD, $FD, $FD, $FD, $B7, $B8

	.byte $00	; Terminator

Curtain_Line04:
	DBYT $2060

	.byte 32
	.byte $B9, $BA, $FD, $0A, $0B, $0C, $0D, $0E, $0F, $10, $11, $12, $13, $FD, $FD, $FD
	.byte $FD, $FD, $FD, $14, $15, $16, $17, $18, $19, $1A, $1B, $1C, $1D, $FD, $B9, $BA

	.byte $00	; Terminator

Curtain_Line05:
	DBYT $2080

	.byte 32
	.byte $B7, $B8, $1E, $1F, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $FD, $FD
	.byte $FD, $FD, $2A, $2B, $2C, $2D, $2E, $2F, $30, $31, $32, $33, $34, $35, $B7, $B8

	.byte $00	; Terminator

Curtain_Line06:
	DBYT $20A0

	.byte 32
	.byte $B9, $BA, $36, $37, $38, $39, $3A, $3B, $FB, $FB, $FB, $3C, $3D, $3E, $3F, $40
	.byte $43, $44, $45, $46, $47, $FB, $FB, $FB, $48, $49, $4A, $4B, $4C, $4D, $B9, $BA

	.byte $00	; Terminator

Curtain_Line07:
	DBYT $20C0

	.byte 32
	.byte $B7, $B8, $4E, $4F, $50, $51, $52, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.byte $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $53, $54, $55, $56, $57, $B7, $B8

	.byte $00	; Terminator

Curtain_Line08:
	DBYT $20E0

	.byte 32
	.byte $B9, $BA, $58, $59, $5A, $5B, $5C, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.byte $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $5C, $5D, $5E, $5F, $60, $B9, $BA

	.byte $00	; Terminator

Curtain_Line09:
	DBYT $2100

	.byte 32
	.byte $B7, $B8, $61, $62, $63, $FB, $5C, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.byte $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $5C, $FB, $8C, $8D, $8E, $B7, $B8

	.byte $00	; Terminator

Curtain_Line10:
	DBYT $2120

	.byte 32
	.byte $B9, $BA, $64, $65, $66, $FB, $5C, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.byte $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $5C, $FB, $8F, $90, $91, $B9, $BA

	.byte $00	; Terminator

Curtain_Line11:
	DBYT $2140

	.byte 32
	.byte $B7, $B8, $67, $68, $69, $FB, $5C, $FB, $FB, $E9, $E5, $DE, $DA, $EC, $DE, $FB
	.byte $EC, $DE, $E5, $DE, $DC, $ED, $FB, $FB, $FB, $5C, $FB, $92, $93, $94, $B7, $B8

	.byte $00	; Terminator

Curtain_Line12:
	DBYT $2160

	.byte 32
	.byte $B9, $BA, $FD, $6A, $6B, $FB, $5C, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.byte $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $5C, $FB, $95, $96, $FD, $B9, $BA

	.byte $00	; Terminator

Curtain_Line13:
	DBYT $2180

	.byte 32
	.byte $B7, $B8, $FD, $6C, $6D, $6E, $5C, $FB, $FB, $FB, $FB, $FB, $E9, $E5, $DA, $F2
	.byte $DE, $EB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $5C, $97, $98, $99, $FD, $B7, $B8

	.byte $00	; Terminator

Curtain_Line14:
	DBYT $21A0

	.byte 32
	.byte $B9, $BA, $FD, $6F, $70, $71, $5C, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.byte $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $5C, $9A, $9B, $9C, $FD, $B9, $BA

	.byte $00	; Terminator

Curtain_Line15:
	DBYT $21C0

	.byte 32
	.byte $B7, $B8, $FD, $72, $73, $74, $5C, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.byte $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $5C, $9D, $9E, $9F, $FD, $B7, $B8

	.byte $00	; Terminator

Curtain_Line16:
	DBYT $21E0

	.byte 32
	.byte $B9, $BA, $FD, $75, $76, $77, $5C, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.byte $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $5C, $BB, $BC, $BD, $FD, $B9, $BA

	.byte $00	; Terminator

Curtain_Line17:
	DBYT $2200

	.byte 32
	.byte $B7, $B8, $FD, $78, $79, $7A, $5C, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.byte $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $5C, $A0, $A1, $A2, $FD, $B7, $B8

	.byte $00	; Terminator

Curtain_Line18:
	DBYT $2220

	.byte 32
	.byte $B9, $BA, $FD, $7B, $7C, $7D, $5C, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.byte $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $5C, $A3, $A4, $A5, $FD, $B9, $BA

	.byte $00	; Terminator

Curtain_Line19:
	DBYT $2240

	.byte 32
	.byte $B7, $B8, $FD, $7E, $7F, $80, $5C, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.byte $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $5C, $A6, $A7, $A8, $FD, $B7, $B8

	.byte $00	; Terminator

Curtain_Line20:
	DBYT $2260

	.byte 32
	.byte $B9, $BA, $FD, $FD, $81, $6E, $5C, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.byte $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $5C, $A9, $AA, $FD, $FD, $B9, $BA

	.byte $00	; Terminator

Curtain_Line21:
	DBYT $2280

	.byte 32
	.byte $B7, $B8, $FD, $FD, $82, $6E, $8A, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.byte $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $8A, $AB, $AC, $FD, $FD, $B7, $B8

	.byte $00	; Terminator

Curtain_Line22:
	DBYT $22A0

	.byte 32
	.byte $B9, $BA, $FD, $FD, $83, $FB, $8B, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.byte $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $8B, $FB, $AD, $FD, $FD, $B9, $BA

	.byte $00	; Terminator

Curtain_Line23:
	DBYT $22C0

	.byte 32
	.byte $B7, $B8, $FD, $FD, $84, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.byte $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $AE, $FD, $FD, $B7, $B8

	.byte $00	; Terminator

Curtain_Line24:
	DBYT $22E0

	.byte 32
	.byte $B9, $BA, $FD, $FD, $85, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.byte $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $B0, $FD, $FD, $B9, $BA

	.byte $00	; Terminator

Curtain_Line25:
	DBYT $2300

	.byte 32
	.byte $B7, $B8, $FD, $FD, $86, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.byte $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $B1, $FD, $FD, $B7, $B8

	.byte $00	; Terminator

Curtain_Line26:
	DBYT $2320

	.byte 32
	.byte $B9, $BA, $FD, $FD, $87, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $B2, $FD, $FD, $B9, $BA

	.byte $00	; Terminator

Curtain_Line27:
	DBYT $2340

	.byte 32
	.byte $B7, $B8, $FD, $FD, $88, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $B3, $FD, $FD, $B7, $B8

	.byte $00	; Terminator

Curtain_Line28:
	DBYT $2360

	.byte 32
	.byte $B9, $BA, $FD, $FD, $89, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.byte $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $B4, $FD, $FD, $B9, $BA

	.byte $00	; Terminator

Curtain_Line29:
	DBYT $2380

	.byte 32
	.byte $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8
	.byte $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8, $B7, $B8

	.byte $00	; Terminator

Curtain_Line30:
	DBYT $23A0

	.byte 32
	.byte $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA
	.byte $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA, $B9, $BA

	.byte $00	; Terminator

CurtainAttr_Line01:
	DBYT $23C0

	.byte 32
	.byte $3E, $0E, $0E, $0E, $0E, $0E, $0E, $8E, $32, $00, $00, $00, $00, $00, $00, $8C
	.byte $32, $00, $A0, $A0, $A0, $20, $00, $8C, $32, $00, $00, $0A, $02, $00, $00, $8C

	.byte $00	; Terminator

CurtainAttr_Line02:
	DBYT $23E0

	.byte 32
	.byte $32, $00, $00, $0E, $00, $00, $00, $8C, $32, $00, $00, $00, $00, $00, $00, $8C
	.byte $32, $00, $A0, $A0, $A0, $A0, $00, $8C, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E

	.byte $00	; Terminator


Curtain_FadeIn_1:
	DBYT $3F00
	
	.byte 32
	.byte $0F, $0F, $0F, $0F, $0F, $00, $0F, $0F, $0F, $00, $0F, $0F, $0F, $00, $0F, $0F
	.byte $0F, $0F, $06, $0F, $0F, $0A, $06, $0F, $0F, $0F, $06, $0F, $0F, $0F, $0F, $0F
	
	.byte $00

Curtain_FadeIn_2:
	DBYT $3F00
	
	.byte 32
	.byte $0F, $08, $0F, $0F, $0F, $10, $0F, $0F, $0F, $10, $0F, $0F, $0F, $10, $0F, $0F
	.byte $0F, $0F, $16, $0F, $0F, $0A, $16, $0F, $0F, $0F, $16, $0F, $0F, $0F, $0F, $0F
	
	.byte $00

Curtain_FadeIn_3:
	DBYT $3F00
	
	.byte 32
	.byte $0F, $18, $06, $0F, $0F, $20, $02, $06, $0F, $20, $06, $02, $0F, $20, $02, $06
	.byte $0F, $06, $26, $0F, $0F, $1A, $26, $0F, $0F, $06, $26, $0F, $0F, $0F, $0F, $0F
	
	.byte $00

Curtain_FadeIn_4:
	DBYT $3F00
	
	.byte 32
	.byte $0F, $28, $16, $06, $0F, $30, $12, $16, $0F, $30, $16, $12, $0F, $30, $12, $16
	.byte $0F, $16, $36, $0F, $0F, $2A, $36, $0F, $0F, $16, $36, $0F, $0F, $0F, $0F, $0F
	
	.byte $00



Curtain_P2PushStart:
	DBYT $232B

	.byte 8
	;      P    L    A    Y    E    R         2
	.byte $E9, $E5, $DA, $F2, $DE, $EB, $FB, $D2

	DBYT $234A

	.byte 10
	;      P    U    S    H         S    T    A    R    T
	.byte $E9, $EE, $EC, $E1, $FB, $EC, $ED, $DA, $EB, $ED

	.byte $00	; Terminator


Curtain_P2PushStartClear:
	DBYT $232B

	.byte 8 | VU_REPEAT, $FB

	DBYT $234A

	.byte 10 | VU_REPEAT, $FB

	.byte $00	; Terminator


DebugMenu_Line1:
	DBYT $200A

	.byte 10
	;      S    E    K    R    E    T         L    A    B
	.byte $12, $04, $0A, $11, $04, $13, $FC, $0B, $00, $01

	DBYT $2042

	.byte 10
	;      S    O    U    N    D         T    E    S    T
	.byte $12, $0E, $14, $0D, $03, $FC, $13, $04, $12, $13
	
		
	; Index
	DBYT $2050

	.byte 2
	;      0    0
	.byte $1A, $1A

	.byte $00	; Terminator


DebugMenu_Line2:
	; Music_MusBank / Music_NextIndex / Music_Sq2TrkOff / Music_Sq1TrkOff / Music_TriTrkPos / Music_NseTrkPos / Music_PCMTrkPos
	DBYT $2081
	
	.byte 29
	;      B    0    0         I    0    0         2    S    0    0         1    S    0    0         T    0    0         N    0    0         D    0    0
	.byte $01, $1A, $1A, $FC, $08, $1A, $1A, $FC, $1C, $12, $1A, $1A, $FC, $1B, $12, $1A, $1A, $FC, $13, $1A, $1A, $FC, $0D, $1A, $1A, $FC, $03, $1A, $1A


	.byte $00	; Terminator
	

DebugMenu_Line3:
	DBYT $20E2

	.byte 9
	;      W    O    R    L    D         E    N    D
	.byte $16, $0E, $11, $0B, $03, $FC, $04, $0D, $03

	DBYT $20F0
	
	.byte 1
	; 1
	.byte $1B

	DBYT $2122

	.byte 6
	;      E    N    D    I    N    G 
	.byte $04, $0D, $03, $08, $0D, $06

	DBYT $2142

	.byte 8
	;      E    N    D    I    N    G         2
	.byte $04, $0D, $03, $08, $0D, $06, $FC, $1C

	.byte $00	; Terminator


DebugMenu_Line4:
	DBYT $21E2

	.byte 8
	;      G    E    T         S    T    A    R 
	.byte $06, $04, $13, $FC, $12, $13, $00, $11

	DBYT $21F0
	
	.byte 4
	;      N    O    N    E
	.byte $0D, $0E, $0D, $04

	DBYT $2222

	.byte 11
	;      C    O    M    P    L         W    O    R    L    D
	.byte $02, $0E, $0C, $0F, $0B, $FC, $16, $0E, $11, $0B, $03
	
	DBYT $2230
	
	.byte 1
	; 1
	.byte $1B

	.byte $00	; Terminator


DebugMenu_Line5:
	DBYT $2262

	.byte 5
	;      S    T    A    R    T
	.byte $12, $13, $00, $11, $13

	.byte $00	; Terminator


DebugMenu_Line6:
	DBYT $22C0

	.byte 24
	;      W    A    R    N    I    N    G         S    A    V    E         D    A    T    A         M    A    Y         B    E
	.byte $16, $00, $11, $0D, $08, $0D, $06, $FC, $12, $00, $15, $04, $FC, $03, $00, $13, $00, $FC, $0C, $00, $18, $FC, $01, $04

	.byte $00	; Terminator

DebugMenu_Line7:
	DBYT $22E0

	.byte 25
	;      O    V    E    R    W    R    I    T    T    E    N              P    R    O    C    E    E    D         W    I    T    H
	.byte $0E, $15, $04, $11, $16, $11, $08, $13, $13, $04, $0D, $FC, $FC, $0F, $11, $0E, $02, $04, $04, $03, $FC, $16, $08, $13, $07

	.byte $00	; Terminator


DebugMenu_Line8:
	DBYT $2300

	.byte 7
	;      C    A    U    T    I    O    N
	.byte $02, $00, $14, $13, $08, $0E, $0D

	.byte $00	; Terminator


DebugMenu_Palette:
	; This is the initial palette applied to the title screen

	DBYT $3F00
	.byte 32	; 32 bytes to follow (32 colors)

	; The colors!
	.byte $0F, $0F, $30, $16, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
	.byte $0F, $16, $36, $0F, $0F, $2A, $36, $0F, $0F, $27, $30, $0F, $0F, $2A, $30, $0F

	.byte $00	; Terminator

Ending2_Fade1:
	DBYT $3F00

	.byte 16
	.byte $21, $0F, $30, $3C, $21, $0F, $36, $27, $21, $0F, $30, $10, $21, $0F, $21, $12

	.byte $00	; Terminator

Ending2_Fade2:
	DBYT $3F00

	.byte 16
	.byte $11, $0F, $30, $3C, $11, $0F, $36, $27, $11, $0F, $30, $10, $11, $0F, $21, $12

	.byte $00	; Terminator

Ending2_Fade3:
	DBYT $3F00

	.byte 16
	.byte $01, $0F, $30, $3C, $01, $0F, $36, $27, $01, $0F, $30, $10, $01, $0F, $21, $12

	.byte $00	; Terminator

Ending2_Fade4:
	DBYT $3F00

	.byte 32
	.byte $0F, $0F, $30, $3C, $0F, $0F, $36, $27, $0F, $0F, $30, $10, $0F, $0F, $21, $12
	.byte $FF, $16, $36, $0F, $FF, $06, $19, $28, $FF, $06, $10, $28, $FF, $0F, $30, $2A

	.byte $00	; Terminator

Ending2_BowsersPal:
	DBYT $3F1C
	
	.byte 4
	.byte $0F, $1A, $30, $27
	
	.byte $00


Ending2_Msg1:
	DBYT $28E8

	.byte 17

	;       T    h    a    n    k         y    o    u         P    l    a    y    e    r    !    
	.byte $C3, $D7, $D0, $DD, $DA, $FE, $8C, $DE, $CE, $FE, $BF, $DB, $D0, $8C, $D4, $CB, $EA
	
	.byte $00

Ending2_Msg2:
	DBYT $2927
	
	.byte 19

	;       Y    o    u    r         q    u    e    s    t         i    s         o    v    e    r    .    
	.byte $C8, $DE, $CE, $CB, $FE, $CA, $CE, $D4, $CC, $CD, $FE, $D8, $CC, $FE, $DE, $CF, $D4, $CB, $E9

	.byte $00

Ending2_Msg3:
	DBYT $2969

	.byte 15

	;       U    s    e         K    o    n    a    m    i         C    o    d    e    
	.byte $C4, $CC, $D4, $FE, $BA, $DE, $DD, $D0, $DC, $D8, $FE, $B2, $DE, $D3, $D4

	.byte $00

Ending2_Msg4:
	DBYT $29A8

	.byte 17

	;       t    o         h    a    v    e         s    o    m    e         f    u    n    .    
	.byte $CD, $DE, $FE, $D7, $D0, $CF, $D4, $FE, $CC, $DE, $DC, $D4, $FE, $D5, $CE, $DD, $E9
	
	.byte $00


WZEnding_Objects:	.include "PRG/objects/W8A"			; World 8 Airship

