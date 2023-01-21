
Level_PrepareNewObjectAlt:
; Clear various object variables
	LDA #$00
	STA entity_var1,X
	STA entity_var2,X
	STA <entity_sprite_lo_x,X
	STA entity_timer,X
	STA entity_no_collision_timer,X
	STA <entity_lo_x_velocity,X
	STA <entity_lo_y_velocity,X
	STA entity_flipped_animation,X
	STA entity_animation_frame,X	
	STA Objects_ColorCycle,X
	STA entity_reverse_gravity,X	; SB
	STA Objects_FrozenTimer,X	; SB
	STA Objects_IsBehind,X		; SB
	STA Objects_StompDisable,X	; SB
	STA <entity_collision_flags,X	
	STA Objects_PlayerHitStat,X
	STA entity_var7,X
	STA <entity_var5,X

	CPX #$06
	BGE PRG000_D4C8	 ; If using slot index >= 6, jump to PRG000_D4C8 (skip variables available only to slots 0 to 5)

	; Clear some more variables (object slots 0 to 5 ONLY)
	STA Objects_DisPatChng,X
	STA entity_timer_splash_disable,X
	STA Objects_QSandCtr,X
	STA Objects_InWater,X

PRG000_D4C8:
	CPX #$05
	BGE PRG000_D506	 ; If using slot index >= 5, jump to PRG000_D506 (skip variables available only to slots 0 to 4)

	; Clear even more variables (object slots 0 to 4 [major objects] ONLY!!)
	STA <entity_var4,X
	STA entity_timer_tertirary,X
	STA entity_timer_secondary,X
	STA Objects_Slope,X
	STA entity_var3,X	
	STA entity_var6,X	 
	STA Objects_TargetingXVal,X
	STA Objects_TargetingYVal,X
	STA Objects_IsGiant,X
	STA Objects_HitCount,X
	STA Objects_DisPatChng,X
	STA entity_var10,X
	STA entity_var11,X
	STA entity_var12,X
	STA entity_var13,X
	STA entity_var14,X

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
	STA entity_no_collision_timer,X

	LDA entity_type,X

	; Determine if we need to do extra bob-omb code
	CMP #OBJ_BOBOMBEXPLODE
	BEQ PLayer_KickBobomb
	CMP #OBJ_BOBOMB	 
	BNE Player_KickRegular

PLayer_KickBobomb:
	; State remains "normal"
	LDA #OBJSTATE_NORMAL
	STA entity_state,X

	; Set Y vel to -$20 (bounce up)
	LDA #-$20
	STA <entity_lo_y_velocity,X

	; Set X Velocity appropriately based on kick direction
	JSR Level_ObjCalcXDiffs
	LDA BobombKickXVel,Y
	STA <entity_lo_x_velocity,X

	EOR <player_lo_x_velocity
	BMI PRG000_CE76	 ; If the Bob-omb's X velocity is the opposite sign of the Player's, jump to PRG000_CE76

	LDA <player_lo_x_velocity
	STA <var1		; -> var1 (yyyy xxxx)
	ASL <var1		; Shift 1 bit left (bit 7 into carry) (y yyyx xxx0)
	ROR A			; A is now arithmatically shifted to the right (yyyyy xxx) (signed division by 2)
	ADD ObjectKickXVelMoving,Y	 ; Add base "moving" X velocity of Bob-omb
	STA <entity_lo_x_velocity,X	 ; Set this as Bob-omb's X Velocity

PRG000_CE76:
	JMP Object_ShakeAndDraw	 ; Draw Bob-omb and don't come back!

Player_KickRegular:

	; Anything besides a Bob-omb...

	; Clear Objects_KillTally 
	LDA #$00	
	STA Objects_KillTally,X

	LDA entity_state,X
	CMP #OBJSTATE_HELD
	BNE PRG000_CEBE	 ; If object's state is not Held, jump to PRG000_CEBE

	; This object is being held by Player...

	LDA entity_type,X
	CMP #OBJ_ICEBLOCK
	BEQ HeldKickRegular	 ; If this is an ice block, jump to PRG000_CEB4

	LDY #1	 ; Y = 1

	LDA <player_flipped_animation
	BNE PRG000_CE94	 ; If Player is not turned around, jump to PRG000_CE94

	LDY #-1	 ; Y = -1

