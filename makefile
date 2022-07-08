# Assembly Files
ASM_FILE := .asm

# Image Files
IMAGE_FILE := .pcx

# ROM File
ROM_FILE := main.nes

# Tags File Name
TAG_FILE := .vscode-ctags

# Main file
MAIN_FILE := main.nes

# Compiler
COMPILER := ../nesasm.exe

# Rules
default: all

all: $(TAG_FILE)

# Generate the ROM
$(ROM_FILE): $(MAIN_FILE) $(wildcard */$(ASM_FILE)) $(wildcard */*$(ASM_FILE)) $(wildcard */$(IMAGE_FILE)) $(wildcard */*$(IMAGE_FILE))
	@$(COMPILER) $(MAIN_FILE)

# Generate tags file for warping.
$(TAG_FILE): $(MAIN_FILE) $(wildcard */$(ASM_FILE)) $(wildcard */*$(ASM_FILE))
	@ctags -f $(TAG_FILE) -R ./
