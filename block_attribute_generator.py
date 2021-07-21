tsa = [0x25, 0x54, 0xA0, 0xE2, 0x2D, 0x56, 0xAD, 0xF0, 0xFF, 0xFF, 0xFF, 0xDA, 0xFF, 0xFF, 0xFF, 0xFF]

defined_attributes = {
    0x01: "Purple_Coin",
    0x03: "Hidden_Noteblock",
    0x05: "Hidden_Coin",
    0x2E: "Noteblock",
    0x2F: "Noteblock_with_Flower",
    0x30: "Noteblock_with_Leaf",
    0x31: "Noteblock_with_Star",
    0x32: "Throwable_Block",
    0x40: "Coin",
    0x44: "Hidden_Question_Block_with_Coin",
    0x45: "Hidden_Question_Block_with_1UP",
    0x46: "Hidden_Noteblock_with_Warp",
    0x50: "Star_Coin_1",
    0x51: "Star_Coin_2",
    0x52: "Star_Coin_3",
    0x53: "Off_Blocks",
    0x60: "Question_Block_with_Fire_Flower",
    0x61: "Question_Block_with_Leaf",
    0x62: "Question_Block_with_Star",
    0x63: "Question_Block_with_Coins",
    0x64: "Question_Block_with_Star_or_Coin",
    0x65: "Question_Block_with_Coins",
    0x66: "Muncher",
    0x67: "Brick",
    0x68: "Brick_with_Fire_Flower",
    0x69: "Brick_with_Leaf",
    0x6A: "Brick_with_Star",
    0x6B: "Brick_with_Coin",
    0x6C: "Brick_with_Star_or_Coin",
    0x6D: "Brick_with_Coins",
    0x6E: "Brick_with_1UP",
    0x6F: "Brick_with_Vine",
    0x70: "Brick_with_P_Switch",
    0x71: "Red_Noteblock",
    0x72: "Question_Block_with_Carrot",
    0x73: "Question_Block_with_Penguin",
    0x74: "Question_Block_with_Boomerang",
    0x75: "Question_Block",
    0x85: "Vine",
    0xAD: "Vertical_go_to_alt_level",
    0xAE: "Vertical_go_to_alt_level",
    0xAF: "Vertical_go_to_secret_level",
    0xB0: "Vertical_go_to_secret_level",
    0xB3: "Vertical_go_to_this_level",
    0xB4: "Vertical_go_to_this_level",
    0xB5: "Horizontal_go_to_alt_level",
    0xB7: "Horizontal_go_to_this_level",
    0xBB: "Warp_Noteblock",
    0xE0: "Waterfall",
    0xE1: "Waterfall",
    0xF2: "P_Switch",
    0xFC: "Upside_Down_Activator_Switch",
    0xFD: "On_Blocks",
    0xFE: "Activator_Switch",
}


def find_block_type(block: int, semi: int, water: int, lava: int, solid: int) -> str:
    if block in defined_attributes:
        return defined_attributes[block]
    elif block >= solid:
        return "Solid"
    elif block >= lava:
        return "Lava"
    elif block >= water:
        return "Water"
    elif block >= semi:
        return "USemiSolid"
    else:
        return "Air"


if __name__ == "__main__":
    blocks = []
    for i in range(0xFF):
        idx = i // 0x40
        semi = tsa[idx]
        water = tsa[idx + 8]
        lava = tsa[idx + 12]
        solid = tsa[idx + 4]
        blocks.append(f"Block_{find_block_type(i, semi, water, lava, solid)}")
    for i in range(0x10):
        print(str(blocks[i * 0x10 : (i + 1) * 0x10]).replace("'", ""))
