#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
SetBatchLines, -1
CoordMode, Pixel, Screen

 ;Configuration for the locations of files and/or functions and stuff
gun_draw_animation = %A_ScriptDir%\data\animations\gun_riseup_animation2.gif
 background_menu = %A_ScriptDir%\data\animations\background.gif
background_menuloop = %A_ScriptDir%\data\animations\backgroundloop.gif
 dialogplayer = %A_ScriptDir%\data\instances soundplayer\dialogplayer.ahk
dialogplayer2 = %A_ScriptDir%\data\instances soundplayer\dialogplayer2.ahk
 gun_cockingplayer = %A_ScriptDir%\data\instances soundplayer\gun_cockingplayer.ahk
gun_idle_animation = %A_ScriptDir%\data\animations\gun_idle_animation.gif
 gun_moveanimation = %A_ScriptDir%\data\animations\gun_moveanimation.gif
gun_screenshake_animation = %A_ScriptDir%\data\animations\gun_screenshake_animation.gif
 first_encounter_it = %A_ScriptDir%\data\instances soundplayer\first_encounter_itplayer.ahk
 centerweight := A_ScreenHeight/1.5
   
 ; This is the GUI Owner, This GUI shall not be deleted, and is only here to be acted upon.
 gui, backg:new, -border -sysmenu -Caption
  gui, backg:margin, 0, 0
   gui, backg:+AlwaysOnTop
    gui, backg:color, Black
	 gui, backg:Show, w%A_ScreenWidth% h%A_ScreenHeight%, The Dark Hall
	  gui, backg:Maximize

; Draw the background menu
 gui, menu:new, -border -sysmenu -Caption
  gui, menu:margin, 0, 0
   gui, menu:Color, Black
    gui, menu:Add, activex, w1930 h1095 x0 y0, %background_menu%
     gui, menu:+parentbackg
	  gui, menu:+AlwaysOnTop
	   gui, menu:Show, w1930 h1095 x-10 y-15
	   
	  ; Sleep increment
	Sleep, 500
	
      ; Draw the background loop and destroy the before's background.
 gui, menu2:new, -border -sysmenu -Caption
  gui, menu2:margin, 0, 0
   gui, menu2:Add, activex, w1930 h1095, %background_menuloop%
   gui, menu2:Color, Black
    gui, menu2:+parentbackg
	 gui, menu2:+AlwaysOnTop
	  gui, menu2:Show, w1930 h1095 x-10 y-15 Restore
         gui, menu:Destroy

      ; Draw the background with the "Press the space bar to continue", destroy the backgroundloop and start the dialog using the DialogMaker func.
