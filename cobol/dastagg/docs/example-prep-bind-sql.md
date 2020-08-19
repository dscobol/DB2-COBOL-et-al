I create one of these for each program I create.
I am using the SAMPLE DB that can be installed
when Db2 for Linux, UNIX and Windows is installed.

I don't share the actual files because they contain the password.

I have a structure in place (see structure-and-running.md) so the output
of this will go to /tcbl (temporary COBOL).

```
connect to <DB> user <user> using <password;
prep ../cbl/<program>.sqb bindfile target ANSI_COBOL output ../tcbl/SQTEST2.cbl;
bind ../cbl/<program>.bnd;
connect reset;
