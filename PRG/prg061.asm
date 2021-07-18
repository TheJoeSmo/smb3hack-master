
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

	; Springs cannot die, so do not do the check
	LDA Level_ObjectID,X
	CMP #OBJ_SPRING
	BEQ HeldKickRegular

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
	BEQ HeldKickSmall			; Not holding up when let go of B, so do a normal kick
	INY
	INY
	JMP NormalHeldKick

HeldKickSmall:
	LDA <Pad_Holding
	AND #PAD_DOWN
	BEQ NormalHeldKick			; Not holding up when let go of B, so do a normal kick
	INY 
	INY 
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

	LDA Level_ObjectID,X
	CMP #OBJ_SPRING
	BEQ SetEnemyAsNormal

	TYA
	AND #$06 				; 0000_0110
	BEQ SetEnemyAsKicked

	; Add extra velocity to vertically kicked shells
	LDA <Player_XVel 	; Get the Player's X velocity
	;STA <Temp_Var1		; -> Temp_Var1 (yyyy xxxx)
	;ASL <Temp_Var1		; Shift 1 bit left (bit 7 into carry) (y yyyx xxx0)
	;ROR A			; A is now arithmatically shifted to the right (yyyyy xxx) (signed division by 2)
	;ADD ObjectKickXVelMoving,Y	 ; Add base "moving" X velocity of object
	STA <Objects_XVel,X	 ; Set as object's X velocity

	; If spring, go back to being normal
	LDA Level_ObjectID,X
	CMP #OBJ_SPRING
	BNE SetEnemyAsShelled

SetEnemyAsNormal:
	LDA #OBJSTATE_NORMAL
	STA Objects_State,X
	BNE PRG000_CEE8

SetEnemyAsShelled:
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
	
	; Springs cannot kill objects while held
	LDA Level_ObjectID, X 
	CMP #OBJ_SPRING
	BEQ PRG000_CF98

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



ObjNorm_Birdo61:
	LDA Player_RescuePrincess
	BEQ Birdo_NotEnding

	; Ending 2 only...
	JSR Object_DeleteOffScreen

Birdo_NotEnding:
	; Birdo pattern; walk from start to left up to 3.5 tiles and back again
	; Run for random ticks
	; When ticks expire, stop, then randomly jump, pause, or spit egg
	; And around again...

	; Var1: Head frame (0 - normal, 1 - spit, 2 - hit)
	; Var2: Body frame (0/1)
	; Var3: Walk remaining; bit 7 set, left, otherwise right
	; Var4: Lower 4 bits, state
	;	0: Init walk (invert bit, set Var3)
	;	1: Walking (random interrupt to state 2-4)
	;	2: Jump
	;	3: Pause
	;	4: Spit Egg
	; Var4: Upper 4 bits, hit level (init 2, then 1, then 0)
	; Var5: State-specific var
	; Var6: Timeout until next ShyGuy drop (last hit level only)
	LDA <Player_HaltGame
	BEQ Birdo_NotHalted 

	JMP Birdo_Draw

Birdo_NotHalted:
	; If Birdo's in state 6 (Dying), jump to Birdo_Die
	LDA Objects_Var7,X
	AND #$0F
	CMP #6
	BEQ Birdo_Die

	; If Birdo's not in dying state but the game engine is declaring him dying
	; we must begin that state...
	LDA Objects_State,X
	CMP #OBJSTATE_KILLED
	BNE Birdo_NotDying	; If not dying, jump to Birdo_NotDying

	LDA Objects_ColorCycle,X
	BNE Birdo_Invincible	; If Birdo is color cycling, invincible; jump to Birdo_Invincible

	; But Birdo also goes into "Dying" state if hit by egg/etc., so
	; we have to hack that a bit
	LDA Objects_Var4,X
	AND #$F0		; Mask out the hit level
	BEQ Birdo_IsKilled	; If Birdo is at zero hit level, jump to Birdo_IsKilled

	; Birdo still has hit level left!

	; Deduct 16 hit points, if possible
	LDA Objects_HitCount,X
	CMP #16
	BGE Birdo_Deduct16

	; This Birdo is as good as dead!
	JMP Birdo_IsKilled

Birdo_Deduct16:
	; Deduct 16 hits from the object impact and resume!
	SUB #16
	STA Objects_HitCount,X