PRG000_CE94:
	STY <entity_lo_x_velocity,X	 ; Set minimum X velocity on object (to enable wall hit detection)

	; Springs cannot die, so do not do the check
	LDA entity_type,X
	CMP #OBJ_SPRING
	BEQ HeldKickRegular

	CMP #OBJ_CRATE
	BEQ HeldKickRegular

	JSR entity_static_detection_inside ; Detect against world

	LDA <entity_collision_flags,X
	AND #$03	
	BEQ HeldKickRegular	 ; If object has not hit a wall, jump to PRG000_CEB4

	; KICK OBJECT INTO WALL LOGIC

	; Flat 100 points
	LDA #$05
	JSR Score_PopUp

	; Object state is Killed
	LDA #OBJSTATE_KILLED
	STA entity_state,X

	; Set object Y velocity to -$40 (fly up a bit)
	LDA #-$40
	STA <entity_lo_y_velocity,X

	; Remove that minimum X velocity
	LDA #$00
	STA <entity_lo_x_velocity,X

	JMP PRG000_CF98	 ; Jump to PRG000_CF98

HeldKickRegular:
	LDY #0	 	; Y = 0

	LDA <buttons_held
	AND #button_up_mask
	BEQ HeldKickSmall			; Not holding up when let go of B, so do a normal kick
	INY
	INY
	JMP NormalHeldKick

HeldKickSmall:
	LDA <buttons_held
	AND #button_down_mask
	BEQ NormalHeldKick			; Not holding up when let go of B, so do a normal kick
	INY 
	INY 
	INY 
	INY

NormalHeldKick:

	LDA <player_flipped_animation
	BEQ PRG000_CEBB	; If Player has not turned around, jump to PRG000_CEBB

	INY		; Y = 1

PRG000_CEBB:
	JMP PRG000_CEC6	; Jump to PRG000_CEC6

PRG000_CEBE:

	; Object kicked, was not held

	; Make sure Player is facing object he's kicking
	JSR Level_ObjCalcXDiffs
	LDA PlayerKickFlipBits,Y
	STA <player_flipped_animation

PRG000_CEC6:
	; Get the base kicking speeds
	LDA ObjectKickXVelMoving,Y
	STA <entity_lo_x_velocity,X
	LDA ObjectKickYVelMoving, Y
	STA <entity_lo_y_velocity, X

	EOR <player_lo_x_velocity
	BMI PRG000_CEDC	 ; If the object's X velocity is the opposite sign of the Player's, jump to PRG000_CEDC

	LDA <player_lo_x_velocity 	; Get the Player's X velocity
	STA <var1		; -> var1 (yyyy xxxx)
	ASL <var1		; Shift 1 bit left (bit 7 into carry) (y yyyx xxx0)
	ROR A			; A is now arithmatically shifted to the right (yyyyy xxx) (signed division by 2)
	ADD ObjectKickXVelMoving,Y	 ; Add base "moving" X velocity of object
	STA <entity_lo_x_velocity,X	 ; Set as object's X velocity

PRG000_CEDC:
	; If object's state is not Killed, jump to PRG000_CEE8
	LDA entity_state,X
	CMP #OBJSTATE_KILLED
	BEQ PRG000_CEE8

	LDA entity_type,X
	CMP #OBJ_SPRING
	BEQ SetEnemyAsNormal

	CMP #OBJ_CRATE
	BEQ SetEnemyAsNormal

	TYA
	AND #$06 				; 0000_0110
	BEQ SetEnemyAsKicked

	; Add extra velocity to vertically kicked shells
	LDA <player_lo_x_velocity 	; Get the Player's X velocity
	;STA <var1		; -> var1 (yyyy xxxx)
	;ASL <var1		; Shift 1 bit left (bit 7 into carry) (y yyyx xxx0)
	;ROR A			; A is now arithmatically shifted to the right (yyyyy xxx) (signed division by 2)
	;ADD ObjectKickXVelMoving,Y	 ; Add base "moving" X velocity of object
	STA <entity_lo_x_velocity,X	 ; Set as object's X velocity

	; If spring, go back to being normal
	LDA entity_type,X
	CMP #OBJ_SPRING
	BEQ SetEnemyAsNormal

	CMP #OBJ_CRATE
	BNE SetEnemyAsShelled


