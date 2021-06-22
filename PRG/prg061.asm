
Level_PrepareNewObjectAlt:
; Clear various object variables
	LDA #$00
	STA Objects_Var1,X
	STA Objects_Var2,X
	STA <Objects_SpriteX,X
	STA Objects_Timer,X
	STA Objects_Timer2,X
	STA <Objects_XVel,X
	STA <Objects_YVel,X
	STA Objects_FlipBits,X
	STA Objects_Frame,X	
	STA Objects_ColorCycle,X
	STA Objects_ReverseGrav,X	; SB
	STA Objects_FrozenTimer,X	; SB
	STA Objects_IsBehind,X		; SB
	STA Objects_StompDisable,X	; SB
	STA <Objects_DetStat,X	
	STA Objects_PlayerHitStat,X
	STA Objects_Var7,X
	STA <Objects_Var5,X

	CPX #$06
	BGE PRG000_D4C8	 ; If using slot index >= 6, jump to PRG000_D4C8 (skip variables available only to slots 0 to 5)

	; Clear some more variables (object slots 0 to 5 ONLY)
	STA Objects_DisPatChng,X
	STA ObjSplash_DisTimer,X
	STA Objects_QSandCtr,X
	STA Objects_InWater,X

PRG000_D4C8:
	CPX #$05
	BGE PRG000_D506	 ; If using slot index >= 5, jump to PRG000_D506 (skip variables available only to slots 0 to 4)

	; Clear even more variables (object slots 0 to 4 [major objects] ONLY!!)
	STA <Objects_Var4,X
	STA Objects_Timer4,X
	STA Objects_Timer3,X
	STA Objects_Slope,X
	STA Objects_Var3,X	
	STA Objects_Var6,X	 
	STA Objects_TargetingXVal,X
	STA Objects_TargetingYVal,X
	STA Objects_IsGiant,X
	STA Objects_HitCount,X
	STA Objects_DisPatChng,X
	STA Objects_Var10,X
	STA Objects_Var11,X
	STA Objects_Var12,X
	STA Objects_Var13,X
	STA Objects_Var14,X

PRG000_D506:
	RTS		 ; Return


_Player_KickObject:
	LDA Level_PipeMove
	BEQ Player_KickObjectRegular
	JMP Player_InvalidKick

Player_KickObjectRegular:
	; Play kick sound
	LDA Sound_QPlayer
	ORA #SND_PLAYERKICK
	STA Sound_QPlayer

	; Have Player do kick frame
	LDA #$0c
	STA Player_Kick

	; Set object timer 2 to $10
	LDA #$10
	STA Objects_Timer2,X

	LDA Level_ObjectID,X

	; Determine if we need to do extra bob-omb code
	CMP #OBJ_BOBOMBEXPLODE
	BEQ PLayer_KickBobomb
	CMP #OBJ_BOBOMB	 
	BNE Player_KickRegular

PLayer_KickBobomb:
	; State remains "normal"
	LDA #OBJSTATE_NORMAL
	STA Objects_State,X

	; Set Y vel to -$20 (bounce up)
	LDA #-$20
	STA <Objects_YVel,X

	; Set X Velocity appropriately based on kick direction
	JSR Level_ObjCalcXDiffs
	LDA BobombKickXVel,Y
	STA <Objects_XVel,X

	EOR <Player_XVel
	BMI PRG000_CE76	 ; If the Bob-omb's X velocity is the opposite sign of the Player's, jump to PRG000_CE76

	LDA <Player_XVel
	STA <Temp_Var1		; -> Temp_Var1 (yyyy xxxx)
	ASL <Temp_Var1		; Shift 1 bit left (bit 7 into carry) (y yyyx xxx0)
	ROR A			; A is now arithmatically shifted to the right (yyyyy xxx) (signed division by 2)
	ADD ObjectKickXVelMoving,Y	 ; Add base "moving" X velocity of Bob-omb
	STA <Objects_XVel,X	 ; Set this as Bob-omb's X Velocity

PRG000_CE76:
	JMP Object_ShakeAndDraw	 ; Draw Bob-omb and don't come back!

Player_KickRegular:

	; Anything besides a Bob-omb...

	; Clear Objects_KillTally 
	LDA #$00	
	STA Objects_KillTally,X

	LDA Objects_State,X
	CMP #OBJSTATE_HELD
	BNE PRG000_CEBE	 ; If object's state is not Held, jump to PRG000_CEBE

	; This object is being held by Player...

	LDA Level_ObjectID,X
	CMP #OBJ_ICEBLOCK
	BEQ HeldKickRegular	 ; If this is an ice block, jump to PRG000_CEB4

	LDY #1	 ; Y = 1

	LDA <Player_FlipBits
	BNE PRG000_CE94	 ; If Player is not turned around, jump to PRG000_CE94

	LDY #-1	 ; Y = -1

