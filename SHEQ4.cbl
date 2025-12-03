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
           05 FILLER PIC X(40).
           05 VAL PIC S9(5)V99999.
       01  AST-TYPE PIC X(2).
       01  INTERP-RESULT PIC X(10).
       01  INTERP-RESULT-NUM
               REDEFINES INTERP-RESULT PIC S9(5)V99999.

       PROCEDURE DIVISION USING ABS-SYN-TREE, AST-TYPE, INTERP-RESULT.
           DISPLAY "Hello World!".

           EVALUATE AST-TYPE
            WHEN "N"
                MOVE VAL TO INTERP-RESULT-NUM
            WHEN "I"
               continue
            WHEN "S"
                CONTINUE
            WHEN "If"
                CONTINUE
            WHEN "A"
                CONTINUE
            WHEN OTHER
                CONTINUE
           END-EVALUATE.
           
           GOBACK.

      *INTERP-NUM.
      *    CONTINUE
    
       END PROGRAM SHEQ4.
           