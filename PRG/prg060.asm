Player_FellAndDied60:
	; Fell in a pit and died
	LDA #PLAYERSUIT_SMALL
	STA <Player_Suit ; Player_Suit = PLAYERSUIT_SMALL

	JSR_THUNKA 61, Player_Die61  ; Kill the player

	LDX Player_Current
	LDA Player_Lives,X
	BNE Player_PitNoGO
	
	LDA #4
	STA <Player_IsDying
    BEQ Player_PitNoGO
	JMP PRG008_A472

	
Player_PitNoGO:
	; This jumps the initial part of the death sequence
	LDA #$c0
	STA Event_Countdown ; Event_Countdown = $C0
	LDA #$02
	STA <Player_IsDying	; Player_IsDying = 2 (already dropped off screen)
    RTS


Level_QueueChangeBlock60:
	LDA Temp_VarNP0			; Restore A
	STA Level_ChgTileEvent	 ; Store type of block change!

	; Store change Y Hi and Lo
	LDA <Temp_Var13
	STA Level_BlockChgYHi
	LDA <Temp_Var14
	AND #$F0		; Align to nearest grid coordinate
	STA Level_BlockChgYLo

	; Store change X Hi and Lo
	LDA <Temp_Var15
	STA Level_BlockChgXHi
	LDA <Temp_Var16	
	AND #$F0	 	; Align to nearest grid coordinate
	STA Level_BlockChgXLo

	RTS		 ; Return

Player_DoClimbAnim60:
	; SB: Supporting "behind the scenes" alternate climb frame; now it's 2 different climb frames
	LDA <Player_Suit
	ASL A				; x 2
	ADD Player_Behind	; Assuming this will only ever be 0/1
	TAY		; -> 'Y'
	
	LDA Player_ClimbFrame,Y	 ; Get appropriate climbing frame
	STA <Player_Frame	 ; Store into Player_Frame

	LDA <Pad_Holding
	AND #(PAD_UP | PAD_DOWN | PAD_LEFT | PAD_RIGHT)
	BEQ PRG060_B035	 ; If Player is NOT pressing a direction, jump to PRG008_B035

	; Every 8 ticks, flip Player horizontally
	LDA <Counter_1
	AND #$08
	ASL A	
	ASL A	
	ASL A	
	STA <Player_FlipBits
PRG060_B035:
	RTS		 ; Return


SpawnKuriboAtPlayer:
	LDX #$04	 
PRG060_B0B7:
	LDA Objects_State,X
	BEQ PRG060_B0C1	 ; If this object slot is dead/empty, jump to PRG002_B0C1
	DEX		 ; X--
	BPL PRG060_B0B7	 ; While X >= 0, loop!

	BMI PRG060_B0FB	 ; If no object slots are available, jump to PRG002_B0FB

PRG060_B0C1:
	JSR_THUNKC 0, Level_PrepareNewObject	 ; Prepare new object (the Goomba which is knocked out)

	; Start Shoe off in normal state
	LDA #OBJSTATE_NORMAL
	STA Objects_State,X

	; It's a Goomba
	LDA #OBJ_KURIBO
	STA Level_ObjectID,X

	; Palette select 3
	LDA #SPR_PAL2
	STA Objects_SprAttr,X

	; Set equal to players's X
	LDA Player_X
	STA <Objects_X,X

	; Set equal to players's X Hi
	LDA Player_XHi
	STA <Objects_XHi,X

	; Set 16 pixels below the players's Y
	LDA Player_Y
	ADD #16
	STA <Objects_Y,X
	LDA Player_YHi
	ADC #$00
	STA <Objects_YHi,X

	; If negative X velocity, flip Kuribo
	LDA Player_XVel
	LSR A	
	AND #SPR_HFLIP
	STA Objects_FlipBits,X

	; Remove the Goomba from the Kuribo
	INC <Objects_Var4,X

	; Set player above the boot.
	LDA <Player_Y
	SUB #08
	STA <Player_Y
	LDA <Player_YHi
	SBC #0
	STA <Player_YHi

	LDA #$01
	STA <Player_InAir

	; Boost the player off of the kuribo.
	LDA #-$30
	STA <Player_YVel

	; Kuribo's bump Y velocity
	LDA #$20
	STA <Objects_YVel,X

PRG060_B0FB:
	RTS		 ; Return



Move_Kuribo60:
	LDA Player_InWater
	BNE DoNotExistKuribo
	
	LDA <Pad_Holding
	AND #PAD_UP
	BEQ DoNotExistKuribo
	BIT <Pad_Input
	BPL DoNotExistKuribo
	
; Exit Kuribo
	LDA #$00
	STA Player_Kuribo

	LDA #-$30
	STA <Player_YVel

	JSR SpawnKuriboAtPlayer
	RTS

DoNotExistKuribo:


	JSR Player_GroundHControl ; Do Player left/right input control
	JSR Player_JumpFlyFlutter ; Do Player jump, fly, flutter wag

	LDA <Player_InAir
	BNE PRG008_AAFF	 ; If Player is mid air, jump to PRG008_AAFF

	STA Player_KuriboDir	 ; Clear Player_KuriboDir

PRG008_AAFF:
	LDA Player_KuriboDir
	BNE PRG008_AB17	 ; If Kuribo's shoe is moving, jump to PRG008_AB17

	LDA <Player_InAir
	BNE PRG008_AB25	 ; If Player is mid air, jump to PRG008_AB25

	LDA <Pad_Holding
	AND #(PAD_LEFT | PAD_RIGHT)
	STA Player_KuriboDir	 ; Store left/right pad input -> Player_KuriboDir
	BEQ PRG008_AB25	 	; If Player is not pressing left or right, jump to PRG008_AB25
	INC <Player_InAir	 ; Flag as in air (Kuribo's shoe bounces along)

	LDY #-$20
	STY <Player_YVel	 ; Player_YVel = -$20

PRG008_AB17:
	LDA <Pad_Input
	BPL PRG008_AB25	 ; If Player is NOT pressing 'A', jump to PRG008_AB25

	LDA #$00
	STA Player_KuriboDir	 ; Player_KuriboDir = 0

	LDY Player_RootJumpVel	 ; Get initial jump velocity
	STY <Player_YVel	 ; Store into Y velocity

PRG008_AB25:
	LDY <Player_Suit
	BEQ PRG008_AB2B	 ; If Player is small, jump to PRG008_AB2B

	LDY #$01	 ; Otherwise, Y = 1

PRG008_AB2B:

	; Y = 0 if small, 1 otherwise

	LDA Player_KuriboFrame,Y	; Get appropriate Kuribo's shoe frame
	STA <Player_Frame		; Store as active Player frame

	LDA <Counter_1
	AND #$08	
	BEQ PRG008_AB38	 	; Every 8 ticks, jump to PRG008_AB38

	INC <Player_Frame	; Player_Frame++

PRG008_AB38:
	RTS		 ; Return
