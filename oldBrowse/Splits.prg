#include "minigui.ch"
#include "Dbstruct.ch"
#include "constants.ch"

/********************************/
FUNCTION Main
/********************************/
SET BROWSESYNC ON
   SET CENTURY ON
   SET DELETED OFF

   DECLARE WINDOW MainWin

   indexFiles()
   USE JOHNACCT INDEX date
   dbGoBottom()
   
   LOAD WINDOW MainWin
   MainWin.acctBrowse.value := RecNo()
//   MainWin.acctBrowse.ColumnAutoFitH
   MainWin.acctBrowse.SetFocus

   CENTER WINDOW MainWin
   ACTIVATE WINDOW MainWin
RETURN( NIL )

/********************************/
FUNCTION indexFiles()
/********************************/
USE JOHNACCT
   INDEX ON DATE TO date
   CLOSE JOHNACCT
RETURN

/********************************/
FUNCTION saveRecord()
/********************************/
return
   