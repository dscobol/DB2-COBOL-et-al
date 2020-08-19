#!/bin/bash

# Set Up
PGM=SQTEST2
REPORT=sqtest2-report.rpt

# Clean Up
rm ../spool/$REPORT

# run program
export COB_LIBRARY_PATH="$RHOME/IBM/SQLLIB/BIN"
export COB_PRE_LOAD=db2agapi64

../bin/$PGM.exe
