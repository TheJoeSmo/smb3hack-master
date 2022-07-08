

# Assembly Files
ASM_FILE := .asm

# Tags File Name
TAG_FILE := tags

# Rules
default: all

all: $(TAG_FILE)


# Generate tags file for warping.
$(TAG_FILE): $(wildcard */$(ASM_FILE)) $(wildcard */*$(ASM_FILE))
	echo $@ $<
	ctags -R 3mix.asm
