#include <minigui.ch>
#include <i_browse.ch>

#define TRUE  .T.
#define FALSE .F.


FUNCTION Main
   SET BROWSESYNC ON
   LOCAL aCtrlNUM := {'TEXTBOX', 'NUMERIC', '99,999.99'}
   LOCAL aCtrlCHR := {'TEXTBOX', 'CHARACTER'}

   LOCAL aColControls := {aCtrlCHR, aCtrlNUM, aCtrlNUM, aCtrlNUM, aCtrlNUM, aCtrlNUM, aCtrlNUM, aCtrlNUM, aCtrlNUM}

   LOCAL aJustify := {BROWSE_JTFY_LEFT, BROWSE_JTFY_LEFT, BROWSE_JTFY_RIGHT, BROWSE_JTFY_RIGHT,;
                     BROWSE_JTFY_RIGHT, BROWSE_JTFY_RIGHT, BROWSE_JTFY_RIGHT, BROWSE_JTFY_RIGHT,; 
                     BROWSE_JTFY_RIGHT, BROWSE_JTFY_RIGHT}

   LOCAL aReadOnly := {TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, FALSE}                  

   USE JOHNACCT

   LOAD WINDOW Main
   Main.Center
   Main.Activate

RETURN( NIL )
