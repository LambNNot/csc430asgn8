       IDENTIFICATION DIVISION.
       PROGRAM-ID. test-interp.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  INPUT-AST PIC X(50).
       01  INPUT-NUMC REDEFINES INPUT-AST.
           05 FILLER PIC X(40).
           05 INPUT-VAL PIC S9(5)V99999.
       01  INPUT-TYPE PIC X(2).
       01  WS-ACTUAL-RES PIC S9(5)V99999.
       01  WS-EXPECTED-RES PIC S9(5)V99999.
       01  WS-TEST-COUNT PIC 9(2) VALUE ZEROS.
       01  WS-PASS-COUNT PIC 9(2) VALUE ZEROS.
       01  WS-FAIL-COUNT PIC 9(2) VALUE ZEROS.

       PROCEDURE DIVISION.
           PERFORM TEST-INTERP-NUMC-1.
           PERFORM SHOW-TEST-RESULTS.
           STOP RUN.

       SHOW-TEST-RESULTS.
           DISPLAY "# of Tests Ran: ".
           DISPLAY WS-TEST-COUNT.
           DISPLAY "# Passed: ".
           DISPLAY WS-PASS-COUNT.
           DISPLAY "# Failed: ".
           DISPLAY WS-FAIL-COUNT.

       TEST-INTERP-NUMC-1.
           MOVE -3.14159 TO WS-EXPECTED-RES
           ADD 1 TO WS-TEST-COUNT.
           MOVE -3.14159
               TO INPUT-VAL.
           MOVE "N" TO INPUT-TYPE.
           CALL 'SHEQ4' USING
               INPUT-AST,
               INPUT-TYPE,
               WS-ACTUAL-RES.
           IF WS-ACTUAL-RES = WS-EXPECTED-RES THEN
               ADD 1 TO WS-PASS-COUNT
            ELSE
               ADD 1 TO WS-FAIL-COUNT
           END-IF.

       END PROGRAM test-interp.
           
       