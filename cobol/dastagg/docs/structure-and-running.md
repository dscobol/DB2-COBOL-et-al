First and foremost, while all this is running on Windows 10, I am more familiar with "Unix-like" OSs so I installed Cygwin.

All the "jcl" scripts are bash scripts so they need to be run in the Cygwin Terminal.
Git-Bash or WSL might work. I don't know. Don't have WSL installed.

In the .bashrc file within cygwin, I added 2 exports to make the 
shell scripts cleaner:

```
    export DHOME='/cygdrive/c/Users/dastagg'
    export RHOME='/cygdrive/c'
```
So:
     
     DHOME = $HOME on linux
     RHOME is "C:\".

## Structure
There is a certain structure I have set up to make the
directories "cleaner". 

Each component is created in or compiled to the "proper" place.
It sort-of mimics the structure on the Mainframe.

This is the directory structure:
```
└───dastagg
    ├───bin
    ├───cbl
    ├───docs
    ├───jcl
    ├───spool
    ├───sql
    └───tcbl
```

There are only three sub-directories that get commited and pushed: cbl, docs and jcl. 

And even then, the *.bnd files within cbl are 
excluded.


# Important notes about running the compile and the program:

## Run the DB2 prep and bind
```
db2cmd -i -w -c db2 -tvf ../sql/$PGM.sql
```

NOTE: This will look for the .sql file with the same name as 
the program in the /sql directory.

## Compile the Code

There are two versions of the compile script:

```nmcompile.sh``` : Run if it is a "standalone" program.

```wmcompile.sh``` : Run if there are called programs(modules) along with the main program.

```
cobc -o ../bin/$LLM.dll ../cbl/$LLM.cbl  
cobc  -x -o ../bin/$PGM ../tcbl/$PGM.cbl -I $SYSLIB -L $LOADLIB -l db2api
```

NOTE: This will compile the called programs as a module (it's Windows, so dll)
and then compile the Main program as an exe.

The -o is to place the results in the /bin directory.

Once all is compiled:

There are certain modules that DB2 programs need.
They are located in the COB_LIBRARY_PATH.
So these two exports MUST be exported before running the program.

## Run the program

I have these scripts, called "program-name".sh in the bin directory.
```
export COB_LIBRARY_PATH="$RHOME/IBM/SQLLIB/BIN"  
export COB_PRE_LOAD=db2agapi64

./$PGM.exe
```
