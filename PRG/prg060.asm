Player_FellAndDied60:
	; Fell in a pit and died
	LDA #powerup_none
	STA <player_powerup ; player_powerup = powerup_none

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
	LDA <var13
	STA Level_BlockChgYHi
	LDA <var14
	AND #$F0		; Align to nearest grid coordinate
	STA Level_BlockChgYLo

	; Store change X Hi and Lo
	LDA <var15
	STA Level_BlockChgXHi
	LDA <var16	
	AND #$F0	 	; Align to nearest grid coordinate
	STA Level_BlockChgXLo

	RTS		 ; Return

Player_DoClimbAnim60:
	; SB: Supporting "behind the scenes" alternate climb frame; now it's 2 different climb frames
	LDA <player_powerup
	ASL A				; x 2
	ADD Player_Behind	; Assuming this will only ever be 0/1
	TAY		; -> 'Y'
	
	LDA Player_ClimbFrame,Y	 ; Get appropriate climbing frame
	STA <player_animation_frame	 ; Store into player_animation_frame

	LDA <buttons_held
	AND #(button_up_mask | button_down_mask | button_left_mask | button_right_mask)
	BEQ PRG060_B035	 ; If Player is NOT pressing a direction, jump to PRG008_B035

	; Every 8 ticks, flip Player horizontally
	LDA <Counter_1
	AND #$08
	ASL A	
	ASL A	
	ASL A	
	STA <player_flipped_animation
PRG060_B035:
	RTS		 ; Return


SpawnKuriboAtPlayer:
	LDX #$04	 
PRG060_B0B7:
	LDA entity_state,X
	BEQ PRG060_B0C1	 ; If this object slot is dead/empty, jump to PRG002_B0C1
	DEX		 ; X--
	BPL PRG060_B0B7	 ; While X >= 0, loop!

	BMI PRG060_B0FB	 ; If no object slots are available, jump to PRG002_B0FB

PRG060_B0C1:
	JSR_THUNKC 0, Level_PrepareNewObject	 ; Prepare new object (the Goomba which is knocked out)

	; Start Shoe off in normal state
	LDA #OBJSTATE_NORMAL
	STA entity_state,X

	; It's a Goomba
	LDA #OBJ_KURIBO
	STA entity_type,X

	; Palette select 3
	LDA #SPR_PAL2
	STA Objects_SprAttr,X

	; Set equal to players's X
	LDA player_lo_x
	STA <entity_lo_x,X

	; Set equal to players's X Hi
	LDA player_hi_x
	STA <entity_hi_x,X

	; Set 16 pixels below the players's Y
	LDA player_lo_y
	ADD #16
	STA <entity_lo_y,X
	LDA player_hi_y
	ADC #$00
	STA <entity_hi_y,X

	; If negative X velocity, flip Kuribo
	LDA player_lo_x_velocity
	LSR A	
	AND #SPR_HFLIP
	STA entity_flipped_animation,X

	; Remove the Goomba from the Kuribo
	INC <entity_var4,X

	; Set player above the boot.
	LDA <player_lo_y
	SUB #08
	STA <player_lo_y
	LDA <player_hi_y
	SBC #0
	STA <player_hi_y

	LDA #$01
	STA <player_is_in_air

	; Boost the player off of the kuribo.
	LDA #-$30
	STA <player_lo_y_velocity

	; Kuribo's bump Y velocity
	LDA #$20
	STA <entity_lo_y_velocity,X

PRG060_B0FB:
	RTS		 ; Return



Move_Kuribo60:
	LDA Player_InWater
	BNE DoNotExistKuribo
	
	LDA <buttons_held
	AND #button_up_mask
	BEQ DoNotExistKuribo
	BIT <buttons_clicked
	BPL DoNotExistKuribo
	
; Exit Kuribo
	LDA #$00
	STA Player_Kuribo

	LDA #-$30
	STA <player_lo_y_velocity

	JSR SpawnKuriboAtPlayer
	RTS

DoNotExistKuribo:


	JSR Player_GroundHControl ; Do Player left/right input control
	JSR Player_JumpFlyFlutter ; Do Player jump, fly, flutter wag

	LDA <player_is_in_air
	BNE PRG008_AAFF	 ; If Player is mid air, jump to PRG008_AAFF

	STA Player_KuriboDir	 ; Clear Player_KuriboDir

PRG008_AAFF:
	LDA Player_KuriboDir
	BNE PRG008_AB17	 ; If Kuribo's shoe is moving, jump to PRG008_AB17

	LDA <player_is_in_air
	BNE PRG008_AB25	 ; If Player is mid air, jump to PRG008_AB25

	LDA <buttons_held
	AND #(button_left_mask | button_right_mask)
	STA Player_KuriboDir	 ; Store left/right pad input -> Player_KuriboDir
	BEQ PRG008_AB25	 	; If Player is not pressing left or right, jump to PRG008_AB25
	INC <player_is_in_air	 ; Flag as in air (Kuribo's shoe bounces along)

	LDY #-$20
	STY <player_lo_y_velocity	 ; player_lo_y_velocity = -$20

PRG008_AB17:
	LDA <buttons_clicked
	BPL PRG008_AB25	 ; If Player is NOT pressing 'A', jump to PRG008_AB25

	LDA #$00
	STA Player_KuriboDir	 ; Player_KuriboDir = 0

	LDY Player_RootJumpVel	 ; Get initial jump velocity
	STY <player_lo_y_velocity	 ; Store into Y velocity

PRG008_AB25:
	LDY <player_powerup
	BEQ PRG008_AB2B	 ; If Player is small, jump to PRG008_AB2B

	LDY #$01	 ; Otherwise, Y = 1

PRG008_AB2B:

	; Y = 0 if small, 1 otherwise

	LDA Player_KuriboFrame,Y	; Get appropriate Kuribo's shoe frame
	STA <player_animation_frame		; Store as active Player frame

	LDA <Counter_1
	AND #$08	
	BEQ PRG008_AB38	 	; Every 8 ticks, jump to PRG008_AB38

	INC <player_animation_frame	; player_animation_frame++

PRG008_AB38:
	RTS		 ; Return
