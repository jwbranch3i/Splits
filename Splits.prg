#include <minigui.ch>
#include <i_browse.ch>
#include "c:\MiniGUI\Include\TSBrowse.ch"

#define TRUE  .T.
#define FALSE .F.


FUNCTION Main

   SET BROWSESYNC ON
   USE JOHNACCT

   mainWin()

   ACTIVATE WINDOW SPLITS
RETURN( NIL )
