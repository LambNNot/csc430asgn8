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
       01  STRC REDEFINES ABS-SYN-TREE.
           05 FILLER PIC X(40).
           05 STRC-BUFF PIC X(10).
       01  IDC REDEFINES ABS-SYN-TREE.
           05 FILLER PIC X(40).
           05 SYM PIC X(10).
       01  APPC REDEFINES ABS-SYN-TREE.
           05 APPC-FUNC PIC X(10).
           05 APPC-ARGS PIC X(40).
       01  LAMC REDEFINES ABS-SYN-TREE.
           05 LAMC-PARAMS PIC X(40).
           05 LAMC-BODY PIC X(10).
       *> Definitions for APPC recursion
       01  INTERP-FUNC PIC X(50).
       01  INTERP-FUNC-TYPE PIC X(50).
       
       01  AST-TYPE PIC X(2).
       01  INTERP-RESULT PIC X(50).
       01  INTERP-RESULT-NUM REDEFINES INTERP-RESULT.
           05 FILLER PIC X(40).
           05 RESULT-NUM-VAL PIC S9(5)V99999.
       01  INTERP-RESULT-STR REDEFINES INTERP-RESULT.
           05 RESULT-STR-VAL PIC X(50).
       01  INTERP-RESULT-CLOV REDEFINES INTERP-RESULT.
           05 RESULT-PARAMS PIC X(40).
           05 RESULT-BODY PIC X(10).
           *> how do we put environment, no more memory
       01  ENVR.
           05 BINDING OCCURS 30 TIMES INDEXED BY ENVR-IDX.
               10 SYMBOLS PIC X(10).
               10 BOUND-VALS.
                   15 VAL-TYPES PIC X(1).
                   15 VALS PIC X(10).
       
       
       PROCEDURE DIVISION USING
               ABS-SYN-TREE,
               AST-TYPE,
               ENVR,
               INTERP-RESULT.

           EVALUATE AST-TYPE
            WHEN "N" *> NUMC case
                MOVE VAL TO RESULT-NUM-VAL
            WHEN "I" *> IDC case
                STRING "Unbound identifier, received " DELIMITED BY SIZE
                    SYM DELIMITED BY SIZE 
                    INTO ERROR-DESC
               PERFORM RAISE-ERROR
            WHEN "S" *> STRC case
                MOVE STRC-BUFF TO RESULT-STR-VAL
            WHEN "If" *> IFC case
                CONTINUE
            WHEN "L" *> LAMC case
                PERFORM HANDLE-LAMC
            WHEN "A" *> APPC case
                CONTINUE
                *>PERFORM HANDLE-APPC
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
    
       HANDLE-LAMC.
           MOVE LAMC-PARAMS TO RESULT-PARAMS
           MOVE LAMC-BODY TO RESULT-BODY
           *> environment?
           GOBACK.



       *> function for APPC recursion
       *>HANDLE-APPC.
           *>MOVE APPC-FUNC(1:50) TO INTERP-FUNC
           *>EVALUATE APPC-FUNC
           *> WHEN "+" OR "-" OR "*" OR "/" OR "strlen" OR "<="
           *> OR "substring" OR "equal?" OR "error"
           *>     PERFORM PRIMV-INTERP.
           *> WHEN 
           *>GOBACK.
           *>MOVE "I" to INTERP-FUNC-TYPE
       
       *> function for PRIMVs
       *>PRIMV-INTERP.
           

       END PROGRAM SHEQ4.
           