SetEnemyAsNormal:
	LDA #OBJSTATE_NORMAL
	STA entity_state,X
	BNE PRG000_CEE8

SetEnemyAsShelled:
	; Set shell to be shelled, so it doesn't hit things too much
	LDA #OBJSTATE_SHELLED
	STA entity_state,X
	BNE PRG000_CEE8

SetEnemyAsKicked:
	; Set object state to 5 (Kicked)

	LDA #OBJSTATE_KICKED
	STA entity_state,X

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

	LDA <player_flipped_animation
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
	LDA <player_lo_x	
	ADD ObjectHoldXOff,Y
	STA <entity_lo_x,X	

	LDA <player_hi_x	
	ADC ObjectHoldXHiOff,Y
	STA <entity_hi_x,X	

	LDY #0		; Y = 0

	LDA Objects_IsGiant,X
	BNE PRG000_CF3D	 ; If object is giant, jump to PRG000_CF3D

	INY		; Y = 1

	LDA <player_powerup
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
	ADD <player_lo_y
	STA <entity_lo_y,X

	LDY #$00	 ; Y = 0

	PLA		 ; Restore 'A'

	BPL PRG000_CF49	 ; If A >= 0 (negative when object was giant), jump to PRG000_CF49

	DEY		 ; Y = -1

PRG000_CF49:
	TYA		 ; A = 0 or -1

	; Apply carry
	ADC <player_hi_y
	STA <entity_hi_y,X

	; While held, object's velocities match Player's
	LDA <player_lo_x_velocity
	STA <entity_lo_x_velocity,X
	LDA <player_lo_y_velocity
	STA <entity_lo_y_velocity,X

	; SB: Match Player's gravity setting too
	LDA Player_ReverseGrav
	CMP entity_reverse_gravity,X
	BEQ ObjectHeld_GravMatch

	; Match gravity
	STA entity_reverse_gravity,X

	; If gravities mismatch, vertically flip object!
	LDA entity_flipped_animation,X
	EOR #SPR_VFLIP
	STA entity_flipped_animation,X

ObjectHeld_GravMatch:
	JSR entity_static_detection_inside	; Detect against world
	JSR Object_CalcSpriteXY_NoHi	; Calculate low parts of sprite X/Y (never off-screen when held by Player!)
	
	; Springs cannot kill objects while held
	LDA entity_type, X 
	CMP #OBJ_SPRING
	BEQ PRG000_CF98

	CMP #OBJ_CRATE
	BEQ PRG000_CF98

	JSR ObjectToObject_HitTest	; Test if this object has collided with another object
	BCC PRG000_CF98		 ; If this object did not collide with any other objects, jump to PRG000_CF98

	LDA entity_no_collision_timer,X
	ORA Level_PipeMove
	BNE PRG000_CF98	 	; If timer 2 is not expired or Player is moving through pipes, jump to PRG000_CF98

	; Object colliding sound!
	LDA Sound_QPlayer
	ORA #SND_PLAYERKICK
	STA Sound_QPlayer

	; Object which was held is dead!
	LDA #OBJSTATE_KILLED
	STA entity_state,X

	; Y velocity = -$30 (fly up a bit)
	LDA #-$30
	STA <entity_lo_y_velocity,X

	; Object that got hit is dead!
	LDA #OBJSTATE_KILLED
	STA entity_state,Y

	; Y velocity = -$30 (fly up a bit)
	LDA #-$30
	STA entity_lo_y_velocity,Y

	; Get 100 pts for the hit!
	LDA #$00
	JSR Score_Get100PlusPts

	; Object will not collide again for 16 ticks (dampener I guess)
	LDA #16
	STA entity_no_collision_timer,X

	TYA
	TAX
	JSR Level_ObjCalcXDiffs	 ; Determine which side the OTHER object is on

	; Set the OTHER object's X velocity appropriately
	LDA ObjectToObject_HitXVel,Y
	STA <entity_lo_x_velocity,X