Birdo_Invincible:
	; Return to normal state
	LDA #OBJSTATE_NORMAL
	STA Objects_State,X

	; Cancel the implied velocities
	LDA #0
	STA Objects_XVel,X
	STA Objects_YVel,X

	BEQ Birdo_NotDying	; Jump (technically always) to Birdo_NotDying

Birdo_IsKilled:
	; Reset Var5
	LDA #0
	STA Objects_Var5,X

	; Pain face all the way down...
	LDA #2
	STA Objects_Var1,X

	 ; Halt the level timer
	LDA #$01
	STA Level_TimerEn

	; Force state 6 (Dying)
	LDA #6
	STA Objects_Var7,X

Birdo_Die:
	JMP Birdo_Dying 	; If Birdo is dying, jump to Birdo_Dying

Birdo_NotDying:
	; If on last hit level, see if it's time for a Shy Guy drop
	LDA Objects_Var4,X
	AND #$F0	; Upper 4 bits are hit level
	BNE Birdo_NoDrop

	JSR Birdo_CheckForShyGuy
	BEQ Birdo_NoDrop	; If Shy Guy still exists, jump to Birdo_NoDrop

	; Shy Guy is gone...

	; If Var6 hasn't expired, no drop
;	LDA Objects_Var6,X
;	BNE Birdo_DecVar6

	; Var6 expired...

	; Prepare new object (if possible!)
	JSR PrepareNewObjectOrAbort

	LDA #SPR_PAL2
	STA Objects_SprAttr,X

	; Green Shy Guy!
	LDA #OBJ_SHYGUY_GREEN
	STA Level_ObjectID,X

	; Fall to Player
	LDA <Horz_Scroll
	ADD #$FF
	STA Objects_X,X
	LDA <Horz_Scroll_Hi
	ADC #0
	STA Objects_XHi,X

	LDA <Vert_Scroll
	ADD #40
	STA Objects_Y,X
	LDA #0
	ADC #0
	STA Objects_YHi,X

	LDA #-$20
	STA Objects_YVel,X

	; Boing!
	LDA #SND_PLAYERJUMPSM
	STA Sound_QPlayer

	LDX <SlotIndexBackup		 ; X = object slot index

	; Reset Var6
	;LDA #64
	;STA Objects_Var6,X

;Birdo_DecVar6:
;	DEC Objects_Var6,X

Birdo_NoDrop:
	JSR Level_ObjCalcXDiffs

	; Face Player
	LDA FireChomp_FlipTowardsPlayer,Y
	STA Objects_FlipBits,X

	JSR Object_Move	 ; Do standard movements

	LDA <Objects_DetStat,X
	AND #$08
	BEQ Birdo_NoCeilHit	 ; If Birdo did not hit ceiling, jump to Birdo_NoCeilHit

	; Bounce off ceiling
	LDA #$01
	STA <Objects_YVel,X

Birdo_NoCeilHit:
	LDA <Objects_DetStat,X
	AND #$04
	BEQ Birdo_NoGndHit	 ; If Birdo did not hit ground, jump to Birdo_NoGndHit

	JSR Object_HitGround	 ; Align Birdo to ground

Birdo_NoGndHit:

	; Check if Birdo has gone to a different hit level
	LDA Objects_Var4,X
	AND #$F0	; Upper 4 bits are hit level
	STA <Temp_Var1	; -> Temp_Var1

	LDA Objects_HitCount,X
	AND #$F0
	CMP <Temp_Var1	; Compare upper 4 bits of hit count to hit level
	BEQ Birdo_NoChangeHit	; If Birdo has not changed to a new hit level, jump to Birdo_NoChangeHit

	; Birdo changed hit level!  Update hit level and go to state 5!
	LDA #5
	STA <Temp_Var1
	JSR Birdo_ChangeState

	; Change upper frame to 2
	LDA #2
	STA Objects_Var1,X

Birdo_NoChangeHit:
	JSR Birdo_Draw

	LDA Objects_ColorCycle,X
	BEQ Birdo_NotInvincible

	JSR Birdo_NoDetect

Birdo_NotInvincible:
	LDA Objects_Var4,X
	AND #$0F	; Lower 4 bits are state
	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word Birdo_InitWalk	; 0
	.word Birdo_Walking	; 1
	.word Birdo_Jump	; 2
	.word Birdo_Pause	; 3
	.word Birdo_SpitEgg	; 4
	.word Birdo_Hit		; 5
	.word Birdo_Dying	; 6
	.word Birdo_Wait4Player	; 7

