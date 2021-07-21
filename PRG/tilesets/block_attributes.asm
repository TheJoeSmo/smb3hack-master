


Block_Air           = $00
Block_USemiSolid    = $01
Block_DSemiSolid    = $02
Block_LSemiSolid    = $03

Block_RSemiSolid    = $04
Block_Solid         = $05
Block_Hurt          = $06
Block_Lava          = $07

Block_Water         = $08

Block_Coin          = $20
Block_Hidden_Coin   = $21
Block_Purple_Coin   = $22

Block_Star_Coin_1   = $24
Block_Star_Coin_2   = $25
Block_Star_Coin_3   = $26

Block_P_Switch                      = $28
Block_Upside_Down_P_Switch          = $29
Block_Activator_Switch              = $2A
Block_Upside_Down_Activator_Switch  = $2B

Block_On_Blocks     = $2C
Block_Off_Blocks    = $2D

Block_Question_Block                    = $30
Block_Question_Block_with_Coins         = $31
Block_Question_Block_with_Star_or_Coin  = $32

Block_Question_Block_with_Fire_Flower   = $34
Block_Question_Block_with_Leaf          = $35
Block_Question_Block_with_Carrot        = $36
Block_Question_Block_with_Penguin       = $37

Block_Question_Block_with_Boomerang     = $38
Block_Question_Block_with_Star          = $39

Block_Brick                     = $40
Block_Brick_with_Coins          = $41
Block_Brick_with_Star_or_Coin   = $42
Block_Brick_with_1UP            = $43

Block_Brick_with_Fire_Flower    = $44
Block_Brick_with_Leaf           = $45
Block_Brick_with_Star           = $46

Block_Brick_with_Vine           = $4C
Block_Brick_with_P_Switch       = $4D

Block_Noteblock                 = $50
Block_Noteblock_with_Flower     = $51
Block_Noteblock_with_Leaf       = $52
Block_Noteblock_with_Star       = $53

Block_Warp_Noteblock            = $5C

Block_Hidden_Question_Block_with_Coin   = $60
;Block_Hidden_Question_Block_with_1UP    = $61
Block_Hidden_Noteblock                  = $62
Block_Hidden_Noteblock_with_Warp        = $63

Block_Muncher           = $64
Block_Vine              = $65
Block_Throwable_Block   = $66

Block_UWaterfall    = $68
Block_DWaterfall    = $69
Block_LWaterfall    = $6A
Block_RWaterfall    = $6B

Block_Vertical_go_to_alt_level      = $70
Block_Vertical_go_to_secret_level   = $73

Block_Vertical_go_to_this_level     = $74
Block_Horizontal_go_to_alt_level    = $76
Block_Horizontal_go_to_this_level   = $78


; This defines the attributes for a given block.
; 0000_1111 => The sides of the player that hurt him and the sides that are solid.
; The order is as following: top, bottom, left, right

BlkAttr_Solid       = %00001111
BlkAttr_Hurt        = %11111111
BlkAttr_USemiSolid  = %00001000
BlkAttr_DSemiSolid  = %00000100
BlkAttr_LSemiSolid  = %00000010
BlkAttr_RSemiSolid  = %00000001
BlkAttr_Air         = %00000000


