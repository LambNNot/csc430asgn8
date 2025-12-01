       IDENTIFICATION DIVISION.
       PROGRAM-ID. SHEQ4.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  CORE-EXPRESSION.
           05 FILLER PIC X(1).
       *> Cannot pictures must have > 0 space
       01  CORE-NUMBER REDEFINES CORE-EXPRESSION.
           05 VAL PIC 9(7).
       01  CORE-ID REDEFINES CORE-EXPRESSION.
           05 SYM PIC X(3).
       01  CORE-STRING REDEFINES CORE-EXPRESSION.
           05 STR PIC X(45).

       PROCEDURE DIVISION.
           DISPLAY "Hello World!".
           STOP RUN.
           