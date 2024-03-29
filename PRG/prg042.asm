; Overflow from 41

Object_Move41:
	JMP_THUNKA 41, Object_Move

Player_HitEnemy41:
	JMP_THUNKA 41, Player_HitEnemy

ObjInit_BowserJr42:
	LDA World_Num
	JSR DynJump
	
	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word BowserJr_InitWorld1	; World 1 - Do nothing, invalid!
	.word BowserJr_InitWorld2	; World 2
	.word BowserJr_InitWorld3	; World 3
	.word BowserJr_InitWorld4	; World 4
	.word BowserJr_InitWorld5	; World 5
	.word BowserJr_InitWorld4	; World 6
	.word BowserJr_InitWorld7	; World 7
	.word BowserJr_InitWorld1	; World 8 - Do nothing, invalid!
	.word BowserJr_InitWorld1	; World 9 - Do nothing, invalid!
	.word BowserJr_InitWorld1	; World Zero - Do nothing

BowserJr_InitWorld2:

	; World 2 Bowser Jr needs a Wart!
	LDY <entity_index
	LDX #1	; Wart will take slot 1
	JSR Level_PrepareNewObject

	LDA entity_lo_y,Y
	ADD #80
	STA <entity_lo_y,X
	LDA entity_hi_y,Y
	ADC #0
	STA <entity_hi_y,X
	
	LDA entity_lo_x,Y
	SUB #32
	STA <entity_lo_x,X
	LDA entity_hi_x,Y
	SBC #0
	STA <entity_hi_x,X
	
	LDA #OBJSTATE_INIT
	STA entity_state,X
	
	LDA #OBJ_BOSS_WART
	STA entity_type,X

	LDX <entity_index
	
BowserJr_InitWorld1:
BowserJr_World1:
BowserJr_InitWorld3:
	RTS

BowserJr_InitWorld7:
	
	LDA #$06
	STA Palette_Buffer+$15
	STA Pal_Data+$15
	LDA #$19
	STA Palette_Buffer+$16
	STA Pal_Data+$16
	LDA #$28
	STA Palette_Buffer+$17
	STA Pal_Data+$17

	LDA #$06
	STA Palette_Buffer+$19
	STA Pal_Data+$19
	LDA #$10
	STA Palette_Buffer+$1A
	STA Pal_Data+$1A
	LDA #$28
	STA Palette_Buffer+$1B
	STA Pal_Data+$1B

	LDA #$0F
	STA Palette_Buffer+$1D
	STA Pal_Data+$1D
	LDA #$10
	STA Palette_Buffer+$1E
	STA Pal_Data+$1E
	LDA #$20
	STA Palette_Buffer+$1F
	STA Pal_Data+$1F
	
	LDA #32
	STA PatTable_BankSel+4
	
	INC Objects_IsGiant,X
	
	LDA #30
	STA Objects_HitCount,X
	
	; HACKish, but we'll take a low starting position for BJr to mean the "cinematic" object
	LDA <entity_hi_y,X
	BEQ BJrW7_NotCinematic
	LDA <entity_lo_y,X
	CMP #$60
	BLT BJrW7_NotCinematic
	
	LDA #8
	STA <entity_var5,X

	LDA #MUS1_STOPMUSIC
	STA Sound_QMusic1
	
	LDA #$80
	STA entity_timer,X
	
BJrW7_NotCinematic:
	RTS

ObjNorm_BowserJr42:

	LDA entity_state,X
	CMP #OBJSTATE_NORMAL
	BEQ BJr_NormalState

	; Bowser Jr should never be "killed"
	LDA #OBJSTATE_NORMAL
	STA entity_state,X

	; Handle kill state, perhaps
	JSR BowserJr_HandleKillState

BJr_NormalState:
	; Hack: "PatTableSel" cannot support a bank value over 127, so must do so manually
	LDA #137
	STA PatTable_BankSel+5

	; Var5 is BJr's state; if $80+, this means we're doing the exit sequence!
	LDA <entity_var5,X
	BMI BowserJr_Exiting

	LDA World_Num
	JSR DynJump
	
	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word BowserJr_World1	; World 1 - Do nothing, invalid!
	.word BowserJr_World2	; World 2
	.word BowserJr_World3	; World 3
	.word BowserJr_World4	; World 4
	.word BowserJr_World5	; World 5
	.word BowserJr_World6	; World 6
	.word BowserJr_World7	; World 7
	.word BowserJr_World1	; World 8 (nothing)
	.word BowserJr_World1	; World 9 (nothing)
	.word BowserJr_WorldZ	; World Zero (ending)

BowserJr_HandleKillState:
	; But we might use the handler for something...
	LDA World_Num
	JSR DynJump
	
	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word BowserJr_KillWorld1	; World 1
	.word BowserJr_KillWorld2	; World 2
	.word BowserJr_KillWorld3	; World 3
	.word BowserJr_KillWorld4	; World 4
	.word BowserJr_KillWorld5	; World 5
	.word BowserJr_KillWorld6	; World 6
	.word BowserJr_KillWorld7	; World 7
	
BowserJr_KillWorld1:
BowserJr_KillWorld2:
BowserJr_KillWorld5:
	RTS
	
BowserJr_KillWorld3:
	INC <entity_var5,X	; Go into spin out state
	RTS

BowserJr_KillWorld4:
BowserJr_KillWorld6:
	JSR BJrW4_FindShell
	BMI BJrW4_NoShellKill

	; Kill the shell that hit BJr
	LDA #OBJSTATE_KILLED
	STA entity_state,Y

BJrW4_NoShellKill:

	; Go into secondary attack state
	LDA #2
	STA <entity_var5,X

	LDA #0
	STA <entity_lo_x_velocity,X
	STA <entity_lo_y_velocity,X

	; Flashing timer
	LDA #120
	STA entity_timer,X

	RTS


BowserJr_KillWorld7:
	LDA #1
	STA <entity_var5,X

	LDA #30
	STA Objects_HitCount,X
	
	JMP BJrW7_KillAct
	
	; BJr's common exit routine
BowserJr_Exiting:
	LDA <entity_var5,X
	AND #$7F

	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word BJrExit_Pissed
	.word BJrExit_SpinOut
	.word BJrExit_Wait
	.word BJrExit_EndLevel
	.word BJrExit_DeadTimeout
	
BJrExit_Pissed:
	LDA #2
	STA entity_animation_frame,X
	JSR BowserJr_Draw

	LDA #1
	JSR BowserJr_DrawHand

	LDA #1
	STA Level_TimerEn

	LDA entity_var1,X
	BNE BJrPissed_Dec
	
	; Init pissed timer
	LDA #80
	STA entity_var1,X
	
BJrPissed_Dec:
	DEC entity_var1,X
	BNE BJrPissed_NotDone

	; Next state...
	INC <entity_var5,X

BJrExit_SpinOut:
	JSR Draw_BJr_ShellSpin


	LDA entity_var1,X
	BNE BJrSpinOut_Dec
	
	; Init spinout timer
	LDA #$80
	STA entity_var1,X
	
BJrSpinOut_Dec:
	DEC entity_var1,X
	BNE BJrSpinOut_NotDone
	
	; Whoosh
	LDA #SND_LEVELAIRSHIP
	STA Sound_QLevel2
	
	; Exit right!
	LDA #$40
	STA <entity_lo_x_velocity,X

	; Next state...
	INC <entity_var5,X

BJrSpinOut_NotDone:
	RTS
	
	
BJrExit_Wait:
	JSR Draw_BJr_ShellSpin
	JSR Object_ApplyXVel

	; Will until Bowser Jr has left the scren
	LDA entity_hi_x,X
	CMP <Horz_Scroll_Hi
	BEQ BJr_NotGone	; If Bowser Jr hasn't left yet, jump to BJr_NotGone

	; Victory fanfare
	LDA Sound_QMusic1
	ORA #MUS1_BOSSVICTORY
	STA Sound_QMusic1

	INC <entity_var5,X

BJr_NotGone:
	RTS


BJrExit_EndLevel:
	JSR DoTimeBonus	 ; Convert remaining time into score
	BNE BJrExit_StillTimering	 ; If not done converting, jump to PRG003_A910 (RTS)

	; Set timer to $40
	LDA #$40
	STA entity_var1,X
	
	INC <entity_var5,X

BJrExit_StillTimering:
	RTS


BJrExit_DeadTimeout:
	DEC entity_var1,X
	BNE BJrExit_StillTimering

	JMP_THUNKC 30, Object_TriggerEndWorld


BJrPissed_NotDone:

	JSR Object_Move41
	
	LDA entity_collision_flags,X
	AND #$04
	BEQ BJr_PissedNotOnFloor
	
	LDA #SND_PLAYERBUMP
	STA Sound_QPlayer
	
	LDA #-$20
	STA <entity_lo_y_velocity,X
		
BJr_PissedNotOnFloor:
	RTS
	

BJrBody_BasePattern:	.byte $D1, $D5
BJrBody_PatternDelta:	.byte   2,  -2

					; Regular, vflipped
BJrBody_YOffs:		.byte 16,   0+16
BJrBodyTop_YOffs:	.byte  0,  16+16
BJrHead_YOffs:		.byte  4,  12+16
BJrHair_YOffs:		.byte -16, 16

BowserJr_Draw:

	; Prep some vertical offsets
	LDA entity_flipped_animation,X
	ROL A
	ROL A
	AND #1
	TAY
	
	LDA BJrBody_YOffs,Y
	STA <var10			; Body Y offset
	
	LDA BJrBodyTop_YOffs,Y
	STA <var11			; Body top Y offset
	
	LDA BJrHead_YOffs,Y
	STA <var12			; Head Y offset

	LDA BJrHair_YOffs,Y
	STA <var13			; Hair Y offset

	;;;;;;;;;;;;;;;;;;;;;
	; Bowser Jr's Body
	;;;;;;;;;;;;;;;;;;;;;
	
	; Determine sprite visibility
	LDA <entity_sprite_lo_y,X
	JSR_THUNKA 41, BowserJr_DoVisChecks	; Need to thunk because his attributes are on 41

	; Y = 0 (if Bowser Jr not h-flipped)
	LDY #0

	LDA entity_flipped_animation,X
	AND #SPR_HFLIP
	BEQ BJrDraw_NoHFlip	; If Bowser Jr is not horizontally flipped, jump to BJrDraw_NoHFlip
	
	INY	; Y = 1 if h-flipped
	
BJrDraw_NoHFlip:

	; Load base pattern and delta (for bottom run of body sprites)
	LDA BJrBody_BasePattern,Y
	STA <var1
	LDA BJrBody_PatternDelta,Y
	STA <var2
	
	; 3 sprites
	LDA #3
	STA <var3

	; Y = sprite memory offset
	LDY Object_SprRAM,X
	
BJrDrawBody_Loop:

	; Sprite pattern
	LDA <var1
	STA Sprite_RAM+$01,Y

	; Sprite Attribute
	LDA Objects_SprAttr,X
	ORA entity_flipped_animation,X
	STA Sprite_RAM+$02,Y

	; Sprite X
	LDA <entity_sprite_lo_x,X
	STA Sprite_RAM+$03,Y


	ASL Objects_SprHVis,X	; Shift in next horizontal visibility bit
	BCS BJDB_NoVis		; If this sprite is horizontally not visible, jump to BJDB_NoVis

	LDA Objects_SprVVis,X
	LSR A
	PHA		; Save shifted vert vis
	BCS BJDB_NoBVis		; If bottom sprite is vertically not visible, jump to BJDB_NoBVis
	
	; Set Sprite Y
	LDA <entity_sprite_lo_y,X
	ADD <var10
	STA Sprite_RAM+$00,Y
	
BJDB_NoBVis:
	PLA	; Restore shifted vert vis
	LSR A
	BCS BJDB_NoVis	; If upper body sprite not visible, jump to BJDB_NoVis

	; One sprite for his upper body exists above pattern $95
	LDA <var1
	CMP #$D5
	BNE BJDB_NoVis

	; Top sprite should be here!

	LDA <entity_sprite_lo_y,X
	ADD <var11
	STA Sprite_RAM+$04,Y
	
	LDA #$D7
	STA Sprite_RAM+$05,Y
	LDA Sprite_RAM+$02,Y
	STA Sprite_RAM+$06,Y
	LDA Sprite_RAM+$03,Y
	STA Sprite_RAM+$07,Y

	; Next sprite RAM
	INY
	INY
	INY
	INY
	
BJDB_NoVis:

	; Next sprite RAM
	INY
	INY
	INY
	INY

	; +8 to sprite X
	LDA <entity_sprite_lo_x,X
	ADD #8
	STA <entity_sprite_lo_x,X
	
	; Add delta to pattern
	LDA <var1
	ADD <var2
	STA <var1
	
	
	DEC <var3
	BNE BJrDrawBody_Loop	; While var3 > 0, loop!
	
	; Calculate head position at Y+4
	LDA <entity_lo_y,X
	PHA
	ADD <var12
	STA <entity_lo_y,X
	LDA <entity_hi_y,X
	PHA
	ADC #0
	STA <entity_hi_y,X

	LDA entity_flipped_animation,X
	AND #SPR_HFLIP
	BEQ BJH_NoFlip

	; Calculate head position at X+8
	LDA <entity_lo_x,X
	PHA
	ADD #8
	STA <entity_lo_x,X
	LDA <entity_hi_x,X
	PHA
	ADC #0
	STA <entity_hi_x,X
	
BJH_NoFlip:

	JSR_THUNKA 41, BowserJr_DrawHead
	LDX <entity_index

	LDA entity_flipped_animation,X
	AND #SPR_HFLIP
	BEQ BJH_NoFlip2

	; Restore X position
	PLA
	STA <entity_hi_x,X
	PLA 
	STA <entity_lo_x,X

BJH_NoFlip2:

	; Crude: Need one more sprite for his stupid tuft of hair,
	; but we're out of sprites!  So we're going to steal some
	; from adjacent objects
	LDA #1
	JSR Object_StealAdjSprite
	
	; Take from last 2 sprites
	TYA
	ADD #(4 * 4)
	TAY
		
	LDA <entity_sprite_lo_y,X
	ADD <var13
	STA Sprite_RAM+$00,Y
	
	; Tuft of hair
	LDA #$CD
	STA Sprite_RAM+$01,Y
	
	LDA Objects_SprAttr,X
	ORA entity_flipped_animation,X
	STA Sprite_RAM+$02,Y

	LDA entity_flipped_animation,X
	EOR #SPR_HFLIP
	AND #SPR_HFLIP
	LSR A
	LSR A
	LSR A
	ADD <entity_sprite_lo_x,X
	STA Sprite_RAM+$03,Y


	; Restore Y position
	PLA
	STA <entity_hi_y,X
	PLA 
	STA <entity_lo_y,X


	RTS

BJr_ShellSpin_Pats:	
	.byte $ED, $EF, $F1	; 5: Spinning shell 2
	.byte $E1, $E3, $E5	; 6: Spinning shell 3
	.byte $E7, $E9, $EB	; 7: Spinning shell 4
	.byte $F3, $F5, $F7	; 8: Spinning shell 5
	.byte $E7, $E9, $EB	; 9: Spinning shell 6
	.byte $E1, $E3, $E5	; 4: Spinning shell 1

Draw_BJr_ShellSpin:
	LDA <Counter_1
	AND #15
	BNE DBSS_NoSwish
	
	; Play the shell rotation "swish" sound
	LDA Sound_QLevel2
	ORA #SND_LEVELMARCH
	STA Sound_QLevel2

DBSS_NoSwish:
	AND #3
	BNE DBSS_NoFlip

	INC entity_animation_frame,X
	LDA entity_animation_frame,X
	CMP #6
	BLT DBSS_NoRollover
	
	LDA #0
	STA entity_animation_frame,X
	BEQ DBSS_Flip

DBSS_NoRollover:	
	CMP #4
	BNE DBSS_NoFlip

DBSS_Flip:
	LDA entity_flipped_animation,X
	EOR #SPR_HFLIP
	STA entity_flipped_animation,X

DBSS_NoFlip:
	JSR Object_ShakeAndCalcSprite	; Calculate sprite info
	LDX <entity_index

	;LDA entity_reverse_gravity,X
	;BEQ DBSS_NoRevGrav

	;LDA <var3
	;ORA #SPR_VFLIP
	;STA <var3

;DBSS_NoRevGrav:

	LDA entity_animation_frame,X
	ASL A
	ADD entity_animation_frame,X		; A = Frame * 3
	TAX		; -> 'X'

	; Shift var5; if bit set, skip this sprite
	LSR <var5
	BCS PRG037_B4B4	 ; If carry set, jump to PRG037_B4B4 (RTS)

	LDA <var8	 ; Holds Object's Flags1 (sprites horizontally off-screen)
	ASL A		 ; Shift value to the left
	STA <var16	 ; -> var16

	LDA <var1	 ; Object's Y
	ADD #16

	BCS PRG037_B466	 	; If sprite is not visible, jump to PRG037_B466

	STA Sprite_RAM,Y 	; Otherwise, store sprite Y

PRG037_B466:
	BIT <var16	 
	BMI PRG037_B46D	 	; If next sprite is not visible, jump to PRG037_B46D

	STA Sprite_RAM+4,Y	; Otherwise, store next sprite Y

PRG037_B46D:
	BVS PRG037_B472	 	; If next sprite is not visible, jump to PRG037_B472

	STA Sprite_RAM+8,Y	; Otherwise, store next sprite Y

PRG037_B472:

	; Store all sprites' Xs
	LDA <var2
	STA Sprite_RAM+3,Y
	ADD #$08
	STA Sprite_RAM+7,Y
	ADD #$08
	STA Sprite_RAM+11,Y

	LDA BJr_ShellSpin_Pats,X
	STA Sprite_RAM+1,Y
	LDA BJr_ShellSpin_Pats+1,X
	STA Sprite_RAM+5,Y
	LDA BJr_ShellSpin_Pats+2,X
	STA Sprite_RAM+9,Y

	LDA <var3
	ORA #SPR_PAL1

	; Store combined attributes
	STA Sprite_RAM+2,Y 
	STA Sprite_RAM+6,Y
	STA Sprite_RAM+10,Y 

	BIT <var3 
	BVC PRG037_B4B4	 ; If not horizontally flipped, jump to PRG037_B4B4 

	; Otherwise, reverse the sprites...
	LDA Sprite_RAM+1,Y 
	PHA	 
	LDA Sprite_RAM+9,Y 
	STA Sprite_RAM+1,Y 
	PLA	 
	STA Sprite_RAM+9,Y 

PRG037_B4B4:
	LDX <entity_index		; X = object's slot index

	RTS		 ; Return
	
	
BJrHand_Pats:	.byte $DD, $DF	; Hand pattern
BJrHand_YOff:	.byte 6, 0		; Hand Y offset
	
BowserJr_DrawHand:
	TAY		; Input -> 'Y'
	
	LDA BJrHand_Pats,Y
	STA <var1

	LDA BJrHand_YOff,Y
	STA <var2

	LDA #1
	JSR Object_StealAdjSprite
	
	; Take from last sprite
	TYA
	ADD #(4 * 5)
	TAY

	LDA <entity_sprite_lo_y,X
	ADD <var2
	STA Sprite_RAM+$00,Y
	
	LDA <var1
	STA Sprite_RAM+$01,Y
	
	LDA Objects_SprAttr,X
	ORA entity_flipped_animation,X
	STA Sprite_RAM+$02,Y

	LDA entity_flipped_animation,X
	AND #SPR_HFLIP
	LSR A
	LSR A
	ADD <entity_sprite_lo_x,X
	SUB #4
	STA Sprite_RAM+$03,Y

	RTS

	; This replaces BJr's bottom 3 sprites...
BowserJr_DrawClownCar:
	LDA #2
	STA <var1

	LDA entity_flipped_animation,X
	AND #SPR_HFLIP
	LSR A
	LSR A
	LSR A
	LSR A		; 0 or 4
	ADD #$B1
	STA <var2

	LDY Object_SprRAM,X

BJrClownCar_Loop:
	LDA Sprite_RAM+$00,Y
	ADD #2
	STA Sprite_RAM+$00,Y

	LDA <var2
	STA Sprite_RAM+$01,Y

	LDA entity_flipped_animation,X
	ORA #SPR_PAL3
	STA Sprite_RAM+$02,Y

	INY
	INY
	INY
	INY
	
	AND #SPR_HFLIP
	BEQ BJrClownCar_NoHFlip

	; BJr H-Flipped...

	LDA <var1
	CMP #2
	BNE BJrClownCar_NotQuirk

	; H-Flip quirk fix
	INY
	INY
	INY
	INY