PRG000_CF98:
	LDX <entity_index	 ; Restore 'X' to the object slot index

	LDA <Player_IsDying
	BNE PRG000_CFA5	 ; If Player is dying, jump to PRG000_CFA5

	; Player is NOT dying...

	LDA Sprite_RAM+$28

	CMP #$f8
	BEQ PRG000_CFA8	 ; ?? If Sprite_RAM+$28 (10th sprite) Y coordinate = $F8 (unused), jump to PRG000_CFA8 ??

PRG000_CFA5:

	; SMB2 type objects don't draw shelled style!
	LDA entity_type,X
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
	LDA entity_var7,X
	AND #$0F
	CMP #6
	BEQ Birdo_Die

	; If Birdo's not in dying state but the game engine is declaring him dying
	; we must begin that state...
	LDA entity_state,X
	CMP #OBJSTATE_KILLED
	BNE Birdo_NotDying	; If not dying, jump to Birdo_NotDying

	LDA Objects_ColorCycle,X
	BNE Birdo_Invincible	; If Birdo is color cycling, invincible; jump to Birdo_Invincible

	; But Birdo also goes into "Dying" state if hit by egg/etc., so
	; we have to hack that a bit
	LDA entity_var4,X
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
	STA entity_state,X

	; Cancel the implied velocities
	LDA #0
	STA entity_lo_x_velocity,X
	STA entity_lo_y_velocity,X

	BEQ Birdo_NotDying	; Jump (technically always) to Birdo_NotDying

Birdo_IsKilled:
	; Reset Var5
	LDA #0
	STA entity_var5,X

	; Pain face all the way down...
	LDA #2
	STA entity_var1,X

	 ; Halt the level timer
	LDA #$01
	STA Level_TimerEn

	; Force state 6 (Dying)
	LDA #6
	STA entity_var7,X

Birdo_Die:
	JMP Birdo_Dying 	; If Birdo is dying, jump to Birdo_Dying

Birdo_NotDying:
	; If on last hit level, see if it's time for a Shy Guy drop
	LDA entity_var4,X
	AND #$F0	; Upper 4 bits are hit level
	BNE Birdo_NoDrop

	JSR Birdo_CheckForShyGuy
	BEQ Birdo_NoDrop	; If Shy Guy still exists, jump to Birdo_NoDrop

	; Shy Guy is gone...

	; If Var6 hasn't expired, no drop
;	LDA entity_var6,X
;	BNE Birdo_DecVar6

	; Var6 expired...

	; Prepare new object (if possible!)
	JSR PrepareNewObjectOrAbort

	LDA #SPR_PAL2
	STA Objects_SprAttr,X

	; Green Shy Guy!
	LDA #OBJ_SHYGUY_GREEN
	STA entity_type,X

	; Fall to Player
	LDA <Horz_Scroll
	ADD #$FF
	STA entity_lo_x,X
	LDA <Horz_Scroll_Hi
	ADC #0
	STA entity_hi_x,X

	LDA <Vert_Scroll
	ADD #40
	STA entity_lo_y,X
	LDA #0
	ADC #0
	STA entity_hi_y,X

	LDA #-$20
	STA entity_lo_y_velocity,X

	; Boing!
	LDA #SND_PLAYERJUMPSM
	STA Sound_QPlayer

	LDX <entity_index		 ; X = object slot index

	; Reset Var6
	;LDA #64
	;STA entity_var6,X

;Birdo_DecVar6:
;	DEC entity_var6,X

Birdo_NoDrop:
	JSR Level_ObjCalcXDiffs

	; Face Player
	LDA FireChomp_FlipTowardsPlayer,Y
	STA entity_flipped_animation,X

	JSR Object_Move	 ; Do standard movements

	LDA <entity_collision_flags,X
	AND #$08
	BEQ Birdo_NoCeilHit	 ; If Birdo did not hit ceiling, jump to Birdo_NoCeilHit

	; Bounce off ceiling
	LDA #$01
	STA <entity_lo_y_velocity,X