Birdo_Draw:
	JSR Object_ShakeAndCalcSprite

	; Store frame into Temp_Var14 (top) and Temp_Var15 (bottom)
	LDX <SlotIndexBackup		 ; X = object slot index

	; Upper body sprite frame
	LDA Objects_Var1,X
	ASL A
	STA <Temp_Var14

	; Lower body sprite frame
	LDA Objects_Var2,X
	ADD #3		; Base frame for lower body
	ASL A
	STA <Temp_Var15

	LDA Objects_FlipBits,X
	AND #SPR_VFLIP
	BEQ Birdo_DrawNotVFlipped

	; If vertically flipped, swap Temp_Var14/15
	LDA <Temp_Var14
	PHA

	LDA <Temp_Var15
	STA <Temp_Var14

	PLA
	STA <Temp_Var15

Birdo_DrawNotVFlipped:

	LDX <Temp_Var14
	JSR Object_Draw16x16Sprite

	LSR <Temp_Var5	 ; Next visibility bit

	; Next two sprites
	TYA
	ADD #8
	TAY

	LDA <Temp_Var1
	ADD #16
	STA <Temp_Var1

	LDX <Temp_Var15
	JSR Object_Draw16x16Sprite

	LDX <SlotIndexBackup		 ; X = object slot index
	RTS


Birdo_Wait4Player:
	JSR Boss_WaitAndLock
	BCC Birdo_NoDetect		; If boss not positioned yet, jump to Birdo_NoDetect

	; Initialize walking and go!  (Implicitly, state becomes zero here)
	LDA Objects_Var4,X
	AND #$F0	; Mask out hit level
	STA Objects_Var4,X

Birdo_NoDetect:

	; Deliberately breaks object detection
	LDA #$FF
	STA Objects_SpriteX,X
	STA Objects_SpriteY,X

	RTS

Birdo_WalkXVel: .byte $0C, -$0C

Birdo_InitWalk:
	; Init walk

	; 3.5 tiles = 56 pixels of walking
	; Speed will be at $0C (0.75 pixels/frame)
	; Frames needed to cover distance: 56 / 0.75 = ~75

	LDA Objects_Var3,X
	AND #$80	; Only keep bit 7
	EOR #$80	; Invert it (reverse walk direction)
	ORA #75		; Set tick count
	STA Objects_Var3,X

Birdo_ResetWalk:
	AND #$80	; Get bit 7
	ROL A
	ROL A		; Move to bit 0
	TAY
	LDA Birdo_WalkXVel,Y
	STA Objects_XVel,X

	; Change to walk state
	LDA Objects_Var4,X
	AND #$F0	; Mask out hit level
	ORA #1		; State = 1 (walk)
	STA Objects_Var4,X

	; Drop into walking...

Birdo_Walking:

	DEC Objects_Var3,X
	LDA Objects_Var3,X

	; Examine just the tick part of this value (bit 7 is direction)
	AND #$7F
	BEQ Birdo_InitWalk	; If Birdo has completed this walk cycle, jump to Birdo_InitWalk

	; Otherwise, just update body frame
	LSR A
	LSR A
	AND #$01
	STA Objects_Var2,X

	; Randomly decide to do something else or not
	LDA RandomN
	CMP #240
	BGE Birdo_DoSomethingElse

	; Just walking...
	RTS

	; Valid destination states: 2 = Jump, 3 = Pause, 4 = Spit Egg
Birdo_DestStates:	.byte 2, 3, 4, 4	; Extra chance on the egg spitting

Birdo_DoSomethingElse:

	AND #$03
	TAY
	LDA Birdo_DestStates,Y	; Random state 2 to 4
	STA <Temp_Var1

Birdo_ChangeState:
	LDA Objects_Var4,X
	AND #$F0		; Mask out hit level
	ORA <Temp_Var1		; Store new state
	STA Objects_Var4,X	; Go for it, Birdo

	; Clear state-specific var
	LDA #0
	STA Objects_Var5,X

	; Birdo stops moving
	LDA #0
	STA Objects_XVel,X

	RTS

Birdo_Jump:

	LDA Objects_Var5,X	; Var5 = 0 means not actually jumped yet
	BNE Birdo_AlreadyHopped

	; Mark as having jumped
	INC Objects_Var5,X

	; Jump!
	LDA #-$28
	STA Objects_YVel,X

	RTS

Birdo_AlreadyHopped:

	LDA <Objects_DetStat,X
	AND #$04
	BEQ Birdo_JumpNotLanded	; If Birdo hasn't landed yet, jump to Birdo_JumpNotLanded (RTS)

