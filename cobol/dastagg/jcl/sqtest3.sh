#!/bin/bash

# Set Up
PGM=SQTEST3
REPORT=sqtest3-report.rpt
LOADLIB="../bin/"

# Clean Up
rm ../spool/$REPORT

# run program
export COB_LIBRARY_PATH="$RHOME/IBM/SQLLIB/BIN"
export COB_PRE_LOAD=db2agapi64
export LD_LIBRARY_PATH="../bin/"

../bin/$PGM.exe
