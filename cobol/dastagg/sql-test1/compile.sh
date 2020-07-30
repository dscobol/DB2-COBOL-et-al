# Compile script

PGM=SQTEST1
SYSLIB="$RHOME/IBM/SQLLIB/include/cobol_mf"
LOADLIB="$RHOME/IBM/SQLLIB/lib"

# clean
rm CHECKERR.dll
rm $PGM.exe
rm $PGM.bnd
rm $PGM.cbl

# db2cmd -i -w -c db2 [command line parameters]
# -i : don't open a new console, share the existing console and stdin, stdout handles
# -c : run the specified command (db2 etc.) and terminate
# -w : wait until the spawned command process ends

db2cmd -i -w -c db2 -tvf db2_precompile1.sql

# pause
read -n1 -r -p "Press any key to continue..." key

# Added ibm compile flag.
# Note: Because SQLTEST1 uses CHECKERR module, it can not
# be compiled with ibm-strict.
#           COPY "sqlenv.cbl".
#           COPY "sql.cbl".
# are MicroFocus copybooks that contain a level 78 value.
# -std=ibm will allow it. 

cobc -m -std=ibm CHECKERR.cbl -I $SYSLIB -L $LOADLIB -l db2api
cobc -x -std=ibm $PGM.cbl -I $SYSLIB -L $LOADLIB -l db2api
