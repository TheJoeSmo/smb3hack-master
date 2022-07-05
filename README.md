# Prime Bros 3

A kaizo adventure built off the back of SMB3, SMB3Mix, and the SMB3 Prime community!  This hack serves to be a testament to the great SMB3 ROM hacking community.  Each level is inspired off the SMB3 gimmicky style that defined Mario franchise.  Likewise, many components were also inspired off its predecessors and other fantastic games, such as Shovel Knight, Hollow Knight, Cup Head, and countless others.  In this spirit most levels took countless hours to program, implement, test.  Even more were bad.  They were scrapped.  The goal of this hack is not to make good levels.  Instead, every level should be a unique experience which is both challenging and rewarding.

Nor is this hack a normal hack.  Unlike other hacks, I do not intend to release the hack and call it finished.  This hack is not meant to be a speed-run.  This hack is an open sourced project.  You are free to copy, release, and distribute the source code of this hack.  I actually encourage it.  If you see a feature you like and it is not released, do not let that hold you back.  You can even submit your own levels if you wish.  Without open sourced projects we would not have the disassembly nor the editors which this hack relied upon.  Neither are finished and nor is this hack.

Special thanks to Captain Sourthbird, Michael, and the SMB3 Prime community!

-------------

# Programming Standards

Assembly is a mess.  Assembly on the NES is no different.  While I cannot enforce a standard on the components of the past, I do wish to enforce a standard onto all future code.  This is provide a simplified interface for one to rely upon when writing assembly.

## Register Usage

On the 6502 CPU, there are three primary registers.  This defines their expected usage between functions.

### Accumulator   

Usage: The first param to be passed.

Preservation: Is not preserved between functions.

### X

Usage: An index register which must be defined by the function passed to.  If not defined, it is assumed to not be modified by the called function.

Preservation: Preserved unless otherwise stated.

### Y

Usage: An index register which must be defined by the function passed to.  If not defined, it is assumed to not be modified by the called function.

Preservation: Preserved unless otherwise stated.

## Temporary Variables

There are 16 temporary variables which are used by SMB3.

### Variables 1-5

Usage: These are utilized to pass parameters 2-6.

Preservation: Not preserved between function calls.

### Variables 6-9

Usage: Temporary variables for the called function.

Preservation: Not preserved between function calls.

### Variables 10-16

Usage: Temporary variables for the parent function.

Preservation: Always preserved between function calls.

-------------

To assemble, simply run:

nesasm 3mix.asm

