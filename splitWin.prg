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

// Input lables
      DEFINE LABEL Label_Date
            ROW    620
            COL    90
            WIDTH  120
            HEIGHT 24
            VALUE "Date:"
            RIGHTALIGN .T.
      END LABEL  

   DEFINE LABEL Label_Disc
            ROW    660
            COL    90
            WIDTH  120
            HEIGHT 24
            VALUE "Description:"
            RIGHTALIGN .T.
      END LABEL  

   DEFINE LABEL Label_Gas
            ROW    700
            COL    90
            WIDTH  120
            HEIGHT 24
            VALUE "Gas:"
            RIGHTALIGN .T.
      END LABEL  

   DEFINE LABEL Label_Maint
            ROW    740
            COL    90
            WIDTH  120
            HEIGHT 24
            VALUE "Maintenance:"
            RIGHTALIGN .T.
      END LABEL  

   DEFINE LABEL Label_John
            ROW    780
            COL    90
            WIDTH  120
            HEIGHT 24
            VALUE "John:"
            RIGHTALIGN .T.
      END LABEL  

   DEFINE LABEL Label_Pastor
            ROW    820
            COL    90
            WIDTH  120
            HEIGHT 24
            VALUE "Pastor:"
            RIGHTALIGN .T.
      END LABEL  

   DEFINE LABEL Label_Med
            ROW    860
            COL    90
            WIDTH  120
            HEIGHT 24
            VALUE "Medical:"
            RIGHTALIGN .T.
      END LABEL  

   DEFINE LABEL Label_School
            ROW    900
            COL    90
            WIDTH  120
            HEIGHT 24
            VALUE "School:"
            RIGHTALIGN .T.
      END LABEL  

   DEFINE LABEL Label_Misc
            ROW    940
            COL    90
            WIDTH  120
            HEIGHT 24
            VALUE "Miscellaneous:"
            RIGHTALIGN .T.
      END LABEL  

   DEFINE LABEL Label_Total
            ROW    980
            COL    90
            WIDTH  120
            HEIGHT 24
            VALUE "Total:"
            RIGHTALIGN .T.
      END LABEL  

   //get boxes
   DEFINE GETBOX GetBox_1
            ROW    620
            COL    220
            WIDTH  120
            HEIGHT 24
            VALUE 0
            IMAGE ''
            PICTURE ''
            VALIDMESSAGE ''
            MESSAGE ''
            FONTNAME 'Arial'
            TOOLTIP ''
   END GETBOX  

   DEFINE GETBOX GetBox_2
            ROW    660
            COL    220
            WIDTH  120
            HEIGHT 24
            VALUE 0
            IMAGE ''
            PICTURE ''
            VALIDMESSAGE ''
            MESSAGE ''
            FONTNAME 'Arial'
            TOOLTIP ''
   END GETBOX  

   DEFINE GETBOX GetBox_3
            ROW    700
            COL    220
            WIDTH  120
            HEIGHT 24
            VALUE 0
            IMAGE ''
            PICTURE ''
            VALIDMESSAGE ''
            MESSAGE ''
            FONTNAME 'Arial'
            TOOLTIP ''
   END GETBOX  

   DEFINE GETBOX GetBox_4
            ROW    740
            COL    220
            WIDTH  120
            HEIGHT 24
            VALUE 0
            IMAGE ''
            PICTURE ''
            VALIDMESSAGE ''
            MESSAGE ''
            FONTNAME 'Arial'
            TOOLTIP ''
   END GETBOX  

   DEFINE GETBOX GetBox_5
            ROW    780
            COL    220
            WIDTH  120
            HEIGHT 24
            VALUE 0
            IMAGE ''
            PICTURE ''
            VALIDMESSAGE ''
            MESSAGE ''
            FONTNAME 'Arial'
            TOOLTIP ''
   END GETBOX  

   DEFINE GETBOX GetBox_6
            ROW    820
            COL    220
            WIDTH  120
            HEIGHT 24
            VALUE 0
            IMAGE ''
            PICTURE ''
            VALIDMESSAGE ''
            MESSAGE ''
            FONTNAME 'Arial'
            TOOLTIP ''
   END GETBOX  

   DEFINE GETBOX GetBox_7
            ROW    860
            COL    220
            WIDTH  120
            HEIGHT 24
            VALUE 0
            IMAGE ''
            PICTURE ''
            VALIDMESSAGE ''
            MESSAGE ''
            FONTNAME 'Arial'
            TOOLTIP ''
   END GETBOX  

   DEFINE GETBOX GetBox_8
            ROW    900
            COL    220
            WIDTH  120
            HEIGHT 24
            VALUE 0
            IMAGE ''
            PICTURE ''
            VALIDMESSAGE ''
            MESSAGE ''
            FONTNAME 'Arial'
            TOOLTIP ''
   END GETBOX  

   DEFINE GETBOX GetBox_9
            ROW    940
            COL    220
            WIDTH  120
            HEIGHT 24
            VALUE 0
            IMAGE ''
            PICTURE ''
            VALIDMESSAGE ''
            MESSAGE ''
            FONTNAME 'Arial'
            TOOLTIP ''
   END GETBOX  

   DEFINE GETBOX GetBox_10
            ROW    980
            COL    220
            WIDTH  120
            HEIGHT 24
            VALUE 0
            IMAGE ''
            PICTURE ''
            VALIDMESSAGE ''
            MESSAGE ''
            FONTNAME 'Arial'
            TOOLTIP ''
   END GETBOX  
   
   DEFINE FRAME Frame_1
      ROW    610
      COL    110
      WIDTH  250
      HEIGHT 400
      FONTNAME 'Arial'
      FONTBOLD .T.
      BACKCOLOR {0,0,0}
      OPAQUE .T.
   END FRAME  

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