Birdo_NoCeilHit:
	LDA <entity_collision_flags,X
	AND #$04
	BEQ Birdo_NoGndHit	 ; If Birdo did not hit ground, jump to Birdo_NoGndHit

	JSR Object_HitGround	 ; Align Birdo to ground

Birdo_NoGndHit:

	; Check if Birdo has gone to a different hit level
	LDA entity_var4,X
	AND #$F0	; Upper 4 bits are hit level
	STA <var1	; -> var1

	LDA Objects_HitCount,X
	AND #$F0
	CMP <var1	; Compare upper 4 bits of hit count to hit level
	BEQ Birdo_NoChangeHit	; If Birdo has not changed to a new hit level, jump to Birdo_NoChangeHit

	; Birdo changed hit level!  Update hit level and go to state 5!
	LDA #5
	STA <var1
	JSR Birdo_ChangeState

	; Change upper frame to 2
	LDA #2
	STA entity_var1,X

Birdo_NoChangeHit:
	JSR Birdo_Draw

	LDA Objects_ColorCycle,X
	BEQ Birdo_NotInvincible

	JSR Birdo_NoDetect

Birdo_NotInvincible:
	LDA entity_var4,X
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

	; Store frame into var14 (top) and var15 (bottom)
	LDX <entity_index		 ; X = object slot index

	; Upper body sprite frame
	LDA entity_var1,X
	ASL A
	STA <var14

	; Lower body sprite frame
	LDA entity_var2,X
	ADD #3		; Base frame for lower body
	ASL A
	STA <var15

	LDA entity_flipped_animation,X
	AND #SPR_VFLIP
	BEQ Birdo_DrawNotVFlipped

	; If vertically flipped, swap var14/15
	LDA <var14
	PHA

	LDA <var15
	STA <var14

	PLA
	STA <var15

Birdo_DrawNotVFlipped:

	LDX <var14
	JSR Object_Draw16x16Sprite

	LSR <var5	 ; Next visibility bit

	; Next two sprites
	TYA
	ADD #8
	TAY

	LDA <var1
	ADD #16
	STA <var1

	LDX <var15
	JSR Object_Draw16x16Sprite

	LDX <entity_index		 ; X = object slot index
	RTS


Birdo_Wait4Player:
	JSR Boss_WaitAndLock
	BCC Birdo_NoDetect		; If boss not positioned yet, jump to Birdo_NoDetect

	; Initialize walking and go!  (Implicitly, state becomes zero here)
	LDA entity_var4,X
	AND #$F0	; Mask out hit level
	STA entity_var4,X

Birdo_NoDetect:

	; Deliberately breaks object detection
	LDA #$FF
	STA entity_sprite_lo_x,X
	STA entity_sprite_lo_y,X

	RTS

Birdo_WalkXVel: .byte $0C, -$0C

Birdo_InitWalk:
	; Init walk

	; 3.5 tiles = 56 pixels of walking
	; Speed will be at $0C (0.75 pixels/frame)
	; Frames needed to cover distance: 56 / 0.75 = ~75

	LDA entity_var3,X
	AND #$80	; Only keep bit 7
	EOR #$80	; Invert it (reverse walk direction)
	ORA #75		; Set tick count
	STA entity_var3,X

Birdo_ResetWalk:
	AND #$80	; Get bit 7
	ROL A
	ROL A		; Move to bit 0
	TAY
	LDA Birdo_WalkXVel,Y
	STA entity_lo_x_velocity,X

	; Change to walk state
	LDA entity_var4,X
	AND #$F0	; Mask out hit level
	ORA #1		; State = 1 (walk)
	STA entity_var4,X

	; Drop into walking...

Birdo_Walking:

	DEC entity_var3,X
	LDA entity_var3,X

	; Examine just the tick part of this value (bit 7 is direction)
	AND #$7F
	BEQ Birdo_InitWalk	; If Birdo has completed this walk cycle, jump to Birdo_InitWalk

	; Otherwise, just update body frame
	LSR A
	LSR A
	AND #$01
	STA entity_var2,X

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
	STA <var1

