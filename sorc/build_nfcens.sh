#!/bin/bash
###############################################################################
#                                                                             #
# Compiles all codes, moves executables to exec and cleans up                 #
#                                                                             #
#                                                               March, 2020   #
#                                                                             #
###############################################################################
#
# --------------------------------------------------------------------------- #

# Load modulefile
  module purge
#  module use ../modulefiles_wave_nfcens
#  module load build_gwes_sorc.module  
#  module list


# 1. Preparations: seek source codes to be compiled

  fcodes=nfcombwave_ensemble

  echo " FORTRAN codes found: "$fcodes

  outfile=`pwd`/make_code_wave_nfcens.out
  rm -f ${outfile}

# 2. Create executables

  for code in $fcodes
  do
    echo " Making ${code} " >> ${outfile}
    cd ${code}.fd 
    module purge 
    module use modulefiles
    module load build_gwes_sorc.module  
    make >> ${outfile}
    echo " Moving ${code} to exec" >> ${outfile}
    mv ${code} ../../exec
    echo " Cleaning up ${code} directory" >> ${outfile}
    make clean
    echo ' ' >> ${outfile}
    cd ..
  done

