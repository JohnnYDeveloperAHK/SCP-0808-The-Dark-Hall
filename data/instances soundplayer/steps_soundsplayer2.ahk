#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetBatchLines, -1

oldtime := A_TickCount

Play_the_step_sounds:
SoundPlay, steps_soundstouse2.mp3
 Loop
  {
  newtime := A_TickCount - oldtime
   If newtime >= 2400
   break
   }
 KeyWait, W, D
 Run, steps_soundsplayer1.ahk
 Loop
   {
  newtime := A_TickCount - oldtime
   If newtime >= 4228
   break
   }
ExitApp

*~ESC::
ExitApp