Birdo_ChangeState:
	LDA entity_var4,X
	AND #$F0		; Mask out hit level
	ORA <var1		; Store new state
	STA entity_var4,X	; Go for it, Birdo

	; Clear state-specific var
	LDA #0
	STA entity_var5,X

	; Birdo stops moving
	LDA #0
	STA entity_lo_x_velocity,X

	RTS

Birdo_Jump:

	LDA entity_var5,X	; Var5 = 0 means not actually jumped yet
	BNE Birdo_AlreadyHopped

	; Mark as having jumped
	INC entity_var5,X

	; Jump!
	LDA #-$28
	STA entity_lo_y_velocity,X

	RTS

Birdo_AlreadyHopped:

	LDA <entity_collision_flags,X
	AND #$04
	BEQ Birdo_JumpNotLanded	; If Birdo hasn't landed yet, jump to Birdo_JumpNotLanded (RTS)

Birdo_FinishedState:
	; Return to state 1
	LDA #1
	STA entity_var5,X

	; Need to reset walk speed
	LDA entity_var3,X
	JMP Birdo_ResetWalk

Birdo_JumpNotLanded:
	RTS

Birdo_Pause:
	LDA entity_var5,X
	BNE Birdo_PauseCont	; If Birdo already initialized pause, jump to Birdo_PauseCont

	; Initialize pause
	LDA RandomN
	AND #$1F	; Additional value
	ADD #16		; Base value
	STA entity_var5,X

Birdo_PauseCont:

	DEC entity_var5,X	; Decrement pause value
	BEQ Birdo_FinishedState	; If zero, jump to Birdo_FinishedState
	RTS

Birdo_SpitEgg:
	LDA entity_var5,X
	BNE Birdo_SpitCont	; If Birdo already initialized egg spit, jump to Birdo_SpitCont

	; Set upper frame to spit-ready
	LDA #1
	STA entity_var1,X

	; Set timer
	LDA #$18
	STA entity_var5,X

Birdo_SpitCont:

	DEC entity_var5,X	; Decrement ticker

	LDA entity_var5,X
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
	STA entity_var1,X

	BEQ Birdo_FinishedState 	; Jump (technically always) to Birdo_FinishedState

Birdo_Hit:
	LDA entity_var5,X
	BNE Birdo_SpitCont	; If Birdo hit ticker already initialized, jump to Birdo_HitCont

	; Change Birdo's color as appropriate and resume walking
	LDA Objects_HitCount,X
	AND #$F0	; Get next hit level
	TAY		; -> 'Y'
	ORA #5		; Stay in state 5 for now
	STA entity_var4,X

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
	STA entity_var5,X
	STA Objects_ColorCycle,X

Birdo_HitCont:
	DEC entity_var5,X	; Decrement hit ticker
	BNE Birdo_HitNotDone	; If not done yet, jump to Birdo_HitNotDone

	LDA entity_var4,X
	AND #$F0	; Retain hit level
	ORA #1		; Back to walking state
	STA entity_var4,X

Birdo_HitNotDone:
	RTS

Birdo_Dying:
	LDA entity_var5,X
	BNE Birdo_DeadTimeout	; If Var5 > 0, jump to Birdo_DeadTimeout

	LDA entity_state,X
	CMP #OBJSTATE_NORMAL
	BEQ Birdo_EndLevel	; If Birdo's state is "Normal" here, that means we're doing the victory / bonus countdown

	; Birdo is falling...
	JSR Birdo_Draw

	; While Birdo is dying, we're going to stop him from just falling off
	; because we want to play some victory music and convert time -> bonus
	LDA entity_hi_y,X
	BEQ Birdo_StillDying	; If not Y Hi = 1 yet, jump to Birdo_StillDying (RTS)

	LDA entity_lo_y,X
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
	STA entity_state,X

Birdo_StillDying:
	RTS

Birdo_EndLevel:
	JSR DoTimeBonus	 ; Convert remaining time into score
	BNE Birdo_StillTimering	 ; If not done converting, jump to PRG003_A910 (RTS)

	; Set timer to $40
	LDA #$40
	STA entity_var5,X

Birdo_StillTimering:
	RTS

