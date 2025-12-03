       IDENTIFICATION DIVISION.
       PROGRAM-ID. SHEQ4.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  CORE-EXPRESSION.
           05 FILLER PIC X(1).
       *> Cannot pictures must have > 0 space
       01  CORE-NUMBER REDEFINES CORE-EXPRESSION.
           05 VAL PIC 9.
       01  CORE-ID REDEFINES CORE-EXPRESSION.
           05 SYM PIC X.
       01  CORE-STRING REDEFINES CORE-EXPRESSION.
           05 STR PIC X.

       PROCEDURE DIVISION.
           Move 'Hello World' to VAL
           DISPLAY "    Hello World!".
           MOVE ''
           STOP RUN.
           