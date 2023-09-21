#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetBatchLines, -1
#NoTrayIcon

     SoundPlay, first_encounter_it.mp3
    SetTimer, WinCheck, 0
     SetTimer, Exitlabel, 26000
	 do_nothin:

WinCheck:
 IfWinExist, The Dark Hall
  Goto, do_nothin
   Else
    ExitApp

Exitlabel:
 ExitApp
Return