BJrClownCar_NotQuirk:
	; Previous Clown Car pattern
	DEC <var2
	DEC <var2
	
	JMP BJrClownCar_LoopDecJump

BJrClownCar_NoHFlip:
	; BJr not H-Flipped...

	; Next Clown Car pattern
	INC <var2
	INC <var2

BJrClownCar_LoopDecJump
	DEC <var1			; var1--
	BPL BJrClownCar_Loop	; While var1 >= 0, loop!

	RTS
	


BowserJr_World3:
	LDA <entity_var5,X
	AND #$7F

	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word BJrW3_Normal
	.word BJrExit_SpinOut
	.word BJrW3_ExitSpinOut

BJrW3_ExitSpinOut:
	JSR BowserJr_Draw

	; Don't play the woosh sound
	LDA SndCur_Level2
	AND #~SND_LEVELAIRSHIP
	STA SndCur_Level2

	LDA #0
	STA <entity_var5,X
	
	DEC entity_var6,X
	LDA entity_var6,X
	BPL BJrW3_StillAlive

	; Kill the boss!
	LDY entity_var3,X	; Boomer's handle
	LDA entity_var4,Y
	ADD #1	; Go into death state
	STA entity_var4,Y

	LDA #-$40
	STA <entity_lo_y_velocity,X
	
	LDA #0
	STA <entity_lo_x_velocity,X

BJrW3_StillAlive:
	RTS

BJrW3_Normal:
	JSR BowserJr_Draw

	LDY entity_var3,X	; Checking on Boomer...

	LDA entity_state,Y
	CMP #OBJSTATE_NORMAL
	BEQ BowserJr_BoomersOK


	; Bowser Jr's typical expression
	LDA #1
	STA entity_animation_frame,X
	
	LDA #0
	STA <var1		; Hand resting
	JSR BowserJr_DrawHand
	
	; Bowser Jr has blown out of Boomer ... waiting for him to land
	JSR Object_Move41
	
	LDA <entity_collision_flags,X
	AND #$04
	BEQ BJrW3_NotLanded
	
	; Landed!
	JSR Object_HitGround
	
	LDA #$80
	STA <entity_var5,X
	
BJrW3_NotLanded:
	RTS

BowserJr_BoomersOK:
	JSR Player_HitEnemy41	; Need to thunk because his attributes are on 41

	; Bowser Jr's typical expression
	LDA #0
	STA entity_animation_frame,X
	
	LDA #0
	STA <var1		; Hand resting
	JSR BowserJr_DrawHand

	RTS

BowserJr_World2:
	JSR BowserJr_Draw

	LDA #138
	STA PatTable_BankSel+4

	LDA #$0F
	STA Palette_Buffer+$1C
	STA Pal_Data+$1C
	LDA #$0F
	STA Palette_Buffer+$1D
	STA Pal_Data+$1D
	LDA #$2A
	STA Palette_Buffer+$1E
	STA Pal_Data+$1E
	LDA #$30
	STA Palette_Buffer+$1F
	STA Pal_Data+$1F

	LDY #1	; Checking on Wart...

	LDA entity_state,Y
	BNE BowserJr_WartsOK
	
	; Wart died!
	LDA #0
	STA entity_var1,X
	
	LDA #$80
	STA <entity_var5,X


BowserJr_WartsOK:

	; Bowser Jr's typical expression
	LDA #0
	STA entity_animation_frame,X
	STA <var1		; Hand resting

	LDA entity_var5,Y
	CMP #5
	BNE BowserJr_WartsNotHurt
	
	; Wart's hurt!
	INC entity_animation_frame,X

	BNE BowserJr_W2DrawHand
	
BowserJr_WartsNotHurt:

	; Wart's not hurt... is he spitting?
	LDA entity_var6,Y
	CMP #64
	BGE BowserJr_W2DrawHand
	
	; Spitting!
	INC <var1
	
	; Mouth open
	INC entity_animation_frame,X
	INC entity_animation_frame,X

BowserJr_W2DrawHand:
	LDA <var1
	JSR BowserJr_DrawHand

	RTS


BJrW4_DeathJump:
	JMP BowserJr_Exiting

BowserJr_World6:
	INC Objects_StompDisable,X

	LDA #144
	STA PatTable_BankSel+4

	LDA #$0F
	STA Palette_Buffer+$1C
	STA Pal_Data+$1C
	LDA #$0F
	STA Palette_Buffer+$1D
	STA Pal_Data+$1D
	LDA #$30
	STA Palette_Buffer+$1E
	STA Pal_Data+$1E
	LDA #$2A
	STA Palette_Buffer+$1F
	STA Pal_Data+$1F

	LDA <entity_var5,X
	BMI BJrW4_DeathJump
	
	AND #$7F

	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word BJrW4_Normal			; 0 - Normal movement state
	.word BJrW4_WaitingShell	; 1 - Waiting a bit to make sure shell is out of the way
	.word BJrW4_HitFlash		; 2 - Flash after hit
	.word BJrW6_ExitTop			; 3 - Exit off top of screen
	.word BJrW6_Bombing			; 4 - Start dropping random bombs!
	.word BJrW6_WaitBombsClear	; 5 - Wait for all bombs to be gone
	.word BJrW6_ComeBackDown	; 6 - Come back down onto screen
	.word $0000			; 7 - ?
	.word BJrW4_WaitABit		; 8 - Wait a bit (I added this one late...)

BowserJr_World4:
	INC Objects_StompDisable,X

	LDA #$0F
	STA Palette_Buffer+$1C
	STA Pal_Data+$1C
	LDA #$0F
	STA Palette_Buffer+$1D
	STA Pal_Data+$1D
	LDA #$30
	STA Palette_Buffer+$1E
	STA Pal_Data+$1E
	LDA #$2A
	STA Palette_Buffer+$1F
	STA Pal_Data+$1F

	LDA <entity_var5,X
	BMI BJrW4_DeathJump
	
	AND #$7F

	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word BJrW4_Normal			; 0 - Normal movement state
	.word BJrW4_WaitingShell	; 1 - Waiting a bit to make sure shell is out of the way
	.word BJrW4_HitFlash		; 2 - Flash after hit
	.word BJrW4_FallLow			; 3 - Fall down low
	.word BJrW4_GetInPosition	; 4 - Get into position...
	.word BJrW4_SwoopRight		; 5 - Swoop right!
	.word BJrW4_SwoopLeft		; 6 - Swoop left!
	.word BJrW4_ReturnToTop		; 7 - Return to top
	.word BJrW4_WaitABit		; 8 - Wait a bit (I added this one late...)
	
	
BJrW6_ExitTop:
	LDA #-$18
	STA <entity_lo_y_velocity,X

	JSR BJrW4_Draw
	JSR Object_Move41

	JSR Player_HitEnemy41

	LDA <entity_hi_y,X
	BPL BJrW6_NotHighEnough
	
	LDA <entity_lo_y,X
	CMP #$D0
	BGE BJrW6_NotHighEnough

	INC <entity_var5,X
	
	LDA #0
	STA entity_var1,X

BJrW6_NotHighEnough:
	RTS
	
	
BJrW6_Bombing:
	LDA <Counter_1
	AND #$1F
	BNE BJrW6_NoBomb

	JSR BJrW6_DropBobomb

	INC entity_var1,X
	LDA entity_var1,X
	CMP #4
	BLT BJrW6_NoBomb
	
	; Done bombing...
	INC <entity_var5,X
	
BJrW6_NoBomb:
	RTS

BJrW6_DropBobomb:
	JSR PrepareNewObjectOrAbort

	LDA #SND_LEVELMARCH
	STA Sound_QLevel2

	; It's a Bob-omb!!
	LDA #OBJ_BOBOMBEXPLODE
	STA entity_type,X

	; Bobomb's Timer3 = $80
	LDA #$30
	STA entity_timer_secondary,X

	INC entity_var7,X	 ; Bob-omb's Var7++
	INC entity_var1,X	 ; Bob-omb's Var1++

	; Set Bob-omb's Y
	LDA #0
	STA <entity_lo_y,X
	STA <entity_hi_y,X

	; Set Bob-omb's Y velocity
	LDA #0
	STA <entity_lo_y_velocity,X

	; Set Bob-omb's X
	LDA RandomN
	CMP #224
	BLT BJrW6_BombXLT224

	; Basically capping random at 0-223
	AND #31

BJrW6_BombXLT224:
	ADD #16
	AND #~15		; Align to tile

	STA <entity_lo_x,X
	LDA entity_hi_x,Y
	LDA #0
	STA <entity_hi_x,X


	; Set Bob-omb attributes
	LDA #SPR_PAL3
	STA Objects_SprAttr,X
	
	LDX <entity_index
	RTS
	

BJrW6_WaitBombsClear:
	LDY #4
BJrW6_BombClearLoop:

	LDA entity_type,Y
	CMP #OBJ_BOBOMBEXPLODE
	BNE BBCL_NextLoop	; If this isn't a OBJ_BOBOMBEXPLODE (probably BJr), jump to BBCL_NextLoop

	LDA entity_state,Y
	BNE BBCL_StillBombs	; If object isn't dead/empty, jump to BBCL_StillBombs

BBCL_NextLoop:
	DEY		; Y--
	BPL BJrW6_BombClearLoop	; While Y >= 0, loop!
	
	; If you get here, all bombs are gone!
	INC <entity_var5,X
	
BBCL_StillBombs:
	RTS


BJrW6_ComeBackDown:
	LDA #$18
	STA <entity_lo_y_velocity,X

	JSR BJrW4_Draw
	JSR Object_Move41

	JSR Player_HitEnemy41

	LDA <entity_hi_y,X
	BMI BJrW6_NotLowEnough
	
	LDA <entity_lo_y,X
	CMP #$10
	BLT BJrW6_NotLowEnough

	LDA #0
	STA <entity_var5,X
	STA entity_var1,X
	STA <entity_lo_y_velocity,X

BJrW6_NotLowEnough:
	RTS

	; Bowser Jr, back and forth
	; Dropping fireball over player (up to 2??)
	; Shell in play when not avialable - after 2 fireballs?
	
	; Var1 - H-travel direction (0 = left, 1 = right)
	; Var2 - V-travel direction (0 = down, 1 = up)

BJrW4_XVels:		.byte -$20, $20
BJrW4_XVelDelta:	.byte -$01, $01
BJrW4_FlipBits:		.byte    0, SPR_HFLIP

BJrW4_YVels:		.byte -$08, $08
BJrW4_YVelDelta:	.byte -$01, $01

BowserJr_InitWorld4:

	LDA #3
	STA Objects_HitCount,X

	LDA #8
	STA <entity_var5,X

	RTS

BJrW4_WaitingShell:
	JSR BJrW4_Normal	; Mostly the same...
	
	; ... but make immune to shell
	LDA #$FF
	STA <entity_sprite_lo_x,X
	STA <entity_sprite_lo_y,X
	
	; ... until Timer runs out
	LDA entity_timer,X
	BNE BJrW4_WaitingShell_Still
	
	; Okay, back to normal...
	DEC <entity_var5,X
	
BJrW4_WaitingShell_Still:
	RTS


BJrW4_FindShell:

	; First check if a shell needs to be brought into play...
	LDY #4
BJrW4_ShellCheck_Loop:
	LDA entity_state,Y
	BEQ BJrW4_ShellCheck_NotShell	; If dead/empty, can't be the shell, jump to BJrW4_ShellCheck_NotShell

	LDA entity_type,Y
	CMP #OBJ_GREENSHELL
	BEQ BJrW4_ShellCheck_ShellFound	; If shell found, jump to BJrW4_ShellCheck_ShellFound

BJrW4_ShellCheck_NotShell:
	DEY		; Y--
	BPL BJrW4_ShellCheck_Loop	; While Y >= 0, loop

BJrW4_ShellCheck_ShellFound:
	RTS

BJrW4_Normal:
	
	JSR BJrW4_Draw
		
	JSR BJrW4_Move

	; Can't drop a flame while the timer is active...
	LDA entity_timer,X
	BNE BJrW4_NotOverPlayer
	
	JSR BJrW4_FindShell
	BPL BJrW4_ShellFound

	; If you get here, no shell was found, need to kick one out...
	INC <entity_var5,X	; Temp invincibility to not get killed by shell
	
	LDA #SND_PLAYERKICK
	STA Sound_QPlayer
	
	LDA #SPR_PAL3
	STA <var2
	
	LDA #OBJ_GREENSHELL
	BNE BJrW4_DropObject_Do


BJrW4_ShellFound:
	JSR entity_player_x_coarse_difference
	LDA <var15
	ADD #2
	CMP #4
	BGE BJrW4_NotOverPlayer
	
	LDA #SPR_PAL1
	STA <var2
	
	; BJr's over the Player! Drop a fireball if possible...
	LDA #OBJ_FLAREUP
BJrW4_DropObject_Do:
	STA <var1
	JSR BJrW4_DropObject

	; Timer to prevent too much
	LDA #20
	STA entity_timer,X
	
BJrW4_NotOverPlayer:
	RTS


BJrW4_DropObject:
	JSR PrepareNewObjectOrAbort
	
	TXA
	TAY

	LDX <entity_index
	
	LDA <entity_lo_x,X
	ADD #4
	STA entity_lo_x,Y
	LDA <entity_hi_x,X
	ADC #0
	STA entity_hi_x,Y
	LDA <entity_lo_y,X
	STA entity_lo_y,Y
	LDA <entity_hi_y,X
	STA entity_hi_y,Y
	
	LDA <var1
	STA entity_type,Y

	LDA <var2
	STA Objects_SprAttr,Y

	RTS

BJrW4_Move:

	LDY entity_var1,X	; Y = H-travel direction (0 = left, 1 = right)
	
	LDA BJrW4_FlipBits,Y
	STA entity_flipped_animation,X
	
	LDA <entity_lo_x_velocity,X
	CMP BJrW4_XVels,Y
	BEQ BJrW4_AtHSpeed	; If BJr is already at the proper speed, jump to BJrW4_AtSpeed
	
	; Accelerate as appropriate
	ADD BJrW4_XVelDelta,Y
	STA <entity_lo_x_velocity,X
	
BJrW4_AtHSpeed:

	LDA <entity_lo_x,X
	CPY #0			; Y = 0 (left) or 1 (right)
	BEQ BJrW4_LeftCheck	; If going left, jump to BJrW4_LeftCheck
	
	; BJr going right...
	CMP #$B8
	BGE BJrW4_SwitchDirection
	BLT BJrW4_NotAtLimit

BJrW4_LeftCheck:
	; BJr going left...
	CMP #$30
	BGE BJrW4_NotAtLimit

BJrW4_SwitchDirection:
	; BJr at left/right limit - toggle horizontal direction
	LDA entity_var1,X
	EOR #1
	STA entity_var1,X
	
BJrW4_NotAtLimit:

BJrW4_MoveVertOnly:
	LDY entity_var2,X	; Y = V-travel direction (0 = left, 1 = right)
	
	LDA <entity_lo_y_velocity,X
	CMP BJrW4_YVels,Y
	BNE BJrW4_NotAtVSpeed	; If BJr is not at the proper speed, jump to BJrW4_NotAtVSpeed
	
	; Reverse vertical direction
	LDA entity_var2,X
	EOR #1
	STA entity_var2,X
	
	
BJrW4_NotAtVSpeed:
	
	; Accelerate as appropriate
	ADD BJrW4_YVelDelta,Y
	STA <entity_lo_y_velocity,X
	
	JSR Object_ApplyXVel
	JSR entity_do_y_velocity
	
	RTS

BJrW4_Draw:
	JSR BowserJr_Draw
	JSR BowserJr_DrawClownCar

	LDA <Player_HaltGame
	BEQ BJrW4_NotHalted		; If gameplay not halted, jump to BJrW4_NotHalted
	
	; Don't return to movement!
	PLA
	PLA
	
BJrW4_NotHalted:
	RTS


BJrW4_HitFlash:

	; Flash for a bit, Jr...
	LDA entity_timer,X
	BEQ BJrW4_InitAttack2
	
	PHA
	AND #15
	BNE BJrW4_HitNoSwish

	; Play the shell rotation "swish" sound
	LDA Sound_QLevel2
	ORA #SND_LEVELMARCH
	STA Sound_QLevel2

BJrW4_HitNoSwish:
	PLA
	
	AND #$04
	BNE BJrW4_Flash

	LDA entity_flipped_animation,X
	EOR #SPR_HFLIP
	STA entity_flipped_animation,X

	JSR BJrW4_Draw

BJrW4_Flash:	
	RTS
	
BJrW4_InitAttack2:

	; Enough flashing! Drop to floor and do hit and run attack!

	; Bowser Jr dead yet?
	DEC Objects_HitCount,X
	BEQ BJrW4_Dead

	INC <entity_var5,X

	RTS
	
BJrW4_Dead:

	LDA #$80
	STA <entity_var5,X

	LDA #0
	STA entity_var1,X

	; Recycle Boom Boom's cool effect
	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1
	JSR_THUNKA 3, Explode_Stars

	LDA #$9e	 
	STA RotatingColor_Cnt

	RTS

BJrW4_FallLow:
	JSR BJrW4_Draw
	JSR Object_Move41

	JSR Player_HitEnemy41

	LDA <entity_lo_y,X
	CMP #$70
	BLT BJrW4_NotFallenFarEnough
	
	INC <entity_var5,X

	LDA #0
	STA entity_lo_y_velocity,X
	STA entity_var1,X	; Always head left...

BJrW4_NotFallenFarEnough:
	RTS

BJrW4_GetInPosition:

	JSR BJrW4_Draw
	JSR BJrW4_Move

	JSR Player_HitEnemy41

	LDA <entity_lo_x,X
	CMP #20
	BGE BJrW4_NotInPosition

	; Swoop right!
	INC <entity_var5,X

	; Whoosh
	LDA #SND_LEVELAIRSHIP
	STA Sound_QLevel2

	; Flip around
	LDA #SPR_HFLIP
	STA entity_flipped_animation,X

	; Burst of speed!
	LDA #$40
	STA <entity_lo_x_velocity,X

	; Number of times going to swoop
	LDA #3
	SUB Objects_HitCount,X
	STA entity_var1,X

BJrW4_NotInPosition:	
	RTS
	
BJrW4_SwoopRight:

	JSR BJrW4_Draw
	JSR Player_HitEnemy41

	JSR Object_ApplyXVel

	LDA <entity_lo_x,X
	CMP #$90
	BLT BJrW4_SwoopRNoSlowDown

	; Slowing down...
	LDA <entity_lo_x_velocity,X
	SUB #$02
	STA <entity_lo_x_velocity,X

	BNE BJrW4_SwoopRNoSlowDown
	
	; Turn Around
	LDA #0
	STA entity_flipped_animation,X
	
	; Reverse thrust!
	LDA #-$40
	STA <entity_lo_x_velocity,X

	; Don't play the woosh sound
	LDA SndCur_Level2
	AND #~SND_LEVELAIRSHIP
	STA SndCur_Level2

	; Whoosh
	LDA #SND_LEVELAIRSHIP
	STA Sound_QLevel2
	
	; Return!
	INC <entity_var5,X

BJrW4_SwoopRNoSlowDown:
	RTS


BJrW4_SwoopLeft:

	JSR BJrW4_Draw
	JSR Player_HitEnemy41

	JSR Object_ApplyXVel

	LDA <entity_lo_x,X
	CMP #$30
	BGE BJrW4_SwoopLNoSlowDown

	; Slowing down...
	LDA <entity_lo_x_velocity,X
	ADD #$04
	STA <entity_lo_x_velocity,X

	BNE BJrW4_SwoopLNoSlowDown

	; Turn Around
	LDA #SPR_HFLIP
	STA entity_flipped_animation,X
	
	; See if we have any swoop maneuvers left...
	DEC entity_var1,X
	BEQ BJrW4_SwoopDone
	
	; Forward thrust!
	LDA #$40
	STA <entity_lo_x_velocity,X

	; Don't play the woosh sound
	LDA SndCur_Level2
	AND #~SND_LEVELAIRSHIP
	STA SndCur_Level2

	; Whoosh
	LDA #SND_LEVELAIRSHIP
	STA Sound_QLevel2
	
	; Go!!
	DEC <entity_var5,X

BJrW4_SwoopLNoSlowDown:
	RTS
	
BJrW4_SwoopDone:
	INC <entity_var5,X
	
	LDA #0
	STA entity_animation_frame,X
	
	RTS
	

