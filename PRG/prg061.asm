
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


ObjState_Squashed61:
	LDA Objects_Timer3,X 
	BEQ PRG000_D090	 ; If timer 3 is expired, jump to PRG000_D090

	JSR Object_Move	 ; Perform standard object movements

	LDA <Objects_DetStat,X
	AND #$04
	BEQ PRG000_D07E	 ; If object did NOT hit ground, jump to PRG000_D07E

	JSR Object_HitGround	 ; Align to ground
	STA <Objects_XVel,X	 ; Clear X velocity

PRG000_D07E:

	; Set object frame to 3
	LDA #$03
	STA Objects_Frame,X

	LDA Objects_IsGiant,X
	BNE PRG000_D08D	 ; If object is giant, jump to PRG000_D08D (ObjectGroup_PatternSets, i.e. the "giant" enemy alternative)

	JMP Object_ShakeAndDrawMirrored	 ; Draw goomba as mirrored sprite and don't come back

PRG000_D08D:
	JMP ObjectGroup_PatternSets	 ; Do the giant enemy draw routine and don't come back

PRG000_D090:
	JMP Object_SetDeadEmpty	 ; Jump to Object_SetDeadEmpty (mark object as dead/empty)


AScrlURDiag_HandleWrap:
	LDA AScrlURDiag_WrapState
	STA AScrlURDiag_WrapState_Copy	 ; AScrlURDiag_WrapState_Copy = AScrlURDiag_WrapState
	JSR AScrlURDiag_NoWrapAbort	; Will not return here if AScrlURDiag_WrapState_Copy not set or gameplay halted!

	LDY #$00	 ; Y = 0
 
	LDA Level_AScrlVVelCarry
	LSR A		
	BCC PRG000_DE53	 ; If Level_AScrlVVelCarry = 0, jump to PRG000_DE53

	INY		 ; Y = 1
	DEC Level_ScrollDiffH	 ; Level_ScrollDiffH--

PRG000_DE53:
	LDA Level_ScrollDiffH
	STA AScrlURDiag_OffsetX	 ; AScrlURDiag_OffsetX = Level_ScrollDiffH

	STY Level_ScrollDiffH	; Level_ScrollDiffH = 0 or 1

	ADD <Player_X
	STA <Player_X	 ; Player_X += Level_ScrollDiffH
	BCC PRG000_DE65	 ; If no carry, jump to PRG000_DE65

	INC <Player_XHi	 ; Otherwise, apply carry

PRG000_DE65:
	LDY #$00	 ; Y = 0

	LDA Level_AScrlVVelCarry
	LSR A		
	BCC PRG000_DE71	 ; If no autoscroll vertical velocity carry, jump to PRG000_DE71

	DEY		 ; Y = -1
	INC Level_ScrollDiffV

PRG000_DE71:
	LDA Level_ScrollDiffV
	STA AScrlURDiag_OffsetY	 ; AScrlURDiag_OffsetY = Level_ScrollDiffV

	STY Level_ScrollDiffV	 ; Level_ScrollDiffV = 0 or -1

	LDY <Player_InAir
	BEQ PRG000_DE89	 ; If Player is not mid air, jump to PRG000_DE89

	LDY #$00	 ; Y = 0

	ADD Level_ScrollDiffV	 ; Level_ScrollDiffV is 0 or -1 right now
	CMP #$ff
	BNE PRG000_DE89
	DEY		 ; Y = -1 

PRG000_DE89:
	ADD <Player_Y
	STA <Player_Y
	TYA		
	ADC <Player_YHi	
	STA <Player_YHi	

	RTS		 ; Return


AScrlURDiag_CheckWrapping61:
	JSR AScrlURDiag_NoWrapAbort	 ; Will not return here if AScrlURDiag_WrapState_Copy is not set or gameplay halted!

	LDA <Objects_X,X
	ADD AScrlURDiag_OffsetX	
	STA <Objects_X,X
	BCC PRG000_DEA3	 ; If no carry, jump to PRG000_DEA3
	INC <Objects_XHi,X	 ; Otherwise, apply carry
PRG000_DEA3:

	LDA <Objects_Y,X
	ADD AScrlURDiag_OffsetY	
	STA <Objects_Y,X
	BCC PRG000_DEAF	 ; If no carry, jump to PRG000_DEAF
	INC <Objects_YHi,X	 ; Otherwise, apply carry 

