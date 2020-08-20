#!/bin/bash

# Clean Up
rm ../spool/sqtest3-report.rpt

# run program
export COB_LIBRARY_PATH="$RHOME/IBM/SQLLIB/BIN"
export COB_PRE_LOAD=db2agapi64
#export LD_LIBRARY_PATH="."

./SQTEST3.exe
