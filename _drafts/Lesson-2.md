---
layout: post
category: lessons
title: "Lession 2: Main components of a computer"
tagline: "WTF is a CPU, RAM and opcodes"
tags : [intro, beginner]
---
{% include JB/setup %}

# Target audience

Everyone who understood the previous lesson.

You may want to skip this, if ...

* ... you already familiar with the basic principles of a modern day computer
* ... you are already familiar with terms like CPU, RAM, ROM, opcodes, ...

Do not expect:

* A detailed instruction how to build a computer from scratch.
* If you are looking for a guide to build logic gates from transistors,
diodes and resistors, you might want to start here: [Digital Logic Gates Just Using Transistors](http://www.instructables.com/id/Digital-Logic-Gates-Just-Using-Transistors/)
* If you want to know how to build a (simple) CPU using logic gates, you might
want start here: [How to Build an 8-Bit Computer](http://www.instructables.com/id/How-to-Build-an-8-Bit-Computer/)

# The basic terms and units first

In the previous lesson we talked a lot about binary encoding. A single binary
digit (i.e. __0__ or __1__) is usually called a _bit_, which is a portmanteau of
the former (i.e. __b__<del>inary dig</del>__it__). But its also safe to think of
a _bit_ as in "a bit of information", since it is the smallest unit of information
available on a computer system.

As mentioned before, bits are usually transmitted in groups of 8, also called an octet
or - more commonly - a _byte_ (which is a respelling of _bite_ to avoid confusion with a _bit_).
With 8 bits a byte can contain any number from __0__ (0b00000000) to __255__ (0b11111111 or $2^8 - 1$).

For greater numbers 2 bytes may be combined to a group of 16 bits, which is also
called a _word_, _small integer_, _short integer_. A _word_ can contain any number
from __0__ to __65,535__ ($2^16 - 1$)

The next greatest unit is the combination of 2 words or 4 bytes or 32 bits, also called _doubleword_
or _integer_ - the latter might be ambiguous as in the early days of computer
science an _integer_ depended on the processor architecture and might have also
denoted a 16-bit number. A _doubleword_ can contain any number from __0__ to
__4,294,967,295__ ($2^32 - 1$). If you want to think in terms of population, a _doubleword_
is not big enough to count the people on earth, though still sufficient to
count the people in china.

An eventually there is the combination of 4 words or 8 bytes or 64 bits, also
called _quadword_ or _long integer_ or _long_ or _long long_ - again the latter might be
ambiguous and depend on the processor architecture. A _quadword_ may contain
any number between __0__ and __18,446,744,073,709,551,615__ ($2^64 - 1$).
Or - in terms of population - a _quadword_ is sufficient to count the
people of a billion of earths. Though its not big enough to count all cells of all
humans on earth (which is somewhere in the region of 37 trillion per human by the way).

Even though I already said _eventually_, there is one more, the _douvkeqzadword_ or _octaword_ or
8 words or 16 byte or 128 bits. I am not writing down the range, it is enough to
say: An _octaword_ is big enough to count a the cells of all humans on 100 trillion
earths - and there would be still room for more. Even though modern day computers
can handle these numbers, they are so enormous that their practical use is limited.
Or simply put: Why waste resources if almost all of your human concerns can be
solved with a _quad ord_? The only exception to this is cryptography, in which case 128 bit
is the lower range of numbers - we will address this in a later lesson.
In summary, the commonly used units are:

{:.table .table-bordered}
| Unit | Definition | Range |
| bit  |            | __0__ to __1__ |
| byte, octet | 8 bits | __0__ to __255__ |
| word, short integer | 16 bits | __0__ to __65,535__ |
| doubleword, integer | 32 bits | __0__ to __4,294,967,295__ |
| quadword, long integer | 64 bits | __0__ to __18,446,744,073,709,551,615__ |
| doublequadword, octaword | 127 bits | __0__ to $2^128 - 1$ |

# Units for memory

Every computer requires some means to store and retrieve informations, or rather bytes. It is
quite obvious, that units described in the previous section do not suffice for larger amounts of data.
Regardless of the concrete storage medium there are several well established units to measure the
amount of available memory.

First der is the _kilobyte_, which orginally - and still quite commonly - referres to 1,024 (or $2^10$)
bytes. As computers are build on binary numbers, it makes sense, to measure the amount of memory in
powers of two. On the other hand the prefix _kilo_ is well establisched in [SI](https://en.wikipedia.org/wiki/International_System_of_Units)-Units
(like _kilometer_, _kilogram_, _kilowatt_ and so on) and usually mean 1,000. To clean this up, the
[IEC](https://en.wikipedia.org/wiki/IEC_80000-13) eventually defined a _kilobyte_ (short _kB_) als 1000 byte and
a _kibibyte_ (short _KiB_) as 1,024 byte. This terminology ist still quite uncommon, but for
correctness we will continue to use this.

By the same argument there a _megabyte_ (short MB) means 1,000,000 byte and a _mebibyte_ (short MiB) 1,048,576 ($2^20$) bytes.
A _gigabyte_ (short GB) is 1,000,000,000 byte, a _gibibyte_ (short GiB) 1,073,741,824 ($2^30$) bytes and so one.

In summary we end up with the following units to measure the amount of information storage:

{:.table .table-bordered}
| SI | IEC | Amount of information (if one character uses one byte) |
| 1 _kilobyte_ = 1 KB = $10^3$ byte | 1 _kibibyte_ = 1 KIB = $2^10$ byte | About 2-3 paragraphs of text, a bit less than a page in a novel |
| 1 _megabyte_ = 1 MB = $10^6$ byte | 1 _mibibyte_ = 1 MiB = $2^20$ byte | Between 800-900 pages, or about 2-4 books - depending on the author an genre |
| 1 _gigabyte_ = 1 GB = $10^9$ byte | 1 _gibibyte_ = 1 GiB = $2^30$ byte | Between 3000-4000 books |
| 1 _terrabyte_ = 1 TB = $10^12$ byte | 1 _tebibyte_ = 1 TiB = $2^40$ byte | About 3-4 million books |
| 1 _petabyte_ = 1 PB = $10^15$ byte | 1 _pebibyte_ = 1 PiB = $2^50$ byte | About 3-4 billion books or about 100 Library of Congresses |
| 1 _exabyte_ = 1 EB = $10^18$ byte | 1 _exbibyte_ 1 E = $2^60$ byte | Abount 100,000 Library of Congresses |

Next would be _zettabyte_ and then _yottabyte_, but these are so enourmous that they do not have
any practical use at the moment. Might be good to keep in mind for the future though. To give you
an idea about the timeframe of development so far. The personal computers in the early 1980's started with
1-32 KiB, in 2015 we are already used to machines in the TiB region and super-computers touching the
EIB order of magnitude.

# Types of memory

Over the time many forms of computer memory have been invented, to some degree re-invented and in
several cases already abandoned. It is usually to distinquish beween external and internal storage:
External storage is supposed ot be removed from the computer by the user and potentially moved to
a different computer, internal storage is build-in and not supposed to be removed from the computer.

Here is a short list in roughly temporal order:

* Printouts (external): One might lough this of, but a printed document is of course a storage medium that we are
using for several millenia already (sometimes also called _books_). In the early days of computers the
main problem was that this was a write-only storage medium (i.e. it was impossible for the computer to
  read the information again). With [OCR](https://en.wikipedia.org/wiki/Optical_character_recognition),
  [Barcodes](https://en.wikipedia.org/wiki/Barcode) and [QR-Codes](https://de.wikipedia.org/wiki/QR-Code)
  this has changed over time. So yes, printouts are a computer storage mediuam, albeit a quite pricy
  one with limited capacity.
  * As a demonstration there is the nice anecdote of the [PGPi sanning project](http://www.pgpi.org/pgpi/project/scanning/):
  As cryptographic software PGP was restricted by US-Export regulations, so its source code was
  printed, exported as 12 books (not limited by US-Export, but rather backed by freedom of speech)
  and re-scanned in a country without rediculous export limitations.
* [Punched cards](https://en.wikipedia.org/wiki/Punched_card)
[tapes](https://en.wikipedia.org/wiki/Punched_tape) (external): The most simple way - and to some degree
- most permanent way to to store a bit is to punch a hole into some sort of material. Actually this
method of information storage was already used before the age of computers in various mechanical
constructs. Todays use of this method is very limited to almost non-existent. On the other hand:
If you want to store something for geological ages there is probably no better way than to punch
holes into a material that is prooven to remain inert for a very long time ... lat's say a rock.
* [Magnetic storage](https://en.wikipedia.org/wiki/Magnetic_storage): When using a medium with magnetic
properties its possible to store a bit be magnetising or demagnetising a certain area. There are several
applications for this method:
  * [Magnetic tapes](https://en.wikipedia.org/wiki/Magnetic_tape_data_storage) (external): Just like old audio or
video tapes. Since data can only be read or writtern sequentally this method was most commonly used for
data backup. [DAT/DDS](https://en.wikipedia.org/wiki/Digital_Data_Storage) or [DLT](https://de.wikipedia.org/wiki/Digital_Linear_Tape)
are still in use, though are loosing importance since other media have become cheaper and more
reliable.
  * [Floopy disk](https://en.wikipedia.org/wiki/Floppy_disk) (external): In the 1970-1990ith if was quite common to
  store data on a flexible, more or less small, transportable disk. This medium has now become almost non-existent.
  * [Hard disk drive (HDD or HD)](https://en.wikipedia.org/wiki/Hard_disk_drive) (mostly internal storage,
    might be used as external storage as well):
  Similiar in concept to a floppy disk, just with a different, "hard" matherial and better protected from
  external environment (e.g. dust). Still a very common storage medium, though loosing importance.
* [Optical disks](https://en.wikipedia.org/wiki/Optical_disc) (external): Bits are stored by changing the optical
properties in an area (e.g. create a dent, a hole or darken/lighten it) and scan it with a laser. Usually used in
a write once read multiple scenario. Commonly known applications: [CD](https://en.wikipedia.org/wiki/Compact_Disc),
[DVD](https://en.wikipedia.org/wiki/DVD) and [BlueRay](https://en.wikipedia.org/wiki/Blu-ray_Disc). Still
a very common storage medium, though loosing importance.
* [Semiconductor memory](https://en.wikipedia.org/wiki/Semiconductor_memory): A very wide range of integrated circuits
(i.e. microchips) to store data, with different properties and applications:
  * [Read only memory (ROM)](https://en.wikipedia.org/wiki/Read-only_memory) (internal): A microchip that
  is able to store information for a long time without power source, but can only be
  read by the computer. Very early versions of his where programmed or _burned_ by actually burning
  paths inside the chip with sufficently high voltage (i.e. this variant could really be programmed just once).
  Later came [EPROMs (erasable, programmable ROM)](https://en.wikipedia.org/wiki/EPROM), that could be programmed
  once and resetted by UV light, and even later [EEPROMs (electrical-erasable, programmable ROM](https://en.wikipedia.org/wiki/EEPROM)
  that could be erased electrically (though not by the computer itself in normal operation and
    only a limited times before it deterioates and becomes entirely unusable).
    This storage is still widely used to store the firmware or BIOS of a computer.
  * (Flash memory)(https://en.wikipedia.org/wiki/Flash_memory): The next generation of EEPROMs, that
  can be programmed and earsed multiple times at higher speed and is still able to hold information without
  external power source. Even though flash memory still has the problem that it deterioates with use,
  it has become increasingly important in the recent years:
    * Replacement for ROM (internal): To allow firmware updates, flash memory has in most cases replaced
    the use for classical ROMs
    * [Compact flash cards](https://de.wikipedia.org/wiki/CompactFlash) (external): Mostly using in digital cameras
    * [USB-Sticks](https://de.wikipedia.org/wiki/USB-Stick) (external): Has replaced floppy disks almost entirely
    * [Solid state drive (SSD)](https://de.wikipedia.org/wiki/Solid-State-Drive) (internal as well as external):
    Is about to replace hard disks in most cases
  * [Random access memory (RAM)](https://de.wikipedia.org/wiki/Random-Access_Memory) (internal):
  A microchip that is able to store information for a limited amound of time and requires a
  power source to keep it (i.e. all information is lost on a power outage). One might raise the
  question "Why use such an unreiable storage medium in the first place?". The reason is in the
  name: The information can be read and written randomly at very high and constant speed with next
  to no deterioation of the medium itself. There are two main variants:
    * [Static RAM (SRAM)](https://de.wikipedia.org/wiki/Static_random-access_memory): Stores information
    as long as there is a power source and offers extremely fast access times. In theory
    SRAM is the ideal non-permanent computer storage, unluckily it has a rather poor data-density and
    thereby only offers limited capacities and (comparably) high price. SRAMs are usually used as
    caches of buffers.
    * [Dynamic RPM (DRAM)](https://de.wikipedia.org/wiki/Dynamic_Random_Access_Memory): Looses information
    even with power source after a certain amount of time, its access times are usually slower than SRAM,
    but offers a much high data-density. DRAMs are a major part in almost any modern computer and usually
    reffered to a _main memory_. The information loss over time is countered by a constant refresh
    (i.e. read and re-write) of the stored information.

# The processor

The core of each computer consists of its processor, also reffered to as CPU (central processing unit).

# Exercises

* Find some more examples what you can count with bytes, word, double words or quad words.
* Find some more examples how much information you can store in a _kilobyte_, _megabyte_, _gigabyte_, _terrabyte_