PRG000_DEAF:
	RTS		 ; Return


AScrlURDiag_NoWrapAbort:
	LDA AScrlURDiag_WrapState_Copy
	BEQ PRG000_DEB9	 ; If diagonal autoscroller is not wrapping, jump to PRG000_DEB9

	LDA <Player_HaltGame
	BEQ PRG000_DEBB	 ; If gameplay is not halted, jump to PRG000_DEBB (RTS)

PRG000_DEB9:
	; If NOT AScrlURDiag_WrapState_Copy or if gameplay is halted, do not return to caller!!
	PLA
	PLA		 ; Pull return address

PRG000_DEBB:
	RTS		 ; Return


Player_Die61:
	; Queue death song
	LDA Sound_QMusic1
	ORA #MUS1_PLAYERDEATH
	STA Sound_QMusic1

	; Clear a bunch of stuff at time of death
	LDA #$00
	STA <Player_XVel
	STA Player_Flip	
	STA Player_FlashInv
	STA Player_Kuribo
	STA Player_StarInv
	STA Player_Statue
	STA Level_PSwitchCnt

	LDA #$01
	STA Player_QueueSuit	 ; Queue change to "small"

	LDA #-64
	STA <Player_YVel ; Player_YVel = -64

	LDA #$30	 
	STA Event_Countdown ; Event_Countdown = $30 (ticks until dropped back to map)

	TXA
	PHA
	
	LDX Player_Current
	LDA Player_Lives,X
	BNE Die_NotGameover

	LDA #$04
	STA <Player_IsDying	 ; Player_IsDying = 4
	
	; Used for GAME OVER raise-up
	LDA #$FF
	STA <Pipe_PlayerX
	STA <Pipe_PlayerY

	LDA #MUS1_GAMEOVER
	STA Sound_QMusic1
	
	PLA
	TAX
	
	JMP PRG000_DAAE

Die_NotGameover:
	PLA
	TAX

	LDA #$01
	STA <Player_IsDying	 ; Player_IsDying = 1

PRG000_DAAE:
	; Ensure Player_FlipBits is correct?
	; SB: May be a cosmetic bugfix for player coming out of a somersault
	; (see jump to PRG000_DAAE) and getting hit, but I'm not really sure...
	LDA <Player_FlipBits
	AND #$7f
	STA <Player_FlipBits

	RTS		 ; Return