BJrW4_ReturnToTop:

	JSR BJrW4_Draw
	JSR Player_HitEnemy41

	LDA <entity_lo_y,X
	SUB #2
	STA <entity_lo_y,X

	CMP #32
	BGE BJrW4_NotAtTopYet

	; Okay he's there
	LDA #0
	STA <entity_var5,X

BJrW4_NotAtTopYet:
	RTS


BJrW4_WaitABit:
	JSR BJrW4_Draw
	JSR BJrW4_MoveVertOnly

	; Keep Player in place to land on Yoshi
	LDA Player_Kuribo
	BNE BJr4_WaitABit_YoshiGrabbed
	
	LDA #0
	STA <player_lo_x_velocity

BJr4_WaitABit_YoshiGrabbed:
	LDA entity_timer,X
	BNE BJrW4_WaitABitTimer
	
	; Init timer
	LDA #120
	STA entity_timer,X
	
BJrW4_WaitABitTimer:
	CMP #1
	BNE BJrW4_WaitLonger

	; Done waiting
	LDA #0
	STA <entity_var5,X

BJrW4_WaitLonger:
	RTS


BowserJr_InitWorld5:

	; World 2 Bowser Jr needs a Wart!
	LDY <entity_index
	LDX #2	; Clyde will take slot 1
	JSR Level_PrepareNewObject

	LDA entity_lo_y,Y
	ADD #128
	STA <entity_lo_y,X
	LDA entity_hi_y,Y
	ADC #0
	STA <entity_hi_y,X
	
	LDA entity_lo_x,Y
	SUB #32
	STA <entity_lo_x,X
	LDA entity_hi_x,Y
	SBC #0
	STA <entity_hi_x,X
	
	LDA #OBJSTATE_INIT
	STA entity_state,X
	
	LDA #OBJ_BOSS_CLYDE
	STA entity_type,X

	LDX <entity_index

	RTS

BowserJr_World5:
	JSR BowserJr_Draw

	; Base frames on Clyde
	; If Clyde is using frame 1, he's spitting fire
	
	; If Clyde's state = 1, he's hurt somehow
	;	>= 4, he's dying

	; Clyde index
	LDY #2

	LDA entity_state,Y
	BEQ BowserJr_ClydesDone
	
	; Do BJr's hand out or not
	LDA entity_animation_frame,Y
	CMP #1
	BEQ BowerJrW5_HandOut
	
	; Not spitting, no hand out
	LDA #0
BowerJrW5_HandOut:
	STA <var1
		
	JSR BowserJr_W2DrawHand
	
	; Clyde index
	LDY #2
	
	LDA entity_var5,Y
	BEQ BowserJr_ClydesAttack
	CMP #4
	BGE BowserJr_ClydesHurt
	CMP #1
	BNE BowserJr_ClydesOK
		
BowserJr_ClydesHurt:
	LDA #1
	STA entity_animation_frame,X
	
	RTS

BowserJr_ClydesOK:
	LDA #0
	STA entity_animation_frame,X
	RTS

BowserJr_ClydesAttack:
	LDA #2
	STA entity_animation_frame,X
	RTS

BowserJr_ClydesDone:
	LDA #$80
	STA <entity_var5,X
	
	RTS



ObjInit_DelfinoSlots42:
	; Load slots to default images
	LDA Reel1_Defs
	ASL A
	ASL A
	STA <var1
	LDA Reel1_Defs+1
	ORA <var1
	STA entity_var1,X

	LDA Reel2_Defs
	ASL A
	ASL A
	STA <var1
	LDA Reel2_Defs+1
	ORA <var1
	STA entity_var2,X

	LDA Reel3_Defs
	ASL A
	ASL A
	STA <var1
	LDA Reel3_Defs+1
	ORA <var1
	STA entity_var3,X

	LDA <entity_lo_y,X
	SUB #1
	STA <entity_lo_y,X
	LDA <entity_hi_y,X
	SBC #0
	STA <entity_hi_y,X


	; HACK TEST
	;LDA #%10000001
	;LDA #%11000000
	;STA entity_var10,X

	RTS

; Reel images:
SLOT_COIN1	= 0		; Low coin
SLOT_COINS	= 1		; High coin
SLOT_ENEMY	= 2		; Enemy
SLOT_LUCK7	= 3		; Lucky 7

Reel1_Defs:	
	; Shifted up by 4 for convenience, since they need to occupy bits 4-5 / 6-7
	.byte (SLOT_COIN1 << 4)	; 0
	.byte (SLOT_COINS << 4)	; 1
	.byte (SLOT_ENEMY << 4)	; 2
	.byte (SLOT_LUCK7 << 4)	; 3
	.byte (SLOT_COIN1 << 4)	; 4
	.byte (SLOT_COINS << 4)	; 5
	.byte (SLOT_ENEMY << 4)	; 6
	.byte (SLOT_LUCK7 << 4)	; 7
	.byte (SLOT_COIN1 << 4)	; 8
	.byte (SLOT_COINS << 4)	; 9
	.byte (SLOT_LUCK7 << 4)	; 10
	.byte (SLOT_LUCK7 << 4)	; 11
	.byte (SLOT_COIN1 << 4)	; 12
	.byte (SLOT_LUCK7 << 4)	; 13
	.byte (SLOT_ENEMY << 4)	; 14
	.byte (SLOT_LUCK7 << 4)	; 15
	.byte (SLOT_COIN1 << 4)	; 16 (for wrap-around, must be same as 0)

Reel2_Defs:
	.byte (SLOT_LUCK7 << 4)	; 0
	.byte (SLOT_COIN1 << 4)	; 1
	.byte (SLOT_COINS << 4)	; 2
	.byte (SLOT_ENEMY << 4)	; 3
	.byte (SLOT_COIN1 << 4)	; 4
	.byte (SLOT_COINS << 4)	; 5
	.byte (SLOT_ENEMY << 4)	; 6
	.byte (SLOT_LUCK7 << 4)	; 7
	.byte (SLOT_COIN1 << 4)	; 8
	.byte (SLOT_COINS << 4)	; 9
	.byte (SLOT_LUCK7 << 4)	; 10
	.byte (SLOT_LUCK7 << 4)	; 11
	.byte (SLOT_COIN1 << 4)	; 12
	.byte (SLOT_COIN1 << 4)	; 13
	.byte (SLOT_COINS << 4)	; 14
	.byte (SLOT_LUCK7 << 4)	; 15
	.byte (SLOT_LUCK7 << 4)	; 16 (for wrap-around, must be same as 0)



Reel3_Defs:
	.byte (SLOT_COIN1 << 4)	; 0
	.byte (SLOT_COINS << 4)	; 1
	.byte (SLOT_ENEMY << 4)	; 2
	.byte (SLOT_LUCK7 << 4)	; 3
	.byte (SLOT_COINS << 4)	; 4
	.byte (SLOT_ENEMY << 4)	; 5
	.byte (SLOT_LUCK7 << 4)	; 6
	.byte (SLOT_COIN1 << 4)	; 7
	.byte (SLOT_COIN1 << 4)	; 8
	.byte (SLOT_COINS << 4)	; 9
	.byte (SLOT_ENEMY << 4)	; 10
	.byte (SLOT_LUCK7 << 4)	; 11
	.byte (SLOT_COIN1 << 4)	; 12
	.byte (SLOT_COINS << 4)	; 13
	.byte (SLOT_ENEMY << 4)	; 14
	.byte (SLOT_LUCK7 << 4)	; 15
	.byte (SLOT_COIN1 << 4)	; 16 (for wrap-around, must be same as 0)



Reel_DefAddrs:
	.word Reel1_Defs, Reel2_Defs, Reel3_Defs
	
Reel_ImageIndexAddrs:
	.word entity_var1, entity_var2, entity_var3
	
Reel_PositionAddrs:
	.word entity_var10, entity_var11, entity_var12
	
ReelPal_PerImage:
	.byte SPR_PAL3 | SPR_BEHINDBG	; SLOT_COIN1
	.byte SPR_PAL3 | SPR_BEHINDBG	; SLOT_COINS
	.byte SPR_PAL1 | SPR_BEHINDBG	; SLOT_ENEMY
	.byte SPR_PAL1 | SPR_BEHINDBG	; SLOT_LUCK7

; Var1-3 - Reel 1-3 index / position -- See DelfinoSlots_MoveReel
; Var10-12 -- reel Y position, bit 7 means to lock the reel when at zero, bit 6 means reel is locked

; Var4 is current reel 0-2

ObjNorm_DelfinoSlots42:
	LDA <Player_HaltGame
	BNE DelfinoReel_SkipSound	; If gameplay halted, jump to DelfinoReel_SkipSound (to draw the reels)

	; Give coins if there's a prize left to give...
	LDA entity_var6,X
	ORA entity_var7,X
	BEQ DelfinoSlots_NotGivingPrize	; If Var6/7 = 0, no prize to give, jump to DelfinoSlots_NotGivingPrize

	; Still giving out coins...
	LDA entity_var6,X
	SUB #1
	STA entity_var6,X
	LDA entity_var7,X
	SBC #0
	STA entity_var7,X
	
	INC Coins_Earned

	; Every 8 coins, play coin sound, do coin effect
	LDA entity_var6,X
	AND #7
	BNE DelfinoSlots_NoCoinEffect

	LDA #SND_LEVELCOIN
	STA Sound_QLevel1

DelfinoSlots_NoCoinEffect:
	LDA entity_var6,X
	ORA entity_var7,X
	BNE DelfinoSlots_NotZeroCoins	; If still coins to give, not restarting reels yet...

	LDA #$40
	STA entity_timer,X
	
DelfinoSlots_NotZeroCoins:
	JMP DelfinoReel_SkipSound	; Jump to DelfinoReel_SkipSound (to draw the reels)

DelfinoSlots_NotGivingPrize:
	LDA entity_timer,X
	CMP #1
	BNE DelfinoSlots_NoReelRestart
	JMP DelfinoSlots_RestartReels	; If timer = 1, jump to DelfinoSlots_RestartReels
	
DelfinoSlots_NoReelRestart:
	BGE DelfinoReel_SkipSound	; If timer active, jump to DelfinoReel_SkipSound (to draw the reels)


	; Let's check if ALL of the reels are stopped,
	; in which case we need to enter a prize mode
	LDA entity_var10,X
	AND entity_var11,X
	AND entity_var12,X
	CMP #%11000000
	BEQ DelfinoSlots_CalculatePrize		; If bit 6 and 7 are set on ALL reel positions, all are fully stopped, jump to DelfinoSlots_CalculatePrize

	JSR Object_DeleteOffScreen_N2

	LDA SndCur_Player
	BEQ DelfinoReel_SoundOK
	CMP #SND_PLAYERPOWER
	BNE DelfinoReel_SkipSound

DelfinoReel_SoundOK:
	LDA Sound_QPlayer
	ORA #SND_PLAYERPOWER
	STA Sound_QPlayer

DelfinoReel_SkipSound:
	LDA #0
	JSR DelfinoSlots_MoveReel
	LDA #1
	JSR DelfinoSlots_MoveReel
	LDA #2
	JSR DelfinoSlots_MoveReel

	JSR DelfinoSlot_Draw

	RTS


	; Since the reels stop with Y offset = 0, we'll go by the top icon
	; Thus, we need bits 4 and 5 from the reel position/index variables...

	; To make reward calculation logic simple, we'll weight the different
	; reel images like this:
	; Coin - bits 0-1
	; Many - bits 2-3
	; Boos - bits 4-5
	; 7s   - bits 6-7
	
	; The base value will always be 1, so, by addition --
	; * If we have 1-3 coin images, we'll have the values 1, 2, or 3.
	; * If we have 1-3 many coin images, we'll have values 4, 8, or 12.
	; * If we have 1-3 boo images, we'll have values 16, 32, or 48.
	; * If we have 1-3 "7" images, we'll have values 64, 128, or 192.
	
	; That means if we have some mismatched sets (e.g. a single coin and
	; a many coin), we won't get one of the valid matching values, and
	; we can reject that...
	
	; Since the 7s act as a sort of wild card, we'll only consider bits
	; 0 through 5 for the base. We'll consider number of 7s (determined
	; by the most significant 2 bits) after we have a base.
	
	; Pretty nifty, huh?

DelfinoSlots_ImageWeight:
	.byte %00000001	; SLOT_COIN1
	.byte %00000100	; SLOT_COINS
	.byte %00010000	; SLOT_ENEMY
	.byte %01000000	; SLOT_LUCK7

 
	; Prize award (negative for those nasty Boos)
DelfinoSlots_CoinLevel_L:
	.byte LOW(10), LOW(100), LOW(-1), LOW(300)
DelfinoSlots_CoinLevel_H:
	.byte HIGH(10), HIGH(100), HIGH(-1), HIGH(300)

DelfinoSlots_WeightPrizeJumps:
	.byte 1,  0		; Coin, single reel (2 wild 7s)
	.byte 2,  0		; Coin, double reel (1 wild 7)
	.byte 3,  0		; Coin, all three reels
	.byte 4,  1		; Many coin, single reel (2 wild 7s)
	.byte 8,  1		; Many coin, double reel (1 wild 7)
	.byte 12, 1		; Many coin, all three reels
	.byte 16, 2		; Boo, single reel (2 wild 7s)
	.byte 32, 2		; Boo, double reel (1 wild 7)
	.byte 48, 2		; Boo, all three reels
	.byte 0,  3		; Checking zero because we're not checking bit 6/7 results; so if no other weight was added, must be all 7s!
DelfinoSlots_PrizeJumpsEnd
   
DelfinoSlots_CalculatePrize:
	LDA entity_var1,X
	;AND #%00111111
	;ORA #%00000000
	;STA entity_var1,X
	;LDA entity_var2,X
	;AND #%00111111
	;ORA #%00000000
	;STA entity_var2,X
	;LDA entity_var3,X
	;AND #%00111111
	;ORA #%00000000
	;STA entity_var3,X


	; Start with zero weight
	LDA #0
	STA <var1

	; Sum all of the reel prize weights
	LDA entity_var1,X
	JSR DelfinoSlots_AddPrizeWeight
	LDA entity_var2,X
	JSR DelfinoSlots_AddPrizeWeight
	LDA entity_var3,X
	JSR DelfinoSlots_AddPrizeWeight

	; Now for the matching rules, in English:
	;	3 7s	= 300 coins
	;	3 Many	= 100 coins
	;	3 1s	= 10 coins
	;	3 Boos	= Damage, unless small
	;
	;	A single 7 with two matching icons gives the prize -- e.g. 7 1 1 = 10
	;	A double 7 with a single icon gives double -- e.g. 7 7 1 = 20
	
	; Iterate through DelfinoSlots_WeightPrizeJumps to find out what prize
	; (if any) is to be awarded...
	LDA <var1
	AND #%00111111	; Don't include bit 6/7 because they can be used as wild/doublers; if this is zero, it's an all 7 match!
	STA <var2
	
	LDX #0
DelfinoSlots_PrizeCheckLoop:
	
	; Check if the weight matches this prize jump...
	LDA DelfinoSlots_WeightPrizeJumps,X
	CMP <var2
	BEQ DelfinoSlots_WinPrize	; If this is the prize here, jump to DelfinoSlots_WinPrize
	
	INX
	INX		; X += 2 (2 bytes per DelfinoSlots_WeightPrizeJumps entry)
	CPX #(DelfinoSlots_PrizeJumpsEnd - DelfinoSlots_WeightPrizeJumps)
	BNE DelfinoSlots_PrizeCheckLoop		; If we haven't checked all possibilities, jump to DelfinoSlots_PrizeCheckLoop
	
	LDA #SND_MAPDENY
	STA Sound_QMap
	
	LDX <entity_index

	LDA #$40
	STA entity_timer,X

	JMP DelfinoReel_SkipSound	; Jump to DelfinoReel_SkipSound (to draw the reels really)


DelfinoSlots_WinPrize:

	; We've found a winner!!

	; For either of the coin prizes, a double can take place
	; if two reels are 7s, which incidentally is easily determined
	; by checking the sign bit of var1 (since the bit weight
	; addition result of the two 7s will result in %10000000),
	; which results in a doubling of the prize!
	
	; But let's see what we have here...
	LDY DelfinoSlots_WeightPrizeJumps+1,X	; Get the coin prize index

	LDX <entity_index

	LDA DelfinoSlots_CoinLevel_L,Y	; Get low byte of coin prize
	STA <var3					; -> var3
	LDA DelfinoSlots_CoinLevel_H,Y	; Get hight byte of coin prize
	STA <var4					; -> var4
		
	; Doubling of the coin prize only comes from "coin" reels, so
	; Y = 0 or Y = 1... a little hacky
	CPY #2
	BGE DelfinoReel_NoDoubling
	
	; This is a lower coin prize, subject to doubling
	LDA <var1
	; Since the only possibility of being here is if we have 0, 1, or 2 
	; reels with a "7" on it, the result in var1 will be %10xxxxxx,
	; so we can just check sign. More comment than instruction, eh?
	BPL DelfinoReel_NoDoubling	; If we don't have two 7 reels, jump to DelfinoReel_NoDoubling
	
	; Double prize!
	ASL <var3
	ROL <var4	; Not really needed, but most correct...
	
DelfinoReel_NoDoubling:
	; If the coin result is negative, we got Boo reels, which (may) be damaging!
	LDA <var4
	BPL DelfinoSlots_RewardNotBoo	; If not negative, jump to DelfinoSlots_RewardNotBoo
	
	LDA #SND_MAPDENY
	STA Sound_QMap
	
	; Boo reward! Hurt player! (Only if not small)
	LDA <player_powerup
	BEQ DelfinoSlots_DontHurt	; If Player is already small, jump to DelfinoSlots_RewardEnd
	
	; Otherwise, hurt player!
	JSR Player_GetHurt	
	
DelfinoSlots_DontHurt:
	JMP DelfinoSlots_RewardEnd
	
DelfinoSlots_RewardNotBoo:
	; Coin prize, yay!
	LDA <var3
	STA entity_var6,X
	LDA <var4
	STA entity_var7,X
	
DelfinoSlots_RewardEnd:
	LDA #$40
	STA entity_timer,X

	JMP DelfinoReel_SkipSound

DelfinoSlots_AddPrizeWeight:
	AND #%11000000
	ASL A
	ROL A
	ROL A
	TAY
	LDA DelfinoSlots_ImageWeight,Y
	ADD <var1
	STA <var1
	RTS

DelfinoSlots_RestartReels
	; Restart reels!
	LDA entity_var10,X
	AND #%00111111
	STA entity_var10,X
	LDA entity_var11,X
	AND #%00111111
	STA entity_var11,X
	LDA entity_var12,X
	AND #%00111111
	STA entity_var12,X
	RTS
	
DelfinoSlots_MoveReel:
	; Everything about these damn reels is a pain in the ass!
	; I probably should have done this differently...
	; All this just for a gag (reel ... hur)
	; Because everyone hates the Sunshine Reels.
	; YEAH!

	; Time for some rotten 6502!

	; Change input to 2 byte index
	ASL A
	TAY		; -> 'Y'
	
	; Store address to reel images -> var1/2
	LDA Reel_DefAddrs,Y		; Low byte of reel image array
	STA <var1
	LDA Reel_DefAddrs+1,Y	; High byte of reel image array
	STA <var2

	; Store address of reel's index and images -> var3/4
	LDA Reel_ImageIndexAddrs,Y
	ADD <entity_index
	STA <var3
	LDA Reel_ImageIndexAddrs+1,Y
	ADC #0
	STA <var4

	; Store address of reel's Y position -> var5/6
	LDA Reel_PositionAddrs,Y
	ADD <entity_index
	STA <var5
	LDA Reel_PositionAddrs+1,Y
	ADC #0
	STA <var6

	; var1/2 point to the array of reel images, if we advance

	; var3/4 point to the value that holds the index and images:
	; Bits 0-3 -- index into reel array
	; Bits 4-5 -- top reel image
	; Bits 6-7 -- bottom reel image

	; var5/6 point to the address of the reel's Y position
	
	; OKAY so what we need to do is:
	;	- advance the reel Y position
	;	- if it reaches 16, we reset to zero
	;	- ... increment the index
	;	- ... and fetch new top and bottom images
	
	LDY #0
	
	LDA [var5], Y
	CMP #%11000000			; Bit 7 is "going to stop" and bit 6 is "stopped", which should happen at Y offset zero
	BEQ ReelYUpdate_NoChange	; If this reel is already stopped, jump to ReelYUpdate_NoChange
	
	ADD #1
	CMP #%10010000		; Because the "AND" below won't ever be zero, need to check explicitly...
	BEQ Reel_NeedToStop	; If we're at stop position, jump to Reel_NeedToStop!
	AND #%10001111		; Wrap every 16 pixels, preserve bit 7 in case we're supposed to stop
	BNE ReelYUpdate_NoChange	; If we're non-zero, we haven't hit the bottom of the reel yet, jump to ReelYUpdate_NoChange