Birdo_DeadTimeout:
	DEC entity_var5,X
	BNE Birdo_StillTimering

	LDA World_Num
	CMP #9
	BNE Birdo_NotWZeroExit

	; Clear Arena Door 0
	LDA #0
	STA <var1
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
	LDA entity_state,Y
	BEQ PRG003_B353	 ; If this object slot is dead/empty, jump to PRG003_B353

	DEY		 ; Y--
	BPL PRG003_B34A	 ; While Y >= 0, loop!

	RTS		 ; Return

PRG003_B353:
	TYA		 
	TAX		 ; X = open object slot index

	JSR Level_PrepareNewObject

	LDX <entity_index		 ; X = object slot index

	; Set to normal state
	LDA #OBJSTATE_NORMAL
	STA entity_state,Y

	LDA #SPR_PAL1
	STA Objects_SprAttr,Y

	; Birdo egg!
	LDA #OBJ_BIRDOEGG
	STA entity_type,Y

	; May have chance for fireball at other hit levels
	; 2 = Always egg, 1 = 50/50, 2 = Always fireball
	LDA entity_var4,X
	AND #$F0	; 2, 1, 0
	LSR A
	LSR A
	LSR A		; Hit level * 2
	STA <var1	; -> var1

	LDA RandomN
	AND #$01	; 50/50 chance of something different
	ORA <var1
	TAX
	LDA BirdoEgg_Type,X
	STA entity_animation_frame,Y

	LDX <entity_index		 ; X = object slot index
	LDA <entity_lo_y,X
	STA entity_lo_y,Y
	LDA <entity_hi_y,X
	STA entity_hi_y,Y

	LDA <entity_lo_x,X
	STA entity_lo_x,Y
	LDA <entity_hi_x,X
	STA entity_hi_x,Y

	LDA entity_flipped_animation,X

	; X = 0
	LDX #$00

	AND #SPR_HFLIP
	BEQ PRG003_B37D	 ; If Birdo is not flipped, jump to PRG003_B37D

	INX	; X = 1

PRG003_B37D:

	LDA BirdoEgg_XVel,X
	STA entity_lo_x_velocity,Y

	LDX <entity_index		 ; X = object slot index
	RTS		 ; Return


Birdo_CheckForShyGuy:
	LDY #$04	 ; Y = 4
Birdo_CheckForShyGuy_Loop:
	LDA entity_state,Y
	BEQ Birdo_CheckEmpty	 ; If this object slot is dead/empty, jump to Birdo_CheckEmpty

	; Not dead/empty...
	LDA entity_type,Y
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
	LDA entity_timer_secondary,X 
	BEQ PRG000_D090	 ; If timer 3 is expired, jump to PRG000_D090

	JSR Object_Move	 ; Perform standard object movements

	LDA <entity_collision_flags,X
	AND #$04
	BEQ PRG000_D07E	 ; If object did NOT hit ground, jump to PRG000_D07E

	JSR Object_HitGround	 ; Align to ground
	STA <entity_lo_x_velocity,X	 ; Clear X velocity

PRG000_D07E:

	; Set object frame to 3
	LDA #$03
	STA entity_animation_frame,X

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

	ADD <player_lo_x
	STA <player_lo_x	 ; player_lo_x += Level_ScrollDiffH
	BCC PRG000_DE65	 ; If no carry, jump to PRG000_DE65

	INC <player_hi_x	 ; Otherwise, apply carry

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

	LDY <player_is_in_air
	BEQ PRG000_DE89	 ; If Player is not mid air, jump to PRG000_DE89

	LDY #$00	 ; Y = 0

	ADD Level_ScrollDiffV	 ; Level_ScrollDiffV is 0 or -1 right now
	CMP #$ff
	BNE PRG000_DE89
	DEY		 ; Y = -1 

PRG000_DE89:
	ADD <player_lo_y
	STA <player_lo_y
	TYA		
	ADC <player_hi_y	
	STA <player_hi_y	

	RTS		 ; Return


AScrlURDiag_CheckWrapping61:
	JSR AScrlURDiag_NoWrapAbort	 ; Will not return here if AScrlURDiag_WrapState_Copy is not set or gameplay halted!

	LDA <entity_lo_x,X
	ADD AScrlURDiag_OffsetX	
	STA <entity_lo_x,X
	BCC PRG000_DEA3	 ; If no carry, jump to PRG000_DEA3
	INC <entity_hi_x,X	 ; Otherwise, apply carry
