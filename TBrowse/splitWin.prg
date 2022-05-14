#include <minigui.ch>
#include <i_browse.ch>
#include "c:\MiniGUI\Include\TSBrowse.ch"

FUNCTION mainWin()

   DEFINE WINDOW SPLITS AT 90, 743 ;
      WIDTH 1150 HEIGHT 650 ;
      TITLE "John Account Splits" ;
      BACKCOLOR {128,255,255};
      MAIN
   
      DEFINE TBROWSE oBrowse AT 50, 50 ALIAS "JOHNACCT";
         WIDTH 1050 HEIGHT 490;
            CELLED EDITABLE 

      //   oBrowse:SetAppendMode(.T.)
         oBrowse:SetDeleteMode( .T., .T.)
      //  oBrowse:lNoResetPos := .F.  
          

         ADD COLUMN TO oBrowse;
            HEADER "Date" ;
            SIZE 120 ;
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
            COLORS {128,255,255};
            NOHILITE MOVE DT_MOVE_RIGHT

            oBrowse:SetColor({9,10}, {RGB(255, 255, 255),RGB( 128, 128, 192)})
            oBrowse:nHeightCell += 6

            MODIFY TBROWSE oBrowse INDEXCOLS TO 1
      END TBROWSE  

      DEFINE BUTTON bAddRecord
         ROW    570
         COL    950
         WIDTH  100
         HEIGHT 28
//         ACTION saveRecord() ; oBrowse:reset() ; oBrowse:GoBottom()
         ACTION saveRecord() ; oBrowse:reset(); oBrowse:DrawSelect(); oBrowse:GoBottom()
         CAPTION "Add Record"
         FONTNAME 'Arial'
         TOOLTIP ''
         FONTBOLD .T.
         FONTUNDERLINE .T.
      END BUTTON  

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