KeyWait, Space, D
      gui, menu2:Destroy
       gui, drawgun:new, -border -SysMenu -Caption
        gui, drawgun:margin, 0, 0
		Sleep, 1000
			  DialogMaker("The last conversation between Johnny and the SCP Worker:", centerweight, 960, 960, 200, 2800)
			  Sleep, 1120
			  Run, %dialogplayer%
			  DialogMaker("SCP Worker (Over Walkie-Talkie): Johnny, can you hear me?", centerweight, 960, 960, 200, 2800)
              Sleep, 1200			  
			  DialogMaker("Johnny (Over Walkie-Talkie): Yeah, loud and clear.", centerweight, 960, 960, 200, 3000)
			  Sleep, 1000
			  DialogMaker("SCP Worker (Over Walkie-Talkie): good.", centerweight, 960, 960, 200, 1700)
			  DialogMaker("SCP Worker (Over Walkie-Talkie): Just..", centerweight, 960, 960, 200, 900)
			  DialogMaker("SCP Worker (Over Walkie-Talkie): proceed forward,", centerweight, 960, 960, 200, 1700)
			  DialogMaker("SCP Worker (Over Walkie-Talkie): down the dark hallway.", centerweight, 960, 960, 200, 1800)
			  Sleep, 700
			  DialogMaker("SCP Worker (Over Walkie-Talkie): If you encounter anything unusual or classified, ", centerweight, 960, 960, 200, 2900)
			  DialogMaker("SCP Worker (Over Walkie-Talkie): report immediately and return to the entrance.", centerweight, 960, 960, 200, 2000)
			  Sleep, 1200
			  DialogMaker("Johnny (Over Walkie-Talkie): Okay but,", centerweight, 960, 960, 200, 1000)
			  Sleep, 200
			  DialogMaker("Johnny (Over Walkie-Talkie): What's this all about?", centerweight, 960, 960, 200, 1900)
			  DialogMaker("Johnny (Over Walkie-Talkie): What's in there?", centerweight, 960, 960, 200, 1300)
			  Sleep, 1300
			  DialogMaker("SCP Worker (Over Walkie-Talkie): Can't say, Johnny.", centerweight, 960, 960, 200, 1300)
			  Sleep, 1000
			  DialogMaker("SCP Worker (Over Walkie-Talkie): Just follow instructions, and all will be okay.", centerweight, 960, 960, 200, 3900)
			  Sleep, 1000
		      DialogMaker("                    Press 3 to continue.", centerweight, 960, 960, 200, 2000)
		
 ; Draw the gun Cocking Animation.
KeyWait, 3, D
     ; Activate the window of not already activated.
      Click
	  Run, %gun_cockingplayer%
	  gui, drawgun:Maximize
	  SystemCursor(False)
	  gui, drawgun:add, activex, BackgroundTrans w1920 h1080, %gun_draw_animation%
	     gui, drawgun:Color, Black
	  	  WinSet, TransColor, 0xFFFFFF, The dark hall
			  gui, drawgun:+AlwaysOnTop
			  gui, drawgun:+Ownerbackg
              Sleep, 1120
			  
			  ; Draw the initial Idle Animation, and destroy the cocking animation
AnimationMaker(gun_idle_animation)
			  gui, drawgun:Destroy
			  
			  Run, %dialogplayer2%
			  Sleep, 800
			  DialogMaker("Johnny (whispering in the dark): Is anyone out there?", centerweight, 700, 780, 200, 2000)
			  Sleep, 1500
			   DialogMaker("Johnny (whispering in the dark): If there is anyone,", centerweight, 700, 780, 200, 1200)
			   Sleep, 200
			   DialogMaker("Johnny (whispering in the dark): please tell me where you are, I...", centerweight, 700, 780, 200, 1000)
			   Sleep, 100
			   DialogMaker("Johnny (whispering in the dark): I can't see a thing.", centerweight, 700, 780, 200, 1600)
			   Sleep, 300
			   Sleep, 900
			   DialogMaker("Johnny (startled): what is that sound?", centerweight, 700, 780, 200, 2750)
			   Sleep, 700
			   Run, %first_encounter_it%
			   Sleep, 13000
			   AnimationMaker(gun_screenshake_animation)
			   Sleep, 3700
			   AnimationMaker(gun_idle_animation)
			   Sleep, 3300
			   AnimationMaker(gun_screenshake_animation)
			   Sleep, 2000
			   AnimationMaker(gun_idle_animation)
			  Sleep, 1000
			  
			  ; The functioning game should start here, as of yet, nothing really exists apart of the moving/idle animations.
			   ; Run steps_soundsplayer for allowing stepping sounds to occur.
			  Run, %A_ScriptDir%\data\instances soundplayer\steps_soundsplayer.ahk
			  
			  ; Similar to a loop, but better, using a label for continuing the code below.
	 WaitAgain:
	 KeyWait, W, D
	  {
	   AnimationMaker(gun_moveanimation)
	   KeyWait, W, P
	   AnimationMaker(gun_idle_animation)
	   Goto, WaitAgain
	   }
	   
	 
	 
	 
	 
	 
	 
	 
	 Return
	 ; Not my code, it's from the AHK Developers. Used for hiding the Cursor and unhiding it when told so.
	 