Birdo_FinishedState:
	; Return to state 1
	LDA #1
	STA Objects_Var5,X

	; Need to reset walk speed
	LDA Objects_Var3,X
	JMP Birdo_ResetWalk

Birdo_JumpNotLanded:
	RTS

Birdo_Pause:
	LDA Objects_Var5,X
	BNE Birdo_PauseCont	; If Birdo already initialized pause, jump to Birdo_PauseCont

	; Initialize pause
	LDA RandomN
	AND #$1F	; Additional value
	ADD #16		; Base value
	STA Objects_Var5,X

Birdo_PauseCont:

	DEC Objects_Var5,X	; Decrement pause value
	BEQ Birdo_FinishedState	; If zero, jump to Birdo_FinishedState
	RTS

Birdo_SpitEgg:
	LDA Objects_Var5,X
	BNE Birdo_SpitCont	; If Birdo already initialized egg spit, jump to Birdo_SpitCont

	; Set upper frame to spit-ready
	LDA #1
	STA Objects_Var1,X

	; Set timer
	LDA #$18
	STA Objects_Var5,X

Birdo_SpitCont:

	DEC Objects_Var5,X	; Decrement ticker

	LDA Objects_Var5,X
	BEQ Birdo_SpitStop	; If zero, jump to Birdo_SpitStop

	CMP #$08
	BNE Birdo_SpitDone	; If not trigger tick for spit, jump to Birdo_SpitDone (RTS)

	; Play spit sound
	LDA #SND_LEVELUNK
	STA Sound_QLevel1

	; Spit egg
	JSR Birdo_SpawnEgg

Birdo_SpitDone:
	RTS

Birdo_SpitStop:
	; Set upper frame to closed mouth
	LDA #0
	STA Objects_Var1,X

	BEQ Birdo_FinishedState 	; Jump (technically always) to Birdo_FinishedState

Birdo_Hit:
	LDA Objects_Var5,X
	BNE Birdo_SpitCont	; If Birdo hit ticker already initialized, jump to Birdo_HitCont

	; Change Birdo's color as appropriate and resume walking
	LDA Objects_HitCount,X
	AND #$F0	; Get next hit level
	TAY		; -> 'Y'
	ORA #5		; Stay in state 5 for now
	STA Objects_Var4,X

	; 'Y' is scaled up by 4 bits, need to tone it down
	TYA
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	; Get next Birdo palette color
	LDA Birdo_HitColors,Y
	STA Palette_Buffer+$1F

	; Hit effect ticker = 32
	LDA #32
	STA Objects_Var5,X
	STA Objects_ColorCycle,X

Birdo_HitCont:
	DEC Objects_Var5,X	; Decrement hit ticker
	BNE Birdo_HitNotDone	; If not done yet, jump to Birdo_HitNotDone

	LDA Objects_Var4,X
	AND #$F0	; Retain hit level
	ORA #1		; Back to walking state
	STA Objects_Var4,X

Birdo_HitNotDone:
	RTS

Birdo_Dying:
	LDA Objects_Var5,X
	BNE Birdo_DeadTimeout	; If Var5 > 0, jump to Birdo_DeadTimeout

	LDA Objects_State,X
	CMP #OBJSTATE_NORMAL
	BEQ Birdo_EndLevel	; If Birdo's state is "Normal" here, that means we're doing the victory / bonus countdown

	; Birdo is falling...
	JSR Birdo_Draw

	; While Birdo is dying, we're going to stop him from just falling off
	; because we want to play some victory music and convert time -> bonus
	LDA Objects_YHi,X
	BEQ Birdo_StillDying	; If not Y Hi = 1 yet, jump to Birdo_StillDying (RTS)

	LDA Objects_Y,X
	AND #$F0
	CMP #$C0
	BNE Birdo_StillDying	; If Birdo's not real low yet, jump to Birdo_StillDying (RTS)

	; Whoop!  Birdo is low, let's change
	LDA Player_RescuePrincess
	BPL Birdo_NoEndingDie

	JMP Object_Delete

Birdo_NoEndingDie:
	LDA <Map_EnterViaID
	CMP #MAPOBJ_DAREDEVILCOMET
	BNE Birdo_NotDDComet

	JMP_THUNKC 30, Level_EndComet