BlockAttributes:
    .byte BlkAttr_Air, BlkAttr_USemiSolid, BlkAttr_DSemiSolid, BlkAttr_LSemiSolid 
    .byte BlkAttr_RSemiSolid, BlkAttr_Solid, BlkAttr_Hurt, BlkAttr_Air
    .byte BlkAttr_Air, 0, 0, 0
    .byte 0, 0, 0, 0

    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0

    .byte BlkAttr_Air, BlkAttr_Air, BlkAttr_Air, 0
    .byte BlkAttr_Air, BlkAttr_Air, BlkAttr_Air, 0
    .byte BlkAttr_Solid, BlkAttr_Solid, BlkAttr_Solid, BlkAttr_Solid
    .byte BlkAttr_Solid, BlkAttr_Solid, 0, 0

    .byte BlkAttr_Solid, BlkAttr_Solid, BlkAttr_Solid, 0
    .byte BlkAttr_Solid, BlkAttr_Solid, BlkAttr_Solid, BlkAttr_Solid
    .byte BlkAttr_Solid, BlkAttr_Solid, 0, 0
    .byte 0, 0, 0, 0
    
    .byte BlkAttr_Solid, BlkAttr_Solid, BlkAttr_Solid, BlkAttr_Solid
    .byte BlkAttr_Solid, BlkAttr_Solid, BlkAttr_Solid, 0
    .byte 0, 0, 0, 0
    .byte BlkAttr_Solid, BlkAttr_Solid, 0, 0

    .byte BlkAttr_Solid, BlkAttr_Solid, BlkAttr_Solid, BlkAttr_Solid
    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    .byte BlkAttr_Solid, 0, 0, 0

    .byte BlkAttr_Air, BlkAttr_Air, BlkAttr_Air, BlkAttr_Air
    .byte BlkAttr_Hurt, BlkAttr_Solid, BlkAttr_Solid, 0
    .byte BlkAttr_Air, BlkAttr_Air, BlkAttr_Air, BlkAttr_Air
    .byte 0, 0, 0, 0    

    .byte BlkAttr_Solid, BlkAttr_Solid, BlkAttr_Solid, BlkAttr_Solid
    .byte BlkAttr_Solid, BlkAttr_Solid, BlkAttr_Solid, BlkAttr_Solid
    

; This defines the secondary attributes for a given block.
; These provide additional attributes, such as acting like lava or being climbable.
BlkAttr_None        = %00000000
BlkAttr_Water       = %00000001
BlkAttr_Lava        = %00000010
BlkAttr_Climbable   = %00000100


BlockAttributes2:
    .byte 0, 0, 0, 0 
    .byte 0, 0, 0, BlkAttr_Lava
    .byte BlkAttr_Water, 0, 0, 0
    .byte 0, 0, 0, 0

    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0

    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0

    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    
    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0

    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0

    .byte 0, 0, 0, 0
    .byte 0, BlkAttr_Climbable, 0, 0
    .byte BlkAttr_Water, BlkAttr_Water, BlkAttr_Water, BlkAttr_Water
    .byte 0, 0, 0, 0    

    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    

; Macros to keep things cosistent throughout
GetBlockAttributes .macro
    ; TileAttribute_ByTileset[tileset][block_idx]
    LDY Level_Tileset
    LDA TileAttribute_ByTileset, Y
	STA <Temp_Var1		
	LDA TileAttribute_ByTileset+1, Y
	STA <Temp_Var2
    LDY \1
    LDA [Temp_Var1], Y
    .endm

GetBlockAttributesX .macro
    ; TileAttribute_ByTileset[tileset][block_idx]
    LDY Level_Tileset
    LDA TileAttribute_ByTileset, Y
	STA <Temp_Var1		
	LDA TileAttribute_ByTileset+1, Y
	STA <Temp_Var2
    LDY \1, X
    LDA [Temp_Var1], Y
    .endm

GetIfLevelBlockIsSolid .macro
    GetBlockAttributes <Level_Tile
    TAY 
    GetIfBlockIsSolid
    .endm

GetIfLevelBlockSolidAtFeet .macro 
    GetBlockAttributes <Level_Tile
    TAY 
    GetIfBlockSolidAtFeet
    .endm

GetIfBlockIsSolid .macro
	LDA BlockAttributes, Y
    AND #BlkAttr_Solid
    CMP #BlkAttr_Solid
	.endm

GetIfBlockSolidAtFeet .macro
    LDA BlockAttributes, Y
    AND #BlkAttr_USemiSolid
    CMP #BlkAttr_USemiSolid
	.endm

GetIfBlockSolidAtHead .macro
    LDA BlockAttributes, Y 
    AND #BlkAttr_DSemiSolid
    CMP #BlkAttr_DSemiSolid
	.endm

GetIfBlockInWater .macro
    LDA BlockAttributes2, Y
    AND #BlkAttr_Water
    CMP #BlkAttr_Water
	.endm