Reel_NeedToStop:
	; We've wrapped!
	; Increment the index...
	LDA [var3], Y
	ADD #1				; Next index
	AND #%00001111		; Lower bits hold the current index
	TAY					; -> 'Y'
	
	; Use this to fetch the new reel images
	LDA [var1], Y	; Pre-shifted reel
	ASL A
	ASL A				; It's pre-shifted to bits 4-5, need to be in 6-7
	STA <var8		; Reel image we're at -> var8 (for top)
	
	INY		; Next image in reel
	
	LDA [var1], Y
	ORA <var8		; Reel image coming up next -> var9 (for bottom)
	STA <var8		; Combine into var8
	
	; Merge!
	DEY		; Return to current index
	TYA		; -> 'A'
	ORA <var8		; Merge in the image indexes

	LDY #0
	STA [var3], Y	; Store into reel positions!
	
	; Check if we were supposed to stop
	LDA [var5], Y
	BPL DelfinoReel_NotStopping		; If bit 7 is not set, jump to DelfinoReel_NotStopping
		
	; We're stopping!
	LDA #%11000000
	BNE ReelYUpdate_NoChange	; Jump (technically always) to ReelYUpdate_NoChange	
	
DelfinoReel_NotStopping:
	; Reel Y position should be zero now...
	LDA #0

ReelYUpdate_NoChange:
	STA [var5], Y

	RTS


DelfinoSlot_Draw:
	
	; Keep track of what reel we're on so Player can hit it...
	LDA #0
	STA <entity_var4,X
	
	; REEL 1

	; Slot sprite offsets
	LDA entity_var1,X
	JSR DelfinoSlots_SetFrAndPal
		
	; Get sprite base that actually belongs to this object normally
	TXA
	JSR Object_StealAdjSprite_DS
	
	; Use sprite 1, 2, 3, and 4 of this object
	STY <var11
	TYA
	ADD #(4 * 2)
	STA <var12

	LDA <var12
	PHA		; Save var12; it will get damaged in DelfinoSlot_DrawSlot by the collision check
			
	; Draw it!
	LDA entity_var10,X
	AND #%00111111		; Bit 6 & 7 are stop indicators
	STA <var1
	JSR_THUNKA 41, DelfinoSlot_DrawSlot

	; REEL 2
	INC <entity_var4,X
	
	LDA entity_var2,X
	JSR DelfinoSlots_SetFrAndPal

	; Use sprite 5 and 6...
	PLA		; Restore var12
	ADD #(4 * 2)
	STA <var11

	; Get next object sprite base
	LDA #0
	JSR Object_StealAdjSprite
	
	; Change to last sprite
	TYA
	ADD #(4 * 4)
	STA <var12
	
	; Move over to next reel
	LDA <entity_lo_x,X
	PHA
	ADD #64
	STA <entity_lo_x,X
	LDA <entity_hi_x,X
	PHA
	ADC #0
	STA <entity_hi_x,X

	; Draw it!
	LDA entity_var11,X
	AND #%00111111		; Bit 6 & 7 are stop indicators
	STA <var1
	JSR_THUNKA 41, DelfinoSlot_DrawSlot


	; REEL 3
	INC <entity_var4,X
	
	LDA entity_var3,X
	JSR DelfinoSlots_SetFrAndPal

	; Get 2-over object sprite base
	LDA #1
	JSR Object_StealAdjSprite
	
	; Change to last sprite
	TYA
	ADD #(4 * 4)
	STA <var11

	; Get 3-over object sprite base
	LDA #2
	JSR Object_StealAdjSprite
	
	; Change to last sprite
	TYA
	ADD #(4 * 4)
	STA <var12
	
	; Move over to next reel
	LDA <entity_lo_x,X
	ADD #64
	STA <entity_lo_x,X
	LDA <entity_hi_x,X
	ADC #0
	STA <entity_hi_x,X

	; Draw it!
	LDA entity_var12,X
	AND #%00111111		; Bit 6 & 7 are stop indicators
	STA <var1
	JSR_THUNKA 41, DelfinoSlot_DrawSlot
	

	; Restore X
	PLA
	STA <entity_hi_x,X
	PLA
	STA <entity_lo_x,X

	RTS

DelfinoSlots_SetFrAndPal:
	LSR A
	LSR A
	LSR A
	LSR A
	PHA
	AND #%00000011		; Bits 4-5 (top reel image)
	STA <var13
	TAY
	LDA ReelPal_PerImage,Y 
	STA <var9	; Top reel image palette
	
	PLA
	AND #%00001100		; Bits 2-3 (bottom reel image)
	LSR A
	LSR A
	STA <var14
	TAY
	LDA ReelPal_PerImage,Y 
	STA <var10	; Bottom reel image palette

	RTS

ObjHit_DelfinoSlots42:

	; Var4 is current reel 0-2

	; Need to check if this reel is already stopping/stopped,
	; in which case it'll be non-interactive
	LDA <entity_var4,X
	ASL A
	TAY		; Y = 0, 2, 4
	
	; Store address of reel's Y position -> var1/2
	LDA Reel_PositionAddrs,Y
	ADD <entity_index
	STA <var1
	LDA Reel_PositionAddrs+1,Y
	ADC #0
	STA <var2
	
	LDY #0
	
	LDA [var1], Y
	BMI DelfinoReel_AlreadyStop		; If reel already stopping/stopped, jump to DelfinoReel_AlreadyStop
	
	; Mark reel to stop
	ORA #%10000000
	STA [var1], Y
	
	LDA #SND_PLAYERSWIM
	STA Sound_QPlayer
	
	LDA #0
	STA <player_lo_y_velocity
	
DelfinoReel_AlreadyStop:
	RTS


	
ObjNorm_Petey42:
	; Hack: "PatTableSel" cannot support a bank value over 127, so must do so manually
	LDA #139
	STA PatTable_BankSel+5

	LDA <entity_var5,X
	CMP #6
	BGE Petey_NoDraw

	JSR Petey_Draw
	
Petey_NoDraw:
	LDA <Player_HaltGame
	BNE DelfinoReel_AlreadyStop		; If gameplay halted, jump to DelfinoReel_AlreadyStop (RTS)

	LDA entity_state,X
	CMP #OBJSTATE_NORMAL
	BEQ Petey_Normal		; If Petey is in normal state, jump to Petey_Normal

	LDA <entity_var5,X
	CMP #6
	BGE Petey_Normal		; If Petey is already dying, jump to Petey_Normal
	
	JMP Petey_Kill	; Petey's been killed by a weapon, jump to Petey_Kill

Petey_Normal:
	LDA <entity_var5,X
	JSR DynJump
	
	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word Petey_InitWalk	; 0: Start walking
	.word Petey_Walk		; 1: Petey skips towards you
	.word Petey_Jump		; 2: Petey jumps around
	.word Petey_Fly			; 3: Petey flies and swoops
	.word Petey_Divebomb	; 4: Swoop down!
	.word Petey_Stun		; 5: Stop for a second, change tactic
	.word Petey_Killed		; 6: Petey's down!
	.word Mouser_EndLevel		; 7
	.word Mouser_DeadTimeout	; 8

Petey_InitWalk:
	LDA #-$10
	STA <entity_lo_x_velocity,X

	INC <entity_var5,X

Petey_Walk:

	LDA <Counter_1
	ASL A
	ASL A
	AND #$80
	STA <var1
	LDA entity_animation_frame,X
	AND #~$80
	ORA <var1
	STA entity_animation_frame,X
	

	JSR Petey_StandardMove
	
	LDA entity_collision_flags,X
	AND #$04
	BEQ Petey_NotOnGroundW
	
	; Clear on-ground bit so default behavior doesn't occur!
	AND #~$04
	STA entity_collision_flags,X
	
	; On ground; hop a little, change frames
	LDA #-$20
	STA <entity_lo_y_velocity,X
	
	LDA entity_animation_frame,X
	EOR #1
	STA entity_animation_frame,X
		
	LDA #SND_PLAYERBUMP
	STA Sound_QPlayer
	
Petey_NotOnGroundW:
	JMP Petey_Common
	
Petey_Jump:
	JSR Petey_StandardMove

	LDY #$82	; Flap arms for jump
	LDA <entity_lo_y_velocity,X
	BMI Petey_MovingUpward

	; Moving downward, use frame 0
	LDY #0

Petey_MovingUpward:
	TYA
	STA entity_animation_frame,X

	LDA entity_collision_flags,X
	AND #$04
	BEQ Petey_NotOnGroundJ

	; Clear on-ground bit so default behavior doesn't occur!
	AND #~$04
	STA entity_collision_flags,X
	
	; On ground; JUMP!
	LDA #-$50
	STA <entity_lo_y_velocity,X

	LDA #SND_PLAYERJUMPSM
	STA Sound_QPlayer

Petey_NotOnGroundJ:
	JMP Petey_Common

Petey_FlyFrames:	.byte 0, 1, 2, 1

Petey_Fly:
	JSR Petey_StandardMove

	; Clear on ground bit always
	LDA entity_collision_flags,X
	AND #~$04
	STA entity_collision_flags,X

	LDA <Counter_1
	LSR A
	LSR A
	AND #3
	TAY
	LDA Petey_FlyFrames,Y
	STA entity_animation_frame,X

	; If below top, need to fly up
	LDA <entity_sprite_lo_y,X
	CMP #32
	BLT Petey_NoHigher

	; Start flying upwards to -$28
	LDA <entity_lo_y_velocity,X
	CMP #-$28
	BLS Petey_NoHigher
	
	SUB #$08
	STA <entity_lo_y_velocity,X

	JMP Petey_YVelSet

Petey_NoHigher:
	LDA <entity_lo_y_velocity,X
	CMP #0
	BGS Petey_YVelSet
	

Petey_YVelSet:
	LDA entity_timer,X
	BNE Petey_FlyCont

	JSR Level_ObjCalcXDiffs
	LDA <var16
	ADD #4
	CMP #8
	BGE Petey_FlyCont

	; Timeout; dive bomb!
	LDA #$50
	STA <entity_lo_y_velocity,X
	
	LDA #0
	STA <entity_lo_x_velocity,X
	
	INC <entity_var5,X

Petey_FlyCont:
	JMP Petey_Common

Petey_Divebomb:
	JSR Petey_StandardMove

	LDA <Counter_1
	LSR A
	AND #3
	TAY
	LDA Petey_FlyFrames,Y
	ORA #$80
	STA entity_animation_frame,X

	; Timer is zero while dive bombing
	; Non-zero after landing
	; At 1, we end the dive bomb move
	LDA entity_timer,X
	BEQ Petey_NotDiveBombEnd
	CMP #1
	BNE Petey_DiveBombNotOver	; While timer > 0, don't do anything, jump to Petey_DiveBombNotOver
	
	; At exactly 1, we end the dive bomb...
	; Take off again...
	DEC <entity_var5,X

	; Delay before doing that again
	LDA #$80
	STA entity_timer,X

	JMP Petey_FacePlayerAndMove

Petey_NotDiveBombEnd:
	LDA entity_collision_flags,X
	AND #$04
	BEQ Petey_DiveBombNotOver

	; Vibrate level!
	LDA #$0c
	STA Level_Vibration

	; Ba-boom! sound
	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1

	; Stall on ground a moment
	LDA #$40
	STA entity_timer,X

Petey_DiveBombNotOver:
	JMP Petey_Common

Petey_Stun:
	LDA #0
	STA <entity_lo_x_velocity,X
	JSR Petey_StandardMove
	
	LDA entity_timer,X
	BNE Petey_StillStunned
	
	LDA entity_var2,X
	ADD #1
	STA <entity_var5,X		; So go to state 2, 3, ...

	; Mainly to let flight actually take place (state 3)
	LDA #$10
	STA entity_timer,X

	JSR Petey_FacePlayerAndMove
	
Petey_StillStunned:
	JMP Petey_Common

Petey_FacePlayerAndMove:
	JSR Level_ObjCalcXDiffs

	; Face Player
	LDA Mouser_FlipTowardsPlayer,Y
	STA entity_flipped_animation,X

	LDA Petey_JumpSpeed,Y
	STA <entity_lo_x_velocity,X

	RTS

Petey_JumpSpeed:	.byte $20, -$20

Petey_StandardMove:
	JSR Object_Move41

Petey_MoveProtection:
	LDA <entity_hi_x,X
	BPL Petey_NotOffLeft

	; Off left, block and reverse
	LDA #0
	STA <entity_lo_x,X
	STA <entity_hi_x,X
	
	JMP Petey_TurnAround

Petey_NotOffLeft:
	LDA <entity_lo_x,X
	CMP #(256-32)
	BLT Petey_NotOffRight
	
	LDA #(256-32)
	STA <entity_lo_x,X
	
	JMP Petey_TurnAround
	
Petey_NotOffRight:
	RTS

Petey_TurnAround:
	LDA <entity_lo_x_velocity,X
	NEG
	STA <entity_lo_x_velocity,X

	LDA entity_flipped_animation,X
	EOR #SPR_HFLIP
	STA entity_flipped_animation,X

	RTS

Petey_Common:
	LDA entity_collision_flags,X
	AND #$04
	BEQ Petey_NotHitFloor
	
	JSR Object_HitGround
	
Petey_NotHitFloor:

	LDA entity_collision_flags,X
	AND #$03
	BEQ Petey_NotHitWall

	JSR Petey_TurnAround

Petey_NotHitWall:
	LDA <entity_var5,X
	CMP #5
	BGE Petey_PlayerNoHit	; If Petey's stunned, dying, etc., jump to Petey_PlayerNoHit
	
	LDA Objects_ColorCycle,X
	BNE Petey_PlayerNoHit	; If color cycling, jump to Petey_PlayerNoHit

	; Thunk for correct lookups
	JSR_THUNKA 41, Object_HandleBumpUnderneath

	LDA Objects_PlayerHitStat,X
	BEQ Petey_PlayerNoHit	 ; If Player is not hitting Petey at all, jump to Petey_PlayerNoHit (RTS)

	LDA <player_lo_y_velocity
	BMI Petey_PlayerNoHit	 ; If Player is moving upward, jump to Petey_PlayerNoHit (RTS)

	; Play squish sound
	LDA #SND_PLAYERSWIM
	STA Sound_QPlayer

	; Get 1000, 2000, or 4000 points
	INC entity_var2,X
	LDA entity_var2,X	; 1, 2, 3
	ADD #$08
	JSR Score_PopUp

	; Player Y Vel = -$30 (bounce off)
	LDA #-$30
	STA <player_lo_y_velocity
	
	LDA entity_var2,X	; 1, 2, 3
	CMP #3
	BLT Petey_NotDead

	; 3 stomps, we're done
	; Dead!

Petey_Kill:	
	LDA #6
	STA <entity_var5,X

	LDA #1
	STA Level_TimerEn

	LDA #$40
	STA entity_timer,X

	; Recycle Boom Boom's cool effect
	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1
	JMP_THUNKA 3, Explode_Stars


Petey_NotDead:
	LDA #$60
	STA Objects_ColorCycle,X
	
	LDA #$40
	STA entity_timer,X
	
	; Jump to state 5
	LDA #5
	STA <entity_var5,X
	

Petey_PlayerNoHit:
	RTS

Petey_Killed:
	LDA <Map_EnterViaID
	CMP #MAPOBJ_DAREDEVILCOMET
	BNE Petey_NotDDComet
	
	JMP_THUNKC 30, Level_EndComet

Petey_NotDDComet:

	LDA entity_timer,X
	BNE Petey_KillWait

	LDA World_Num
	CMP #9
	BEQ Petey_NoFanfare	; No fanfare on World Zero

	; Victory fanfare
	LDA Sound_QMusic1
	ORA #MUS1_BOSSVICTORY
	STA Sound_QMusic1
	
Petey_NoFanfare:
	INC <entity_var5,X

Petey_KillWait:
	RTS

Petey_BodyPatternByFrame:	.byte $D1, $D7, $DD

	; This one can stay in 42 since it's a custom job!
Petey_Draw:

	; Oh Petey...
	
	; Head is HUGE 32x32 -- 8 sprites (2 rows, 4 each)
	; Body is 24x16 -- 3 sprites
	
	; Screw even trying to do visibility checks :P
	; Petey, you shall live in a fixed, non-scrolling single screen forever

	LDA Objects_ColorCycle,X
	BEQ Petey_NotFlashing
	DEC Objects_ColorCycle,X
Petey_NotFlashing:

	JSR Object_CalcSpriteXY_NoHi

	; var4 sets mouth closed or open (0 or 8)
	; Bit 7 of frame sets this
	LDA entity_animation_frame,X
	AND #$80
	LSR A
	LSR A
	LSR A
	LSR A
	STA <var4

	; HEAD UPPER HALF

	; Petey's standard sprites first...
	LDY Object_SprRAM,X
		
	LDA #0
	STA <var3	; 0 or SPR_VFLIP for bottom half of head
	
	LDA <entity_sprite_lo_x,X
	STA <var11
	LDA <entity_sprite_lo_y,X
	STA <var12
		
	JSR Petey_DrawHeadHalf

	
	; HEAD LOWER HALF
	
	; Object+1 slot sprites...
	LDA #0
	JSR Object_StealAdjSprite
	
	LDA #SPR_VFLIP
	STA <var3
	
	LDA <entity_sprite_lo_x,X
	STA <var11
	LDA <entity_sprite_lo_y,X
	ADD #16
	STA <var12
		
	JSR Petey_DrawHeadHalf
	
	
	; BODY
	
	; Petey body patterns start at $D1 + (Frame * 3)
	LDA entity_animation_frame,X
	AND #%01111111	; Bit 7 is mouth open/closed
	TAY
	LDA Petey_BodyPatternByFrame,Y
	STA <var1
	
	; Object+2 slot sprites...
	LDA #1
	JSR Object_StealAdjSprite
		
	LDA <entity_sprite_lo_x,X
	ADD #8
	STA <var11
	LDA <entity_sprite_lo_y,X
	ADD #31
	STA <var12
			
	; Normally incrementing forward, 2 patterns at a time
	LDA #2
	STA <var2
	
	LDA entity_flipped_animation,X
	AND #SPR_HFLIP
	BEQ Petey_BodyNotHFlipped	; If not horizontally flipped, jump to Petey_BodyNotHFlipped
	
	; If horizontally flipped, start at end, go in reverse
	LDA <var1
	ADD #4
	STA <var1
	
	LDA #-2
	STA <var2

	; Move body over
	LDA <var11
	SUB #8
	STA <var11	
	
Petey_BodyNotHFlipped:
		

	LDA #3
	STA <var10
Petey_BodyLoop:
	
	; Y
	LDA <var12
	STA Sprite_RAM+$00,Y
	
	; Pattern
	LDA <var1
	STA Sprite_RAM+$01,Y
	
	ADD <var2
	STA <var1		; Pattern += var2
	
	; Attribute
	LDA Objects_SprAttr,X
	ORA entity_flipped_animation,X
	STA Sprite_RAM+$02,Y
	
	; X
	LDA <var11
	STA Sprite_RAM+$03,Y

	ADD #8
	STA <var11		; Sprite X += 8

	; Y += 4
	INY
	INY
	INY
	INY
	
	DEC <var10			; var10--
	BNE Petey_BodyLoop		; While var10 > 0, loop!

	; No real good bbox for Petey, so offset his hit detection down 8
	LDA <entity_sprite_lo_y,X
	ADD #8
	STA <entity_sprite_lo_y,X	

	RTS

Petey_DrawHeadHalf:
	; var3 is vertical flip or not (as in, bottom half of head)
	; var4 is open or closed mouth (0 or 8)
	; var11 is Sprite X
	; var12 is Sprite Y
	; 'Y' is offset into Sprite_RAM


	; Petey head patterns start at $C1 for closed mouth, $C9 for open mouth
	LDA #$C1
	ADD <var4
	STA <var1
	
	; Normally incrementing forward, 2 patterns at a time
	LDA #2
	STA <var2
	
	LDA entity_flipped_animation,X
	AND #SPR_HFLIP
	BEQ Petey_HeadNotHFlipped	; If not horizontally flipped, jump to Petey_HeadNotHFlipped
	
	; If horizontally flipped, start at end, go in reverse
	LDA <var1
	ADD #6
	STA <var1
	
	LDA #-2
	STA <var2
	
Petey_HeadNotHFlipped:

	LDA #4
	STA <var10
