# run program

PGM=SQTEST2

export COB_LIBRARY_PATH="$RHOME/IBM/SQLLIB/BIN"
export COB_PRE_LOAD=db2agapi64

./$PGM.exe
