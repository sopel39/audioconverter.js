#!/bin/bash
set -e

# define some missing tuning variables
LANG=C sed -i '' $'s/#error  >>>> Please set architecture characterization defines for your platform (FDK_HIGH_PERFORMANCE)! <<<</#define ARCH_PREFER_MULT_32x16\\\n#define SINETABLE_16BIT\\\n#define WINDOWTABLE_16BIT\\\n#define POW2COEFF_16BIT\\\n#define LDCOEFF_16BIT/g' libFDK/include/FDK_archdef.h

emconfigure ./configure --host=x86 --disable-shared --prefix=$(pwd)/../dist