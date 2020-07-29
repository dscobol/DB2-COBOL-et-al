# clean
rm CONNDB.exe

# db2cmd -i -w -c db2 [command line parameters]
# -i : don't open a new console, share the existing console and stdin, stdout handles
# -c : run the specified command (db2 etc.) and terminate
# -w : wait until the spawned command process ends

db2cmd -i -w -c db2 -tvf precompile.sql

# pause
read -n1 -r -p "Press any key to continue..." key

export COB_LIBRARY_PATH="$RHOME/IBM/SQLLIB/BIN"
export COB_PRE_LOAD=db2agapi64

# compile
cobc -x -std=mf CONNDB.cbl -I/cygdrive/c/IBM/SQLLIB/include/cobol_mf -L/cygdrive/c/IBM/SQLLIB/lib -ldb2api