SystemCursor(OnOff := 1) {  ; INIT = "I","Init"; OFF = 0,"Off"; TOGGLE = -1,"T","Toggle"; ON = others
 ; https://www.autohotkey.com/boards/viewtopic.php?t=6167
 Static AndMask, XorMask, $, h_cursor
  , b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13   ; Blank cursors
  , h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13   ; Handles of default cursors
  , c := StrSplit("32512,32513,32514,32515,32516,32642,32643,32644,32645,32646,32648,32649,32650", ",")
 If (OnOff = "Init" || OnOff = "I" || $ = "") {  ; Init when requested or at first call
  $ = h                                          ; Active default cursors
  VarSetCapacity(h_cursor,4444, 1), VarSetCapacity(AndMask, 32*4, 0xFF), VarSetCapacity(XorMask, 32*4, 0)
  For each, cursor in c {
   h_cursor := DllCall("LoadCursor", "Ptr",0, "Ptr", cursor)
   h%each%  := DllCall("CopyImage", "Ptr", h_cursor, "UInt", 2, "Int", 0, "Int", 0, "UInt", 0)
   b%each%  := DllCall("CreateCursor", "Ptr", 0, "Int", 0, "Int", 0
                     , "Int", 32, "Int", 32, "Ptr", &AndMask, "Ptr", &XorMask)
  }
 }
 $ := OnOff = 0 || OnOff = "Off" || $ = "h" && (OnOff < 0 || OnOff = "Toggle" || OnOff = "T") ? "b" : "h"
 For each, cursor in c {
  h_cursor := DllCall("CopyImage", "Ptr", %$%%each%, "UInt", 2, "Int", 0, "Int", 0, "UInt", 0)
  DllCall("SetSystemCursor", "Ptr", h_cursor, "UInt", cursor)
 }
}

 ;Dialog Maker function for making dialogs of text onscreen.
DialogMaker(text, xproc, yproc, wproc, hproc, timer)
{ 
 numberproc := numberproc + 1
 gui_name = % "slovo" numberproc
  gui, %gui_name%:new, -border -sysmenu -caption
   gui, %gui_name%:margin, 0, 0
    gui, %gui_name%:color, Black
	 gui, %gui_name%:Font, cWhite s12, Verdana
	 gui, %gui_name%:Add, Text, % "x"0 "y"0 "w"wproc "h"hproc, %text%
	  gui, %gui_name%:Show, % "x"xproc "y"yproc "w"wproc "h"hproc
	  gui, %gui_name%:+AlwaysOnTop
	  gui, %gui_name%:+parentbackg
	  Sleep, %timer%
	   gui, %gui_name%:Destroy
 }
 
  ; Animation maker for the gun, the width and height must correspond to the following numbers. Width 746 Height 420
 AnimationMaker(location)
                  {
				   numberprocc := numberprocc + 1
                   gui_namesecond = % "slovos" numberprocc
   			       gui, %gui_namesecond%:new, -border -SysMenu -Caption
                    gui, %gui_namesecond%:margin, 0, 0
			         gui, %gui_namesecond%:Maximize
			            gui, %gui_namesecond%:Color, Black
			             gui, %gui_namesecond%:+AlwaysOnTop
			              gui, %gui_namesecond%:+ownerbackg
			               WinSet, TransColor, 0xFFFFFF, The dark hall
			                gui, %gui_namesecond%:Show, w746 h420 x600 y660
			                 gui, %gui_namesecond%:add, activex, BackgroundTrans w746 h420 x0 y0, %location%
                                   }

 ; Exit the Application upon pressing ESC
*~ESC::
SystemCursor(True)
ExitApp

 ; Exit the Application upon pressing Alt and F4
*~ALT & F4::
SystemCursor(True)
ExitApp