Petey_HeadHalfLoop:
	
	; Y
	LDA <var12
	STA Sprite_RAM+$00,Y
	
	; Pattern
	LDA <var1
	STA Sprite_RAM+$01,Y
	
	ADD <var2
	STA <var1		; Pattern += var2
	
	; Attribute
	LDA Objects_ColorCycle,X
	AND #3
	EOR #3		; Idle at palette 3
	ORA entity_flipped_animation,X
	ORA <var3
	STA Sprite_RAM+$02,Y
	
	; X
	LDA <var11
	STA Sprite_RAM+$03,Y

	ADD #8
	STA <var11		; Sprite X += 8

	; Y += 4
	INY
	INY
	INY
	INY
	
	DEC <var10			; var10--
	BNE Petey_HeadHalfLoop	; While var10 > 0, loop!

	RTS

ObjInit_Mouser42:
	; The colors
	LDA #$25
	STA Palette_Buffer+$19
	STA Pal_Data+$19
	LDA #$10
	STA Palette_Buffer+$1A
	STA Pal_Data+$1A
	LDA #$0F
	STA Palette_Buffer+$1B
	STA Pal_Data+$1B

	; Give Mouser 3 hits
	LDA #2
	STA Objects_HitCount,X

	RTS

ObjNorm_Mouser42:
	; Hack: "PatTableSel" cannot support a bank value over 127, so must do so manually
	LDA #135
	STA PatTable_BankSel+5

	LDA entity_state,X
	CMP #OBJSTATE_KILLED
	BEQ Mouser_Killed		; Mouser got killed, jump to Mouser_Killed

	LDA <entity_var5,X
	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word Mouser_WaitForPlayer	; 0
	.word Mouser_Alive			; 1
	.word Mouser_EndLevel		; 2
	.word Mouser_DeadTimeout	; 3
	.word Mouser_Jump			; 4

Mouser_Killed:
	JSR_THUNKA 41, Mouser_Draw

	LDA #1
	STA Level_TimerEn
	STA <entity_var5,X

	; Mouser's dying!
	; While Mouser is dying, we're going to stop him from just falling off
	; because we want to play some victory music and convert time -> bonus
	LDA entity_hi_y,X
	BEQ Mouser_KilledNotLow	; If not Y Hi = 1 yet, jump to Mouser_KilledNotLow

	LDA entity_lo_y,X
	AND #$F0
	CMP #$C0
	BNE Mouser_KilledNotLow	; If Mouser's not real low yet, jump to Mouser_StillAlive

	; Whoop!  Mouser is low, let's change

	; Destroy remaining Bob-ombs or anything else that might be there
	JSR Boss_DestroyOtherObjects

	LDA World_Num
	CMP #9
	BEQ Mouse_WZero_NoFanfare	; On World Zero, no victory fanfare

	; Victory fanfare
	LDA Sound_QMusic1
	ORA #MUS1_BOSSVICTORY
	STA Sound_QMusic1

Mouse_WZero_NoFanfare:
	; Go into normal state for bonus countdown
	LDA #OBJSTATE_NORMAL
	STA entity_state,X
	
	; CHECKME state number
	INC <entity_var5,X
	
Mouser_KilledNotLow:
	RTS


Mouser_WaitForPlayer:
	JSR Object_DetermineHorzVis	 ; Determine horizontal visibility of Mouser's sprites
	JSR Object_DetermineVertVis	 ; Determine vertical visibility of Mouser's sprites
	JSR Object_AnySprOffscreen
	BNE Mouser_DoNothing	 ; If any of Mouser's sprites are off-screen, jump to Mouser_DoNothing

	; Boss music!
	LDA #MUS2B_BOSS
	STA Sound_QMusic2
	
	; Lock horizontal scrolling
	INC LevelJctBQ_Flag

	INC <entity_var5,X

Mouser_DoNothing:
	RTS

Mouser_HopXVel:	.byte $40, -$40

Mouser_FlipTowardsPlayer:	.byte SPR_HFLIP, $00
Mouser_WalkXVel:	.byte -$10, $10