PRG000_CE94:
	STY <Objects_XVel,X	 ; Set minimum X velocity on object (to enable wall hit detection)

	JSR Object_WorldDetectN1 ; Detect against world

	LDA <Objects_DetStat,X
	AND #$03	
	BEQ HeldKickRegular	 ; If object has not hit a wall, jump to PRG000_CEB4

	; KICK OBJECT INTO WALL LOGIC

	; Flat 100 points
	LDA #$05
	JSR Score_PopUp

	; Object state is Killed
	LDA #OBJSTATE_KILLED
	STA Objects_State,X

	; Set object Y velocity to -$40 (fly up a bit)
	LDA #-$40
	STA <Objects_YVel,X

	; Remove that minimum X velocity
	LDA #$00
	STA <Objects_XVel,X

	JMP PRG000_CF98	 ; Jump to PRG000_CF98

HeldKickRegular:
	LDY #0	 	; Y = 0

	LDA <Pad_Holding
	AND #PAD_UP
	BEQ NormalHeldKick			; Not holding up when let go of B, so do a normal kick
	INY
	INY

NormalHeldKick:

	LDA <Player_FlipBits
	BEQ PRG000_CEBB	; If Player has not turned around, jump to PRG000_CEBB

	INY		; Y = 1

PRG000_CEBB:
	JMP PRG000_CEC6	; Jump to PRG000_CEC6

PRG000_CEBE:

	; Object kicked, was not held

	; Make sure Player is facing object he's kicking
	JSR Level_ObjCalcXDiffs
	LDA PlayerKickFlipBits,Y
	STA <Player_FlipBits

PRG000_CEC6:
	; Get the base kicking speeds
	LDA ObjectKickXVelMoving,Y
	STA <Objects_XVel,X
	LDA ObjectKickYVelMoving, Y
	STA <Objects_YVel, X

	EOR <Player_XVel
	BMI PRG000_CEDC	 ; If the object's X velocity is the opposite sign of the Player's, jump to PRG000_CEDC

	LDA <Player_XVel 	; Get the Player's X velocity
	STA <Temp_Var1		; -> Temp_Var1 (yyyy xxxx)
	ASL <Temp_Var1		; Shift 1 bit left (bit 7 into carry) (y yyyx xxx0)
	ROR A			; A is now arithmatically shifted to the right (yyyyy xxx) (signed division by 2)
	ADD ObjectKickXVelMoving,Y	 ; Add base "moving" X velocity of object
	STA <Objects_XVel,X	 ; Set as object's X velocity

PRG000_CEDC:
	; If object's state is not Killed, jump to PRG000_CEE8
	LDA Objects_State,X
	CMP #OBJSTATE_KILLED
	BEQ PRG000_CEE8

	TYA
	AND #$02
	BEQ SetEnemyAsKicked

	; Add extra velocity to vertically kicked shells
	LDA <Player_XVel 	; Get the Player's X velocity
	;STA <Temp_Var1		; -> Temp_Var1 (yyyy xxxx)
	;ASL <Temp_Var1		; Shift 1 bit left (bit 7 into carry) (y yyyx xxx0)
	;ROR A			; A is now arithmatically shifted to the right (yyyyy xxx) (signed division by 2)
	;ADD ObjectKickXVelMoving,Y	 ; Add base "moving" X velocity of object
	STA <Objects_XVel,X	 ; Set as object's X velocity

	; Set shell to be shelled, so it doesn't hit things too much
	LDA #OBJSTATE_SHELLED
	STA Objects_State,X
	BNE PRG000_CEE8

SetEnemyAsKicked:
	; Set object state to 5 (Kicked)
	LDA #OBJSTATE_KICKED
	STA Objects_State,X

PRG000_CEE8:
	JMP PRG000_CF98	 ; Jump to PRG000_CF98

Player_InvalidKick:

	; Player moving through pipes... 

	; Player keeps on holding through the pipes!!
	LDA #$01
	STA Player_IsHolding

	LDA Level_PipeMove
	BEQ PRG000_CEFD	 ; If Player is NOT moving through pipes, jump to PRG000_CEFD

	LDY #$0a	 ; Y = 10
	BNE PRG000_CF1A	 ; Jump (technically always) to PRG000_CF1A

PRG000_CEFD:
	LDY #$00	 ; Y = 0

	LDA <Player_FlipBits
	BNE PRG000_CF04	 ; If Player is turned around, jump to PRG000_CF04

	INY		 ; Y = 1

PRG000_CF04:
	LDA Objects_IsGiant,X
	BEQ PRG000_CF0E	 ; If object is not giant, jump to PRG000_CF0E

	; Y += 5
	INY
	INY
	INY
	INY
	INY

PRG000_CF0E:
	LDA Player_PipeFace
	BEQ PRG000_CF1F	 ; If Player is NOT "pipe facing" (facing forward in pipe), jump to PRG000_CF1F

	; Y += 2
	INY
	INY

	CMP #$05	
	BLT PRG000_CF1A	 ; If less than 5 ticks remaining on the "pipe face", jump to PRG000_CF1A

	INY		 ; Otherwise, Y++

