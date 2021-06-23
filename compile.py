import os


def main(path):
    os.system(f"asm6f.exe -f -q {path}")  # Compile the ROM and LUA file

    if os.path.exists(f"{path}.nes"):
        os.remove(f"{path}.nes")
    os.rename(f"{path}.bin", f"{path}.nes")  # Rename the ROM to NES

    with open(f"{path}.lua", "r") as lua:
        lines = lua.readlines()

    with open(f"{path}.fns", "w") as fns:

        for line in lines:
            var_name = line.split()[0]
            var_pos = line[-5:-1]
            fns.write(f"{var_name} = ${var_pos}\n")


if __name__ == "__main__":
    main("3mix")
