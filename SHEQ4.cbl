       IDENTIFICATION DIVISION.
       PROGRAM-ID. SHEQ4.
       
       DATA DIVISION.
      *WORKING-STORAGE SECTION.
      *01  CORE-EXPRESSION.
      *    05 FILLER PIC X(1).
       *> Cannot pictures must have > 0 space
       

       LINKAGE SECTION.
       01  ABS-SYN-TREE PIC X(50).
       01  NUMC REDEFINES ABS-SYN-TREE.
           05 FILLER PIC
           05 VAL
       01  AST-TYPE PIC X(2).
      *> "if AST-TYPE == N:" --> "if AST-IS-NUMC" 
       01  INTERP-RES-NUM PIC 9(5).

       PROCEDURE DIVISION USING ABS-SYN-TREE, AST-TYPE
           RETURNING INTERP-RES-NUM.
           DISPLAY "Hello World!".

           EVALUATE AST-TYPE
            WHEN "N"
                DISPLAY "DETECTED NUM"
            WHEN OTHER
                CONTINUE
           END-EVALUATE
           
           MOVE 1 TO INTERP-RES-NUM.
           STOP RUN.

      *INTERP-NUM.
      *    CONTINUE
    
       END PROGRAM SHEQ4.
           