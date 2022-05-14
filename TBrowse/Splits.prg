#include <minigui.ch>
#include <i_browse.ch>
#include "c:\MiniGUI\Include\TSBrowse.ch"

#define TRUE  .T.
#define FALSE .F.



FUNCTION Main
   SET BROWSESYNC ON
   SET CENTURY ON
   SET DELETED ON

   PUBLIC dWorkDate := DATE()

   DECLARE WINDOW splits

   indexFiles()

   USE JOHNACCT INDEX date

   mainWin()

   ACTIVATE WINDOW SPLITS
RETURN( NIL )


FUNCTION addData()
   DECLARE WINDOW splits
   DECLARE WINDOW edit_Input

    IF !EMPTY(edit_Input.Get_Gas.VALUE + ;
             edit_Input.Get_Maint.VALUE + ;
             edit_Input.Get_John.VALUE + ;
             edit_Input.Get_Pastor.VALUE + ;
             edit_Input.Get_Med.VALUE + ;
             edit_Input.Get_School.VALUE + ;
             edit_Input.Get_Misc.VALUE) 
  
      APPEND BLANK

      JOHNACCT->DATE := edit_Input.Get_Date.VALUE
      JOHNACCT->DISCRIP := edit_Input.Get_Disc.VALUE
      JOHNACCT->MAINT := edit_Input.Get_Maint.VALUE
      JOHNACCT->JOHN := edit_Input.Get_John.VALUE
      JOHNACCT->PASTOR := edit_Input.Get_Pastor.VALUE
      JOHNACCT->MED := edit_Input.Get_Med.VALUE
      JOHNACCT->SCHOOL := edit_Input.Get_School.VALUE
      JOHNACCT->MISC := edit_Input.Get_misc.VALUE

      edit_Input.Get_Disc.VALUE := ""
      edit_Input.Get_Gas.VALUE := 0
      edit_Input.Get_Maint.VALUE := 0
      edit_Input.Get_John.VALUE := 0
      edit_Input.Get_Pastor.VALUE := 0
      edit_Input.Get_Med.VALUE := 0
      edit_Input.Get_School.VALUE := 0
      edit_Input.Get_misc.VALUE := 0

      dWorkDate := edit_Input.Get_Date.VALUE

      edit_Input.RELEASE
      
   ENDIF                
RETURN   

FUNCTION saveRecord()
   LOCAL nParentRow
   LOCAL nParentCol

   DECLARE WINDOW SPLITS

   nParentRow := Splits.row
   nParentCol := Splits.col  

   LOAD WINDOW edit_input
   edit_Input.Row := nParentRow + 50
   edit_Input.Col := nParentCol + 20
   edit_Input.Get_Date.VALUE := dWorkDate
   ACTIVATE WINDOW edit_input
RETURN   

FUNCTION sumInput()
   nTotal := edit_Input.Get_Gas.VALUE + ;
            edit_Input.Get_Maint.VALUE + ;
            edit_Input.Get_John.VALUE + ;
            edit_Input.Get_Pastor.VALUE + ;
            edit_Input.Get_Med.VALUE + ;
            edit_Input.Get_School.VALUE + ;
            edit_Input.Get_Misc.VALUE
   edit_Input.Text_total.VALUE := nTotal
RETURN    

FUNCTION indexFiles()
   USE JOHNACCT
   INDEX ON DATE TO date
   CLOSE JOHNACCT
RETURN