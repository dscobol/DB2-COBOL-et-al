This is code I have created or copied and modified as I progress learning to create 
COBOL programs to access IBM's DB2 Database Server.

They all have been run on the following environment:

* Windows 10 64bit (currently Version 2004)
* IBM DB2 for Linux, UNIX, and Windows V11.5
* Cygwin 64bit
* gnuCobol 3.1rc 64bit compiled with cygwin.


For now, there are two main areas:

    cobol: These are programs that were written to use the gnuCobol compiler. 
    I don't have access to a DB2 Server on a Mainframe but I can learn this way.

    python: Well... I'll state the obvious: These are Python programs that connect to DB2.

Under the cobol directory:

    dastagg: These are programs I have written trying to use my "style". 
    Program structure, naming convention, etc. 
    
    All these programs will be written to access the SAMPLE DB included with 
    the installation of IBM DB2.

    examples: These are programs supplied by IBM or other tutorials that I used 
    to make sure the programs worked. 
    
    They may access other Schemas.


Installation Notes:

Also look at the docs directory under cobol/dastagg for documents that have more information.

IBM DB2 was installed at C:\ so the path is "C:\IBM\SQLLIB"