Score_PopUp61:
; $C467
	STY <Temp_Var15	 	; Backup 'Y' -> Temp_Var15

	JSR Score_FindFreeSlot	; Get free Scores_Value slot

	LDA Temp_VarNP0
	STA Scores_Value,Y	; Store input value

	LDA Objects_SpriteY,X
	SUB #16
	CMP #192
	BLT PRG000_C47D	 ; If (sprite's Y - 16) < 192, jump to PRG000_C47D

	LDA #$05	 	 ; A = 5

PRG000_C47D:
	STA Scores_Y,Y	 ; Set score Y

	; Set score X to spawning object
	LDA Objects_SpriteX,X	
	STA Scores_X,Y	 

	; Set score counter to $30
	LDA #$30
	STA Scores_Counter,Y

	LDY <Temp_Var15	; Restore 'Y'

	RTS		 ; Return


Level_QueueChangeBlock61: 
	;STA Level_ChgTileEvent	 ; Store type of block change!

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


DoHitBumpBlock61:
	; Align X Detect low to tile grid
	LDA <Temp_Var16
	AND #$F0
	STA <Temp_Var16

	LDA <Temp_Var1	 ; Get power-up value
	ASL A		 ; Make into 2-byte index
	TAY		 ; -> 'Y'

	; Load jump address as per block tile type...
	LDA LATP_JumpTable,Y
	STA <Temp_Var1	
	LDA LATP_JumpTable+1,Y
	STA <Temp_Var2	

	JMP [Temp_Var1]	 ; Handle special block!

LATP_JumpTable:
	.word LATP_None		; 0 = None
	.word LATP_Flower	; 1 = Mushroom/Flower
	.word LATP_Leaf		; 2 = Mushroom/Leaf
	.word LATP_Star		; 3 = Star
	.word LATP_Coin		; 4 = Coin
	.word LATP_CoinStar	; 5 = Coin/Star
	.word LATP_Brick	; 6 = Standard brick behavior
	.word LATP_Vine		; 7 = Vine
	.word LATP_10Coin	; 8 = 10 coin
	.word LATP_1up		; 9 = 1-up
	.word LATP_PSwitch	; A = P-Switch
	.word LATP_BrickAltClear; B = Brick which clears to alternate tile when smashed
	.word LATP_ExtPowerUp	; C = Penguin (TEMP)
	.word LATP_ExtPowerUp	; D = Rabbit
	.word LATP_ExtPowerUp	; E = Hammer
	.word LATP_LikeExSwitch	; F = Like hitting an [!] switch (multipurpose)

LATP_None:
	LDY #1		; Y = 1 (spawn .. nothing?) (index into PRG001 Bouncer_PUp)
	RTS		 ; Return

LATP_Flower:
	LDA #$00
	STA PUp_StarManFlash	 ; PUp_StarManFlash = 0 (don't activate star man flash)

	LDY #$05	 ; Y = 5 (spawn a mushroom) (index into PRG001 Bouncer_PUp)

	LDA <Player_Suit
	BEQ PRG008_B7F9	 ; If Player is small, jump to PRG008_B7F9

	LDY #$02	 ; Y = 2 (spawn a fire flower) (index into PRG001 Bouncer_PUp)

PRG008_B7F9:
	RTS		 ; Return


LATP_Leaf:
	LDA #$00
	STA PUp_StarManFlash	 ; PUp_StarManFlash = 0 (don't activate star man flash)

	LDY #$05	 ; Y = 5 (spawn a mushroom) (index into PRG001 Bouncer_PUp)

	LDA <Player_Suit
	BEQ PRG008_B807	 ; If Player is small, jump to PRG008_B807

	LDY #$03	 ; Y = 3 (spawn a leaf) (index into PRG001 Bouncer_PUp)

PRG008_B807:
	RTS		 ; Return

LATP_Star:
	LDA #$80
	STA PUp_StarManFlash	 ; PUp_StarManFlash = $80 (activate star man flash)

	LDY #$04	 ; Y = 4 (spawn a starman) (index into PRG001 Bouncer_PUp)

	RTS		 ; Return

LATP_ExtPowerUp:
	LDA #$00
	STA PUp_StarManFlash	 ; PUp_StarManFlash = 0 (don't activate star man flash)

	LDA <Player_Suit
	BEQ LATP_ExtPowerUp_Sm	 ; If Player is small, jump to LATP_ExtPowerUp_Sm


	TYA	; 'Y' -> 'A'
	LSR A	; Return to index value
	SUB #4	; Base at 8
	TAY	; Y = 8 to 10 (spawn a suit) (index into PRG001 Bouncer_PUp)

	SUB #7	; Base 1-3
	STA PUp_StarManFlash	 ; PUp_StarManFlash = 1 to 3 (trigger super suit)

	RTS		 ; Return

LATP_ExtPowerUp_Sm:
	LDY #$05	 ; Y = 5 (spawn a mushroom) (index into PRG001 Bouncer_PUp)
	RTS


LATP_Coin:
	JSR LATP_CoinCommon	 ; Do common "power up" coin routine

	LDY #$01	 ; Y = 1 (spawn a coin) (index into PRG001 Bouncer_PUp, i.e. nothing)

	LDA <Temp_Var16
	ORA <Temp_Var15	; Regenerate 10 coin block ID
	CMP B10Coin_ID
	BNE PRG008_B82F	; If this is a DIFFERENT coin block than the last one we started, jump to PRG008_B82F (RTS)

	LDA B10Coin_Timer
	BEQ PRG008_B82F	; In any case, if a 10 coin timer is not still on, jump to PRG008_B82F (RTS)

	LDA B10Coin_Count
	BMI PRG008_B82F	; If you've already got 10 coins (ideally), jump to PRG008_B82F (RTS)

	DEC B10Coin_Count	 ; B10Coin_Count--

	LDA #$17
	STA <Temp_Var6	 ; Temp_Var6 = $17

PRG008_B82F:
	RTS		 ; Return

LATP_CoinStar:
	LDA #$80
	STA PUp_StarManFlash	 ; Get that Starman flash ready just in case...

	LDY #$04	 	; Y = 4 (spawn a starman) (index into PRG001 Bouncer_PUp)

	LDA Player_StarInv
	BNE PRG008_B83F	 ; If Player if invincible, jump to PRG008_B83F!

	; Otherwise, sorry, just a coin :(
	JMP LATP_Coin

PRG008_B83F:
	RTS		 ; Return

LATP_Brick:
	JSR LATP_GetCoinAboveBlock	; Get coin above block, if any

; If temp var is set, act like small mario and do not bust the brick
	LDA Temp_VarNP0
	BEQ BustTheBrick
	CMP #OBJSTATE_KICKED
	BNE DoNotBustTheBrick

BustTheBrick:
	CPX #$04
	BEQ PRG008_B84E	 ; If on tile check index 4 (tail attack's tile), jump to PRG008_B84E (bust brick!)

	LDA <Player_Suit
	BNE PRG008_B84E	 ; If Player is not small, jump to PRG008_B84E (bust brick!)

DoNotBustTheBrick:
	LDY #$01	 ; Y = 1 (spawn a coin) (index into PRG001 Bouncer_PUp, i.e. nothing)

	RTS		 ; Return

PRG008_B84E:
	; Crumbling sound
	LDA Sound_QLevel2
	ORA #SND_LEVELCRUMBLE
	STA Sound_QLevel2

	JSR BrickBust_MoveOver	 ; If a brick is busting in slot 1, move it to slot 2

	LDA #$02
	STA BrickBust_En	 ; Set brick bust enable

	; Y
	LDA <Temp_Var14
	AND #$F0
	CLC
	SBC Level_VertScroll
	STA BrickBust_YUpr	 ; Store upper brick segment Y

	ADD #$08
	STA BrickBust_YLwr	 ; Store lower brick segment Y

 	; X
	LDA <Temp_Var16
	SUB <Horz_Scroll
	STA BrickBust_X	 ; Store X base coordinate

	LDA #$00	 
	STA BrickBust_XDist	 ; Reset X fan out distance
	STA BrickBust_HEn	 ; Reset horizontal enablers

	LDA #-6	 
	STA BrickBust_YVel	 ; Y velocity = -6

	LDA #$01	
	STA Score_Earned	 ; 10 points!

	LDY #CHNGTILE_DELETETOBG
	STY <Temp_Var12		 ; Temp_Var12 = CHNGTILE_DELETETOBG

	LDY #$80	 	; Y = $80
	RTS		 ; Return

LATP_Vine:
	LDY #$00	 ; Y = 0 (??)

	; Vine raise sound!
	LDA Sound_QLevel1
	ORA #SND_LEVELVINE
	STA Sound_QLevel1

	LDY #$06	 ; Y = 6 (vine) (index into PRG001 Bouncer_PUp)
	RTS		 ; Return

LATP_10Coin:
	LDA <Temp_Var16
	ORA <Temp_Var15
	STA B10Coin_ID	 ; X & Y are merged into a sort of unique ID for this block

	LDA #$09
	STA B10Coin_Count ; Set coin counter to 9

	LDA #200
	STA B10Coin_Timer ; B10Coin_Timer = 200

	JMP LATP_Coin	; Jump to common coin routine...

LATP_1up:
	JSR Level_RecordBlockHit	 ; Record having grabbed this 1-up so it does not come back

	LDA #$00
	STA PUp_StarManFlash	 ; PUp_StarManFlash = 0 (don't activate star man flash)

	LDY #$07	 ; Y = 7 (1-up) (index into PRG001 Bouncer_PUp)

	RTS		 ; Return

LATP_PSwitch:
	LDY #$05	 ; Y = 5

PRG008_B8BE:
	LDA SpecialObj_ID,Y
	BEQ PRG008_B8C9	 ; If this is a free spawn event slot, jump to PRG008_B8C9
	DEY		 ; Y--
	BPL PRG008_B8BE	 ; While Y >= 0, loop!
	JMP PRG008_B8D3	 ; Jump to PRG008_B8D3

PRG008_B8C9:
	LDA #SOBJ_POOF
	STA SpecialObj_ID,Y	 ; Special object "poof"
	LDA #$20	 
	STA SpecialObj_Data,Y	 ; Used as "counter" while poof is in effect

PRG008_B8D3: 
	LDA <Temp_Var14	 ; Get Y Low
	AND #$F0	 ; Align to tile grid
	SUB #16		 ; Above hit tile
	PHP		 ; Save processor status

	CPY #$00
	BLS PRG008_B8E2	 ; If index < 0, then we don't have a special object, and skip setting Y Lo

	STA SpecialObj_YLo,Y	 ; Otherwise, store Y Lo

PRG008_B8E2:
	STA Level_BlockChgYLo	 ; Store block change Y low coord
	PLP		 ; Restore processor status

	LDA <Temp_Var13	 ; Get Y high
	SBC #$00	 ; Apply carry as necessary from previous subtraction

	CPY #$00	 
	BLS PRG008_B8F1	 ; If index < 0, then we don't have a special object, and skip setting Y Hi
	STA SpecialObj_YHi,Y	 ; Otherwise, store Y Hi

PRG008_B8F1:
	STA Level_BlockChgYHi	 ; Store block change Y high coord

	LDA <Temp_Var16	 ; Get X Low

	CPY #$00
	BLS PRG008_B8FD	 ; If index < 0, then we don't have a special object, and skip setting X Lo
	STA SpecialObj_XLo,Y	 ; Otherwise, store X Lo

PRG008_B8FD:
	STA Level_BlockChgXLo	 ; Store block change X low coord

	LDA <Temp_Var15		 ; Get X Hi
	STA Level_BlockChgXHi	 ; Store block change X high coord

	LDA #CHNGTILE_PSWITCHAPPEAR	 
	STA Level_ChgTileEvent	 ; Queue P-Switch appear!

	LDY #$01	 ; Y = 1 (index into PRG001 Bouncer_PUp, i.e. nothing)
	RTS		 ; Return

LATP_BrickAltClear:
	JSR LATP_Brick	 ; Act like a brick!  ('A' = 0 when small)
	BEQ PRG008_B916	 ; If Player is small, then do nothing...

	LDA #CHNGTILE_DELETETOBGALT
	STA <Temp_Var12	 ; Temp_Var12 = 12

PRG008_B916:
	RTS		 ; Return

LATP_CoinCommon:
	INC Coins_Earned ; One more coin earned
	INC Coins_ThisLevel	 ; One more coin earned this level

	; Y Lo - into Temp_Var1
	LDA <Temp_Var14	
	STA <Temp_Var1	

	; X Lo - center it up, shove into Temp_Var2
	LDA <Temp_Var16
	ORA #$04
	STA <Temp_Var2

	JMP PRG000_C49B	 ; Jump to PRG000_C49B (common "power up" coin entry)


	; Special routine which gets a coin above a ? block, if one is present!
LATP_GetCoinAboveBlock:
	; SB: Bug: If you bump a P-Switch induced "temporary brick" beneath
	; another temporary brick, you'll get a "coin" (because they really
	; are still coin blocks!)  This worked in original SMB3 as well.  In
	; any case, if P-Switch is active, cancel this logic!
	LDA Level_PSwitchCnt
	BNE GCAB_PSwitch_Cancel

	LDA <Temp_Var14
	PHA		 ; Save Temp_Var14 (Y Lo)
	SUB #16	
	STA <Temp_Var14	 ; Temp_Var14 -= 16 (get tile above)

	STX <Temp_Var5	 ; Backup X into Temp_Var5
	JSR Player_GetTileAndSlope_Normal	 ; Get a tile here
	LDX <Temp_Var5	 ; Restore X into Temp_Var5

	CMP #TILEA_COIN
	BNE PRG008_B948	 ; If tile above is not a coin, jump to PRG008_B948

	; Tile above was a coin...
	; The following will collect the coin along with the ? block hit!

	LDA #CHNGTILE_DELETETOBG
	JSR Level_QueueChangeBlock	; Delete to background

	PLA		 
	STA <Temp_Var14		 ; Restore Temp_Var14
	JMP LATP_CoinCommon	 ; Jump to common coin routine

PRG008_B948:
	PLA		 
	STA <Temp_Var14	 ; Restore Temp_Var14

GCAB_PSwitch_Cancel:
	RTS		 ; Return


LATP_LikeExSwitch:
	LDY #1
	JSR ExSwitch_Press
	RTS
