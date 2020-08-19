#!/bin/bash

# Compile script

# This is changed to the name of the program to compile
PGM=SQTEST2

# These are static
# Copylib
SYSLIB="$RHOME/IBM/SQLLIB/include/cobol_mf"
# DB2 Load Libraries
LOADLIB="$RHOME/IBM/SQLLIB/lib"

# Clean Up
rm ../bin/$PGM.exe
rm ../cbl/$PGM.bnd
rm ../tcbl/$PGM.cbl

# db2cmd -i -w -c db2 [command line parameters]
# -i : don't open a new console, share the existing console and stdin, stdout handles
# -c : run the specified command (db2 etc.) and terminate
# -w : wait until the spawned command process ends

# Run the DB2 prep and bind
db2cmd -i -w -c db2 -tvf ../sql/$PGM.sql

# pause
read -n1 -r -p "Press any key to continue..." key

# Added ibm-strict compile flag.
# Note: Because SQLTEST2 removed CHECKERR module, it can
# be compiled with ibm-strict.
# Removed these copybooks:
#           COPY "sqlenv.cbl".
#           COPY "sql.cbl".
# which are MicroFocus copybooks that contain a level 78 value.
# -std=ibm will allow it, -std=ibm-strict will not.
cobc  -x -o ../bin/$PGM ../tcbl/$PGM.cbl -I $SYSLIB -L $LOADLIB -l db2api 