PRG000_CF1A:

	; Set object to occupy Sprite_RAM offset $10
	LDA #$10
	STA Object_SprRAM,X

PRG000_CF1F:

	; Set held object's proper X position
	LDA <Player_X	
	ADD ObjectHoldXOff,Y
	STA <Objects_X,X	

	LDA <Player_XHi	
	ADC ObjectHoldXHiOff,Y
	STA <Objects_XHi,X	

	LDY #0		; Y = 0

	LDA Objects_IsGiant,X
	BNE PRG000_CF3D	 ; If object is giant, jump to PRG000_CF3D

	INY		; Y = 1

	LDA <Player_Suit
	BNE PRG000_CF3D	 ; If Player is not small, jump to PRG000_CF3D

	INY		; Y = 2

PRG000_CF3D:
	LDA Player_ReverseGrav
	BEQ PlayerHold_YOffNoRev	; If Player is not under reverse gravity, jump to PlayerHold_YOffNoRev

	; Use other offsets
	INY
	INY
	INY

PlayerHold_YOffNoRev:
	LDA ObjectHeld_YOff,Y	; Get proper Y offset
	PHA		 ; Save 'A'

	; Set Y offset to object being held
	ADD <Player_Y
	STA <Objects_Y,X

	LDY #$00	 ; Y = 0

	PLA		 ; Restore 'A'

	BPL PRG000_CF49	 ; If A >= 0 (negative when object was giant), jump to PRG000_CF49

	DEY		 ; Y = -1

PRG000_CF49:
	TYA		 ; A = 0 or -1

	; Apply carry
	ADC <Player_YHi
	STA <Objects_YHi,X

	; While held, object's velocities match Player's
	LDA <Player_XVel
	STA <Objects_XVel,X
	LDA <Player_YVel
	STA <Objects_YVel,X

	; SB: Match Player's gravity setting too
	LDA Player_ReverseGrav
	CMP Objects_ReverseGrav,X
	BEQ ObjectHeld_GravMatch

	; Match gravity
	STA Objects_ReverseGrav,X

	; If gravities mismatch, vertically flip object!
	LDA Objects_FlipBits,X
	EOR #SPR_VFLIP
	STA Objects_FlipBits,X

ObjectHeld_GravMatch:
	JSR Object_WorldDetectN1	; Detect against world
	JSR Object_CalcSpriteXY_NoHi	; Calculate low parts of sprite X/Y (never off-screen when held by Player!)
	JSR ObjectToObject_HitTest	; Test if this object has collided with another object
	BCC PRG000_CF98		 ; If this object did not collide with any other objects, jump to PRG000_CF98

	LDA Objects_Timer2,X
	ORA Level_PipeMove
	BNE PRG000_CF98	 	; If timer 2 is not expired or Player is moving through pipes, jump to PRG000_CF98

	; Object colliding sound!
	LDA Sound_QPlayer
	ORA #SND_PLAYERKICK
	STA Sound_QPlayer

	; Object which was held is dead!
	LDA #OBJSTATE_KILLED
	STA Objects_State,X

	; Y velocity = -$30 (fly up a bit)
	LDA #-$30
	STA <Objects_YVel,X

	; Object that got hit is dead!
	LDA #OBJSTATE_KILLED
	STA Objects_State,Y

	; Y velocity = -$30 (fly up a bit)
	LDA #-$30
	STA Objects_YVel,Y

	; Get 100 pts for the hit!
	LDA #$00
	JSR Score_Get100PlusPts

	; Object will not collide again for 16 ticks (dampener I guess)
	LDA #16
	STA Objects_Timer2,X

	TYA
	TAX
	JSR Level_ObjCalcXDiffs	 ; Determine which side the OTHER object is on

	; Set the OTHER object's X velocity appropriately
	LDA ObjectToObject_HitXVel,Y
	STA <Objects_XVel,X

PRG000_CF98:
	LDX <SlotIndexBackup	 ; Restore 'X' to the object slot index

	LDA <Player_IsDying
	BNE PRG000_CFA5	 ; If Player is dying, jump to PRG000_CFA5

	; Player is NOT dying...

	LDA Sprite_RAM+$28

	CMP #$f8
	BEQ PRG000_CFA8	 ; ?? If Sprite_RAM+$28 (10th sprite) Y coordinate = $F8 (unused), jump to PRG000_CFA8 ??

PRG000_CFA5:

	; SMB2 type objects don't draw shelled style!
	LDA Level_ObjectID,X
	JSR Object_IsSMB2Obj
	BEQ PRG000_CFA8		; If object is an SMB2 object, don't draw shell style!

	JMP Player_KickObjectDraw
PRG000_CFA8:
	JMP Player_KickObjectNoDraw
