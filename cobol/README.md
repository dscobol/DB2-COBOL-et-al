This is a list of the programs and what they do:

| Directory  | Program Name     | Description |
|:----------:|:----------------:|:------------|
| dastagg/cbl | SQTEST2 | Uses a cursor to fetch data and creates a formatted report. This removes the CHECKERR module for error handling and uses a WS-Flag instead. |
| dastagg/cbl | SQTEST3 | Uses a cursor to fetch data and simply displays it. This uses a called GETDBID module because I don't want to have to type in my userid and password everytime I run the program. |



| Directory | Sub        | Program Name     | Description |
|:----------:|:---------:|:----------------:|:------------|
| samples   | connectdb | CONNDB | Check to make sure the program can connect to the DB. |
| samples | static_check | STATIC1 | Run a static SQL statement against the DB. |
| samples | cursor_check | CURSCK | Declare a cursor and fetch from the DB. |
