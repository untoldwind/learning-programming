---
layout: post
category: lessons
title: "Lesson 3: A very simple computer"
tagline: "WTF is assembler"
tags : [intro, beginner]
---
{% include JB/setup %}

# Target audience

Everyone who understood the previous lesson.

You may want to skip this, if ...

* ... you already have writen assembler programms.
* ... know the Z80 or 8080 processor upside down.

What you need:

* Pen and pager in electronic or archaic form.
* A modern web-browser (preferably Chrome in is current version, since most of the testing has been
    done with it).
* Internet access for further reading.

Do not expect:

* The layout of a real world computer. Though it might be possible to build an actual machine as
described here, it would not have any practical use (and would be horribly outdated).

# The simulator

To demonstrate the basic concepts of a computer system we will use the
[80ish Simulator]({{ site.url }}/assets/eightyish/index.html){:target="_blank"}, which you may open
in a different browser window now. Do not be alarmed by the amount of information displayed, we
will discuss all elements in detail.

But first: Why is it called 80ish?

The simulator orients itself at Intel's 8080 processor and its successor the famous Zilog's Z80, though
it is not fully compatible with either as some slightly inconsistent parts have been removed or
simplified. Also it simulates a personal computer that could have been available in the early 80s, but
again: It is not a real thing, just close to one.

Lets take a look at the two main components. First there is the information of the processor state
in the upper left corner:

{:.text-center}
![Eightyish registers]({{site.url}}/assets/pictures/eightyish_registers.png)

In the previous lesson we already mention the registers of a processor: They are used to temporarly
store binary values to operate on. A register is somewhat similar to the display of a cash register or
pocket calculator: You enter all your numbers there and it eventually shows the result of your
calculation.

The registers of the simulator a similar to those of the original Z80. There are 8 byte registers (8-bit):
__A__ __B__ __C__ __D__ __E__ __F__ __H__ __L__. I.e. these registers can store an 8-bit value (__0__ to __255__),
the simulator shows the current value of these registers in decimal, hexadecimal and binary.
The __A__ and __F__ registers have a special use: __A__ is also called accumulator, most operations are
done with this register, __F__ stores the current __Flags__, which are also displayed in the
lower left (Zero, Sign, Parity, Carry) - we will discuss the meaning of these later.

Since a byte can not contain very large number, the processor is able to combine two byte registers to
one word register (16-bit) for operations on bigger numbers. I.e. the __AF__ register actually just combines
the __A__ and __F__ register, __BC__ the content of __B__ and __C__ and so one. If you want to may
click on one of the values, enter a new one and see what happens.

Additionally the processor has 4 separate word registers __IX__, __IY__, __SP__ and __PC__. The later two
have a special meaning: __PC__ is the _program counter_ and __SP__ the _stack pointer_, which we will describe
in a minute.

Moving on with the simulator, we ignore the section in the upper right corner for now and take a look
at the section filling up the lower half of the screen:

{:.text-center}
![Eightyish memory]({{site.url}}/assets/pictures/eightyish_memory.png)

As the header suggests this is a view to the main memory of our simulated computer. The simulator
has the whooping amount of 1 kibibyte of main memory to play with. Each memory cell holds a byte which
is displayed in hexadecimal.

Since the processor needs a way to reference a specific memory cell, eath is uniquely identified
by a word address (16-bit). As indicated by the row and column titles the memory cells are counted from
left to right, top to bottom starting with zero. Therefore the upper left cell has the address 0x0000,
the upper right cell the address 0x001f, the lower left 0x03e0 and last and least the lower right 0x03ff.

# Program counter and opcodes

Now we have the main elements of a computer: A processor and some memory for it to work on. What we
so far have not talked about is: How exactly do we tell the processor what it has to do?

First of all, you may notice that the first memory cell is colored blue. This is because
the __PC__-register (program counter) currently has the value 0x0000 and thereby points to this
memory cell. If you change the value of the __PC__ register (by clicking on it), you will see
that a different memory cell will get this color. This applies to some other word registers as
well: __HL__ is light green, __IX__ light blue, __IY__ light yellow, __SP__ light red and __PC__
blue. Obviously the word registers a mostly used to point to a certain memory cell. __HL__, __IX__,
__IY__ may have some other uses, but __SP__ and __PC__ are solely used for this purpose.

You may also notice that the first memory cell already has the value 0x76 (instead of just 0 like
    the others). If the processor starts its work, the following will happen:

* The byte at the address __PC__ is loaded. Since the __PC__ is 0x0000 at the beginning, this will
be 0x76.
* The byte value is interpreted as an _operation code_ (or short _opcode_), i.e. the processor
has a list of allowed operations (also called _instruction set_) sees if the _opcode_ matches to one
of them. In this case 0x76 is the __HALT__ instruction, which tells the processor to stop its work
for now (i.e. the end of the program is reached).
* ... and the processor just halts.

There you are: The single byte 0x76 is actually a program. Admittedly its not a very fancy program,
but a program nevertheless and in this scenario the shortest possible one. (Other people usually
    start with a 'Hello world', but that is way more complicated as you will see).

Just to digest all the information:

* The __PC__ points to the next instruction in the main memory, just as the name _program counter_
suggests.
* An instruction just a byte or a sequence of bytes (for somewhat more complex instructions).
* The actually meaning of this byte is (more or less) hardwired inside the processor. The actual
method how an _opcode_ is interpreted is quite complicate and is out of the scope of this lesson,
from the programers point of view it is just important to know what instruction is hidden behind
each byte value and what it is supposed to do.
* To do this the very early programers had to refer to a datasheet of the processor, documenting
all its instructions and corresponding _opcodes_. If you want to know how a datasheet originally
looked like: You may find [here](http://www.z80.info/zip/z80.pdf){:target="_blank"} is a
scanned version of the Z80-datasheet, as you can see on Page 14 the __HALT__ instruction is
indeed 0x76.

Looking up instructions in a datasheet is very cumbersome and far to unintuitive to be a good
learning experience. The first programmers though so as well and invented the assembler which
translates instructions in human readable form to their processor-readable byte representation.
This is what you see in the upper left section of the simulator:

{:.text-center}
![Eightyish memory]({{site.url}}/assets/pictures/eightyish_assembler.png)

No the right side of the assembler you see the program from the processor's view (i.e. the
    bytes in the main memory), to the left is a more human-friendly version. Not suprisingly
both are rather empty right now: There is just the single byte __HALT__ instruction.
