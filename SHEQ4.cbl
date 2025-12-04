       IDENTIFICATION DIVISION.
       PROGRAM-ID. SHEQ4.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  ERROR-DESC PIC X(40).
       01  ERROR-MSG PIC X(50).
       

       LINKAGE SECTION.
       01  ABS-SYN-TREE PIC X(50).
       01  NUMC REDEFINES ABS-SYN-TREE.
           05 FILLER PIC X(40).
           05 VAL PIC S9(5)V99999.
       01  IDC REDEFINES ABS-SYN-TREE.
           05 FILLER PIC X(40).
           05 SYM PIC X(10).
       01  AST-TYPE PIC X(2).
       01  INTERP-RESULT PIC X(50).
       01  INTERP-RESULT-NUM REDEFINES INTERP-RESULT.
           05 FILLER PIC X(40).
           05 RESULT-NUM-VAL PIC S9(5)V99999.

       PROCEDURE DIVISION USING ABS-SYN-TREE, AST-TYPE, INTERP-RESULT.

           EVALUATE AST-TYPE
            WHEN "N"
                MOVE VAL TO RESULT-NUM-VAL
            WHEN "I"
                STRING "Unbound identifier, received " DELIMITED BY SIZE
                    SYM DELIMITED BY SIZE 
                    INTO ERROR-DESC
               PERFORM RAISE-ERROR
               
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
           
       RAISE-ERROR.
           STRING "SHEQ ERROR: " DELIMITED BY SIZE
                    ERROR-DESC DELIMITED BY SIZE
                    INTO ERROR-MSG
           MOVE ERROR-MSG TO INTERP-RESULT.
           GOBACK.
           
    
       END PROGRAM SHEQ4.
           