Mouser_Alive:
	JSR_THUNKA 41, Mouser_Draw

	LDA <Player_HaltGame
	BNE Mouser_KilledNotLow	; If gameplay is halted, jump to Mouser_KilledNotLow (RTS)

	LDA Objects_ColorCycle,X
	BNE Mouser_HitDance		; If Mouser got hit, jump to Mouser_HitDance

	LDA entity_var3,X
	BEQ Mouser_NotThrown	; If Var3 (Mouser's throw timer) is zero, jump to Mouser_NotThrown
	
	; Set Mouser's frame to 3 (throw ready)
	LDA #3
	STA entity_animation_frame,X
	
	DEC entity_var3,X	; Decrement throw timer
	BNE Mouser_FacePlayer	; If throw timer is not zero, jump to Mouser_FacePlayer

	; Throw timer is zero; hurl Bob-omb!
	JSR Mouser_HurlBobomb
	
	; Re-initialize walk timer
	LDA RandomN
	AND #$3F
	ADD #120
	STA entity_var2,X

Mouser_NotThrown:
	LDA entity_var2,X
	BNE Mouser_WalkTimerNotZero	; If Var2 (Mouser's walk timer) is not zero, jump to Mouser_WalkTimerNotZero
	
	; Walk timer is zero, initialize throw timer
	LDA #10
	STA entity_var3,X

Mouser_WalkTimerNotZero:
	DEC entity_var2,X	; Decrement walk timer

	LDY <entity_var4,X		; Y = walking direction flag
	LDA Mouser_WalkXVel,Y	; Get walking velocity
	STA entity_lo_x_velocity,X
	
	; Do standard movements
	JSR Object_Move41	; Need to thunk so lookups are right
	
	LDA <entity_collision_flags,X
	AND #$03
	BNE Mouser_HitWall	; If Mouser hit wall, jump to Mouser_HitWall
	
	LDA <entity_collision_flags,X
	AND #$04
	BNE Mouser_WalkingOnFloor	; As long as Mouser is touching floor, jump to Mouser_WalkingOnFloor

Mouser_HitWall:
	; Failing that, turn around
	LDA entity_lo_x_velocity,X
	NEG
	STA entity_lo_x_velocity,X
	JSR Object_ApplyXVel
	JSR Object_ApplyXVel	; Force step back
	
	; Reverse walk flag
	LDA <entity_var4,X
	EOR #1
	STA <entity_var4,X

Mouser_WalkingOnFloor:
	JSR Object_HitGround

	; Should be one of the walking frames only
	LDA entity_animation_frame,X
	AND #1
	STA entity_animation_frame,X


	JSR Object_ToggleFrameBySpd


Mouser_FacePlayer:
	JSR Level_ObjCalcXDiffs

	; Face Player
	LDA Mouser_FlipTowardsPlayer,Y
	STA entity_flipped_animation,X

	JSR Mouser_CheckJump

	RTS
	
Mouser_HitDance:
	; Mouser's hit!  "Dance" a little
	LDA #2
	STA entity_animation_frame,X
	
	LDA <Counter_1
	ASL A
	ASL A
	ASL A
	AND #SPR_HFLIP
	STA entity_flipped_animation,X
	
	RTS
	
Mouser_CheckJump:
	LDA entity_var6,X
	BEQ Mouser_ResetJumpCnt

	DEC entity_var6,X
	BNE Mouser_NotJumping

	; Mouser jumps!
	LDA <entity_sprite_lo_x,X
	AND #$80
	ASL A
	ROL A	
	TAY		; Y = 0 or 1, depending on if Mouser is on left or right side
	LDA Mouser_HopXVel,Y
	STA entity_var6,X	; Change Var6 to velocity setting for jump
	
	LDA #-$50
	STA <entity_lo_y_velocity,X
	
	LDA #4
	STA <entity_var5,X

	RTS
	
Mouser_ResetJumpCnt:
	LDA #250
	STA entity_var6,X

Mouser_NotJumping:
	RTS



Mouser_HurlBobomb:
	JSR PrepareNewObjectOrAbort

	; It's a Bob-omb!!
	LDA #OBJ_BOBOMBEXPLODE
	STA entity_type,X

	; Bobomb's Timer3 = $80
	LDA #$80
	STA entity_timer_secondary,X

	INC entity_var7,X	 ; Bob-omb's Var7++
	INC entity_var1,X	 ; Bob-omb's Var1++

	LDY <entity_index	 ; Y = Mouser's object slot index

	; Set Bob-omb's Y
	LDA entity_lo_y,Y
	ADD #$10
	STA <entity_lo_y,X
	LDA entity_hi_y,Y
	ADC #$00
	STA <entity_hi_y,X

	; Set Bob-omb's Y velocity
	LDA #-$30
	STA <entity_lo_y_velocity,X

	LDA Objects_SprAttr,X
	AND #SPR_HFLIP
	PHP

	LDA #$10	 ; A = $10
	LDY #$0b	 ; Y = $0B
	
	PLP
	BNE Mouser_HurlRight	 ; If this is a right-shot Bob-omb, jump to Mouser_HurlRight

	DEY		 ; Y = $0A
	LDA #-$10	 ; A = -$10

Mouser_HurlRight:
	STY <var1	 ; var1 = $0A or $0B
	STA <entity_lo_x_velocity,X	 ; Set Bob-omb's X velocity (-$10 or $10)

	ASL A		 ; Shift sign bit into carry

	; var2 = $00 (16-bit sign extension)
	LDA #$FF
	STA <var2

	LDY <entity_index	 ; Y = Mouser's object slot index

	; Set Bob-omb's X
	LDA #-$08	 ; A = $08
	BCC Mouser_BCFC	 ; If this is a right-shot Bob-omb, jump to Mouser_BCFC
	LDA #$08	 ; A = -$08
	INC <var2	 ; var2 = $00 (16-bit sign extension)
Mouser_BCFC:
	ADD entity_lo_x,Y
	STA <entity_lo_x,X
	LDA entity_hi_x,Y
	ADC <var2	
	STA <entity_hi_x,X


Mouser_BD09:
	; Set Bob-omb attributes
	LDA #SPR_PAL3
	STA Objects_SprAttr,X
	RTS


Mouser_EndLevel:
	JSR DoTimeBonus	 ; Convert remaining time into score
	BNE Mouser_StillTimering	 ; If not done converting, jump to PRG003_A910 (RTS)

	; Set timer to $40
	LDA #$40
	STA entity_var1,X
	
	INC <entity_var5,X

Mouser_StillTimering:
	RTS


Mouser_DeadTimeout:
	DEC entity_var1,X
	BNE Mouser_StillTimering

	LDA World_Num
	CMP #9
	BNE Mouser_NotWZeroExit


	; Multiple bosses use this, so there's different arena clears
	LDY #(Arena42Clears_End - Arena42Clears - 1)
ArenaClear_Loop:
	LDA Arena42Clears,Y
	CMP entity_type,X
	BEQ Arena_Clear
	
	DEY
	BPL ArenaClear_Loop

Arena_Clear:
	; Clear Arena Door 1
	INY		; Because lowest is actually arena 1 (starting from 0)
	STY <var1
	JSR_THUNKA 41, ArenaCtl_ExitBoss
	JMP Object_Delete

Arena42Clears:
	;	Arenea 0 (would be Birdo, but Birdo doesn't use this routine)
	.byte OBJ_BOSS_MOUSER		; Arena 1 (starting at 0)
	.byte OBJ_BOSS_BIGBOO2		; Arena 2
	.byte 0						; Arena 3 (would be Reznor, but Reznor doesn't use this routine)
	.byte OBJ_BOSS_TOTOMESU		; Arena 4
	.byte OBJ_BOSS_PETEY		; Arena 5
Arena42Clears_End

Mouser_NotWZeroExit:
	; Exit to map!
	
ExitLevel_InvalidateCP37:
	; Invalidate the checkpoint for this Player
	JSR_THUNKC 30, Object_InvalidateCP

	; Timer done, exit!
	LDA #0
	STA Map_ReturnStatus

	INC Level_ExitToMap
	RTS

Boss_DestroyOtherObjects:
	LDX #$04	 ; X = 4
Mouser_BEFC:
	LDA entity_state,X
	BEQ Mouser_BF4B	 ; If object slot is dead/empty, jump to Mouser_BF4B

	LDA entity_type,X
	CMP #OBJ_BOSS_MOUSER
	BEQ Mouser_BF4B	 ; If this is Mouser, jump to  Mouser_BF4B
	CMP #OBJ_BOSS_BIGBOO1
	BEQ Mouser_BF4B	 ; If this is Big Boo, jump to  Mouser_BF4B
	CMP #OBJ_BOSS_BIGBOO2
	BEQ Mouser_BF4B	 ; If this is Big Boo, jump to  Mouser_BF4B
	CMP #OBJ_BOSS_BIGBOO3
	BEQ Mouser_BF4B	 ; If this is Big Boo, jump to  Mouser_BF4B
	CMP #OBJ_BOSS_TOTOMESU
	BEQ Mouser_BF4B	 ; If this is Totomesu, jump to  Mouser_BF4B
	CMP #OBJ_BOSS_BOWSERJR
	BEQ Mouser_BF4B	 ; If this is Bowser Jr, jump to  Mouser_BF4B
	CMP #OBJ_BOSS_BLECK
	BEQ Mouser_BF4B	 ; If this is Bleck, jump to  Mouser_BF4B

	; Determine if object has gone off-screen yet or not
	LDY #$00
	JSR Object_DetermineHorzVisY
	LDY #$00
	JSR Object_DetermineVertVisY
	JSR Object_AnySprOffscreen
	BNE Mouser_BF46	 ; If object is off-screen in any way, jump to Mouser_BF46

	; Set poof timer to $1F
	LDA #$1f
	STA entity_timer,X
	
	; Stop any frozen state
	LDA #0
	STA Objects_FrozenTimer,X
	
	LDA #OBJSTATE_POOFDEATH	; A = 8 ("Poof" death the object)
	BNE Mouser_BF48	 ; Jump (technically always) to Mouser_BF48

Mouser_BF46
	LDA #$00	 ; A = 0 (just delete object)

Mouser_BF48:
	STA entity_state,X	 ; Set object state

Mouser_BF4B:
	DEX		 ; X--
	BPL Mouser_BEFC	 ; While X >= 0, loop

	LDX <entity_index		 ; X = object slot index
	RTS


Mouser_Jump:
	JSR_THUNKA 41, Mouser_Draw

	LDA <Player_HaltGame
	BNE Mouser_JumpHalt	; If gameplay is halted, jump to Mouser_KilledNotLow (RTS)

	; Persist X velocity
	LDA entity_var6,X
	STA <entity_lo_x_velocity,X

	JSR Object_Move41	; Need to thunk so lookups are right
	
	LDA <entity_lo_x_velocity,X
	BPL Mouser_JumpRight	; If Mouser is jumping to the right, jump to Mouser_JumpRight
	
	LDA <entity_lo_x,X
	CMP #8
	BGE Mouser_JumpCont		; If not at left edge, jump to Mouser_JumpCont
	
	; Stop Mouser from jumping too far to the left
	LDA #8
	STA <entity_lo_x,X
	BNE Mouser_HaltHorz		; Jump (technically always) to Mouser_HaltHorz
	
Mouser_JumpRight:
	LDA <entity_lo_x,X
	CMP #232
	BLT Mouser_JumpCont		; If Mouser is not at right edge, jump to Mouser_JumpCont
	
	; Stop Mouser from jumping too far to the right
	LDA #232
	STA <entity_lo_x,X
	BNE Mouser_HaltHorz

Mouser_JumpCont:
	LDA entity_collision_flags,X
	AND #$03
	BEQ Mouser_JumpNoWallHit

Mouser_HaltHorz:
	LDA #0
	STA <entity_lo_x_velocity,X

Mouser_JumpNoWallHit:
	LDA entity_collision_flags,X
	AND #$04
	BEQ Mouser_JumpHalt		; If Mouser has not yet touched floor, jump to Mouser_JumpHalt
	
	
	; Touched floor!
	LDA #1
	STA <entity_var5,X
	
	LDA #0
	STA <entity_lo_x_velocity,X
	STA <entity_lo_y_velocity,X
	STA entity_var6,X
	JSR Object_HitGround

Mouser_JumpHalt:
	RTS
	



Wart_SpawnShyguy:
	LDX #0	; ShyGuy will take slot 0nh
	
	; Check if ShyGuy is still present
	LDA entity_state,X
	BNE Wart_NoSpawn	; If ShyGuy is still here, jump to Wart_NoSpawn (RTS)
	
	JSR Level_PrepareNewObject

	LDA #16
	STA <entity_lo_y,X
	LDA #0
	STA <entity_hi_y,X
	
	LDA #104
	STA <entity_lo_x,X
	LDA #0
	STA <entity_hi_x,X
	
	LDA #OBJSTATE_NORMAL
	STA entity_state,X
	
	LDA #OBJ_SHYGUY_GREEN
	STA entity_type,X
	
	LDA #(SPR_PAL3 | SPR_BEHINDBG)
	STA Objects_SprAttr,X

	LDA #SND_PLAYERPIPE
	STA Sound_QPlayer
	
Wart_NoSpawn:

	LDX <entity_index
	RTS

Wart_Hurting:
	LDA #1
	STA entity_var1,X
	STA entity_var2,X

	JSR_THUNKA 41, Wart_Draw

	DEC entity_var6,X
	BNE Wart_StillHurting

	; Wart's going into the floor for NO REASON
	;LDA #0
	;STA entity_var1,X
	;STA entity_var2,X
	
	LDA #SND_PLAYERPIPE
	STA Sound_QPlayer

	INC <entity_var5,X

Wart_StillHurting:
	RTS

ObjNorm_Wart42:

	LDA entity_flipped_animation,X
	AND #~SPR_VFLIP
	STA entity_flipped_animation,X

	LDA entity_state,X
	CMP #OBJSTATE_NORMAL
	BEQ Wart_Normal
	JMP Wart_Dying

Wart_Normal:
	LDA <entity_var5,X
	CMP #7
	BEQ Wart_SpitTimer_NotSpitting	; In state 7, don't draw Wart, just perform activities

	LDA entity_var10,X
	BEQ Wart_TimerExpired

	DEC entity_var10,X

Wart_TimerExpired:
	LDA <entity_var5,X
	CMP #5
	BGE Wart_NotHurt

	LDA entity_no_collision_timer,X
	BEQ Wart_NotHurt

Wart_JustHurt:
	; Wart's hurt!
	LDA #5
	STA <entity_var5,X		; Go to state 5
	
	LDA #$20
	STA entity_var6,X
	BNE Wart_Hurting


Wart_NotHurt:
	JSR_THUNKA 41, Wart_Draw
		
	LDA <Player_HaltGame
	BNE Wart_Halt	; If gameplay halted, jump to Wart_Halt

	LDA <entity_var5,X
	CMP #5
	BGE Wart_SpitTimer_NotSpitting

	JSR Player_HitEnemy41
			
	; Spits...
	LDA #0
	STA entity_var2,X	; Mouth closed by default
	
	LDA entity_var6,X
	BNE Wart_SpitTimer_Running
	
	; Timer expired...
	LDA #240
	STA entity_var6,X
	
Wart_SpitTimer_Running:
	DEC entity_var6,X
	BNE Wart_NotDoneSpitting
	
	JSR Wart_SpawnShyguy
	
Wart_NotDoneSpitting:
	CMP #48
	BGE Wart_SpitTimer_NotSpitting

	; Spitting!
	INC entity_var2,X	; Mouth open
	
	; Only spit every 8 ticks
	AND #7
	BNE Wart_SpitTimer_NotSpitting
	
	; Spit!
	JSR Wart_Spit

	LDA #SND_LEVELUNK
	STA Sound_QLevel1
	
Wart_SpitTimer_NotSpitting:

	; In case state 7 bypass
	LDA <Player_HaltGame
	BNE Wart_Halt	; If gameplay halted, jump to Wart_Halt

	LDA <entity_var5,X
	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word Wart_InitWait		; 0: Initialize wait (first time only)
	.word Wart_Wait			; 1: Wait 
	.word Wart_Walk			; 2: Walk left
	.word Wart_Wait			; 3: Wait
	.word Wart_Walk			; 4: Walk right
	.word Wart_Hurting		; 5: Wart's hurt!
	.word Wart_Downward		; 6: Wart goes down into the floor for NO REASON
	.word Wart_LowerAtk		; 7: Wart's in-ground attack
	.word Wart_Upward		; 8: Wart comes back up...

Wart_Halt:
	RTS
	
Wart_WalkXVel:	.byte -$08, $08
	
Wart_InitWait:
	INC <entity_var5,X		; Next state
	
Wart_InitWait_After:
	LDA #120
	STA entity_var10,X		; Timer = 120
	
Wart_Wait:
	; Both feet on ground
	LDA #0
	STA entity_var3,X
	LDA #1
	STA entity_var4,X

	LDA entity_var10,X
	BNE Wart_Waiting

	; Timer expired...
		
	; Set Wart's X velocity
	LDA <entity_var5,X
	LSR A	; A = 0 if due left, 1 = if due right
	TAY
	
	LDA Wart_WalkXVel,Y
	STA <entity_lo_x_velocity,X	
	
	; Set timer
	LDA #(32 * 2)
	STA entity_var10,X
	
	INC <entity_var5,X	; Next state

Wart_Waiting:
	RTS
	
Wart_Walk:
	LDA <Counter_1
	LSR A
	LSR A
	LSR A
	LSR A
	AND #1
	STA entity_var3,X
	STA entity_var4,X

	JSR Object_ApplyXVel	; Move horizontally...
	
	LDA entity_var10,X
	BNE Wart_Waiting
	
	; Timer expired...
	JSR Wart_InitWait_After		; Setup for waiting
	
	; Next state or loop around
	LDA <entity_var5,X
	ADD #1
	CMP #5
	BLT Wart_WalkOK
	
	; Loop around state
	LDA #1
	
Wart_WalkOK:
	STA <entity_var5,X

	RTS
	
Wart_SpitXVels:	.byte -$08, -$10, -$20, -$30, -$40
Wart_SpitYVels: .byte -$40, -$38, -$30, -$28, -$20

Wart_SpitAlt:
	JSR SpecialObj_FindEmptyAbort
	
	; Set X/Y
	LDA <var1
	STA SpecialObj_YLo,Y
	LDA <var2
	STA SpecialObj_YHi,Y

	LDA <var3
	STA SpecialObj_XLo,Y

	; Zeroes the spit X velocity
	LDA #0
	STA <var1
	
	JSR Wart_SpitAlt_Cont
	
	LDA #-$40
	STA SpecialObj_YVel,Y
	
	RTS
	
Wart_Spit:
	LDA entity_var6,X	; < 48
	LSR A
	LSR A
	LSR A
	TAY
	LDA Wart_SpitXVels,Y
	STA <var1
	LDA Wart_SpitYVels,Y
	STA <var2

	JSR SpecialObj_FindEmptyAbort	 

	LDA <entity_lo_y,X
	ADD #16
	STA SpecialObj_YLo,Y
	LDA <entity_hi_y,X
	ADC #0
	STA SpecialObj_YHi,Y

	LDA <entity_lo_x,X
	ADD #16
	STA SpecialObj_XLo,Y

Wart_SpitAlt_Cont:
	; Wart's attack
	LDA #SOBJ_SPIKEBALL
	STA SpecialObj_ID,Y

	; Wart's style
	LDA #(2 | 1)
	STA SpecialObj_Data,Y
	
	LDA <var2
	STA SpecialObj_YVel,Y

	LDA <var1
	STA SpecialObj_XVel,Y
	
	RTS		 ; Return


WartAttacks_Remaining:	.byte 32, 21, 10

Wart_Downward:

	LDA Objects_SprAttr,X
	ORA #SPR_BEHINDBG
	STA Objects_SprAttr,X

	LDA #$10
	STA <entity_lo_y_velocity,X
	
	JSR entity_do_y_velocity

	INC entity_var6,X
	LDA entity_var6,X
	CMP #48
	BLT Wart_DownMore

	; Variables have different meanings in upcoming attack state
	LDA #0
	
	; Attack X
	LDA #12
	STA entity_var1,X
	
	; Attacks remain
	LDY Objects_HitCount,X
	LDA WartAttacks_Remaining,Y
	STA entity_var2,X
	
	; Next state
	INC <entity_var5,X

Wart_DownMore:
	RTS

Wart_LowerAtk:

	LDA <Counter_1
	AND #15
	BNE Wart_LowerAtk_Pause

	LDA <entity_lo_y,X
	ADD #32
	STA <var1
	LDA <entity_hi_y,X
	ADC #0
	STA <var2

	LDA entity_var1,X
	STA <var3
	
	JSR Wart_SpitAlt

	LDA #SND_PLAYERFIRE
	STA Sound_QPlayer
	
	; Move over for next attack
	LDA entity_var1,X
	ADD #24
	STA entity_var1,X
	
	DEC entity_var2,X		; One less attack...
	BNE Wart_LowerAtk_Pause	; If attacks remain, jump to Wart_LowerAtk_Pause

	; Next state...
	INC <entity_var5,X
	
	; Reset Wart!
	LDA #0
	STA entity_var1,X
	STA entity_var2,X
	STA entity_var3,X
	STA <entity_var4,X
	STA entity_var10,X

	LDA #48
	STA entity_var6,X

	LDY #4	; Bowser Jr

	LDA entity_lo_x,Y
	SUB #32
	STA <entity_lo_x,X
	LDA entity_hi_x,Y
	SBC #0
	STA <entity_hi_x,X

	LDA #SND_PLAYERPIPE
	STA Sound_QPlayer

Wart_LowerAtk_Pause:
	RTS

Wart_Upward:

	LDA #-$10
	STA <entity_lo_y_velocity,X
	
	JSR entity_do_y_velocity

	DEC entity_var6,X
	LDA entity_var6,X
	BNE Wart_UpMore
	
	; Back to state 1
	LDA #0
	STA <entity_var5,X
	
	LDA Objects_SprAttr,X
	AND #~SPR_BEHINDBG
	STA Objects_SprAttr,X
	

Wart_UpMore:
	RTS
	
Wart_Dying:

	LDA Objects_HitCount,X
	BEQ Wart_OfficiallyDead
	
	DEC Objects_HitCount,X
	
	LDA #OBJSTATE_NORMAL
	STA entity_state,X
	
	JSR Object_HitGround
	
	JMP Wart_JustHurt

Wart_OfficiallyDead:
	LDA #1
	STA entity_var1,X
	STA entity_var2,X

	JSR_THUNKA 41, Wart_Draw
	
	LDA <entity_sprite_lo_y,X
	CMP #192
	BLT Wart_UpMore

	JMP Object_Delete


BJrW7_YVelLimit:	.byte $10, -$10
BJrW7_YVelAccel:	.byte $02, -$02

BowserJr_World7:
	LDA <Player_HaltGame
	BEQ BJrW7_NoHalt

	JMP BJrW7_Draw

BJrW7_NoHalt:
	LDA <entity_var5,X
	AND #$7F

	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word BJrW7_SeekPlayerAndShoot	; 0: seek and shoot
	.word BJrW7_BowserJrHit			; 1: flash, reverse gravity
	.word BJrW7_PerformFlip			; 2: flip world, land
	.word BJrW7_BowserJr_PLanded	; 3: Player landed, resume
	.word BJrW7_Explode				; 4: Blow up the ship...
	.word BJrW7_BlowUpward			; 5: Blow Jr up and off screen
	.word BJrExit_EndLevel			; 6: Recycle bonus count down
	.word BJrW7_DeadTimeout			; 7: Waiting...
	
	; Cinematic
	.word BJrW7_CinePoint			; 8: Pointing angrily
	.word BJrW7_CineLaunchStar		; 9: Launch star appears
	.word BJrW7_CineLaunch			; 10: Launch away!


BJrW7_SeekPlayerAndShoot:
	JSR BJrW7_Draw
	JSR BJrW7_FacePlayer
	JSR BJrW7_MoveVertToPlayer

	JSR_THUNKA 41, Object_HandleBumpUnderneath
	
	LDA Objects_PlayerHitStat,X
	BEQ BJrW7_PlayerNoHit	 ; If Player is not hitting BJrW7 at all, jump to BJrW7_PlayerNoHit

	INC <entity_var5,X

	; Player Y Vel = -$30 (bounce off)
	LDA #-$30
	STA <player_lo_y_velocity

	; Regain the hit (this doesn't count towards death)
	INC Objects_HitCount,X

BJrW7_KillAct:
	
	LDA #$7F
	STA Objects_ColorCycle,X
		
BJrW7_PlayerNoHit:
	RTS


BJrW7_BowserJrHit:
	JSR BJrW7_Draw
	
	LDA #$FF
	STA <entity_sprite_lo_x,X
	STA <entity_sprite_lo_y,X

	LDA #1
	STA entity_animation_frame,X

	LDA Objects_ColorCycle,X
	BNE BJrW7_StillFlashing

	INC entity_var1,X
	LDA entity_var1,X
	CMP #3
	BEQ BJrW7_Finished

	; Reverse gravity
	LDA entity_reverse_gravity,X
	EOR #1
	STA entity_reverse_gravity,X
	STA Player_ReverseGrav
	
	; Ensure Player removes from planet...
	LDA #1
	STA player_is_in_air

	; Whoosh
	LDA #SND_LEVELAIRSHIP
	STA Sound_QLevel2

	; Change to free verticall scrolling
	LDA #1
	STA Level_FreeVertScroll

	INC <entity_var5,X

BJrW7_StillFlashing:
	RTS
	
BJrW7_Finished:
	LDA #4
	STA <entity_var5,X
	RTS

BJrW7_Explode:
	JSR BJrW7_Draw

	LDA <player_is_in_air
	BNE BJrW7_ExplodeNotLanded	; If Player hasn't touched ground yet, jump to BJrW7_ExplodeNotLanded

	LDA #$FF
	STA Player_VibeDisable

	LDA #0
	STA Player_Slide

	LDA #1
	STA Level_TimerEn

	; Recycle some of the world 4 death
	JSR BJrW4_Dead

	LDA #5
	STA <entity_var5,X

	LDA #-$70
	STA <entity_lo_y_velocity,X
	
BJrW7_ExplodeNotLanded:
	RTS


BJrW7_BlowUpward:
	LDA #$FF
	STA Player_VibeDisable

	LDA #2
	STA entity_animation_frame,X
	JSR BowserJr_Draw

	LDA #1
	JSR BowserJr_DrawHand

	JSR Object_DetermineVertVis

	JSR Object_Move
	
	JSR Object_AnySprOffscreen
	BEQ BJrW7_NotBlownUp

	INC <entity_var5,X

	; Victory fanfare
	LDA Sound_QMusic1
	ORA #MUS1_BOSSVICTORY
	STA Sound_QMusic1

BJrW7_NotBlownUp:
	RTS

BJrW7_YPos:		.byte $F0, $C0	; Not reverse / reverse gravity
BJrW7_YPosHi:	.byte $00, $00
BJrW7_XPos:		.byte $C0, $20

BJrW7_PerformFlip:
	JSR BJrW7_Draw
	
	LDA <player_is_in_air
	BNE BJrW7_PlayerNotLanded
	
	; Landed!
	
	; Set BJr Y
	LDY entity_reverse_gravity,X
	LDA BJrW7_YPos,Y
	STA <entity_lo_y,X
	LDA BJrW7_YPosHi,Y
	STA <entity_hi_y,X
	
	LDA BJrW7_XPos,Y
	STA <entity_lo_x,X
	
	; Restore fixed vertical scrolling
	LDA #2
	STA Level_FreeVertScroll
	
	LDA #0
	STA <entity_var5,X
	STA entity_animation_frame,X
	
BJrW7_PlayerNotLanded:
	RTS
	
BJrW7_BowserJr_PLanded:
	LDA #0
	STA <entity_var5,X

	RTS

BJrW7_MoveVertToPlayer:
	JSR Object_CalcCoarseYDiff
	
	LDA <var16		; 255 too high, 0 too low
	ADD #1
	EOR entity_reverse_gravity,X
	TAY
	
	LDA <entity_lo_y_velocity,X
	CMP BJrW7_YVelLimit,Y
	BEQ BJrW7_AtYVelLimit
	
	ADD BJrW7_YVelAccel,Y
	STA <entity_lo_y_velocity,X
	
BJrW7_AtYVelLimit:
	JSR entity_do_y_velocity

	LDA <Counter_1
	CMP #$5F
	BGE BJrW7_NoFire
	LDA <Counter_1
	AND #$1F
	BNE BJrW7_NoFire

	JSR BJrW7_SpitFire

BJrW7_NoFire:
	RTS

BJrW7_FacePlayer:
	JSR Level_ObjCalcXDiffs

	; Face Player
	LDA Mouser_FlipTowardsPlayer,Y
	STA entity_flipped_animation,X
	
	RTS

BJrW7_Draw:
	LDA entity_reverse_gravity,X
	ROR A
	ROR A
	STA <var13

	LDA Objects_SprVVis,X
	STA <var14

	LDA entity_animation_frame,X
	ASL A
	ASL A
	ASL A
	ASL A
	STA <var15		; 15 = offset for head frame change

	JSR Object_GetRandNearUnusedSpr
	STY <var16		; 16 = additional sprite index needed

	JSR Object_DetermineVertVis

	JSR Object_ShakeAndCalcSprite

	LDX <entity_index
	LDA Objects_ColorCycle,X
	AND #3
	STA <var4

	LDX <var16

	; Sprite Y
	LDA <var14
	AND #1
	BEQ BJrW7_TopVis
	
	LDA #$F8
	BNE BJrW7_TopInvis
		
BJrW7_TopVis:
	LDA <var1

BJrW7_TopInvis:
	STA Sprite_RAM+$00,X	; Left half of head
	STA Sprite_RAM+$00,Y	; Right half of head
	STA Sprite_RAM+$04,Y	; Top of ship

	LDA <var14
	AND #1
	BEQ BJrW7_BotVis
	
	LDA #$F8
	BNE BJrW7_BotInvis
		
BJrW7_BotVis:
	LDA <var1
	ADD #16
	
BJrW7_BotInvis:
	STA Sprite_RAM+$08,Y	; Lower ship sprites
	STA Sprite_RAM+$0C,Y
	STA Sprite_RAM+$10,Y
	STA Sprite_RAM+$14,Y
	
	
	LDA <var13
	BEQ BJrW7_NoVFlip
	
	LDA Sprite_RAM+$00,X
	PHA
	
	LDA Sprite_RAM+$08,Y
	STA Sprite_RAM+$00,X
	STA Sprite_RAM+$00,Y
	STA Sprite_RAM+$04,Y

	PLA
	STA Sprite_RAM+$08,Y
	STA Sprite_RAM+$0C,Y
	STA Sprite_RAM+$10,Y
	STA Sprite_RAM+$14,Y
		
BJrW7_NoVFlip:
	; xx xx 00 04
	; 08 0C 10 14
	
	; Sprite X
	LDA <var2
	STA Sprite_RAM+$0B,Y	; Lower left ship
	ADD #8
	STA Sprite_RAM+$03,X	; Left half of head
	STA Sprite_RAM+$0F,Y	; Mid left ship
	ADD #8
	STA Sprite_RAM+$03,Y	; Right half of head
	STA Sprite_RAM+$13,Y	; Mid right ship
	ADD #8
	STA Sprite_RAM+$07,Y	; Top right ship
	STA Sprite_RAM+$17,Y	; Lower right ship
	
	LDA #$A3
	ADD <var15
	STA Sprite_RAM+$01,X	; Left half of head
	LDA #$A5
	ADD <var15
	STA Sprite_RAM+$01,Y	; Right half of head
	LDA #$A7
	STA Sprite_RAM+$05,Y	; Top right ship
	LDA #$A9
	STA Sprite_RAM+$09,Y	; Bottom left ship
	LDA #$AB
	STA Sprite_RAM+$0D,Y	; Mid left ship
	LDA #$AD
	STA Sprite_RAM+$11,Y	; Mid right ship
	LDA #$AF
	STA Sprite_RAM+$15,Y	; Lower right ship
	
	LDA #SPR_PAL1
	ORA <var3
	ORA <var13
	EOR <var4
	STA Sprite_RAM+$02,X	; Right half of head
	STA Sprite_RAM+$02,Y	; Left half of head
	LDA #SPR_PAL3
	ORA <var3
	ORA <var13
	EOR <var4
	STA Sprite_RAM+$06,Y	; Top right ship
	STA Sprite_RAM+$0A,Y	; Bottom left ship
	STA Sprite_RAM+$0E,Y	; Mid left ship
	STA Sprite_RAM+$12,Y	; Mid right ship
	STA Sprite_RAM+$16,Y	; Lower right ship

	LDA <var3
	AND #SPR_HFLIP
	BEQ BJrW7_DrawNoHFlip

	; Swap head sprites
	LDA Sprite_RAM+$01,X	; Left half of head
	PHA
	LDA Sprite_RAM+$01,Y	; Right half of head
	STA Sprite_RAM+$01,X
	PLA
	STA Sprite_RAM+$01,Y

	; There's not a symmetrical amount of sprites on the top row,
	; so we need to swap by pulling the right-most ship sprite
	LDA Sprite_RAM+$07,Y
	SUB #24
	STA Sprite_RAM+$07,Y
	
	; Swap bottom sprites
	LDA Sprite_RAM+$09,Y
	PHA
	LDA Sprite_RAM+$15,Y
	STA Sprite_RAM+$09,Y
	PLA
	STA Sprite_RAM+$15,Y

	LDA Sprite_RAM+$0D,Y
	PHA
	LDA Sprite_RAM+$11,Y
	STA Sprite_RAM+$0D,Y
	PLA
	STA Sprite_RAM+$11,Y

BJrW7_DrawNoHFlip:
	LDX <entity_index

	RTS


BJ7SFire_XVel:			.byte -$20, $20
BJ7SFire_YOff:			.byte 16, 0
BJ7SFire_YCoarseOff:	.byte 0, 4

BJrW7_SpitFire:
	LDY entity_reverse_gravity,X
	LDA BJ7SFire_YOff,Y
	STA <var1

	LDY <entity_index
	JSR PrepareNewObjectOrAbort

	LDA #SND_LEVELFLAME
	STA Sound_QLevel2

	LDA #OBJ_BOSSATTACK
	STA entity_type,X

	LDA entity_lo_y,Y
	ADD <var1
	STA <entity_lo_y,X
	LDA entity_hi_y,Y
	ADC #0
	STA <entity_hi_y,X

	LDA entity_lo_x,Y
	STA <entity_lo_x,X
	LDA entity_hi_x,Y
	STA <entity_hi_x,X

	LDA #SPR_PAL2
	STA Objects_SprAttr,X

	JSR entity_player_x_coarse_difference
	LDA <var16
	ROL A
	ROL A
	ROL A
	TAY
	LDA BJ7SFire_XVel,Y
	STA <entity_lo_x_velocity,X

	LDA #$01
	STA <entity_var5,X
	
	LDX <entity_index
	RTS

BJrW7_DeadTimeout:
	LDA #$FF
	STA Player_VibeDisable

	DEC entity_var1,X
	BNE BJrW7_StillTimering

	LDA #3
	STA Level_JctCtl_Req ; Set appropriate value to Level_JctCtl_Req

BJrW7_StillTimering:
	RTS


BJrW7_CinePoint:
	LDA #$FF
	STA Player_HaltTick
	
	LDA #SPR_HFLIP
	STA player_flipped_animation

	LDA <Counter_1
	LSR A
	LSR A
	AND #2
	STA entity_animation_frame,X
	JSR BowserJr_Draw

	LDA #1
	JSR BowserJr_DrawHand

	LDA entity_timer,X
	CMP #$48
	BNE BJrW7_CineNot48
	
	JMP BJrW7_SpawnLaunchStarPrequel
	
BJrW7_CineNot48:
	LDA entity_timer,X
	BNE BJrW7_CinePointing

	; Time's up...
	LDA #SND_LEVELPOOF
	STA Sound_QLevel1
	
	LDA #24
	STA <var2
	LDA #0
	JSR BJrW7_CinePoof
	LDA #16
	JSR BJrW7_CinePoof

	JSR BJrW7_SpawnLaunchStar

	LDA #$40
	STA entity_timer,X
	
	INC <entity_var5,X

BJrW7_CinePointing:
	RTS

BJrW7_CinePoof:
	STA <var1

	JSR SpecialObj_FindEmptyAbort	; Find an empty special object slot or don't come back here!

	; The "poof" from when it appears	 
	LDA #SOBJ_POOF
	STA SpecialObj_ID,Y

	; Set the poof where the box will be
	LDA <entity_lo_x,X
	SUB #8
	ADD <var1
	STA SpecialObj_XLo,Y
	LDA <entity_lo_y,X
	ADD <var2
	STA SpecialObj_YLo,Y
	LDA <entity_hi_y,X
	ADC #0
	STA SpecialObj_YHi,Y

	; Set the "poof" counter
	LDA #$1f
	STA SpecialObj_Data,Y

	RTS		 ; Return

BJrW7_SpawnLaunchStarPrequel:
	JSR PrepareNewObjectOrAbort

	LDA #$F0
	STA <entity_lo_y,X
	LDA #$00
	STA <entity_hi_y,X
	
	LDA #$00
	STA <entity_lo_x,X
	LDA #1
	STA <entity_hi_x,X
	
	LDA #OBJSTATE_NORMAL
	STA entity_state,X
	
	LDA #OBJ_POWERUP_STARMAN
	STA entity_type,X

	LDA #$48
	STA <entity_var5,X

	LDX <entity_index

	RTS

BJrW7_SpawnLaunchStar:
	TXA
	TAY


	JSR PrepareNewObjectOrAbort

	LDA entity_lo_y,Y
	ADD #24
	STA <entity_lo_y,X
	LDA entity_hi_y,Y
	ADC #0
	STA <entity_hi_y,X
	
	LDA entity_lo_x,Y
	SUB #4
	STA <entity_lo_x,X
	LDA entity_hi_x,Y
	SBC #0
	STA <entity_hi_x,X
	
	LDA #OBJSTATE_INIT
	STA entity_state,X
	
	LDA #OBJ_LAUNCHSTAR
	STA entity_type,X

	LDX <entity_index

	RTS

BJrW7_SpinAround:
	LDA <Counter_1
	ASL A
	ASL A
	ASL A
	ASL A
	AND #SPR_HFLIP
	STA entity_flipped_animation,X
	RTS

BJrW7_DrawLSBJr:
	LDA #1
	STA entity_animation_frame,X
	JSR BowserJr_Draw

	LDA #1
	JMP BowserJr_DrawHand
	

BJrW7_CineLaunchStar:
	LDA #$FF
	STA Player_VibeDisable

	JSR BJrW7_DrawLSBJr

	LDA entity_timer,X
	CMP #$30
	BGE BJrW7_CLS_Timering
	CMP #$2F
	BNE BJrW7_CLS_SpinAround

	LDA #SND_LEVELVINE
	STA Sound_QLevel1

	LDA #$10
	STA entity_timer,X

	INC <entity_var5,X

BJrW7_CLS_SpinAround:
	JSR BJrW7_SpinAround

BJrW7_CLS_Timering:
	RTS

BJrW7_CineLaunch:
	LDA #$FF
	STA Player_VibeDisable

	JSR BJrW7_DrawLSBJr
	JSR BJrW7_SpinAround

	LDA #-$40
	STA <entity_lo_y_velocity,X
	JSR entity_do_y_velocity

	LDA <entity_hi_y,X
	BNE BJrW7_CineLCont

	LDX #5
BJrW7_FindLS_Loop:

	LDA entity_state,X
	CMP #OBJSTATE_NORMAL
	BNE BJW7FLSL_NotLS

	LDA entity_type,X
	CMP #OBJ_LAUNCHSTAR
	BNE BJW7FLSL_NotLS
	
	; Found the launch star...
	LDA #4
	STA <var2
	LDA #8
	JSR BJrW7_CinePoof
	LDA #24
	JSR BJrW7_CinePoof
	
	JSR Object_Delete
	JMP BJW7FLSL_Done

BJW7FLSL_NotLS:
	DEX		; X--
	BPL BJrW7_FindLS_Loop	; While X >= 0, loop!

BJW7FLSL_Done:
	LDX <entity_index

	JSR BJrW7_SpawnRosalina
	
	JMP Object_Delete
	
BJrW7_CineLCont:
	RTS
	

BJrW7_SpawnRosalina:
	JSR PrepareNewObjectOrAbort

	LDA #$40
	STA <entity_lo_y,X
	LDA #1
	STA <entity_hi_y,X
	
	LDA #$00
	STA <entity_lo_x,X
	LDA #1
	STA <entity_hi_x,X
	
	LDA #OBJSTATE_INIT
	STA entity_state,X
	
	LDA #OBJ_PRINCESS
	STA entity_type,X

	LDX <entity_index

	RTS

BowserJr_WorldZ:
	LDA <entity_lo_x,X
	CMP <Horz_Scroll
	LDA <entity_hi_x,X
	SBC <Horz_Scroll_Hi
	BEQ BJWZ_OK	 ; If sprite is not horizontally off-screen, jump to PRG043_D7DE

	JMP Object_Delete

BJWZ_OK:
	LDA #144
	STA PatTable_BankSel+4
	
	LDA #-$10
	STA <entity_lo_x_velocity,X

	LDY entity_var2,X	; Y = V-travel direction (0 = left, 1 = right)
	
	LDA <entity_lo_y_velocity,X
	CMP BJrW4_YVels,Y
	BNE BJrWZ_NotAtVSpeed	; If BJr is not at the proper speed, jump to BJrW4_NotAtVSpeed
	
	; Reverse vertical direction
	LDA entity_var2,X
	EOR #1
	STA entity_var2,X
	
	
BJrWZ_NotAtVSpeed:
	
	; Accelerate as appropriate
	ADD BJrW4_YVelDelta,Y
	STA <entity_lo_y_velocity,X
	
	JSR Object_ApplyXVel
	JSR entity_do_y_velocity
	
	JSR BowserJr_Draw
	JMP BowserJr_DrawClownCar

Bleck_Palette:
	.byte $02, $15, $30, $0F, $01, $13, $03
Bleck_Palette_End

ObjInit_Bleck42:

	LDA #$7F
	STA Objects_HitCount,X

	INC Objects_IsGiant,X

	LDY #(Bleck_Palette_End - Bleck_Palette)

Bleck_SetPalLoop:
	LDA Bleck_Palette,Y
	STA Palette_Buffer+$15,Y
	STA Pal_Data+$15,Y
	
	DEY
	BPL Bleck_SetPalLoop

	LDA #MUS2A_BLECK
	STA Sound_QMusic2

	; Spawning a second fake Bleck used to just keep a placeholder 
	; for sprites to steal safely (Bleck needs 12!!)
	JSR PrepareNewObjectOrAbort

	LDA #OBJ_BOSS_BLECK
	STA entity_type,Y
	
	
	; Dummy state
	LDA #$FF
	STA <entity_var5,X

	LDX <entity_index
	
	;;;;;;;;;
	
	LDA #$04
	STA <entity_var5,X

Bleck_Halt:
	RTS
	
ObjNorm_Bleck42:
	JSR_THUNKA 41, Bleck_Draw
	LDA <Player_HaltGame
	BNE Bleck_Halt
	
	JSR Bleck_Common
	
	LDA <entity_var5,X
	JSR DynJump
	
	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word Bleck_Move			; 0
	.word Bleck_DecideAtk		; 1
	.word Bleck_BlackholeInit	; 2
	.word Bleck_Blackhole		; 3
	.word Bleck_FireShotInit	; 4
	.word Bleck_FireShot		; 5
	.word Bleck_Die				; 6

Bleck_Common:
	; Adjustment to fit bounding box better (similar to draw)
	LDA <entity_sprite_lo_x,X
	ADD #8
	STA <entity_sprite_lo_x,X

	JSR Object_AnySprOffscreen
	BNE Bleck_PlayerNoHit

	LDA Objects_ColorCycle,X
	BNE Bleck_PlayerNoHit

	JSR_THUNKA 41, Object_HandleBumpUnderneath

	LDA Objects_PlayerHitStat,X
	BEQ Bleck_PlayerNoHit	 ; If Player is not hitting Bleck at all, jump to Bleck_PlayerNoHit (RTS)

	LDA <player_lo_y_velocity
	BMI Bleck_PlayerNoHit	 ; If Player is moving upward, jump to Bleck_PlayerNoHit (RTS)

	; Play squish sound
	LDA #SND_PLAYERSWIM
	STA Sound_QPlayer

	; Get 1000, 2000, or 4000 points
	INC entity_var2,X
	LDA entity_var2,X	; 1, 2, 3
	ADD #$08
	JSR Score_PopUp

	; Player Y Vel = -$30 (bounce off)
	LDA #-$30
	STA <player_lo_y_velocity

	LDA entity_var2,X	; 1, 2, 3
	CMP #3
	BLT Bleck_NotDead

	; 3 stomps, we're done
	; Dead!

Bleck_Kill:	
	LDA #6
	STA <entity_var5,X

	JSR Boss_DestroyOtherObjects

	LDA #1
	STA Level_TimerEn

	LDA #$FF
	STA Objects_ColorCycle,X
	STA Player_VibeDisable
	
	LDA #$7F
	STA RotatingColor_Cnt
	STA entity_timer,X

	RTS

Bleck_NotDead:
	LDA #$FF
	STA Objects_ColorCycle,X
	
	; Jump to state 0
	LDA #0
	STA <entity_var5,X
	
	LDA #$40
	STA entity_timer,X

Bleck_PlayerNoHit:
	RTS

Bleck_MoveVel:		.byte -$17, $17

Bleck_Move:
	LDA #0
	STA entity_animation_frame,X

	JSR Level_ObjCalcXDiffs

	; Face Player
	LDA Mouser_FlipTowardsPlayer,Y
	STA entity_flipped_animation,X

	; Var1:
	;	Bit 0 - move left [0] or right [1]
	;	Bit 1 - move up [0] or down [1]
	;	Bit 2 - needs to dislodge once, then this bit is set

	LDA entity_var1,X
	AND #%00000010
	BNE Bleck_CheckLow	; If Bleck isn't moving upward, jump to Bleck_CheckLow

	; Attempting to move upward...

	LDA <entity_hi_y,X
	BNE Bleck_NotOORVert		; If Bleck is YHi = 1, can't be too high, jump to Bleck_NotOORVert
	
	LDA <entity_lo_y,X
	CMP #177
	BGE Bleck_NotOORVert		; If Y > 176, not too high, jump to Bleck_NotOORVert
	
	; Bleck is too high trying to move upward, reverse direction
	LDA entity_var1,X
	ORA #%00000010			; Set to move down
	STA entity_var1,X
	BNE Bleck_NotOORVert	; Jump (technically always) to Bleck_NotOORVert

Bleck_CheckLow:

	; Attempting to move downward

	LDA <entity_hi_y,X
	BEQ Bleck_NotOORVert	; If Bleck is YHi = 0, can't be too low, jump to Bleck_NotOORVert
	
	LDA <entity_lo_y,X
	CMP #48
	BLT Bleck_NotOORVert	; If Y < 48, jump to Bleck_NotOORVert

	; Bleck is too low trying to move down, reverse direction
	LDA entity_var1,X
	AND #~%00000010			; Set to move down
	STA entity_var1,X

Bleck_NotOORVert:

	LDA entity_var1,X
	AND #%00000001
	BNE Bleck_CheckRight	; If Bleck isn't moving leftward, jump to Bleck_CheckRight

	; Attempting to move leftward...

	LDA <entity_hi_x,X
	BNE Bleck_NotOORHorz		; If Bleck is XHi = 1, can't be too left, jump to Bleck_NotOORHorz
	
	LDA <entity_lo_x,X
	CMP #49
	BGE Bleck_NotOORHorz		; If X > 48, not too left, jump to Bleck_NotOORHorz
	
	; Bleck is too left trying to move leftward, reverse direction
	LDA entity_var1,X
	ORA #%00000001			; Set to move right
	STA entity_var1,X
	BNE Bleck_NotOORHorz	; Jump (technically always) to Bleck_NotOORHorz

Bleck_CheckRight:

	; Attempting to move rightward

	LDA <entity_hi_x,X
	BEQ Bleck_NotOORHorz	; If Bleck is XHi = 0, can't be too right, jump to Bleck_NotOORHorz
	
	LDA <entity_lo_x,X
	CMP #176
	BLT Bleck_NotOORHorz	; If X < 176, jump to Bleck_NotOORHorz

	; Bleck is too Left trying to move down, reverse direction
	LDA entity_var1,X
	AND #~%00000001			; Set to move left
	STA entity_var1,X

Bleck_NotOORHorz:


	; Set X velocity
	LDA entity_var1,X
	AND #%00000001
	TAY
	LDA Bleck_MoveVel,Y
	STA <entity_lo_x_velocity,X

	; Set Y velocity
	LDA entity_var1,X
	AND #%00000010
	LSR A
	TAY
	LDA Bleck_MoveVel,Y
	STA <entity_lo_y_velocity,X
	
	JSR Object_ApplyXVel
	JSR entity_do_y_velocity
	

	; Only have to check Y since Bleck moves on diagonals
	LDA <entity_lo_y,X
	AND #%00111111
	CMP #%00110000
	BNE Bleck_NotArrivedDislodge

	LDA entity_var1,X
	AND #%00000100
	BEQ Bleck_NotArrived	; Need to have dislodged once before we can accept it

	; Randomly select next direction
	LDA RandomN
	AND #%00000011
	STA <var1
	
	LDA entity_var1,X
	AND #%11111100
	ORA <var1
	STA entity_var1,X

	INC <entity_var5,X
	
	LDA #$40
	STA entity_timer,X

	; Keep him centered
	LDA <entity_lo_x,X
	ADD #8
	AND #%11110000
	STA <entity_lo_x,X

	RTS

Bleck_NotArrivedDislodge:
	LDA entity_var1,X
	ORA #%00000100
	STA entity_var1,X

	; Bleck has arrived at a block
Bleck_NotArrived:
	RTS


Bleck_DecideAtk:
	LDA Objects_ColorCycle,X
	BNE Bleck_StillFlashing

	; pick 2 or 4

	LDA RandomN
	AND #1	; 0 or 1
	ADD #1	; 1 or 2
	ASL A	; 2 or 4
	STA <entity_var5,X

	RTS

Bleck_StillFlashing:
	LDA #0
	STA <entity_var5,X
	RTS

Bleck_BlackholeInit:
	LDA #$FF
	STA entity_timer,X

	INC <entity_var5,X

Bleck_Blackhole:
	LDA #1
	STA entity_animation_frame,X

	LDA SndCur_Level2
	CMP #SND_LEVELAIRSHIP
	BEQ BleckBH_NoSnd

	LDA #SND_LEVELAIRSHIP
	STA SndCur_Level2

BleckBH_NoSnd:
	LDA entity_timer,X
	BNE Bleck_StillBlackHoling

	LDA #0
	STA <entity_var5,X

Bleck_StillBlackHoling:
	;LDA <Counter_1
	;AND #$0F
	;BNE Bleck_DragEnd

	; Black hole FX	
	STX <var11
	JSR Bleck_SpawnFX

Bleck_NoBHFX:

	LDA Level_NoStopCnt
	AND #7
	BEQ Bleck_DragEnd

	; 'Y' = 1 if player to left, 0 if player to right
	JSR Level_ObjCalcXDiffs
	CPY	#1
	BEQ Bleck_DragPlayerRight

	; Drag left
	LDA <player_lo_x_velocity
	SUB #$01
	STA <player_lo_x_velocity

	JMP Bleck_DragVert

Bleck_DragPlayerRight:

	; Drag right
	LDA <player_lo_x_velocity
	ADD #$01
	STA <player_lo_x_velocity

Bleck_DragVert:
	JSR Level_ObjCalcYDiffs
	CPY	#$01
	BEQ Bleck_DragPlayerDown

	; Drag up
	LDA <player_lo_y_velocity
	SUB #$06
	STA <player_lo_y_velocity

	JMP Bleck_DragEnd

Bleck_DragPlayerDown:

	; Drag down
	;LDA <player_lo_y_velocity
	;ADD #$02
	;STA <player_lo_y_velocity
	
Bleck_DragEnd:
	RTS


ObjNorm_BleckProj42:
	JSR Object_ApplyXVel
	JSR entity_do_y_velocity
	JSR Object_DeleteOffScreen

	JSR_THUNKA 41, Object_ShakeAndDraw

	LDA <entity_var5,X
	BNE BleckProj_ProjectileMode

	LDA entity_timer,X
	BEQ BleckProj_ResetTimer
	CMP #1
	BNE BleckProj_TimerNotExpired
	
	INC entity_animation_frame,X
	LDA entity_animation_frame,X
	CMP #3
	BNE BleckProj_TimerNotExpired
	
	JMP Object_Delete

BleckProj_TimerNotExpired:
	RTS

BleckProj_ResetTimer:
	LDA #$08
	STA entity_timer,X
	RTS

BleckProj_ProjectileMode:
	JSR_THUNKA 41, Object_HandleBumpUnderneath

	;STX <var11
	;JSR Bleck_SpawnFX

	RTS

Bleck_SpawnFX:
	; Take advantage of the Boo Loop code!
	LDA RandomN
	STA <var1
	JSR_THUNKA 3, BooLoop_GetOffsetXY_TV1

	; Divide Y offset by 2
	LDA <var2
	ASR A
	STA <var2
	LDA <var1
	ROR A
	STA <var1

	; Divide X offset by 2
	LDA <var4
	ASR A
	STA <var4
	LDA <var3
	ROR A
	STA <var3

	LDY <var11

	LDA entity_lo_x,Y
	ADD <var3
	STA <var3
	LDA entity_hi_x,Y
	ADC <var4
	STA <var4

	LDA entity_lo_y,Y
	ADD <var1
	STA <var1
	LDA entity_hi_y,Y
	ADC <var2
	STA <var2
	

	; var1 = Y
	; var2 = YHi
	; var3 = X
	; var4 = XHi
	
	; var11 = index of target

	JSR PrepareNewObjectOrAbort

	; It's a Bleck Projectile
	LDA #OBJ_BLECK_PROJ
	STA entity_type,X

	; Set Bleck's projectile Y
	LDA <var1
	STA <entity_lo_y,X
	LDA <var2
	STA <entity_hi_y,X

	; Set Bleck's projectile X
	LDA <var3
	STA <entity_lo_x,X
	LDA <var4
	STA <entity_hi_x,X

	LDA #$14
	JSR BleckFX_CalcVelPath
	
	LDA <var1
	STA <entity_lo_y_velocity,X
	LDA <var2
	STA <entity_lo_x_velocity,X
	

	; Set attributes
	LDA #SPR_PAL2
	STA Objects_SprAttr,X
	
	LDX <entity_index
	RTS

BleckFX_CalcVelPath:
	STA <var2	; Store input value -> var2

	; var11 holds the index of the object to be targeted

	; Backup 'X' and 'Y'
	TXA
	PHA
	TYA
	PHA

	LDY <var11
	JSR BleckProj_ObjCalcYDiffs
	STY <var3		 ; Store Y difference indicator -> var3

	; Get absolute value of Y difference
	LDA <var16
	BPL PRG042_BCAA
	JSR Negate
PRG042_BCAA:
	STA <var13		 ; -> var13
 
	LDY <var11
	JSR BleckProj_ObjCalcXDiffs
	STY <var4		 ; Store X difference indicator -> var4

	; Get absolute value of X difference
	LDA <var16
	BPL PRG042_BCB8
	JSR Negate
PRG042_BCB8:
	STA <var14		 ; -> var14

	LDY #$00	 ; Y = 0
	LDA <var14	
	CMP <var13	
	BGE PRG042_BCCB	 ; If Y difference >= X difference, jump to PRG042_BCCB

	INY		 ; Y = 1

	; Swap differences (so greater difference will be in var14)
	PHA
	LDA <var13
	STA <var14
	PLA
	STA <var13

PRG042_BCCB:
	LDA #$00
	STA <var12	; Clear var12
	STA <var1	; Clear var1

	LDX <var2		 ; X = var2 (original input value)

PRG042_BCD3:
	LDA <var12
	ADD <var13		; A = var12 + var13 (the lesser difference)
	CMP <var14		
	BLT PRG042_BCE0	 	; If (var12 + var13) < var14 (the greater difference), jump to PRG042_BCE0

	; If (var12 + var13) >= var14

	SBC <var14		 ; Subtract total from var14
	INC <var1		 ; var1++

PRG042_BCE0:
	STA <var12		 ; Update var12 with the previous total
	DEX		 	; X--
	BNE PRG042_BCD3		; While X >= 0, loop!

	TYA		 ; A = 0 or 1
	BEQ PRG042_BCF2	 ; If zero (don't need to swap), jump to PRG042_BCF2

	; Swap var1 and var2
	LDA <var1
	PHA	
	LDA <var2
	STA <var1
	PLA	
	STA <var2

PRG042_BCF2:
	LDA <var1		 ; A = var1

	LDY <var3		 ; Y = var3 (Y difference indicator)
	BEQ PRG042_BCFD	 	; If Player was lower than object, jump to PRG042_BCFD

	; Otherwise, negate var1
	JSR Negate
	STA <var1

PRG042_BCFD:
	LDA <var2		 ; A = var2

	LDY <var4		 ; Y = var4 (X difference indicator)
	BEQ PRG042_BD08	 	; If Player was lower than object, jump to PRG042_BD08

	; Otherwise, negate var2
	JSR Negate
	STA <var2

PRG042_BD08:

	; Restore 'Y' and 'X'
	PLA
	TAY
	PLA
	TAX 

	RTS		 ; Return


BleckProj_ObjCalcXDiffs:
	LDA entity_lo_x,Y
	SUB <entity_lo_x,X
	STA <var16	 ; var16 = difference between Player's X and object's X

	LDA entity_hi_x,Y
	PHA

	LDY #$00	 ; Y = 0
	
	PLA
	SBC <entity_hi_x,X
	BPL PRG042_DD3C	 ; If Player's X Hi >= Object's X Hi, jump to PRG042_DD3C (RTS)

	INY		 ; Otherwise Y = 1

PRG042_DD3C:
	RTS		 ; Return


BleckProj_ObjCalcYDiffs:
	LDA entity_lo_y,Y
	SUB <entity_lo_y,X
	STA <var16		 ; var16 = difference between Player's Y and object's Y

	LDA entity_hi_y,Y
	PHA

	LDY #$00	 ; Y = 0
	
	PLA
	SBC <entity_hi_y,X
	BPL PRG042_DD4D	 ; If Player's Y Hi >= Object's Y Hi, jump to PRG042_DD4D (RTS)

	INY		 ; Ohterwise Y = 1

PRG042_DD4D:
	RTS		 ; Return

Bleck_FireShotInit:
	LDA #$40
	STA entity_timer,X

	JSR Bleck_Shoot

	INC <entity_var5,X
	
	LDA #1
	STA entity_animation_frame,X

Bleck_FireShot:
	LDA entity_timer,X
	BNE BleckFS_StillTimering

	LDA #0
	STA <entity_var5,X

BleckFS_StillTimering:
	RTS

Bleck_Shoot:
	JSR_THUNKA 3, Bleck_CalcProjPath

	JSR PrepareNewObjectOrAbort

	LDA #SND_LEVELFLAME
	STA Sound_QLevel2

	; It's a Bleck Projectile
	LDA #OBJ_BLECK_PROJ
	STA entity_type,X

	LDA #1
	STA <entity_var5,X

	LDA <var1
	STA <entity_lo_y_velocity,X
	LDA <var2
	STA <entity_lo_x_velocity,X

	LDY <entity_index
	LDA entity_lo_x,Y
	STA <entity_lo_x,X
	LDA entity_hi_x,Y
	STA <entity_hi_x,X

	LDA entity_lo_y,Y
	STA <entity_lo_y,X
	LDA entity_hi_y,Y
	STA <entity_hi_y,X

	; Set attributes
	LDA #SPR_PAL2
	STA Objects_SprAttr,X

	LDA #3
	STA entity_animation_frame,X

	LDX <entity_index
	RTS


Bleck_Die:
	LDA SndCur_Level1
	CMP #SND_LEVELBABOOM
	BEQ BleckDie_BaboomOK
	
	LDA #SND_LEVELBABOOM
	STA Sound_QLevel1
	
BleckDie_BaboomOK:
	LDA entity_timer,X
	BNE BleckDie_StillBooming

	; Really just using this for star coin checking
	JSR Save_GetTotalStarsAndHighWorld
	
	; HAX!
	JSR Bleck_StarCoinAddHack
		
	; If var17 is not 1, you didn't get enough
	; star coins (indicates an overflow in the count,
	; and there are more than 255 star coins!)
	LDA var17
	CMP #1
	BNE Bleck_NotEnoughSCs
	
	; Finally, Map_StarCoin_Got must match Map_StarCoin_Total!
	LDA Map_StarCoin_Got
	CMP Map_StarCoin_Total
	BNE Bleck_NotEnoughSCs

	; All star coins! Do your special ending!
	LDA #$80
	STA Player_RescuePrincess
		
	LDA #0
	STA Map_ReturnStatus
		
	LDA #1
	STA Level_ExitToMap
	RTS

Bleck_NotEnoughSCs:
	; Force end of world always
	LDA #0
	STA Level_IsComplete

	JMP_THUNKC 30, Object_TriggerEndWorld

BleckDie_StillBooming:
	RTS
	
	; Basically if the level's not complete with exactly the
	; star coins you're holding, the star coin count will be
	; short by however many you weren't holding last time it
	; was completed (if ever.) This just quickly merges the
	; star coins you're carrying with the current completion
	; information so the count comes out right...
Bleck_StarCoinAddHack:
	; Take all current star coin bytes and combine into a bitfield
	LDA Inventory_Cards
	ASL A
	ASL A
	STA var1

	LDA Inventory_Cards+1
	ASL A
	ORA var1
	STA var1

	LDA Inventory_Cards+2
	ORA var1
	STA var1

	; Now take whatever star cards were already collected out of the equation
	EOR Level_IsComplete
	AND #(MCOMP_SCOIN1 | MCOMP_SCOIN2 | MCOMP_SCOIN3)	; Only caring about the star coins, not completion bits
	TAY
		
	LDA Map_StarCoin_Got
	ADD Bleck_SCoinBitToVal,Y
	STA Map_StarCoin_Got
	LDA var17
	ADC #0
	STA var17
	
	RTS

	; Given that the star coins are stored in Map_Completions
	; as individual bits, but we just need a total, this is
	; a quick cheater table that helps us get there...
	;MCOMP_SCOIN3	= %00000001	; Bit 0 - Star Coin 3 collected
	;MCOMP_SCOIN2	= %00000010	; Bit 1 - Star Coin 2 collected
	;MCOMP_SCOIN1	= %00000100	; Bit 2 - Star Coin 1 collected
Bleck_SCoinBitToVal:
	.byte 0		; %000
	.byte 1		; %001
	.byte 1		; %010
	.byte 2		; %011
	.byte 1		; %100
	.byte 2		; %101
	.byte 2		; %110
	.byte 3		; %111


ObjInit_BattleCtl42:

	LDA World_Num
	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word InitBattleCtl_W1	; World 1
	.word InitBattleCtl_W2	; World 2
	.word InitBattleCtl_W3	; World 3
	.word InitBattleCtl_W4	; World 4
	.word InitBattleCtl_W5	; World 5
	.word InitBattleCtl_W6	; World 6
	.word InitBattleCtl_W7	; World 7
	.word InitBattleCtl_W7	; World 8
	.word $0000				; World 9
	.word InitBattleCtl_WZ	; World Zero
		
		
InitBattleCtl_W6:
	; This mixes every other CannonFire timer (should only be two here)
	; to make the Fazzy Crab pipes alternate a bit instead of sync
	LDY #7
	LDA #0
BCW6_SplitCFTimerLoop:

	LDA #$70/2
	STA CannonFire_Timer,Y
	DEY
	DEY
	BPL BCW6_SplitCFTimerLoop		
	
	JSR InitBattleCtl_W1
	
	LDA #5
	STA <entity_var4,X
	RTS

InitBattleCtl_W1:

	; Dead fish tracking
	LDA #$FF
	STA Object_BufferX
	STA Object_BufferX+1
	STA Object_BufferX+2
	STA Object_BufferX+3

	; Number of fish to kill
	LDA #3
	STA <entity_var4,X

InitBattleCtl_W2:
InitBattleCtl_W5:
InitBattleCtl_W7:
InitBattleCtl_WZ:
	RTS


InitBattleCtl_W4:
	JSR InitBattleCtl_W1	; Basically World 1...
	
	LDA #9
	STA <entity_var4,X		; More baddies, though
	
	; Countdown timer
	LDA #$7F
	STA entity_var2,X
	STA entity_no_collision_timer,X
	
	RTS


InitBattleCtl_W3:
	LDA #1
	STA <entity_hi_x,X
	LDA #$D0
	STA <entity_lo_x,X
	RTS


ObjNorm_BattleCtl42:

	LDA World_Num
	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word BattleCtl_W1	; World 1
	.word BattleCtl_W2	; World 2
	.word BattleCtl_W3	; World 3
	.word BattleCtl_W4	; World 4
	.word BattleCtl_W5	; World 5
	.word BattleCtl_W6	; World 6
	.word BattleCtl_W7	; World 7
	.word BattleCtl_W7	; World 8
	.word $0000			; World 9
	.word BattleCtl_WZ	; World Zero
	

BCW1_Sprite_Patterns:
	.byte $E7, $E9, $95, $71
BCW1_Sprite_Patterns_End
BCW4_Sprite_Patterns:
	.byte $D7, $D9, $D5, $71
BCW6_Sprite_Patterns:
	.byte $DB, $DD, $D5, $71

BCW_PatternOff_ByWorld:	
	.byte 0
	.byte 0
	.byte 0
	.byte (BCW4_Sprite_Patterns - BCW1_Sprite_Patterns)
	.byte 0
	.byte (BCW6_Sprite_Patterns - BCW1_Sprite_Patterns)
	.byte 0
	.byte 0

BCW_SprOff_ByWorld:
	.byte $00
	.byte $00
	.byte $00
	.byte $40
	.byte $00
	.byte $40
	.byte $00
	.byte $00

BCW_SprAttr_ByWorld:
	.byte SPR_PAL1
	.byte SPR_PAL1
	.byte SPR_PAL1
	.byte SPR_PAL2
	.byte SPR_PAL1
	.byte SPR_PAL1
	.byte SPR_PAL1
	.byte SPR_PAL1

BattleCtl_W4:
	JSR BattleCtl_W1_NoBankSel	; Do most of everything in World 1...
	
	; Different pattern bank, though
	LDA #253
	STA PatTable_BankSel+5
	
	LDA entity_var3,X
	BEQ BCW4_SpawnCheck
	
	; Clear "all dead" flag!
	LDA #0
	STA entity_var3,X
	
	; Destroy the Rexes and Yoshi
	JSR Boss_DestroyOtherObjects
	
	; ... but not self!
	LDA #OBJSTATE_NORMAL
	STA entity_state,X
	
	LDA #-$7F
	STA <player_lo_y_velocity
	STA <player_is_in_air
	
	LDA <player_lo_y
	SUB #8
	STA <player_lo_y
	LDA <player_hi_y
	SBC #0
	STA <player_hi_y
	
	LDA #0
	STA Player_Kuribo
	
	LDA #16
	STA <entity_var5,X
		
	LDA #SND_LEVELAIRSHIP
	STA Sound_QLevel2
		
BCW4_SpawnCheck:
	; Also, gotta spawn Rex!
	LDA entity_no_collision_timer,X
	BNE BCW4_DoNothing

	JSR BCW4_SpawnRex
			
BCW4_DoNothing:


	LDA <entity_var5,X
	BEQ BCW4_NotBustingMunchers

	DEC <entity_var5,X
	LDA <entity_var5,X
	ASL A
	ASL A
	ASL A
	ASL A
	;ADD #64
	STA Level_BlockChgXLo
	LDA #0
	STA Level_BlockChgXHi

	LDY #64
	
	LDA <entity_var5,X
	SUB #4
	CMP #8
	BGE BCW4_BustingLowMunchers
		
	LDY #160
	
BCW4_BustingLowMunchers:
	STY Level_BlockChgYLo
	LDA #0
	STA Level_BlockChgYHi
	
	LDA #CHNGTILE_TOMETALPLATE
	STA Level_ChgTileEvent

BCW4_NotBustingMunchers:
	RTS

SpawnRex_PipeX:	.byte $08, $E8
SpawnRex_Flip:	.byte SPR_HFLIP, $00
SpawnRex_XVel:	.byte $08, -$08

BCW4_SpawnRex:
	; Toggle sides
	;LDA entity_var1,X
	;EOR #1
	LDA RandomN
	AND #1
	STA entity_var1,X
	TAY
	
	JSR PrepareNewObjectOrAbort
		
	LDA #SND_PLAYERPIPE
	STA Sound_QPlayer

	LDA #OBJ_REX
	STA entity_type,X
	
	LDA SpawnRex_PipeX,Y
	STA <entity_lo_x,X
	LDA #0
	STA <entity_hi_x,X

	LDA RandomN+1
	AND #1
	TAY
	
	LDA SpawnRex_Flip,Y
	STA entity_flipped_animation,X

	LDA #(SPR_PAL2 | SPR_BEHINDBG)
	STA Objects_SprAttr,X
	
	LDA #$0C
	STA <entity_lo_y,X
	LDA #0
	STA <entity_hi_y,X

	LDA #OBJSTATE_NORMAL
	STA entity_state,X
	
	LDA SpawnRex_XVel,Y
	STA <entity_lo_x_velocity,X
			
	LDX <entity_index
	
	; Less time between Rexes next time, to a limit of $3F
	LDA entity_var2,X
	CMP #$40
	BLT BCW4_NoDecTimer
	
	SUB #$10
	STA entity_var2,X

BCW4_NoDecTimer:
	STA entity_no_collision_timer,X

	RTS


BattleCtl_CheckDeadFish:
	; Check if getting devoured by Yoshi
	LDY Player_Kuribo	; Yoshi index -> 'Y'
	BEQ BCCDF_NoYoshiEat	; If zero, Player's not riding Yoshi, jump to Fish_NoYoshiEat	
	DEY					; Index correction

	TXA
	CMP entity_var6,Y
	BEQ BCCDF_DeadFish	; If Yoshi is devouring this one, jump to Fish_DeadFish

BCCDF_NoYoshiEat:
	LDA Objects_FrozenTimer,X
	CMP #$FF
	BEQ BCCDF_DeadFish		; If frozen and kicked, object is as good as dead!

	; Fazzy Crabs aren't dead until they have non-zero Var6 (otherwise angry state is incorrectly counted)
	LDA entity_type,X
	CMP #OBJ_FAZZYCRAB
	BNE BCCDF_NotFazzy

	; Fazzy Crab only...
	LDA entity_var6,X
	BEQ BCCDF_NotDeadFish	; Not dead yet!

BCCDF_NotFazzy:
	LDA entity_state,X
	CMP #OBJSTATE_SQUASHED
	BEQ BCCDF_DeadFish
	CMP #OBJSTATE_KILLED
	BNE BCCDF_NotDeadFish
	
BCCDF_DeadFish:
	SEC		; Dead fish, set carry
	RTS
	
BCCDF_NotDeadFish:
	CLC		; Not dead fish, clear carry
	RTS


BattleCtl_W1:
	LDA #253
	STA PatTable_BankSel+4

BattleCtl_W1_NoBankSel:
	LDA <entity_var4,X
	BEQ Fish_KilledEnough

	; Clear any tracking that is no longer tracking a dead fish
	LDY #3
FishTrackingClearLoop:
	LDX Object_BufferX,Y
	BMI FTCL_Empty	; Mainly checking $FF empty flag

	TYA
	PHA
	
	; Does this still point to a killed-state fish?
	JSR BattleCtl_CheckDeadFish
	
	PLA
	TAY
	
	
	BCS FTCL_Empty	; If so, jump to FTCL_Empty
	
	; Pointing to a slot that is no longer a killed fish!
	LDA #$FF
	STA Object_BufferX,Y
	
FTCL_Empty:
	DEY
	BPL FishTrackingClearLoop

	; Basically loop through all objects looking for one in killed state
	LDX #4
Fish_DeadCheckLoop:

	JSR BattleCtl_CheckDeadFish
	BCC Fish_NotDeadFish

	; Make sure we're not already tracking this one
	LDY #3
	TXA
FishTrackingCheckLoop:
	CMP Object_BufferX,Y
	BEQ Fish_NotDeadFish	; If already tracking, jump to Fish_NotDeadFish

	DEY
	BPL FishTrackingCheckLoop

	; If you get here, this is a new one! Find empty tracking var and plug it in...
	LDY #3
FishTrackingInsertLoop:
	LDA Object_BufferX,Y
	BPL FTIL_Next	; If in use, jump to FTIL_Next
	
	; Empty slot! Plug it in, and one less fish...
	TXA
	STA Object_BufferX,Y

	LDY <entity_index
	LDA entity_var4,Y
	SUB #1
	STA entity_var4,Y
	
	BNE Fish_NotDeadFish

	; If we get here, we're at zero! Set timer and bail...
	LDX <entity_index

	; Flag for those who care
	LDA #1
	STA entity_var3,X

	; Stop cheep spawning
	LDA #0
	STA Level_Event

	BEQ Fish_KilledEnough	; If killed enough fish, jump to Fish_KilledEnough
	
FTIL_Next:
	DEY
	BPL FishTrackingInsertLoop

Fish_NotDeadFish:
	DEX
	BPL Fish_DeadCheckLoop

	BMI Fish_DrawHUD

Fish_KilledEnough:
	JSR BatlCtl_TBoxTimeout

Fish_DrawHUD:
	LDY World_Num
	LDA BCW_SprOff_ByWorld,Y
	STA <var3	; Pattern offset

	LDA BCW_SprAttr_ByWorld,Y
	STA <var4	; Sprite attribute

	
	; Draw HUD
	LDX <entity_index

	LDA <entity_var4,X
	STA <var2

	LDY Object_SprRAM,X
	LDX #0	; World 1 starts here


	LDX World_Num
	LDA BCW_PatternOff_ByWorld,X
	TAX

	LDA #$70
	STA <var1
	
BCW1_SprLoop:
	LDA #$08
	STA Sprite_RAM+$00,Y
	LDA BCW1_Sprite_Patterns,X
	CMP #$71
	BNE BCW1_Other
	
	; Number!
	LDA <var2
	ASL A
	ADD #$81
	ADD <var3

BCW1_Other:
	STA Sprite_RAM+$01,Y
	LDA <var4
	STA Sprite_RAM+$02,Y
	LDA <var1
	STA Sprite_RAM+$03,Y
	
	LDA <var1
	ADD #8
	STA <var1
	
	INY
	INY
	INY
	INY
	
	INX
	TXA
	AND #$03	; When we have done 4 sprites, will be zero
	BNE BCW1_SprLoop
	
	
	LDX <entity_index
	RTS


BatlCtl_TBoxTimeout:
	LDA entity_timer,X
	BEQ BCTT_SetTimeout
	CMP #1
	BNE BCTT_NotTimeout	; If timer not expired, jump to BCTT_NotTimeout

	; Timer expired! Turn into a chest...
	JSR Level_PrepareNewObject
	
	LDA #OBJ_TREASUREBOX
	STA entity_type,X
	
	LDA #OBJSTATE_INIT
	STA entity_state,X

BCTT_NotTimeout:
	RTS
	
BCTT_SetTimeout:
	LDA #$80
	STA entity_timer,X
	RTS

BattleCtl_W3:
	; W3's battle is impossible to lose!
	LDA #4
	STA Player_FlashInv


BattleCtl_WZ:
	; Set timers on Magiblots to make them spread out a bit
	LDY #4
IBCWZ_MagiblotLoop:
	LDA entity_type,Y
	CMP #OBJ_MAGIBLOT
	BNE IBCWZ_NotMagiblot

	LDA entity_var5,Y
	BNE IBCWZ_NotMagiblot

	; Magiblot is in state 0... try to withhold him a bit

	LDA RandomN,Y
	AND #$3F
	STA entity_timer,Y

IBCWZ_NotMagiblot:
	DEY
	BPL IBCWZ_MagiblotLoop


BattleCtl_W2:
BattleCtl_W5:
BattleCtl_W7:

	; Just look for anything that's alive (besides ourself)
	LDY #4
BCAnyAlive_CheckLoop:
	CPY <entity_index
	BEQ BCAACL_SkipSelf

	LDA entity_state,Y
	CMP #OBJSTATE_NORMAL
	BEQ BCTT_NotTimeout		; Something's alive, do nothing else

BCAACL_SkipSelf:
	DEY
	BPL BCAnyAlive_CheckLoop

	LDA #0
	STA Player_FlashInv

	; If you get here, nothing's left..
	JMP BatlCtl_TBoxTimeout


BattleCtl_W6:
	JSR BattleCtl_W1_NoBankSel	; Do most of everything in World 1...
	
	; Different pattern bank, though
	LDA #253
	STA PatTable_BankSel+5

	LDA entity_var3,X
	BEQ BCW6_NotAllDeadFlagged
	
	; Clear "all dead" flag!
	LDA #0
	STA entity_var3,X
	
	; Destroy the Fazzy Crabs
	JSR Boss_DestroyOtherObjects
		
	; ... but not self!
	LDA #OBJSTATE_NORMAL
	STA entity_state,X

	; All stop all cannon fires
	LDY #7
	LDA #0
BCW6_NixCannonFireLoop:

	STA CannonFire_ID,Y
	DEY
	BPL BCW6_NixCannonFireLoop

BCW6_NotAllDeadFlagged:
	RTS
