#include <minigui.ch>
#include <i_browse.ch>
#include "c:\MiniGUI\Include\TSBrowse.ch"

FUNCTION mainWin()

   DEFINE WINDOW SPLITS AT 90, 743 ;
      WIDTH 1522 HEIGHT 1064 ;
      TITLE "John Account Splits" ;
      MAIN
   
      DEFINE TBROWSE oBrowse AT 200, 60 CELLED ALIAS "JOHNACCT" ;
         ON CHANGE rowTotal() ;
         EDITABLE WIDTH 1000 HEIGHT 390

         //oBrowse:SetAppendMode(TRUE)

         ADD COLUMN TO oBrowse;
            HEADER "Date" ;
            SIZE 80 ;
            DATA FIELDWBLOCK("date", SELECT()) ;
            ALIGN DT_CENTER, DT_CENTER, DT_CENTER ;
            EDITABLE MOVE DT_MOVE_RIGHT

         ADD COLUMN TO oBrowse;
            HEADER "Description" ;
            SIZE 250 ;
            DATA FIELDWBLOCK("discrip", SELECT()) ;
            ALIGN DT_LEFT, DT_CENTER, DT_CENTER ;
            EDITABLE MOVE DT_MOVE_RIGHT

         ADD COLUMN TO oBrowse;
            HEADER "Gas" ;
            SIZE 80 ;
            POSTEDIT {||rowTotal()} ;
            DATA FIELDWBLOCK("gas", SELECT()) ;
            ALIGN DT_RIGHT, DT_CENTER, DT_CENTER ;
            FOOTER {||getTotal("gas")} ;
            EDITABLE MOVE DT_MOVE_RIGHT

         ADD COLUMN TO oBrowse;
            HEADER "Maintenance" ;
            SIZE 80 ;
            POSTEDIT {||rowTotal()} ;
            DATA FIELDWBLOCK("maint", SELECT()) ;
            ALIGN DT_RIGHT, DT_CENTER, DT_CENTER ;
            FOOTER {||getTotal("maint")} ;
            EDITABLE MOVE DT_MOVE_RIGHT

         ADD COLUMN TO oBrowse;
            HEADER "John" ;
            SIZE 80 ;
            POSTEDIT {||rowTotal()} ;
            DATA FIELDWBLOCK("john", SELECT()) ;
            ALIGN DT_RIGHT, DT_CENTER, DT_CENTER ;
            FOOTER {||getTotal("john")} ;
            EDITABLE MOVE DT_MOVE_RIGHT

         ADD COLUMN TO oBrowse;
            HEADER "Pastor" ;
            SIZE 80 ;
            POSTEDIT {||rowTotal()} ;
            DATA FIELDWBLOCK("pastor", SELECT()) ;
            ALIGN DT_RIGHT, DT_CENTER, DT_CENTER ;
            FOOTER {||getTotal("pastor")} ;
            EDITABLE MOVE DT_MOVE_RIGHT

         ADD COLUMN TO oBrowse;
            HEADER "Medical" ;
            SIZE 80 ;
            POSTEDIT {||rowTotal()} ;
            DATA FIELDWBLOCK("med", SELECT()) ;
            ALIGN DT_RIGHT, DT_CENTER, DT_CENTER ;
            FOOTER {||getTotal("med")} ;
            EDITABLE MOVE DT_MOVE_RIGHT

         ADD COLUMN TO oBrowse;
            HEADER "School" ;
            SIZE 80 ;
            POSTEDIT {||rowTotal()} ;
            DATA FIELDWBLOCK("school", SELECT()) ;
            ALIGN DT_RIGHT, DT_CENTER, DT_CENTER ;
            FOOTER {||getTotal("school")} ;
            EDITABLE MOVE DT_MOVE_RIGHT

         ADD COLUMN TO oBrowse;
            HEADER "Miscellaneous" ;
            SIZE 80 ;
            POSTEDIT {||rowTotal()} ;
            DATA FIELDWBLOCK("misc", SELECT()) ;
            ALIGN DT_RIGHT, DT_CENTER, DT_CENTER ;
            FOOTER {||getTotal("misc")} ;
            EDITABLE MOVE DT_MOVE_RIGHT

         ADD COLUMN TO oBrowse;
            HEADER "Total" ;
            SIZE 80 ;
            DATA FIELDWBLOCK("total", SELECT()) ;
            ALIGN DT_RIGHT, DT_CENTER, DT_CENTER ;
            FOOTER {||getTotal("total")} ;
            NOHILITE MOVE DT_MOVE_RIGHT

         END TBROWSE  
   END WINDOW


RETURN( NIL )


FUNCTION getTotal(envelope)
   nTotal := 0
   nPlace = RECNO()
   do case
      case envelope == "gas"
         SUM GAS TO nTotal
      case envelope == "maint"
         SUM MAINT TO nTotal
      case envelope == "john"
         SUM JOHN TO nTotal
      case envelope == "pastor"
         SUM PASTOR TO nTotal
      case envelope == "med"
         SUM MED TO nTotal
      case envelope == "school"
         SUM SCHOOL TO nTotal
      case envelope == "misc"
         SUM MISC TO nTotal
         case envelope == "total"
            SUM TOTAL TO nTotal
      ENDCASE      

   cTotal := STR(nTotal)   
   DBGOTO(nPlace)
RETURN (cTotal)   


FUNCTION rowTotal()
   nTotal := 0
   nTotal := JOHNACCT->GAS + ;
             JOHNACCT->MAINT + ;
             JOHNACCT->JOHN + ;
             JOHNACCT->PASTOR + ;
             JOHNACCT->MED + ;
             JOHNACCT->SCHOOL + ;
             JOHNACCT->MISC
   JOHNACCT->TOTAL := nTotal          
RETURN (TRUE)