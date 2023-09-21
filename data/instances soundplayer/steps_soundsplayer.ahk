#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetBatchLines, -1

doagen:
KeyWait, W, D
 Run, %A_ScriptDir%\steps_soundsplayer1.ahk
 ExitApp
 
*~ESC::
ExitApp