PRG000_DEA3:

	LDA <entity_lo_y,X
	ADD AScrlURDiag_OffsetY	
	STA <entity_lo_y,X
	BCC PRG000_DEAF	 ; If no carry, jump to PRG000_DEAF
	INC <entity_hi_y,X	 ; Otherwise, apply carry 

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
	STA <player_lo_x_velocity
	STA Player_Flip	
	STA Player_FlashInv
	STA Player_Kuribo
	STA Player_StarInv
	STA Player_Statue
	STA Level_PSwitchCnt

	LDA #$01
	STA Player_QueueSuit	 ; Queue change to "small"

	LDA #-64
	STA <player_lo_y_velocity ; player_lo_y_velocity = -64

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
	; Ensure player_flipped_animation is correct?
	; SB: May be a cosmetic bugfix for player coming out of a somersault
	; (see jump to PRG000_DAAE) and getting hit, but I'm not really sure...
	LDA <player_flipped_animation
	AND #$7f
	STA <player_flipped_animation

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Enemy_Kill
;
; Kills an enemy; flips them over, plays the "kick" sound
; If attribute 3, bit 6 is SET, there's some special
; behavior described below (using CollideJumpTable as a
; value rather than address, alternate dead state 3, etc.)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Enemy_Kill61:

	; Set timer 2 to 12
	LDA #12
	STA entity_no_collision_timer,X

	; "Kick" sound
	LDA Sound_QPlayer
	ORA #SND_PLAYERKICK
	STA Sound_QPlayer

	LDY ObjGroupRel_Idx	 	; Y = object group relative index
	LDA ObjectGroup_Attributes3,Y	; Get this object's attribute set 3
	AND #OA3_DIESHELLED
	BNE PRG000_DBB6	 		; If OA3_DIESHELLED is set, jump to PRG000_DBB6

	; OA3_DIESHELLED is not set...

	LDA Player_Slide
	BNE PRG000_DBB2	 	; If Player is sliding, jump to PRG000_DBB2

	LDA Kill_Tally	 	; Get current kill tally
	JSR Score_Get100PlusPts	; Get appropriate score based on kill tally

PRG000_DBB2:
	LDA #$06	 ; A = 6 (object state 6, killed)
	BNE PRG000_DBCF	 ; Jump (technically always) to PRG000_DBCF


PRG000_DBB6:

	; Attribute set 3 bit 6 is set...

	; Y *= 2 (2 byte index)
	TYA	
	ASL A	
	TAY	

	LDA ObjectGroup_CollideJumpTable+1,Y	; Get upper byte of collision jump entry
	AND #%11111000
	CMP #%00001000	; If only bit 3 is set and 4-7 are clear, this is a new object ID to change to
	BNE PRG000_DBC8	 ; If the above is not the case, jump to PRG000_DBC8

	; SPECIAL CASE: Collide Jump table lower byte specifies a new object ID

	LDA ObjectGroup_CollideJumpTable,Y 	; Get the new ID
	STA entity_type,X			; Set the new ID

PRG000_DBC8:
	; Timer 3 set to $FF
	LDA #$ff
	STA entity_timer_secondary,X

	LDA #OBJSTATE_SHELLED	 ; A = Shelled

PRG000_DBCF:
	STA entity_state,X	 ; Set new object state

	LDA #-$30	 ; A = -$30

	LDY <var4

	CPY #$0f	
	BEQ PRG000_DBDC	 ; If var4 = $0F, jump to PRG000_DBDC

	LDA #-$50	 ; A = -$50

PRG000_DBDC:
	STA <entity_lo_y_velocity,X	 ; Set Y velocity appropriately

	; Set appropriate X Velocity based on facing direction of 
	; Player when he killed the enemy
	JSR Level_ObjCalcXDiffs
	LDA EnemyKill_XVels,Y
	STA <entity_lo_x_velocity,X

	; Set vertical flip on the object
	LDA entity_flipped_animation,X
	ORA #SPR_VFLIP

	STA entity_flipped_animation,X

	RTS		 ; Return
