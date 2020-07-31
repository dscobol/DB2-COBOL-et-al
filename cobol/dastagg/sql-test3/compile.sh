# Compile script

PGM=SQTEST3
SYSLIB="$RHOME/IBM/SQLLIB/include/cobol_mf"
LOADLIB="$RHOME/IBM/SQLLIB/lib"

# clean
rm $PGM.exe
rm $PGM.bnd
rm $PGM.cbl

# db2cmd -i -w -c db2 [command line parameters]
# -i : don't open a new console, share the existing console and stdin, stdout handles
# -c : run the specified command (db2 etc.) and terminate
# -w : wait until the spawned command process ends

db2cmd -i -w -c db2 -tvf db2_precompile.sql

# pause
read -n1 -r -p "Press any key to continue..." key

cobc -x -std=ibm-strict $PGM.cbl -I $SYSLIB -L $LOADLIB -l db2api