Birdo_NotDDComet:

	LDA World_Num
	CMP #9
	BEQ Birdo_NoWZeroVictory	; No victory song on World Zero

	; Victory fanfare
	LDA Sound_QMusic1
	ORA #MUS1_BOSSVICTORY
	STA Sound_QMusic1

Birdo_NoWZeroVictory:
	; Go into normal state for bonus countdown
	LDA #OBJSTATE_NORMAL
	STA Objects_State,X

Birdo_StillDying:
	RTS

Birdo_EndLevel:
	JSR DoTimeBonus	 ; Convert remaining time into score
	BNE Birdo_StillTimering	 ; If not done converting, jump to PRG003_A910 (RTS)

	; Set timer to $40
	LDA #$40
	STA Objects_Var5,X

Birdo_StillTimering:
	RTS

Birdo_DeadTimeout:
	DEC Objects_Var5,X
	BNE Birdo_StillTimering

	LDA World_Num
	CMP #9
	BNE Birdo_NotWZeroExit

	; Clear Arena Door 0
	LDA #0
	STA <Temp_Var1
	JSR_THUNKA 41, ArenaCtl_ExitBoss
	JMP Object_Delete

Birdo_NotWZeroExit:

	; Exit to map!
	JMP_THUNKA 3, ExitLevel_InvalidateCP

BirdoEgg_XVel:	.byte -$18, $18

BirdoEgg_Type:	.byte $01, $01	; 0: Always fireball
		.byte $00, $01	; 1: Sometimes egg, sometimes fireball
		.byte $00, $00	; 2: Always egg

Birdo_SpawnEgg:
	LDY #$04	 ; Y = 4
PRG003_B34A:
	LDA Objects_State,Y
	BEQ PRG003_B353	 ; If this object slot is dead/empty, jump to PRG003_B353

	DEY		 ; Y--
	BPL PRG003_B34A	 ; While Y >= 0, loop!

	RTS		 ; Return

PRG003_B353:
	TYA		 
	TAX		 ; X = open object slot index

	JSR Level_PrepareNewObject

	LDX <SlotIndexBackup		 ; X = object slot index

	; Set to normal state
	LDA #OBJSTATE_NORMAL
	STA Objects_State,Y

	LDA #SPR_PAL1
	STA Objects_SprAttr,Y

	; Birdo egg!
	LDA #OBJ_BIRDOEGG
	STA Level_ObjectID,Y

	; May have chance for fireball at other hit levels
	; 2 = Always egg, 1 = 50/50, 2 = Always fireball
	LDA Objects_Var4,X
	AND #$F0	; 2, 1, 0
	LSR A
	LSR A
	LSR A		; Hit level * 2
	STA <Temp_Var1	; -> Temp_Var1

	LDA RandomN
	AND #$01	; 50/50 chance of something different
	ORA <Temp_Var1
	TAX
	LDA BirdoEgg_Type,X
	STA Objects_Frame,Y

	LDX <SlotIndexBackup		 ; X = object slot index
	LDA <Objects_Y,X
	STA Objects_Y,Y
	LDA <Objects_YHi,X
	STA Objects_YHi,Y

	LDA <Objects_X,X
	STA Objects_X,Y
	LDA <Objects_XHi,X
	STA Objects_XHi,Y

	LDA Objects_FlipBits,X

	; X = 0
	LDX #$00

	AND #SPR_HFLIP
	BEQ PRG003_B37D	 ; If Birdo is not flipped, jump to PRG003_B37D

	INX	; X = 1

PRG003_B37D:

	LDA BirdoEgg_XVel,X
	STA Objects_XVel,Y

	LDX <SlotIndexBackup		 ; X = object slot index
	RTS		 ; Return


Birdo_CheckForShyGuy:
	LDY #$04	 ; Y = 4
Birdo_CheckForShyGuy_Loop:
	LDA Objects_State,Y
	BEQ Birdo_CheckEmpty	 ; If this object slot is dead/empty, jump to Birdo_CheckEmpty

	; Not dead/empty...
	LDA Level_ObjectID,Y
	CMP #OBJ_SHYGUY_GREEN
	BNE Birdo_CheckEmpty	; If this object is not a green Shy Guy, jump to Birdo_CheckEmpty

	; Found green Shy Guy, no drop (Check with BEQ since CMP matched)
	RTS

Birdo_CheckEmpty:
	DEY		 ; Y--
	BPL Birdo_CheckForShyGuy_Loop	; While Y >= 0, loop!

	; If you get here, the Green Shy Guy is gone!  (Check with BNE since Y < 0)
	RTS		 ; Return
