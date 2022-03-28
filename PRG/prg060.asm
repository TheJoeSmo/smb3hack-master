Player_FellAndDied60:
	; Fell in a pit and died
	LDA #PLAYERSUIT_SMALL
	STA <Player_Suit ; Player_Suit = PLAYERSUIT_SMALL

	JSR Player_Die	 ; Begin death sequence

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