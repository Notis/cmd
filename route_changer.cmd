@ECHO OFF
    :: This file checks for the presence of either of two specific
    :: entries in the routing table. If either is found, the
    :: entry is changed to the other. If neither is found, the
    :: user is alerted and the program ends.

    echo.
    echo BEFORE:
    route print | find " 0.0.0.0"


    :: Check for 3.1 route, if it exists change it to 4.1 and exit
    route print | find ".111"
    if %errorlevel% ==0 goto CHANGE109


    :: Check for 4.1 route, if exists change to 3.1 and exit
    route print | find ".109"
    if %errorlevel% ==0 goto CHANGE111


    :: Neither exists - let me know, pause, then exit
    :: Could also easily just create the route here
    echo Route does not exist! Not found in routing table.
    pause
    GOTO END


    :CHANGE109
    route change 0.0.0.0 mask 0.0.0.0 192.168.0.109
    GOTO END


    :CHANGE111
    route change 0.0.0.0 mask 0.0.0.0 192.168.0.111
    GOTO END


    :END
    echo.
    echo ----------------------------
    echo.
    echo AFTER:
    route print | find " 0.0.0.0"

    echo.
    echo DONE!
    pause

