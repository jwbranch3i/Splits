#include <minigui.ch>
#include <i_browse.ch>
#include "c:\MiniGUI\Include\TSBrowse.ch"

#define TRUE  .T.
#define FALSE .F.



FUNCTION Main

   SET BROWSESYNC ON
   SET CENTURY ON
   SET DELETED ON

   DECLARE WINDOW splits

   indexFiles()

   USE JOHNACCT INDEX date

   mainWin()

   ACTIVATE WINDOW SPLITS
RETURN( NIL )


FUNCTION addData()


    IF !EMPTY(splits.Get_Gas.VALUE + ;
             splits.Get_Maint.VALUE + ;
             splits.Get_John.VALUE + ;
             splits.Get_Pastor.VALUE + ;
             splits.Get_Med.VALUE + ;
             splits.Get_School.VALUE + ;
             splits.Get_Misc.VALUE) 
  
      APPEND BLANK

      JOHNACCT->DATE := splits.Get_Date.VALUE
      JOHNACCT->DISCRIP := splits.Get_Disc.VALUE
      JOHNACCT->MAINT := splits.Get_Maint.VALUE
      JOHNACCT->JOHN := splits.Get_John.VALUE
      JOHNACCT->PASTOR := splits.Get_Pastor.VALUE
      JOHNACCT->MED := splits.Get_Med.VALUE
      JOHNACCT->SCHOOL := splits.Get_School.VALUE
      JOHNACCT->MISC := splits.Get_misc.VALUE

      splits.Get_Disc.VALUE := ""
      splits.Get_Gas.VALUE := 0
      splits.Get_Maint.VALUE := 0
      splits.Get_John.VALUE := 0
      splits.Get_Pastor.VALUE := 0
      splits.Get_Med.VALUE := 0
      splits.Get_School.VALUE := 0
      splits.Get_misc.VALUE := 0

      
   ENDIF                
RETURN   

FUNCTION sumInput()
   nTotal := splits.Get_Gas.VALUE + ;
            splits.Get_Maint.VALUE + ;
            splits.Get_John.VALUE + ;
            splits.Get_Pastor.VALUE + ;
            splits.Get_Med.VALUE + ;
            splits.Get_School.VALUE + ;
            splits.Get_Misc.VALUE
   splits.Text_total.VALUE := nTotal
RETURN    

FUNCTION indexFiles()
   USE JOHNACCT
   INDEX ON DATE TO date
   CLOSE JOHNACCT
RETURN